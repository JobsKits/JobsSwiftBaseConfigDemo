#!/bin/zsh
# 脚本自述：
# - 用隔离 HOME、PATH 和本地假安装器验证 FVM 安装来源切换与失败边界。
# - 仅写入系统临时目录，不访问网络，不安装或升级真实工具。
# - 独立运行先回车确认；自动验证可显式传入 --run，按 Ctrl+C 取消。

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
TEST_LIBRARY=""
TEST_NETWORK_MODULE=""
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
  local target_script="${runner_dir:h:h}/【MacOS】配置Flutter环境.sh"
  TEST_NETWORK_MODULE="${runner_dir:h:h}/【MacOS】FlutterSDK网络选路.zsh/【MacOS】FlutterSDK网络选路.zsh"
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
  # 安装来源夹具只测原流程，新增网络入口明确替身，禁止意外联网。
  jobs_swift_flutter_network_load() { return 0; }
  jobs_flutter_fvm_runtime() { return 0; }
  jobs_flutter_sdk_retry() { shift 4; "$@"; }
  jfs_fvm_timed() { "$@"; }
  jfs_fvm_context_fields() { return 1; }
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
# 公共wrapper实际隔离父环境，SDK成功后配置与普通pub业务只执行一次。
test_sdk_network_phase_order() {
  JOBS_SWIFT_FLUTTER_NETWORK_MODULE="$TEST_NETWORK_MODULE"
  source "$JOBS_SWIFT_FLUTTER_NETWORK_MODULE" || return 1
  jobs_swift_flutter_network_load() { return 0; }
  jfs_fvm_context_fields() { print -r -- "https://fixture.invalid/flutter.git"$'\t'"$HOME/fvm/versions"; }
  jobs_flutter_route_prepare() {
    local rounds="$(grep -c '^route:' "$TRACE" || true)"
    (( rounds<4 )) || return 130
    print -r -- "route:${4:-dart}" >> "$TRACE"
    export FLUTTER_STORAGE_BASE_URL=https://selected.fixture.invalid
    return 0
  }
  jobs_flutter_fvm_install() {
    print -r -- fvm-sdk-fetch >> "$TRACE"
    /bin/mkdir -p "$HOME/fvm/versions/stable/bin"
    /bin/cat > "$HOME/fvm/versions/stable/bin/flutter" <<'SDK_FIXTURE'
#!/bin/zsh -f
print -r -- "sdk:${*}:source=${FLUTTER_STORAGE_BASE_URL:-unset}" >> "$TRACE"
if [[ "$1" == precache ]]; then
  /bin/mkdir -p "$HOME/fvm/versions/stable/bin/cache/artifacts/engine/ios/Flutter.xcframework"
fi
[[ "$1" != pub ]] || exit 9
SDK_FIXTURE
    /bin/chmod +x "$HOME/fvm/versions/stable/bin/flutter"
  }
  FVM_BIN="$FAKE_FVM"
  export FLUTTER_STORAGE_BASE_URL=https://parent.fixture.invalid
  ensure_flutter_stable || return 1
  [[ "$FLUTTER_STORAGE_BASE_URL" == https://parent.fixture.invalid ]] || return 1
  precache_flutter_ios || return 1
  precache_flutter_ios || return 1
  [[ "$FLUTTER_STORAGE_BASE_URL" == https://parent.fixture.invalid ]] || return 1
  MY_FLUTTER_DIR="$CASE_ROOT/my_flutter"
  /bin/mkdir -p "$MY_FLUTTER_DIR"
  if flutter_pub_get_in_my_flutter; then return 1; fi
  assert_trace_count '^fvm-sdk-fetch$' 1 || return 1
  assert_trace_count '^route:' 2 || return 1
  assert_trace_count '^sdk:--version:source=https://selected.fixture.invalid$' 1 || return 1
  assert_trace_count '^sdk:precache --ios:' 1 || return 1
  assert_trace_count '^sdk:pub get:' 1 || return 1
  /usr/bin/awk '/^route:dart/{p=NR} /^sdk:--version/{s=NR} /^fvm global stable/{g=NR} END {exit !(p && s>p && g>s)}' "$TRACE"
}
# FVM获取取消不得继续原生自举、全局切换或平台准备。
test_sdk_cancel_stops_followups() {
  FVM_BIN="$FAKE_FVM"
  jobs_flutter_fvm_install() { return 130; }
  ensure_flutter_stable
  [[ $? == 130 ]] || return 1
  assert_trace_count '^fvm global|^sdk:' 0
}
# 管理器下载取消不能被原Homebrew到官方安装器回退吞掉。
test_fvm_cancel_does_not_fallback() {
  install_fvm_with_brew() { return 130; }
  install_fvm_official() { print -r -- forbidden-fallback >> "$TRACE"; return 0; }
  ensure_fvm
  [[ $? == 130 ]] || return 1
  assert_trace_count '^forbidden-fallback' 0
}
# 管理器自身Dart补齐被取消时，不能继续候选探测或回退其它安装器。
test_fvm_runtime_cancel_stops_discovery() {
  seed_healthy_fvm "${HOME}/fvm/bin/fvm"
  jobs_flutter_fvm_runtime() { return 130; }
  install_fvm_official() { print -r -- forbidden-fallback >> "$TRACE"; return 0; }
  ensure_fvm
  [[ $? == 130 ]] || return 1
  assert_trace_count '^fvm |^brew |^curl |^installer |^forbidden-fallback' 0
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
      test_failed_fvm_stops_flutter_flow \
      test_sdk_network_phase_order \
      test_sdk_cancel_stops_followups \
      test_fvm_cancel_does_not_fallback \
      test_fvm_runtime_cancel_stops_discovery; do
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
