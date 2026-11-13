#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 核心用途：用临时目录和假 Flutter / FVM 验证工具发现、跨电脑配置重生成、恢复与非阻断边界。
# - 影响范围：只创建临时夹具，不执行真实安装、Flutter 或 CocoaPods。
# - 运行提示：终端回车继续；自动验证显式传 --run，保留夹具可传 JOBS_KEEP_TEST_FIXTURES=1。

# >>> Jobs terminal style protection v1 >>>
# 临时保护当前终端配色，业务进程自行管理原有退出清理。
jobs_terminal_style_run() {
    # 无法可靠保存原色时，沿用脚本已有的纯文本约定。
    jobs_terminal_style_plain() {
        PLAIN_OUTPUT=1
        NO_COLOR=1
        FORCE_COLOR=0
        CLICOLOR=0
        ANSI_COLORS_DISABLED=1
        npm_config_color=false
        export PLAIN_OUTPUT NO_COLOR FORCE_COLOR CLICOLOR ANSI_COLORS_DISABLED npm_config_color
        if "$@"; then
            jobs_style_exit_status=0
        else
            jobs_style_exit_status=$?
        fi
        exit "$jobs_style_exit_status"
    }
    if [ ! -t 0 ] || [ ! -t 1 ] || [ -z "${TERM:-}" ] ||
       [ "${TERM:-}" = dumb ] || [ "${NO_COLOR+x}" = x ] ||
       [ "${PLAIN_OUTPUT:-0}" = 1 ] || [ "${IS_SOURCETREE_RUNTIME:-0}" = 1 ] ||
       env | LC_ALL=C grep -qiE '^(SOURCETREE|SOURCE_TREE)'; then
        if "$@"; then
            jobs_style_exit_status=0
        else
            jobs_style_exit_status=$?
        fi
        exit "$jobs_style_exit_status"
    fi
    if [ -n "${TMUX:-}${STY:-}" ]; then
        jobs_terminal_style_plain "$@"
    fi
    jobs_style_tty=$(tty 2>/dev/null) || jobs_terminal_style_plain "$@"
    if ! ps -o pgid= -o tpgid= -p "$$" 2>/dev/null |
         LC_ALL=C awk 'NF == 2 && $1 == $2 && $1 > 0 { foreground = 1 } END { exit !foreground }'; then
        jobs_terminal_style_plain "$@"
    fi
    case ${JOBS_TERMINAL_STYLE_OWNER:-} in
        ''|*[!0-9]*) ;;
        *)
            if [ "${JOBS_TERMINAL_STYLE_TTY:-}" = "$jobs_style_tty" ] &&
               kill -0 "$JOBS_TERMINAL_STYLE_OWNER" 2>/dev/null; then
                if "$@"; then
                    jobs_style_exit_status=0
                else
                    jobs_style_exit_status=$?
                fi
                exit "$jobs_style_exit_status"
            fi
            ;;
    esac
    jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || jobs_terminal_style_plain "$@"
    jobs_style_saved=''
    jobs_style_saved_rows=''
    jobs_style_applied_rows=''
    jobs_style_changed=0
    jobs_style_applied_complete=0
    jobs_style_query_active=0
    jobs_style_recovery=''
    jobs_style_exit_status=0
    jobs_style_esc=$(printf '\033')
    jobs_style_bel=$(printf '\007')
    # 只接受本次请求对应的 RGB 响应；非协议输入使本次探测失败。
    jobs_terminal_style_query() {
        jobs_style_query_key=$1
        printf '\033]%s;?\007' "$jobs_style_query_key" > /dev/tty || return 1
        jobs_style_reply=''
        for jobs_style_attempt in 1 2 3; do
            jobs_style_piece=$(dd bs=256 count=1 2>/dev/null < /dev/tty)
            jobs_style_reply=$jobs_style_reply$jobs_style_piece
            case $jobs_style_reply in
                *"$jobs_style_bel"|*"$jobs_style_esc\\") break ;;
                '') ;;
                "$jobs_style_esc"*) ;;
                *) break ;;
            esac
        done
        case $jobs_style_reply in
            "$jobs_style_esc]$jobs_style_query_key;rgb:"*"$jobs_style_bel")
                jobs_style_rgb=${jobs_style_reply#"$jobs_style_esc]$jobs_style_query_key;rgb:"}
                jobs_style_rgb=${jobs_style_rgb%"$jobs_style_bel"}
                ;;
            "$jobs_style_esc]$jobs_style_query_key;rgb:"*"$jobs_style_esc\\")
                jobs_style_rgb=${jobs_style_reply#"$jobs_style_esc]$jobs_style_query_key;rgb:"}
                jobs_style_rgb=${jobs_style_rgb%"$jobs_style_esc\\"}
                ;;
            *) return 1 ;;
        esac
        jobs_style_normalized=$(printf '%s\n' "$jobs_style_rgb" | LC_ALL=C awk -F/ '
            NF != 3 { exit 1 }
            {
                for (i = 1; i <= 3; i++) {
                    h = tolower($i)
                    if (length(h) < 1 || length(h) > 4 || h ~ /[^0-9a-f]/) exit 1
                    n = 0
                    for (j = 1; j <= length(h); j++) n = n * 16 + index("0123456789abcdef", substr(h, j, 1)) - 1
                    value[i] = int(n * 65535 / (16 ^ length(h) - 1) + 0.5)
                }
                printf "%d/%d/%d", value[1], value[2], value[3]
            }
        ') || return 1
        [ -n "$jobs_style_normalized" ]
    }
    # 查询可用不代表终端允许改色，按目标值核对实际生效结果。
    jobs_terminal_style_accepts_target() {
        jobs_style_requested_hex=''
        case $1 in
            10|12) jobs_style_requested_hex=ffffff ;;
            11) jobs_style_requested_hex=000000 ;;
            '4;'*)
                jobs_style_requested_index=0
                for jobs_style_requested_color in 000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff; do
                    if [ "4;$jobs_style_requested_index" = "$1" ]; then
                        jobs_style_requested_hex=$jobs_style_requested_color
                        break
                    fi
                    jobs_style_requested_index=$((jobs_style_requested_index + 1))
                done
                ;;
        esac
        [ -n "$jobs_style_requested_hex" ] || return 1
        printf '%s|%s\n' "$jobs_style_normalized" "$jobs_style_requested_hex" | LC_ALL=C awk -F'|' '
            function hexbyte(h) {
                return (index("0123456789abcdef", substr(h, 1, 1)) - 1) * 16 + index("0123456789abcdef", substr(h, 2, 1)) - 1
            }
            {
                if (split($1, actual, "/") != 3 || length($2) != 6) exit 1
                for (i = 1; i <= 3; i++) {
                    difference = actual[i] - hexbyte(substr($2, i * 2 - 1, 2)) * 257
                    if (difference < -255 || difference > 255) exit 1
                }
            }
        '
    }
    # 检测到后续改色时只恢复仍由本次保护持有的项，保留独立恢复入口。
    jobs_terminal_style_cleanup() {
        jobs_style_result=$1
        trap '' HUP INT TERM
        if [ "$jobs_style_query_active" = 1 ]; then
            stty "$jobs_style_stty" 2>/dev/null < /dev/tty || :
            jobs_style_query_active=0
        fi
        if [ "$jobs_style_changed" = 1 ]; then
            jobs_style_cleanup_ok=0
            jobs_style_conflicts=''
            jobs_style_restore_safe=''
            if [ "$jobs_style_applied_complete" = 1 ]; then
                jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || jobs_style_stty=''
                if [ -n "$jobs_style_stty" ] && stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty; then
                    jobs_style_query_active=1
                    jobs_style_cleanup_ok=1
                    while IFS='|' read -r jobs_style_key jobs_style_expected jobs_style_original; do
                        [ -n "$jobs_style_key" ] || continue
                        if ! jobs_terminal_style_query "$jobs_style_key"; then
                            jobs_style_cleanup_ok=0
                            break
                        fi
                        if [ "$jobs_style_normalized" = "$jobs_style_expected" ]; then
                            jobs_style_restore_safe=$jobs_style_restore_safe$jobs_style_original
                        else
                            jobs_style_conflicts="$jobs_style_conflicts $jobs_style_key"
                        fi
                    done <<JOBS_STYLE_APPLIED
$jobs_style_applied_rows
JOBS_STYLE_APPLIED
                    stty "$jobs_style_stty" 2>/dev/null < /dev/tty || jobs_style_cleanup_ok=0
                    jobs_style_query_active=0
                fi
            fi
            if [ "$jobs_style_cleanup_ok" = 1 ] && printf '%s\033[0m' "$jobs_style_restore_safe" > /dev/tty; then
                if [ -z "$jobs_style_conflicts" ]; then
                    rm -f "$jobs_style_recovery"
                    rmdir "${jobs_style_recovery%/*}" 2>/dev/null || :
                else
                    printf '检测到运行期间的配色变更，已保留这些项：%s\n' "$jobs_style_conflicts" >&2
                    printf '确认要覆盖后续改色时才使用恢复入口：sh "%s"\n' "$jobs_style_recovery" >&2
                    [ "$jobs_style_result" -ne 0 ] || jobs_style_result=1
                fi
            else
                printf '终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh "%s"\n' "$jobs_style_recovery" >&2
                [ "$jobs_style_result" -ne 0 ] || jobs_style_result=1
            fi
        fi
        if [ "${2:-}" = continue ]; then
            jobs_style_cleanup_status=$jobs_style_result
            return 0
        fi
        exit "$jobs_style_result"
    }
    trap 'jobs_terminal_style_cleanup "$jobs_style_exit_status"' 0
    trap 'jobs_style_exit_status=129; exit 129' HUP
    trap 'jobs_style_exit_status=130; exit 130' INT
    trap 'jobs_style_exit_status=143; exit 143' TERM
    if ! stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty; then
        jobs_terminal_style_plain "$@"
    fi
    jobs_style_query_active=1
    jobs_style_probe_ok=1
    for jobs_style_key in 10 11 12 '4;0' '4;1' '4;2' '4;3' '4;4' '4;5' '4;6' '4;7' '4;8' '4;9' '4;10' '4;11' '4;12' '4;13' '4;14' '4;15'; do
        if ! jobs_terminal_style_query "$jobs_style_key"; then
            jobs_style_probe_ok=0
            break
        fi
        jobs_style_saved=$jobs_style_saved$jobs_style_reply
        jobs_style_saved_rows="$jobs_style_saved_rows$jobs_style_key|$jobs_style_reply
