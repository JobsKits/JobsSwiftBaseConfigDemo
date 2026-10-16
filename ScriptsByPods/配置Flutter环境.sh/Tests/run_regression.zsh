#!/bin/zsh
# 脚本自述：
# - 用隔离 HOME、PATH 和本地假安装器验证 FVM 安装来源切换与失败边界。
# - 仅写入系统临时目录，不访问网络，不安装或升级真实工具。
# - 独立运行先回车确认；自动验证可显式传入 --run，按 Ctrl+C 取消。

TEST_ROOT=""
TEST_LIBRARY=""
TEST_TOTAL=0
TEST_FAILED=0

# 先说明隔离范围，显式 --run 可用于自动回归。
show_test_intro_and_wait() {
  print -r -- 'FVM 安装回退隔离回归'
  print -r -- '1、所有 curl、Homebrew 和安装器均使用本地假命令，无真实网络或安装。'
  print -r -- '2、仅在临时目录运行；成功后清理，失败时保留日志；按 Ctrl+C 取消。'
  if [[ "$#" == 1 && "$1" == --run ]]; then
    return 0
  fi
  if (( $# != 0 )) || [[ ! -t 0 ]]; then
    print -u2 -r -- '请在终端运行后回车确认，或显式传入 --run 执行隔离回归。'
    exit 1
  fi
  read -r '?👉 已了解隔离范围，按回车继续：' _ || exit 1
}
# 成功时只清理本次创建的临时目录；失败时保留排查证据。
cleanup_test_root() {
  if [[ -n "$TEST_ROOT" && -d "$TEST_ROOT" && "$TEST_FAILED" == 0 ]]; then
    /bin/rm -r -- "$TEST_ROOT"
  fi
}
# 仅根 Shell 退出时清理，避免子 Shell 和命令替换提前删除夹具。
TRAPEXIT() {
  if (( ZSH_SUBSHELL == 0 )); then
    cleanup_test_root
  fi
}
# 提取函数定义，保证 source 时不运行主入口。
prepare_test_runtime() {
  setopt NO_NOMATCH
  local runner_dir="${${(%):-%x}:A:h}"
  local target_script="${runner_dir:h}/配置Flutter环境.sh"
  TEST_ROOT="$(/usr/bin/mktemp -d "${TMPDIR:-/tmp}/jobs-fvm-regression.XXXXXX")" || exit 1
  TEST_LIBRARY="${TEST_ROOT}/fvm-functions.zsh"
  if ! /usr/bin/awk '
    $0 == "main \"$@\"" { entry_count++; next }
    { print }
    END { if (entry_count != 1) exit 1 }
  ' "$target_script" > "$TEST_LIBRARY"; then
    TEST_FAILED=1
    print -u2 -r -- '无法安全提取主脚本函数：必须且只能存在一个 main "$@" 入口。'
    exit 1
  fi
}
# 写入只会记录版本调用的健康 FVM 假二进制。
write_fake_fvm() {
  /bin/cat > "$FAKE_FVM" <<'FIXTURE'
#!/bin/sh
printf 'fvm %s\n' "$*" >> "$TRACE"
if [ "${1:-}" = --version ]; then
  printf '%s\n' '4.3.2-fixture'
fi
FIXTURE
  /bin/chmod +x "$FAKE_FVM"
}
# 假 curl 仅复制本地安装器，禁止转发任何真实网络请求。
write_fake_curl() {
  /bin/cat > "${FIXTURE_BIN}/curl" <<'FIXTURE'
#!/bin/zsh -f
print -r -- "curl $*" >> "$TRACE"
destination=""
found_url=0
while (( $# )); do
  case "$1" in
    -o|--output) destination="$2"; shift 2 ;;
    https://fvm.app/install.sh) found_url=1; shift ;;
    *) shift ;;
  esac
done
[[ "$found_url" == 1 && -n "$destination" ]] || exit 98
case "$CASE_CURL_MODE" in
  fail) print -u2 -r -- 'fixture: network unavailable'; exit 22 ;;
  empty) : > "$destination" ;;
  *) /bin/cp "$FAKE_INSTALLER" "$destination" ;;
