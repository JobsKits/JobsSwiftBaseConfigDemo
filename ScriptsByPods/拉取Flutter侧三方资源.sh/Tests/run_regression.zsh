#!/bin/zsh
# 脚本自述：
# - 核心用途：用临时目录和假 Flutter / FVM 验证工具发现、确认和 non-blocking 分支。
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
if [[ "${TEST_GENERATE:-0}" == 1 ]]; then
  mkdir -p .ios/Flutter
  print -r -- '# fixture' > .ios/Flutter/podhelper.rb
fi
exit "${TEST_PUB_RC:-0}"
FAKE
  } > "$target_path"
  chmod +x "$target_path"
}
# 在独立用户目录及 PATH 中验证返回码、输出和纯文本降级。
assert_probe() {
  local case_name="$1" expected_rc="$2" expected_text="$3" probe_mode="$4"
  local case_root="$TEST_ROOT/$case_name" probe_output="" probe_rc=0
  shift 4
  mkdir -p "$case_root"
  probe_output="$(/usr/bin/env -i PATH="$case_root/path:/usr/bin:/bin" HOME="$case_root/home" \
    TEST_LOG="$case_root/log" TEST_TRACE="$case_root/trace" TEST_PROJECT="$case_root/project" \
    TEST_CASE_ROOT="$case_root" \
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
  assert_probe nonblocking_pub 0 '当前脚本保持 non-blocking' core TEST_PUB_RC=7
  [[ "$(wc -l < "$TEST_ROOT/nonblocking_pub/trace" | tr -d ' ')" == 2 ]] || exit 1
  make_fake_tool "$TEST_ROOT/generate_podhelper/home/fvm/bin/fvm" 0
  mkdir -p "$TEST_ROOT/generate_podhelper/project/my_flutter"
  print -r -- 'name: fixture' > "$TEST_ROOT/generate_podhelper/project/my_flutter/pubspec.yaml"
  assert_probe generate_podhelper 0 '已生成默认 podhelper' core TEST_GENERATE=1
  [[ -f "$TEST_ROOT/generate_podhelper/project/my_flutter/.ios/Flutter/podhelper.rb" ]] || exit 1
}
# 汇报已完成的隔离用例数。
report_test_result() {
  [[ "$TEST_COUNT" == 16 ]] || exit 1
  print -r -- "✔ ${TEST_COUNT} 项隔离回归通过；未执行真实 Flutter / FVM / CocoaPods。"
}
# 编排自述、隔离环境和两类回归。
main() {
  show_script_intro_and_wait # 先说明测试范围，确认后才写入临时夹具。
  initialize_test_runtime # 校验源码语法并隔离用户目录、PATH 和业务产物。
  verify_tool_discovery # 验证候选优先级、健康检查和官方安装位置发现。
  verify_runtime_boundaries # 验证交互开关、忽略目录及 pub get 失败边界。
  report_test_result # 汇报已通过的用例总数。
}

main "$@"