"
    done
    stty "$jobs_style_stty" 2>/dev/null < /dev/tty || { jobs_style_exit_status=1; exit 1; }
    jobs_style_query_active=0
    if [ "$jobs_style_probe_ok" != 1 ]; then
        printf '%s\n' '终端不支持完整配色保存，或启动时收到其它输入；保留原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    jobs_style_recovery_dir=$(umask 077; mktemp -d "${TMPDIR:-/tmp}/jobs-terminal-style.XXXXXX") || jobs_terminal_style_plain "$@"
    jobs_style_recovery=$jobs_style_recovery_dir/restore.sh
    if ! (umask 077; {
        printf '#!/bin/sh\n'
        printf '[ -t 0 ] && [ "$(tty)" = '\''%s'\'' ] || { printf '\''请在原终端运行恢复入口。\\n'\'' >&2; exit 1; }\n' "$jobs_style_tty"
        printf 'printf '\''本操作会覆盖此终端当前配色。确认恢复脚本启动前的配色，请输入 YES：'\'' >&2\n'
        printf 'IFS= read -r jobs_restore_choice\n[ "$jobs_restore_choice" = YES ] || exit 1\n'
        printf 'printf '\''%%s\\033[0m'\'' '\''%s'\'' > /dev/tty\n' "$jobs_style_saved"
    } > "$jobs_style_recovery"); then
        printf '%s\n' '无法保存终端配色恢复入口；保留原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    printf '正在准备本次终端临时配色；强退后恢复入口：sh "%s"\n' "$jobs_style_recovery" >&2
    jobs_style_changed=1
    printf '\033]10;#ffffff\007\033]11;#000000\007\033]12;#ffffff\007' > /dev/tty
    jobs_style_index=0
    for jobs_style_color in 000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff; do
        printf '\033]4;%s;#%s\007' "$jobs_style_index" "$jobs_style_color" > /dev/tty
        jobs_style_index=$((jobs_style_index + 1))
    done
    printf '\033[0m' > /dev/tty
    jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || { jobs_style_exit_status=1; exit 1; }
    stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty || { jobs_style_exit_status=1; exit 1; }
    jobs_style_query_active=1
    jobs_style_probe_ok=1
    jobs_style_targets_ok=1
    while IFS='|' read -r jobs_style_key jobs_style_original; do
        [ -n "$jobs_style_key" ] || continue
        if ! jobs_terminal_style_query "$jobs_style_key"; then
            jobs_style_probe_ok=0
            break
        fi
        jobs_style_applied_rows="$jobs_style_applied_rows$jobs_style_key|$jobs_style_normalized|$jobs_style_original
