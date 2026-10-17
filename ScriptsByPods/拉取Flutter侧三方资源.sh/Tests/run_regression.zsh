#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 核心用途：用临时目录和假 Flutter / FVM 验证工具发现、跨电脑配置重生成、恢复与非阻断边界。
# - 影响范围：只创建临时夹具，不执行真实安装、Flutter 或 CocoaPods。
# - 运行提示：终端回车继续；自动验证可传 JOBS_SKIP_README=1，保留夹具可传 JOBS_KEEP_TEST_FIXTURES=1。

TEST_ROOT=""
SOURCE_SCRIPT=""
TEST_COUNT=0

# 先说明隔离验证范围，再按入口完成确认。
show_script_intro_and_wait() {
  print -r -- 'Flutter 资源拉取脚本隔离回归：仅在临时目录运行假命令，不执行真实安装。'
  print -r -- '独立终端按回车继续，Ctrl+C 取消；JOBS_SKIP_README=1 可供自动验证。'
  [[ "${JOBS_SKIP_README:-}" == 1 ]] && return 0
  if [[ ! -t 0 ]]; then
    print -u2 -r -- '✖ 当前没有可交互输入，请在终端运行或显式传 JOBS_SKIP_README=1。'
    exit 1
  fi
  IFS= read -r _ || exit 1
}
# 仅清理本次创建的夹具，也允许保留以便复核。
cleanup_test_runtime() {
  [[ -n "$TEST_ROOT" && -d "$TEST_ROOT" ]] || return 0
  if [[ "${JOBS_KEEP_TEST_FIXTURES:-}" == 1 ]]; then
    print -r -- "夹具保留：${TEST_ROOT}"
  else
    /bin/rm -r -- "$TEST_ROOT"
  fi
}
# 在整个测试进程退出时清理，避免 zsh 函数内 EXIT trap 提前触发。
TRAPEXIT() {
  if [[ "$ZSH_SUBSHELL" == 0 ]]; then
    cleanup_test_runtime
  fi
}
# 确认后准备临时函数库和严格隔离的测试入口。
initialize_test_runtime() {
  setopt NO_NOMATCH
  SOURCE_SCRIPT="${${(%):-%x}:A:h:h}/拉取Flutter侧三方资源.sh"
  [[ -f "$SOURCE_SCRIPT" ]] || exit 1
  /bin/zsh -n "$SOURCE_SCRIPT" || exit 1
  TEST_ROOT="$(mktemp -d "${TMPDIR:-/tmp}/jobs-flutter-pull-regression.XXXXXX")" || exit 1
  TEST_ROOT="${TEST_ROOT:A}"
  /usr/bin/awk '
    $0 == "main \"$@\"" { entry_count++; next }
    { print }
    END { if (entry_count != 1) exit 1 }
  ' "$SOURCE_SCRIPT" > "$TEST_ROOT/library.zsh" || exit 1
  /bin/cat > "$TEST_ROOT/probe.zsh" <<'PROBE'
source "$1"
LOG_FILE="$TEST_LOG"
functions[fixture_is_tool_available]="${functions[is_tool_available]}"
# 固定系统目录映射到假工具，其它工具只允许来自本用例夹具。
is_tool_available() {
  if [[ -n "${TEST_BREW_PATH:-}" && "$1" == "$TEST_BREW_PATH" ]]; then
    fixture_is_tool_available "$TEST_CASE_ROOT/fake/fvm"
    return $?
  fi
  [[ "$1" == "$TEST_CASE_ROOT"/* ]] || return 1
  fixture_is_tool_available "$@"
}
case "$2" in
  find)
    find_flutter_command
    tool_rc=$?
    printf 'RESULT_RC:%s\n' "$tool_rc"
    printf 'RESULT_ARG:%s\n' "${FLUTTER_CMD[@]}"
    exit "$tool_rc"
    ;;
  intro)
    show_script_intro_and_wait
    ;;
  core)
    ROOT_DIR="$TEST_PROJECT"
    DEFAULT_FLUTTER_DIR="$ROOT_DIR/my_flutter"
    DEFAULT_PODHELPER="$DEFAULT_FLUTTER_DIR/.ios/Flutter/podhelper.rb"
    run_flutter_resource_pull
    ;;
esac
PROBE
}
# 生成只记录调用参数、返回指定状态的工具替身。
make_fake_tool() {
  local target_path="$1"
  local version_rc="$2"
  mkdir -p "${target_path:h}"
  {
    print -r -- '#!/bin/zsh'
    print -r -- "local version_rc=${version_rc}"
    /bin/cat <<'FAKE'
print -r -- "$0 | $* | $PWD" >> "$TEST_TRACE"
if [[ "$1" == '--version' ]]; then
  print -r -- 'fake version 1.0.0'
  exit "$version_rc"
fi
[[ "$1" == flutter ]] && shift
if [[ "$1" != pub || "$2" != get ]]; then
  print -u2 -r -- 'fixture only permits flutter pub get'
  exit 99
fi
if [[ "${TEST_PUB_RC:-0}" != 0 ]]; then
  exit "$TEST_PUB_RC"
fi
if [[ ! -f .ios/Flutter/Generated.xcconfig && "${TEST_REGEN_SIGNAL:-}" == TERM ]]; then
  print -r -- 'interrupted generated output' > .ios/Flutter/Generated.xcconfig
  kill -TERM "$PPID"
  /bin/sleep 0.1
  exit 143
fi
if [[ ! -f .ios/Flutter/Generated.xcconfig && "${TEST_REGEN_PUB_RC:-0}" != 0 ]]; then
  print -r -- 'partial generated output' > .ios/Flutter/Generated.xcconfig
  exit "$TEST_REGEN_PUB_RC"
fi
if [[ "${TEST_GENERATE:-0}" == 1 || ( "${TEST_REGENERATE_IF_MISSING:-0}" == 1 && ! -f .ios/Flutter/Generated.xcconfig ) ]]; then
  local fixture_sdk="$TEST_CASE_ROOT/sdk"
  local fixture_app="$PWD"
  [[ "${TEST_REGEN_WRONG_APP:-0}" == 1 ]] && fixture_app="$TEST_CASE_ROOT/old module"
  mkdir -p "$fixture_sdk/packages/flutter_tools/bin"
  mkdir -p .ios/Flutter
  print -r -- '# fixture SDK helper' > "$fixture_sdk/packages/flutter_tools/bin/podhelper.rb"
  if [[ "${TEST_GENERATE:-0}" == 1 ]]; then
    print -r -- '# fixture module helper' > .ios/Flutter/podhelper.rb
  fi
  printf 'FLUTTER_ROOT=%s\nFLUTTER_APPLICATION_PATH=%s\n' "$fixture_sdk" "$fixture_app" > .ios/Flutter/Generated.xcconfig
  printf 'export "FLUTTER_ROOT=%s"\nexport "FLUTTER_APPLICATION_PATH=%s"\n' "$fixture_sdk" "$fixture_app" > .ios/Flutter/flutter_export_environment.sh
fi
exit 0
FAKE
  } > "$target_path"
  chmod +x "$target_path"
}
# 在独立用户目录及 PATH 中验证返回码、输出和纯文本降级。
assert_probe() {
  local case_name="$1" expected_rc="$2" expected_text="$3" probe_mode="$4"
  local case_root="$TEST_ROOT/$case_name" probe_output="" probe_rc=0
  shift 4
  mkdir -p "$case_root/tmp"
  probe_output="$(/usr/bin/env -i PATH="$case_root/path:/usr/bin:/bin" HOME="$case_root/home" \
    TEST_LOG="$case_root/log" TEST_TRACE="$case_root/trace" TEST_PROJECT="$case_root/project" \
    TEST_CASE_ROOT="$case_root" TMPDIR="$case_root/tmp" \
    "$@" /bin/zsh -f "$TEST_ROOT/probe.zsh" "$TEST_ROOT/library.zsh" "$probe_mode" 2>&1)"
  probe_rc=$?
  if [[ "$probe_rc" != "$expected_rc" || "$probe_output" != *"$expected_text"* || "$probe_output" == *$'\033'* ]]; then
    print -u2 -r -- "✖ ${case_name}：退出码 ${probe_rc}，预期 ${expected_rc}；夹具 ${case_root}"
    print -u2 -r -- "$probe_output"
    exit 1
  fi
  TEST_COUNT=$((TEST_COUNT + 1))
  print -r -- "✔ ${case_name}"
}
# 覆盖健康命令优先级、损坏回退和官方目录的兼容形式。
verify_tool_discovery() {
  make_fake_tool "$TEST_ROOT/path_flutter/path/flutter" 0
  make_fake_tool "$TEST_ROOT/path_flutter/home/fvm/bin/fvm" 0
  assert_probe path_flutter 0 "RESULT_ARG:$TEST_ROOT/path_flutter/path/flutter" find
  make_fake_tool "$TEST_ROOT/broken_flutter/path/flutter" 5
  make_fake_tool "$TEST_ROOT/broken_flutter/home/fvm/versions/stable/bin/flutter" 0
  assert_probe broken_flutter 0 "RESULT_ARG:$TEST_ROOT/broken_flutter/home/fvm/versions/stable/bin/flutter" find
  make_fake_tool "$TEST_ROOT/legacy_sdk/home/.fvm/versions/stable/bin/flutter" 0
  assert_probe legacy_sdk 0 "RESULT_ARG:$TEST_ROOT/legacy_sdk/home/.fvm/versions/stable/bin/flutter" find
  make_fake_tool "$TEST_ROOT/path_fvm/path/fvm" 0
  make_fake_tool "$TEST_ROOT/path_fvm/home/fvm/bin/fvm" 0
  assert_probe path_fvm 0 "RESULT_ARG:$TEST_ROOT/path_fvm/path/fvm" find
  make_fake_tool "$TEST_ROOT/official_fallback/path/fvm" 8
  make_fake_tool "$TEST_ROOT/official_fallback/home/fvm/bin/fvm" 0
  assert_probe official_fallback 0 "RESULT_ARG:$TEST_ROOT/official_fallback/home/fvm/bin/fvm" find
  make_fake_tool "$TEST_ROOT/custom_official/custom directory/bin/fvm" 0
  assert_probe custom_official 0 "RESULT_ARG:$TEST_ROOT/custom_official/custom directory/bin/fvm" find "FVM_INSTALL_DIR=$TEST_ROOT/custom_official/custom directory"
  make_fake_tool "$TEST_ROOT/tilde_official/home/custom/bin/fvm" 0
  assert_probe tilde_official 0 "RESULT_ARG:$TEST_ROOT/tilde_official/home/custom/bin/fvm" find 'FVM_INSTALL_DIR=~/custom/'
  make_fake_tool "$TEST_ROOT/home_official/home/bin/fvm" 0
  assert_probe home_official 0 "RESULT_ARG:$TEST_ROOT/home_official/home/bin/fvm" find 'FVM_INSTALL_DIR=~'
  make_fake_tool "$TEST_ROOT/pub_cache/home/.pub-cache/bin/fvm" 0
  assert_probe pub_cache 0 "RESULT_ARG:$TEST_ROOT/pub_cache/home/.pub-cache/bin/fvm" find
  make_fake_tool "$TEST_ROOT/brew_arm64/fake/fvm" 0
  assert_probe brew_arm64 0 'RESULT_ARG:/opt/homebrew/bin/fvm' find TEST_BREW_PATH=/opt/homebrew/bin/fvm
  make_fake_tool "$TEST_ROOT/brew_intel/fake/fvm" 0
  assert_probe brew_intel 0 'RESULT_ARG:/usr/local/bin/fvm' find TEST_BREW_PATH=/usr/local/bin/fvm
  assert_probe unavailable 1 'RESULT_RC:1' find
}
# 验证非交互防误触、Podfile 开关和失败后继续处理的业务边界。
verify_runtime_boundaries() {
  mkdir -p "$TEST_ROOT/intro_guard"
  print -r -- sentinel > "$TEST_ROOT/intro_guard/log"
  assert_probe intro_guard 1 '当前没有可交互输入' intro
  [[ "$(cat "$TEST_ROOT/intro_guard/log")" == sentinel ]] || exit 1
  assert_probe intro_skip 0 '核心用途：' intro JOBS_SKIP_README=1
  make_fake_tool "$TEST_ROOT/nonblocking_pub/home/fvm/bin/fvm" 0
  mkdir -p "$TEST_ROOT/nonblocking_pub/project/my_flutter" "$TEST_ROOT/nonblocking_pub/project/Pods/ignored"
  print -r -- 'name: fixture' > "$TEST_ROOT/nonblocking_pub/project/my_flutter/pubspec.yaml"
  print -r -- 'name: ignored' > "$TEST_ROOT/nonblocking_pub/project/Pods/ignored/pubspec.yaml"
  assert_probe nonblocking_pub 1 '宿主保持 non-blocking' core TEST_PUB_RC=7
  [[ "$(wc -l < "$TEST_ROOT/nonblocking_pub/trace" | tr -d ' ')" == 2 ]] || exit 1
  make_fake_tool "$TEST_ROOT/generate_podhelper/home/fvm/bin/fvm" 0
  mkdir -p "$TEST_ROOT/generate_podhelper/project/my_flutter"
  print -r -- 'name: fixture' > "$TEST_ROOT/generate_podhelper/project/my_flutter/pubspec.yaml"
  assert_probe generate_podhelper 0 '默认 Flutter iOS 配置已通过完整复检' core TEST_GENERATE=1
  [[ -f "$TEST_ROOT/generate_podhelper/project/my_flutter/.ios/Flutter/podhelper.rb" ]] || exit 1
}
# 为迁移测试生成完整健康的本机 module，并留下不可删除的 Pods 与锁文件哨兵。
make_module_fixture() {
  local case_name="$1"
  local case_root="$TEST_ROOT/$case_name"
  local module_dir="$case_root/project/my_flutter"
  mkdir -p "$module_dir/.ios/Flutter" "$module_dir/.ios/Pods" "$case_root/sdk/packages/flutter_tools/bin"
  print -r -- 'name: fixture' > "$module_dir/pubspec.yaml"
  print -r -- '# fixture module helper' > "$module_dir/.ios/Flutter/podhelper.rb"
  print -r -- '# fixture SDK helper' > "$case_root/sdk/packages/flutter_tools/bin/podhelper.rb"
  print -r -- 'Pods must remain' > "$module_dir/.ios/Pods/sentinel"
  print -r -- 'module lock must remain' > "$module_dir/.ios/Podfile.lock"
  print -r -- 'host lock must remain' > "$case_root/project/Podfile.lock"
  write_fixture_configs "$case_name" "$case_root/sdk" "$module_dir" "$case_root/sdk" "$module_dir"
}
# 写入仅属于测试夹具的指定路径，模拟仓库克隆或用户名迁移后的旧生成配置。
write_fixture_configs() {
  local case_name="$1" sdk_root="$2" module_path="$3" export_root="$4" export_module="$5"
  local flutter_dir="$TEST_ROOT/$case_name/project/my_flutter/.ios/Flutter"
  printf 'FLUTTER_ROOT=%s\nFLUTTER_APPLICATION_PATH=%s\n' "$sdk_root" "$module_path" > "$flutter_dir/Generated.xcconfig"
  printf '#!/bin/sh\nexport "FLUTTER_ROOT=%s"\nexport "FLUTTER_APPLICATION_PATH=%s"\n' "$export_root" "$export_module" > "$flutter_dir/flutter_export_environment.sh"
}
# 保存旧配置快照，便于断言失败恢复和健康分支完全不写配置。
snapshot_fixture_configs() {
  local case_root="$TEST_ROOT/$1"
  /bin/cp -p "$case_root/project/my_flutter/.ios/Flutter/Generated.xcconfig" "$case_root/original.Generated.xcconfig"
  /bin/cp -p "$case_root/project/my_flutter/.ios/Flutter/flutter_export_environment.sh" "$case_root/original.flutter_export_environment.sh"
}
# 验证旧配置逐字节恢复，且 Pods、module 锁文件和宿主锁文件始终保留。
assert_fixture_unchanged() {
  local case_root="$TEST_ROOT/$1"
  /usr/bin/cmp -s "$case_root/original.Generated.xcconfig" "$case_root/project/my_flutter/.ios/Flutter/Generated.xcconfig" || exit 1
  /usr/bin/cmp -s "$case_root/original.flutter_export_environment.sh" "$case_root/project/my_flutter/.ios/Flutter/flutter_export_environment.sh" || exit 1
  assert_fixture_sentinels "$1"
}
# 验证不会通过删除 .ios、Pods 或锁文件来修复配置。
assert_fixture_sentinels() {
  local case_root="$TEST_ROOT/$1"
  [[ "$(< "$case_root/project/my_flutter/.ios/Pods/sentinel")" == 'Pods must remain' ]] || exit 1
  [[ "$(< "$case_root/project/my_flutter/.ios/Podfile.lock")" == 'module lock must remain' ]] || exit 1
  [[ "$(< "$case_root/project/Podfile.lock")" == 'host lock must remain' ]] || exit 1
}
# 校验官方命令调用次数，健康分支不得调用工具，修复最多执行两次 pub get。
assert_pub_get_count() {
  local case_root="$TEST_ROOT/$1" expected_count="$2" actual_count=0
  if [[ -f "$case_root/trace" ]]; then
    actual_count="$(/usr/bin/awk '/ \| (flutter )?pub get \| / { count++ } END { print count + 0 }' "$case_root/trace")"
  fi
  if [[ "$actual_count" != "$expected_count" ]]; then
    print -u2 -r -- "✖ $1：pub get 次数 ${actual_count}，预期 ${expected_count}。"
    exit 1
  fi
}
# 断言正式脚本按当前电脑生成了配置，且未顺手清理既有依赖或锁文件。
assert_fixture_repaired() {
  local case_name="$1" expected_count="${2:-2}"
  local case_root="$TEST_ROOT/$case_name"
  /usr/bin/grep -Fqx "FLUTTER_ROOT=$case_root/sdk" "$case_root/project/my_flutter/.ios/Flutter/Generated.xcconfig" || exit 1
  /usr/bin/grep -Fqx "FLUTTER_APPLICATION_PATH=$case_root/project/my_flutter" "$case_root/project/my_flutter/.ios/Flutter/Generated.xcconfig" || exit 1
  /usr/bin/grep -Fqx "export \"FLUTTER_APPLICATION_PATH=$case_root/project/my_flutter\"" "$case_root/project/my_flutter/.ios/Flutter/flutter_export_environment.sh" || exit 1
  assert_pub_get_count "$case_name" "$expected_count"
  assert_fixture_sentinels "$case_name"
}
# 覆盖旧用户名、旧工程目录、旧 export 与 SDK helper 缺失等真实迁移故障。
verify_generated_config_migration() {
  local case_name="" case_root="" module_dir=""
  make_module_fixture healthy_skip
  snapshot_fixture_configs healthy_skip
  assert_probe healthy_skip 0 '默认 Flutter iOS 配置完整健康，跳过' core
  [[ ! -f "$TEST_ROOT/healthy_skip/trace" ]] || exit 1
  assert_fixture_unchanged healthy_skip

  for case_name in migrated_user migrated_project migrated_export_root migrated_export_project missing_sdk_helper; do
    make_module_fixture "$case_name"
    make_fake_tool "$TEST_ROOT/$case_name/home/fvm/bin/fvm" 0
    case_root="$TEST_ROOT/$case_name"
    module_dir="$case_root/project/my_flutter"
    case "$case_name" in
      migrated_user)
        write_fixture_configs "$case_name" /Users/old-owner/fvm/versions/stable "$module_dir" /Users/old-owner/fvm/versions/stable "$module_dir"
        ;;
      migrated_project)
        write_fixture_configs "$case_name" "$case_root/sdk" '/Users/old-owner/Documents/Gitee/old project/my_flutter' "$case_root/sdk" '/Users/old-owner/Documents/Gitee/old project/my_flutter'
        ;;
      migrated_export_root)
        write_fixture_configs "$case_name" "$case_root/sdk" "$module_dir" /Users/old-owner/fvm/versions/stable "$module_dir"
        ;;
      migrated_export_project)
        write_fixture_configs "$case_name" "$case_root/sdk" "$module_dir" "$case_root/sdk" '/Users/old-owner/Documents/Gitee/old project/my_flutter'
        ;;
      missing_sdk_helper)
        mkdir -p "$case_root/incomplete sdk"
        write_fixture_configs "$case_name" "$case_root/incomplete sdk" "$module_dir" "$case_root/incomplete sdk" "$module_dir"
        ;;
    esac
    assert_probe "$case_name" 0 '官方 pub get 已重生成并通过完整配置复检' core TEST_REGENERATE_IF_MISSING=1
    assert_fixture_repaired "$case_name"
  done

  make_module_fixture missing_export
  /bin/rm "$TEST_ROOT/missing_export/project/my_flutter/.ios/Flutter/flutter_export_environment.sh"
  make_fake_tool "$TEST_ROOT/missing_export/home/fvm/bin/fvm" 0
  assert_probe missing_export 0 '官方 pub get 已重生成并通过完整配置复检' core TEST_REGENERATE_IF_MISSING=1
  assert_fixture_repaired missing_export

  make_module_fixture missing_generated
  /bin/rm "$TEST_ROOT/missing_generated/project/my_flutter/.ios/Flutter/Generated.xcconfig"
  make_fake_tool "$TEST_ROOT/missing_generated/home/fvm/bin/fvm" 0
  assert_probe missing_generated 0 'Flutter iOS 配置已通过完整复检' core TEST_REGENERATE_IF_MISSING=1
  assert_fixture_repaired missing_generated 1
}
# 覆盖重生成命令失败、假成功、helper 未修复及默认 module 不可替代的失败边界。
verify_config_repair_failures() {
  local case_name="" case_root="" module_dir=""
  for case_name in regenerate_failed regenerate_invalid first_pub_failed regenerate_interrupted; do
    make_module_fixture "$case_name"
    make_fake_tool "$TEST_ROOT/$case_name/home/fvm/bin/fvm" 0
    case_root="$TEST_ROOT/$case_name"
    module_dir="$case_root/project/my_flutter"
    write_fixture_configs "$case_name" /Users/old-owner/fvm/versions/stable "$module_dir" /Users/old-owner/fvm/versions/stable "$module_dir"
    snapshot_fixture_configs "$case_name"
    case "$case_name" in
      regenerate_failed)
        assert_probe "$case_name" 1 '重生成未完成，已尝试恢复原配置' core TEST_REGEN_PUB_RC=23
        assert_pub_get_count "$case_name" 2
        ;;
      regenerate_invalid)
        assert_probe "$case_name" 1 '官方重生成后配置仍未通过复检' core TEST_REGENERATE_IF_MISSING=1 TEST_REGEN_WRONG_APP=1
        assert_pub_get_count "$case_name" 2
        ;;
      first_pub_failed)
        assert_probe "$case_name" 1 'flutter pub get 失败' core TEST_PUB_RC=7
        assert_pub_get_count "$case_name" 1
        ;;
      regenerate_interrupted)
        assert_probe "$case_name" 143 '重生成未完成，已尝试恢复原配置' core TEST_REGEN_SIGNAL=TERM
        assert_pub_get_count "$case_name" 2
        ;;
    esac
    assert_fixture_unchanged "$case_name"
  done

  make_module_fixture missing_module_helper
  /bin/rm "$TEST_ROOT/missing_module_helper/project/my_flutter/.ios/Flutter/podhelper.rb"
  snapshot_fixture_configs missing_module_helper
  make_fake_tool "$TEST_ROOT/missing_module_helper/home/fvm/bin/fvm" 0
  assert_probe missing_module_helper 1 'module podhelper 缺失或不可读' core TEST_REGENERATE_IF_MISSING=1
  assert_pub_get_count missing_module_helper 2
  assert_fixture_unchanged missing_module_helper

  make_module_fixture other_module_not_substitute
  make_fake_tool "$TEST_ROOT/other_module_not_substitute/home/fvm/bin/fvm" 0
  case_root="$TEST_ROOT/other_module_not_substitute"
  module_dir="$case_root/project/my_flutter"
  /bin/cp -R "$module_dir" "$case_root/project/another_module"
  printf 'FLUTTER_ROOT=%s\nFLUTTER_APPLICATION_PATH=%s\n' "$case_root/sdk" "$case_root/project/another_module" > "$case_root/project/another_module/.ios/Flutter/Generated.xcconfig"
  printf 'export "FLUTTER_ROOT=%s"\nexport "FLUTTER_APPLICATION_PATH=%s"\n' "$case_root/sdk" "$case_root/project/another_module" > "$case_root/project/another_module/.ios/Flutter/flutter_export_environment.sh"
  write_fixture_configs other_module_not_substitute /Users/old-owner/fvm/versions/stable "$module_dir" /Users/old-owner/fvm/versions/stable "$module_dir"
  snapshot_fixture_configs other_module_not_substitute
  assert_probe other_module_not_substitute 1 '其它候选不能替代默认 module' core TEST_PUB_RC=7
  assert_fixture_unchanged other_module_not_substitute
}
# 覆盖真实路径别名、重复键及脚本文字注入，确保只读解析不会执行生成配置。
verify_config_parser_boundaries() {
  local case_root="" module_dir=""
  make_module_fixture healthy_symlink_alias
  case_root="$TEST_ROOT/healthy_symlink_alias"
  module_dir="$case_root/project/my_flutter"
  ln -s "$case_root/sdk" "$case_root/sdk alias"
  ln -s "$module_dir" "$case_root/module alias"
  write_fixture_configs healthy_symlink_alias "$case_root/sdk alias" "$case_root/module alias" "$case_root/sdk" "$module_dir"
  snapshot_fixture_configs healthy_symlink_alias
  assert_probe healthy_symlink_alias 0 '默认 Flutter iOS 配置完整健康，跳过' core
  assert_fixture_unchanged healthy_symlink_alias

  make_module_fixture duplicate_root_key
  print -r -- 'FLUTTER_ROOT=/Users/old-owner/another-sdk' >> "$TEST_ROOT/duplicate_root_key/project/my_flutter/.ios/Flutter/Generated.xcconfig"
  make_fake_tool "$TEST_ROOT/duplicate_root_key/home/fvm/bin/fvm" 0
  assert_probe duplicate_root_key 0 '官方 pub get 已重生成并通过完整配置复检' core TEST_REGENERATE_IF_MISSING=1
  assert_fixture_repaired duplicate_root_key

  make_module_fixture export_never_executed
  case_root="$TEST_ROOT/export_never_executed"
  module_dir="$case_root/project/my_flutter"
  write_fixture_configs export_never_executed "$case_root/sdk" "$module_dir" '$(/usr/bin/touch "'"$case_root"'/must-not-exist")' "$module_dir"
  make_fake_tool "$case_root/home/fvm/bin/fvm" 0
  assert_probe export_never_executed 0 '官方 pub get 已重生成并通过完整配置复检' core TEST_REGENERATE_IF_MISSING=1
  [[ ! -e "$case_root/must-not-exist" ]] || exit 1
  assert_fixture_repaired export_never_executed

  make_module_fixture missing_tool_keeps_configs
  case_root="$TEST_ROOT/missing_tool_keeps_configs"
  module_dir="$case_root/project/my_flutter"
  write_fixture_configs missing_tool_keeps_configs /Users/old-owner/fvm/versions/stable "$module_dir" /Users/old-owner/fvm/versions/stable "$module_dir"
  snapshot_fixture_configs missing_tool_keeps_configs
  assert_probe missing_tool_keeps_configs 0 '未检测到 flutter / fvm' core
  assert_fixture_unchanged missing_tool_keeps_configs
}
# 汇报已完成的隔离用例数。
report_test_result() {
  [[ "$TEST_COUNT" == 34 ]] || exit 1
  print -r -- "✔ ${TEST_COUNT} 项隔离回归通过；未执行真实 Flutter / FVM / CocoaPods。"
}
# 编排自述、隔离环境和两类回归。
main() {
  show_script_intro_and_wait # 先说明测试范围，确认后才写入临时夹具。
  initialize_test_runtime # 校验源码语法并隔离用户目录、PATH 和业务产物。
  verify_tool_discovery # 验证候选优先级、健康检查和官方安装位置发现。
  verify_runtime_boundaries # 验证交互开关、忽略目录及 pub get 失败边界。
  verify_generated_config_migration # 验证跨电脑残留路径与缺失配置由官方命令重生成。
  verify_config_repair_failures # 验证失败恢复、严格复检及默认 module 的独立边界。
  verify_config_parser_boundaries # 验证真实路径别名、重复键与非执行式解析。
  report_test_result # 汇报已通过的用例总数。
}

main "$@"