esac
FIXTURE
  /bin/chmod +x "${FIXTURE_BIN}/curl"
}
# 假 Homebrew 支持健康检查、环境激活和可控安装结果。
write_fake_brew() {
  /bin/cat > "${FIXTURE_BIN}/brew" <<'FIXTURE'
#!/bin/zsh -f
print -r -- "brew $*" >> "$TRACE"
case "$1" in
  --version) [[ "$CASE_BREW_MODE" != unhealthy ]] || exit 2; print 'Homebrew fixture' ;;
  --prefix) print -r -- "${FIXTURE_BIN:h}" ;;
  shellenv) printf 'export PATH=%q:$PATH\n' "$FIXTURE_BIN" ;;
  install|upgrade)
    [[ "$2" == fvm ]] || exit 97
    case "$CASE_BREW_MODE" in
      fail) exit 11 ;;
      broken) printf '#!/bin/sh\nexit 8\n' > "${FIXTURE_BIN}/fvm" ;;
      *) /bin/cp "$FAKE_FVM" "${FIXTURE_BIN}/fvm" ;;
    esac
    /bin/chmod +x "${FIXTURE_BIN}/fvm"
    ;;
  *) exit 96 ;;
esac
FIXTURE
  /bin/chmod +x "${FIXTURE_BIN}/brew"
}
# 本地假安装器只写测试目录，并模拟无二进制、损坏和执行失败。
write_fake_installer() {
  /bin/cat > "$FAKE_INSTALLER" <<'FIXTURE'
#!/bin/bash
printf 'installer %s\n' "$FVM_INSTALL_DIR" >> "$TRACE"
case "$CASE_INSTALLER_MODE" in
  fail) exit 7 ;;
  no_binary) exit 0 ;;
esac
/bin/mkdir -p "$FVM_INSTALL_DIR/bin"
case "$CASE_INSTALLER_MODE" in
  broken) printf '#!/bin/sh\nexit 8\n' > "$FVM_INSTALL_DIR/bin/fvm" ;;
  *) /bin/cp "$FAKE_FVM" "$FVM_INSTALL_DIR/bin/fvm" ;;