"
        if ! jobs_terminal_style_accepts_target "$jobs_style_key"; then
            jobs_style_targets_ok=0
        fi
    done <<JOBS_STYLE_ORIGINAL
$jobs_style_saved_rows
JOBS_STYLE_ORIGINAL
    stty "$jobs_style_stty" 2>/dev/null < /dev/tty || { jobs_style_exit_status=1; exit 1; }
    jobs_style_query_active=0
    if [ "$jobs_style_probe_ok" != 1 ]; then
        printf '%s\n' '无法核实本次临时配色，已停止启动业务。' >&2
        jobs_style_exit_status=1
        exit 1
    fi
    jobs_style_applied_complete=1
    if [ "$jobs_style_targets_ok" != 1 ]; then
        jobs_terminal_style_cleanup 0 continue
        jobs_style_changed=0
        if [ "$jobs_style_cleanup_status" != 0 ]; then
            jobs_style_exit_status=1
            exit 1
        fi
        trap 'jobs_style_exit_status=129; exit 129' HUP
        trap 'jobs_style_exit_status=130; exit 130' INT
        trap 'jobs_style_exit_status=143; exit 143' TERM
        printf '%s\n' '终端未接受本次配色，已恢复原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    printf '%s\n' '本次终端已临时使用黑底白字。' >&2
    JOBS_TERMINAL_STYLE_TTY=$jobs_style_tty
    JOBS_TERMINAL_STYLE_OWNER=$$
    export JOBS_TERMINAL_STYLE_TTY JOBS_TERMINAL_STYLE_OWNER
    if "$@"; then
        jobs_style_exit_status=0
    else
        jobs_style_exit_status=$?
    fi
    exit "$jobs_style_exit_status"
}
# 仅监督直接执行的入口；被 source 时不切换配色、不重新执行业务。
jobs_terminal_style_bootstrap() {
    jobs_style_bootstrap_script=$1
    shift
    if [ -n "${ZSH_VERSION:-}" ]; then
        case ${ZSH_EVAL_CONTEXT:-} in
            *:file|*:file:*) return 0 ;;
        esac
    elif [ -n "${BASH_VERSION:-}" ] && [ "${BASH_SOURCE:-$jobs_style_bootstrap_script}" != "$jobs_style_bootstrap_script" ]; then
        return 0
    fi
    if [ "${JOBS_TERMINAL_STYLE_REEXEC:-}" = "$jobs_style_bootstrap_script" ]; then
        unset JOBS_TERMINAL_STYLE_REEXEC
        return 0
    fi
    if [ ! -t 0 ] || [ ! -t 1 ] || [ -z "${TERM:-}" ] ||
       [ "${TERM:-}" = dumb ] || [ "${NO_COLOR+x}" = x ] ||
       [ "${PLAIN_OUTPUT:-0}" = 1 ] || [ "${IS_SOURCETREE_RUNTIME:-0}" = 1 ] ||
       [ -n "${TMUX:-}${STY:-}" ] ||
       env | LC_ALL=C grep -qiE '^(SOURCETREE|SOURCE_TREE)'; then
        return 0
    fi
    case ${JOBS_TERMINAL_STYLE_OWNER:-} in
        ''|*[!0-9]*) ;;
        *)
            if kill -0 "$JOBS_TERMINAL_STYLE_OWNER" 2>/dev/null &&
               [ "${JOBS_TERMINAL_STYLE_TTY:-}" = "$(tty 2>/dev/null)" ]; then
                return 0
            fi
            ;;
    esac
    JOBS_TERMINAL_STYLE_REEXEC=$jobs_style_bootstrap_script
    export JOBS_TERMINAL_STYLE_REEXEC
    jobs_terminal_style_run /bin/zsh "$jobs_style_bootstrap_script" "$@"
    jobs_style_bootstrap_result=$?
    exit "$jobs_style_bootstrap_result"
}
jobs_terminal_style_bootstrap "$0" "$@"
# <<< Jobs terminal style protection v1 <<<

TEST_ROOT=""
SOURCE_SCRIPT=""
TEST_COUNT=0

# 先说明隔离验证范围，再按入口完成确认。
show_script_intro_and_wait() {
  print -r -- 'Flutter 资源拉取脚本隔离回归：仅在临时目录运行假命令，不执行真实安装。'
  print -r -- '独立终端按回车继续，Ctrl+C 取消；--run 可供自动隔离验证。'
  [[ "$#" == 1 && "$1" == --run ]] && return 0
  if [[ ! -t 0 ]]; then
    print -u2 -r -- '✖ 当前没有可交互输入，请在终端运行或显式传 --run。'
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
  SOURCE_SCRIPT="${${(%):-%x}:A:h:h:h}/【MacOS】拉取Flutter侧三方资源.sh"
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
  assert_probe intro_skip_rejected 1 '当前没有可交互输入' intro JOBS_SKIP_README=1 JOBS_POD_INSTALL_HOOK=1
  assert_probe intro_check_only 0 '跳过 Flutter 资源拉取和配置修复' intro JOBS_POD_INSTALL_INTERACTION=check-only
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
  [[ "$TEST_COUNT" == 35 ]] || exit 1
  print -r -- "✔ ${TEST_COUNT} 项隔离回归通过；未执行真实 Flutter / FVM / CocoaPods。"
}
# 编排自述、隔离环境和两类回归。
main() {
  show_script_intro_and_wait "$@" # 先说明测试范围，确认或显式 --run 后才写入临时夹具。
  initialize_test_runtime # 校验源码语法并隔离用户目录、PATH 和业务产物。
  verify_tool_discovery # 验证候选优先级、健康检查和官方安装位置发现。
  verify_runtime_boundaries # 验证交互开关、忽略目录及 pub get 失败边界。
  verify_generated_config_migration # 验证跨电脑残留路径与缺失配置由官方命令重生成。
  verify_config_repair_failures # 验证失败恢复、严格复检及默认 module 的独立边界。
  verify_config_parser_boundaries # 验证真实路径别名、重复键与非执行式解析。
  report_test_result # 汇报已通过的用例总数。
}

main "$@"