esac
/bin/chmod +x "$FVM_INSTALL_DIR/bin/fvm"
FIXTURE
}
# 创建独立环境，并限制候选发现，避免访问本机固定前缀中的工具。
initialize_case() {
  export HOME="${CASE_ROOT}/home" TMPDIR="${CASE_ROOT}/tmp"
  export FIXTURE_BIN="${CASE_ROOT}/bin" TRACE="${CASE_ROOT}/trace.log"
  export FAKE_FVM="${CASE_ROOT}/healthy-fvm" FAKE_INSTALLER="${CASE_ROOT}/installer.sh"
  export CASE_BREW_MODE=absent CASE_CURL_MODE=success CASE_INSTALLER_MODE=success
  export PATH="${FIXTURE_BIN}:/usr/bin:/bin:/usr/sbin:/sbin"
  export JOBS_FLUTTER_AUTO_SETUP=1 NO_COLOR=1
  unset FVM_INSTALL_DIR FVM_HOME BASH_ENV ENV ZDOTDIR
  /bin/mkdir -p "$HOME" "$TMPDIR" "$FIXTURE_BIN"
  : > "$TRACE"
  write_fake_fvm
  write_fake_curl
  write_fake_brew
  write_fake_installer
  source "$TEST_LIBRARY" || return 1
  LOG_FILE="${CASE_ROOT}/business.log"
  : > "$LOG_FILE"
  functions -c fvm_is_healthy fixture_fvm_is_healthy || return 1
  # 固定 Homebrew 前缀不得逃逸到本机真实安装。
  fvm_is_healthy() {
    [[ "$1" == "${CASE_ROOT}/"* ]] || return 1
    fixture_fvm_is_healthy "$@"
  }
  # 仅从当前用例的假 Homebrew 发现安装入口。
  find_brew_bin() {
    [[ "$CASE_BREW_MODE" != absent ]] || return 1
    "${FIXTURE_BIN}/brew" --version >/dev/null 2>&1 || return 1
    "${FIXTURE_BIN}/brew" --prefix >/dev/null 2>&1 || return 1
    print -r -- "${FIXTURE_BIN}/brew"
  }
}
# 在指定测试路径放入健康 FVM。
seed_healthy_fvm() {
  /bin/mkdir -p "${1:h}"
  /bin/cp "$FAKE_FVM" "$1"
  /bin/chmod +x "$1"
}
# 在 PATH 中模拟会失败的残缺 shim。
seed_broken_shim() {
  printf '#!/bin/sh\nexit 8\n' > "${FIXTURE_BIN}/fvm"
  /bin/chmod +x "${FIXTURE_BIN}/fvm"
}
# 验证精确安装路径及当前会话 PATH 可立即执行 FVM。
assert_active_fvm() {
  if [[ "$FVM_BIN" != "$1" || "$(command -v fvm)" != "$1" ]]; then
    print -u2 -r -- "FVM 路径不符：选中 ${FVM_BIN}，PATH 为 $(command -v fvm)，预期 $1"
    return 1
  fi
  [[ "$(fvm --version)" == 4.3.2-fixture ]]
}
# 断言某类假命令调用次数。
assert_trace_count() {
  local actual_count="$(/usr/bin/grep -c -E -- "$1" "$TRACE" || true)"
  if [[ "$actual_count" != "$2" ]]; then
    print -u2 -r -- "调用次数不符：$1，预期 $2，实际 $actual_count"
    return 1
  fi
}
# 验证健康 FVM 跳过 Homebrew 探测及全部安装。
test_healthy_fvm_skips_brew() {
  CASE_BREW_MODE=success
  seed_healthy_fvm "${HOME}/fvm/bin/fvm"
  ensure_fvm || return 1
  assert_active_fvm "${HOME}/fvm/bin/fvm" || return 1
  assert_trace_count '^brew |^curl |^installer ' 0
}
# 没有 Homebrew 时直接回退官方安装并保留 SDK 缓存。
test_no_brew_uses_official() {
  /bin/mkdir -p "${HOME}/fvm/versions/stable"
  print -r -- 'existing Flutter cache' > "${HOME}/fvm/versions/stable/keep.txt"
  ensure_fvm || return 1
  assert_active_fvm "${HOME}/fvm/bin/fvm" || return 1
  assert_trace_count '^curl ' 1 || return 1
  assert_trace_count '^installer ' 1 || return 1
  [[ "$(<"${HOME}/fvm/versions/stable/keep.txt")" == 'existing Flutter cache' ]]
}
# Brew 安装失败时只回退一次官方安装。
test_brew_failure_uses_official() {
  CASE_BREW_MODE=fail
  ensure_fvm || return 1
  assert_active_fvm "${HOME}/fvm/bin/fvm" || return 1
  assert_trace_count '^brew install fvm$' 1 || return 1
  assert_trace_count '^brew tap ' 0 || return 1
  assert_trace_count '^installer ' 1
}
# Brew 返回成功但二进制不可执行时继续官方回退。
test_brew_broken_binary_uses_official() {
  CASE_BREW_MODE=broken
  ensure_fvm || return 1
  assert_active_fvm "${HOME}/fvm/bin/fvm" || return 1
  assert_trace_count '^brew install fvm$' 1 || return 1
  assert_trace_count '^installer ' 1
}
# 健康 Brew 安装成功时不再下载官方安装器。
test_brew_success_skips_official() {
  CASE_BREW_MODE=success
  ensure_fvm || return 1
  assert_active_fvm "${FIXTURE_BIN}/fvm" || return 1
  assert_trace_count '^brew install fvm$' 1 || return 1
  assert_trace_count '^curl |^installer ' 0
}
# 损坏的 Brew 健康检查失败后跳过其安装步骤。
test_unhealthy_brew_uses_official() {
  CASE_BREW_MODE=unhealthy
  ensure_fvm || return 1
  assert_active_fvm "${HOME}/fvm/bin/fvm" || return 1
  assert_trace_count '^brew install ' 0 || return 1
  assert_trace_count '^installer ' 1
}
# 下载失败必须停止，不能执行残缺安装器。
test_curl_failure_blocks_installer() {
  CASE_CURL_MODE=fail
  if install_fvm_official; then
    return 1
  fi
  assert_trace_count '^curl ' 1 || return 1
  assert_trace_count '^installer ' 0
}
# 空下载即使退出码为零也不能执行安装器。
test_empty_download_blocks_installer() {
  CASE_CURL_MODE=empty
  if install_fvm_official; then
    return 1
  fi
  assert_trace_count '^installer ' 0
}
# 安装器返回零但没有产物时必须失败。
test_installer_without_binary_fails() {
  CASE_INSTALLER_MODE=no_binary
  if install_fvm_official; then
    return 1
  fi
  assert_trace_count '^installer ' 1
}
# 安装器返回零但产物无法执行时必须失败。
test_installer_broken_binary_fails() {
  CASE_INSTALLER_MODE=broken
  if install_fvm_official; then
    return 1
  fi
  assert_trace_count '^installer ' 1
}
# 安装器自身失败时传播失败，不误判成功。
test_installer_failure_is_propagated() {
  CASE_INSTALLER_MODE=fail
  if install_fvm_official; then
    return 1
  fi
  assert_trace_count '^installer ' 1
}
# 自定义安装目录包含空格时保持完整路径并立即激活。
test_custom_directory_with_spaces() {
  export FVM_INSTALL_DIR="${HOME}/Tools/FVM with spaces"
  ensure_fvm || return 1
  assert_active_fvm "${FVM_INSTALL_DIR}/bin/fvm" || return 1
  [[ "$OFFICIAL_FVM_DIR" == "$FVM_INSTALL_DIR" ]]
}
# 发现坏 shim 后复用健康官方安装，无需重新下载。
test_broken_path_shim_finds_official() {
  seed_broken_shim
  seed_healthy_fvm "${HOME}/fvm/bin/fvm"
  ensure_fvm || return 1
  assert_active_fvm "${HOME}/fvm/bin/fvm" || return 1
  assert_trace_count '^brew |^curl |^installer ' 0
}
# FVM 安装失败时禁止进入后续 Flutter 操作。
test_failed_fvm_stops_flutter_flow() {
  CASE_CURL_MODE=fail
  # 记录下游入口，避免执行任何真实 Flutter 命令。
  ensure_flutter_stable() { print -r -- flutter-start >> "$TRACE"; }
  # 记录引擎预缓存入口。
  precache_flutter_ios() { print -r -- flutter-precache >> "$TRACE"; }
  # 记录模块资源拉取入口。
  flutter_pub_get_in_my_flutter() { print -r -- flutter-pub-get >> "$TRACE"; }
  if run_flutter_environment_setup; then
    return 1
  fi
  assert_trace_count '^flutter-' 0
}
# 在子 Shell 中运行单项用例，隔离函数覆盖、环境变量和 PATH。
run_case() {
  local case_name="$1"
  local CASE_ROOT="${TEST_ROOT}/${case_name}"
  TEST_TOTAL=$((TEST_TOTAL + 1))
  /bin/mkdir -p "$CASE_ROOT"
  if (
    initialize_case || exit 1
    "$case_name"
  ) </dev/null > "${CASE_ROOT}/output.log" 2>&1; then
    print -r -- "通过 ${TEST_TOTAL}：${case_name}"
  else
    TEST_FAILED=$((TEST_FAILED + 1))
    print -u2 -r -- "失败 ${TEST_TOTAL}：${case_name}（${CASE_ROOT}/output.log）"
    /bin/cat "${CASE_ROOT}/output.log" >&2
  fi
}
# 覆盖安装来源、健康复检、路径刷新及失败停止边界。
run_regression_cases() {
  local case_name=""
  for case_name in \
      test_healthy_fvm_skips_brew \
      test_no_brew_uses_official \
      test_brew_failure_uses_official \
      test_brew_broken_binary_uses_official \
      test_brew_success_skips_official \
      test_unhealthy_brew_uses_official \
      test_curl_failure_blocks_installer \
      test_empty_download_blocks_installer \
      test_installer_without_binary_fails \
      test_installer_broken_binary_fails \
      test_installer_failure_is_propagated \
      test_custom_directory_with_spaces \
      test_broken_path_shim_finds_official \
      test_failed_fvm_stops_flutter_flow; do
    run_case "$case_name"
  done
}
# 汇总回归结果并返回可用于自动验证的退出码。
report_regression_result() {
  print -r -- "回归完成：${TEST_TOTAL} 项，失败 ${TEST_FAILED} 项。"
  if (( TEST_FAILED != 0 )); then
    print -u2 -r -- "失败日志保留在：${TEST_ROOT}"
    exit 1
  fi
}
# 编排说明、隔离准备、回归执行和结果汇总。
main() {
  show_test_intro_and_wait "$@" # 展示用途与隔离边界，显式 --run 可自动执行。
  prepare_test_runtime # 创建临时目录并安全载入主脚本函数。
  run_regression_cases # 逐项验证假环境下的安装分支和停止边界。
  report_regression_result # 汇总结果并传播失败退出码。
}

main "$@"
