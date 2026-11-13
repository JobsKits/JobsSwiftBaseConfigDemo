#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 检查 FVM、Flutter stable 与 iOS 缓存；Homebrew 安装失败时回退 FVM 官方安装器。
# - 会安装工具、更新 Flutter 缓存及 my_flutter 生成文件；官方安装器可能迁移旧 FVM。
# - 每次交互运行先回车确认；check-only / skip 不执行，显式自动配置保留原有范围。

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

# JOBS_INPUT_CHOICE_STYLE_BEGIN
# 只展示提示选项；不读取答案、不改变默认值、返回码或业务环境。
jobs_prompt_color_ready() {
  [ -z "${NO_COLOR+x}" ] && [ -n "${TERM:-}" ] && [ "${TERM:-}" != dumb ] &&
    [ "${PLAIN_OUTPUT:-0}" != 1 ] && [ "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]
}
# 原生 awk 分段着色；任意/非空输入优先，括号内外沿用同一个选项。
jobs_prompt_format() {
  /usr/bin/awk -v color="${1:-0}" -v lines="${2:-0}" -v keep="${3:-0}" '
    function typedEnter(value, start, prefix) {
      prefix = substr(value, 1, start - 1)
      gsub(/[“”‘’「」『』"]/, "", prefix)
      gsub(sprintf("%c", 39), "", prefix)
      if (prefix ~ /(空格|[Ss][Pp][Aa][Cc][Ee])[[:space:]]*(后|再|并|[Tt][Hh][Ee][Nn])?[[:space:]]*$/) return 1
      return prefix ~ /(输入|键入|填写|[Tt]ype)[^；;|]*[[:alnum:]_+-]+[[:space:]]*(后|再|并)?[[:space:]]*$/
    }
    function greenPosition(value, token, start) {
      if (match(value, /(直接|仅|只需|只|按下|按)?[[:space:]]*(回车|回車)/)) {
        start = RSTART
        return typedEnter(value, start) ? 0 : start
      }
      if (!match(value, /(^|[^[:alnum:]_])([Ee][Nn][Tt][Ee][Rr]|[Rr][Ee][Tt][Uu][Rr][Nn])([^[:alnum:]_]|$)/)) return 0
      start = RSTART
      token = substr(value, RSTART, RLENGTH)
      match(token, /[Ee][Nn][Tt][Ee][Rr]|[Rr][Ee][Tt][Uu][Rr][Nn]/)
      start += RSTART - 1
      return typedEnter(value, start) ? 0 : start
    }
    function segment(value, inherited, start, kind, prefix, body, red, green, connector, left, right, splitAt) {
      if (value == "") return value
      kind = inherited
      start = 1
      if (!kind) {
        if (match(value, /(输入)?(任意|任何)(非空)?(字符|内容|输入|键)|非空(字符|内容|输入)?|其它输入|其他输入|[Tt]ype (anything|any[^ ]*)|[Pp]ress any key/)) {
          red = RSTART
        }
        green = greenPosition(value)
        if (red && green && green < red) {
          left = substr(value, 1, red - 1)
          right = substr(value, red)
          connector = ""
          if (match(left, /(或者|或)[[:space:]]*$/)) {
            connector = substr(left, RSTART)
            left = substr(left, 1, RSTART - 1)
          }
          return segment(left, 0) connector segment(right, 31)
        }
        if (red && green && red < green && match(value, /或[[:space:]]*(直接|仅|只需|只|按下|按)?(回车|回車)/)) {
          splitAt = RSTART
          return segment(substr(value, 1, splitAt - 1), 31) "或" segment(substr(value, splitAt + length("或")), 0)
        }
        if (red) {
          kind = 31
          start = red
        } else if (green) {
          kind = 32
          start = green
        }
      }
      if (!kind || !color) return value
      prefix = substr(value, 1, start - 1)
      body = substr(value, start)
      return prefix esc "[1;" kind "m" body esc "[0m"
    }
    function render(value, output, part, boundary, inherited, kind, consumed, depth, original) {
      original = value
      gsub(esc "\\[[0-9;]*m", "", value)
      if (color && keep && !greenPosition(value) && value !~ /(任意|任何|非空|其它输入|其他输入|[Tt]ype (anything|any[^ ]*)|[Pp]ress any key)/) return original
      output = ""
      inherited = 0
      depth = 0
      while (match(value, /[；;\/|，,、？?：:=＝（）()\[\]【】]/)) {
        part = substr(value, 1, RSTART - 1)
        boundary = substr(value, RSTART, RLENGTH)
        consumed = RSTART + RLENGTH
        output = output segment(part, inherited) boundary
        if (boundary ~ /[（(\[【]/) {
          depth++
          if (part ~ /(任意|任何|非空|其它输入|其他输入|[Tt]ype (anything|any[^ ]*)|[Pp]ress any key)/) inherited = 31
          else if (greenPosition(part)) inherited = 32
        } else if (boundary ~ /[）)\]】]/) {
          if (depth) depth--
        } else if (boundary ~ /[：:=＝]/) {
          if (!inherited) {
            if (part ~ /(任意|任何|非空|其它输入|其他输入)/) inherited = 31
            else if (greenPosition(part)) inherited = 32
          }
        } else if (!depth) inherited = 0
        value = substr(value, consumed)
      }
      return output segment(value, inherited)
    }
    BEGIN { esc = sprintf("%c", 27); first = 1 }
    {
      if (lines == 2) {
        if (!first) printf "%s\n", render(pending)
        pending = $0
        first = 0
        next
      }
      if (!lines && !first) printf "\n"
      printf "%s", render($0)
      if (lines) printf "\n"
      first = 0
    }
    END {
      if (lines == 2 && !first) {
        sub(sprintf("%c", 1) "$", "", pending)
        printf "%s", render(pending)
      }
    }
  '
}
# read 的命令替换会使 stdout 成为管道，按输入与提示所在 stderr 判断终端。
jobs_prompt_render() {
  local jobs_prompt_color=0
  if [ -t 0 ] && [ -t 2 ] && jobs_prompt_color_ready; then jobs_prompt_color=1; fi
  printf "%s" "$1" | jobs_prompt_format "$jobs_prompt_color" 0
}
# 仅放在显示链末端；tee 在此函数之前接收纯文本，不把 ANSI 写入日志。
jobs_prompt_stream() {
  local jobs_prompt_color=0
  if [ -t 1 ] && jobs_prompt_color_ready; then jobs_prompt_color=1; fi
  jobs_prompt_format "$jobs_prompt_color" 1 1
}
# 显示管道保留原末尾换行；只删除本轮追加的最后一个结束标记。
jobs_prompt_filter() {
  local jobs_prompt_color=0
  if [ -t 1 ] && jobs_prompt_color_ready; then jobs_prompt_color=1; fi
  { /bin/cat; printf '\001'; } | jobs_prompt_format "$jobs_prompt_color" 2 1
}
# 仅包装原 printf/echo/print 展示，原参数、尾换行与显示命令退出码保持不变。
jobs_prompt_output() {
  local jobs_prompt_status=0 jobs_prompt_stderr=0 jobs_prompt_arg="" jobs_prompt_previous=""
  if [ "${1:-}" = print ]; then
    for jobs_prompt_arg in "$@"; do
      case "$jobs_prompt_arg" in -?*u2*|-u2) jobs_prompt_stderr=1 ;; esac
      if [ "$jobs_prompt_previous" = -u ] && [ "$jobs_prompt_arg" = 2 ]; then jobs_prompt_stderr=1; fi
      jobs_prompt_previous="$jobs_prompt_arg"
      [ "$jobs_prompt_arg" != -- ] || break
    done
  fi
  if [ -n "${ZSH_VERSION:-}" ]; then
    if [ "$jobs_prompt_stderr" = 1 ]; then
      "$@" 2>&1 | jobs_prompt_filter >&2
      jobs_prompt_status=$(( ${pipestatus[1]} != 0 ? ${pipestatus[1]} : ${pipestatus[2]} ))
    else
      "$@" | jobs_prompt_filter
      jobs_prompt_status=$(( ${pipestatus[1]} != 0 ? ${pipestatus[1]} : ${pipestatus[2]} ))
    fi
  elif [ -n "${BASH_VERSION:-}" ]; then
    "$@" | jobs_prompt_filter
    jobs_prompt_status=$(( ${PIPESTATUS[0]} != 0 ? ${PIPESTATUS[0]} : ${PIPESTATUS[1]} ))
  else
    "$@" | jobs_prompt_filter
    jobs_prompt_status=$?
  fi
  return "$jobs_prompt_status"
}
# 仅替换日志 primitive 的 tee：磁盘同步追加纯文，终端保留非选项原色。
jobs_prompt_tee() {
  local jobs_prompt_log="$1" jobs_prompt_line="" jobs_prompt_newline=0
  while :; do
    jobs_prompt_line=""
    if IFS= read -r jobs_prompt_line; then jobs_prompt_newline=1; else jobs_prompt_newline=0; [ -n "$jobs_prompt_line" ] || break; fi
    if [ "$jobs_prompt_newline" = 1 ]; then
      { printf '%s\n' "$jobs_prompt_line"; printf '\001'; } | jobs_prompt_format 0 2 >> "$jobs_prompt_log" || return $?
      printf '%s\n' "$jobs_prompt_line" | jobs_prompt_filter || return $?
    else
      { printf '%s' "$jobs_prompt_line"; printf '\001'; } | jobs_prompt_format 0 2 >> "$jobs_prompt_log" || return $?
      printf '%s' "$jobs_prompt_line" | jobs_prompt_filter || return $?
    fi
  done
}
# JOBS_INPUT_CHOICE_STYLE_END

SCRIPT_DIR=""
SCRIPT_PATH=""
SCRIPT_BASENAME=""
LOG_FILE=""
ROOT_DIR=""
MY_FLUTTER_DIR=""
BREW_BIN=""
FVM_BIN=""
FVM_HOME="${FVM_HOME:-}"
OFFICIAL_FVM_DIR=""
FLUTTER_BIN=""
JOBS_SWIFT_FLUTTER_NETWORK_MODULE="${${(%):-%x}:A:h}/【MacOS】FlutterSDK网络选路.zsh/【MacOS】FlutterSDK网络选路.zsh"

# 惰性加载随包模块；check-only和取消入口不触发网络检测。
jobs_swift_flutter_network_load() {
  (( $+functions[jobs_flutter_fvm_install] )) && return 0
  [[ -f "$JOBS_SWIFT_FLUTTER_NETWORK_MODULE" ]] || { error_echo '缺少随包Flutter SDK网络模块，请保留完整脚本目录。'; return 1; }
  source "$JOBS_SWIFT_FLUTTER_NETWORK_MODULE"
}
# 选路与SDK获取均由子进程执行，不遗留父Shell网络环境。
jobs_swift_flutter_sdk_run() {
  jobs_swift_flutter_network_load || return $?
  JOBS_SDK_LOG_REPLACED=0 jobs_flutter_sdk_retry "$@"
}
# FVM原Git获取与Dart/引擎自举分别检测，保留FVM生效源和缓存位置。
jobs_swift_flutter_fvm_install() {
  jobs_swift_flutter_network_load || return $?
  JOBS_SDK_LOG_REPLACED=0 jobs_flutter_fvm_install "$@"
}
# SDK原生命令保持真实输出并追加本任务日志。
jobs_swift_flutter_command() {
  "$@" 2>&1 | tee -a "$LOG_FILE"
  return "${pipestatus[1]}"
}

# 同步终端与文件日志，非彩色环境剥离展示用 ANSI 控制码。
log() {
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    printf '%b\n' "$1" | jobs_prompt_tee "$LOG_FILE"
  else
    printf '%b\n' "$1" | /usr/bin/sed $'s/\033\\[[0-9;]*m//g' | jobs_prompt_tee "$LOG_FILE"
  fi
}
# 输出常规信息。
color_echo()     { log "\033[1;32m$1\033[0m"; }
# 输出环境信息。
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
# 输出已验证的成功结果。
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
# 输出可恢复的失败与风险。
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
# 输出温馨提示。
warm_echo()      { log "\033[1;33m$1\033[0m"; }
# 输出操作说明。
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
# 输出阻止当前业务继续的错误。
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
# 输出错误正文。
err_echo()       { log "\033[1;31m$1\033[0m"; }
# 输出诊断信息。
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
# 输出重点路径。
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
# 输出次要说明。
gray_echo()      { log "\033[0;90m$1\033[0m"; }
# 输出流程提示。
bold_echo()      { log "\033[1m$1\033[0m"; }
# 输出下划线提示。
underline_echo() { log "\033[4m$1\033[0m"; }
# 在确认前只解析展示所需路径，不写入文件。
prepare_script_context() {
  SCRIPT_PATH="${${(%):-%x}:A}"
  SCRIPT_DIR="${SCRIPT_PATH:h}"
  SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
  LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
  ROOT_DIR="$(resolve_project_root)"
  MY_FLUTTER_DIR="${ROOT_DIR}/my_flutter"
  OFFICIAL_FVM_DIR="$(resolve_official_fvm_dir)"
}
# 打印固定自述；模式跳过与显式自动配置分别处理，钩子标记不代替确认。
show_script_intro_and_wait() {
  prepare_script_context
  local title_style="" body_style="" reset_style=""
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    title_style=$'\033[1;31m'
    body_style=$'\033[0;34m'
    reset_style=$'\033[0m'
  fi
  printf '%s配置 Flutter 环境%s\n' "$title_style" "$reset_style"
  printf '%s%s%s\n' "$body_style" '1、复用可用 FVM；缺失时尝试 Homebrew，失败后自动使用 FVM 官方安装器。' "$reset_style"
  printf '%s%s%s\n' "$body_style" '2、按需准备 Flutter stable、iOS 引擎及 my_flutter 依赖；官方安装器可能迁移旧 FVM。' "$reset_style"
  printf '%s%s%s\n' "$body_style" '3、SDK获取前检测网络并自动选路；流量可能经过已配置代理，仅影响本任务子进程，退出后恢复原环境；Ctrl+C可取消。' "$reset_style"
  printf '%s日志：%s；按 Ctrl+C 可取消。%s\n' "$body_style" "$LOG_FILE" "$reset_style"
  case "${JOBS_POD_INSTALL_INTERACTION:-interactive}" in
    check-only|skip)
      printf '%s\n' "模式：${JOBS_POD_INSTALL_INTERACTION}，跳过 Flutter 写入任务。"
      exit 0
      ;;
    interactive) ;;
    *)
      printf '%s\n' '无效的 JOBS_POD_INSTALL_INTERACTION；仅支持 interactive、check-only、skip。' >&2
      exit 2
      ;;
  esac
  [[ "${JOBS_FLUTTER_AUTO_SETUP:-}" == 1 ]] && return 0
  if [[ ! -t 0 ]]; then
    printf '%s\n' '当前无交互输入；请在终端运行，或显式设置 JOBS_FLUTTER_AUTO_SETUP=1。' >&2
    exit 1
  fi
  read -r "?$(jobs_prompt_render '👉 已了解用途与影响，按回车继续；按 Ctrl+C 取消：')" _ || exit 1
}
# 确认后初始化 Shell 与日志，保持 Podfile 公布的日志路径。
initialize_runtime() {
  setopt NO_NOMATCH
  : > "$LOG_FILE" || exit 1
}
# 安装与升级默认跳过；非交互必要安装由显式自动配置开关决定。
ask_any_to_run() {
  local message="$1"
  local noninteractive_default="${2:-skip}"
  local answer=""

  if [[ ! -t 0 ]]; then
    if [[ "$noninteractive_default" == "run" ]]; then
      note_echo "非交互环境：${message} -> 默认执行。"
      return 0
    fi
    note_echo "非交互环境：${message} -> 默认跳过。"
    return 1
  fi

  jobs_prompt_output printf "%s（直接回车跳过；输入任意字符后回车执行）：" "$message"
  IFS= read -r answer || return 1
  [[ -n "$answer" ]]
}
# 为危险操作保留精确 YES 确认。
confirm_yes() {
  local message="$1"
  local input=""

  if [[ ! -t 0 ]]; then
    warn_echo "非交互环境无法输入 YES：${message} -> 默认取消。"
    return 1
  fi

  echo ""
  warn_echo "⚠ ${message}"
  jobs_prompt_output gray_echo "危险操作必须输入 YES 后回车；其它输入一律取消。"
  printf "➤ "
  IFS= read -r input || return 1
  [[ "$input" == "YES" ]]
}
# 清理拖入路径的外层引号。
strip_outer_quotes() {
  local value="$1"
  value="${value%$'\r'}"
  value="${value%$'\n'}"
  value="${value#\"}"
  value="${value%\"}"
  value="${value#\'}"
  value="${value%\'}"
  printf '%s\n' "$value"
}
# 识别 Apple Silicon 与 Intel。
get_cpu_arch() {
  [[ "$(uname -m)" == "arm64" ]] && echo "arm64" || echo "x86_64"
}
# 从同名脚本包定位工程根目录。
resolve_project_root() {
  local parent_dir="$(cd "${SCRIPT_DIR}/.." && pwd)"

  if [[ "$(basename "$parent_dir")" == "ScriptsByPods" ]]; then
    cd "${parent_dir}/.." && pwd
  else
    echo "$parent_dir"
  fi
}
# 只在显式自动配置时允许非交互安装缺失项。
flutter_auto_prompt_default() {
  [[ "${JOBS_FLUTTER_AUTO_SETUP:-}" == "1" ]] && echo "run" || echo "skip"
}
# 展开官方安装目录；此目录只管理 FVM 二进制，不改变 Flutter 缓存位置。
resolve_official_fvm_dir() {
  local install_dir="${FVM_INSTALL_DIR:-${HOME}/fvm}"
  case "$install_dir" in
    '~') install_dir="$HOME" ;;
    '~/'*) install_dir="${HOME}/${install_dir#\~/}" ;;
  esac
  printf '%s\n' "${install_dir%/}"
}
# 只复用已有且健康的 Homebrew；FVM 官方安装不依赖 Homebrew。
find_brew_bin() {
  local candidate=""
  for candidate in "$(command -v brew 2>/dev/null)" /opt/homebrew/bin/brew /usr/local/bin/brew; do
    [[ -n "$candidate" && -x "$candidate" ]] || continue
    "$candidate" --version >/dev/null 2>&1 || continue
    "$candidate" --prefix >/dev/null 2>&1 || continue
    printf '%s\n' "$candidate"
    return 0
  done
  return 1
}
# 除路径存在外，必须确认候选二进制真实可运行。
fvm_is_healthy() {
  [[ -n "$1" && -x "$1" ]] || return 1
  local version_output=""
  jobs_swift_flutter_network_load || return $?
  JOBS_SDK_LOG_REPLACED=0 jobs_flutter_fvm_runtime 'FVM 管理器 Dart 运行时' "$LOG_FILE" "$1" || return $?
  version_output="$("$1" --version 2>/dev/null)" || return $?
  [[ -n "$version_output" ]]
}
# 跳过损坏的 PATH shim，兼容官方安装、Pub 与两种 Homebrew 前缀。
find_fvm_bin() {
  local candidate="" health_result=0
  for candidate in "$(command -v fvm 2>/dev/null)" \
      "$(resolve_official_fvm_dir)/bin/fvm" "${HOME}/fvm/bin/fvm" \
      "${HOME}/.pub-cache/bin/fvm" /opt/homebrew/bin/fvm /usr/local/bin/fvm; do
    health_result=0
    fvm_is_healthy "$candidate" || health_result=$?
    case "$health_result" in 129|130|137|143) return "$health_result" ;; esac
    (( health_result==0 )) || continue
    printf '%s\n' "$candidate"
    return 0
  done
  return 1
}
# 当前进程立即使用已验证的 FVM，无需重开终端或改写 shell 配置。
activate_fvm() {
  export PATH="${FVM_BIN:h}:${PATH}"
  rehash
  success_echo "FVM 已就绪：${FVM_BIN}（$("$FVM_BIN" --version 2>/dev/null | head -n 1)）"
}
# 单次尝试 Homebrew；安装命令失败或二进制复检失败均交给官方回退。
install_fvm_with_brew() {
  local action="${1:-install}" shellenv_output="" rc=0
  if ! BREW_BIN="$(find_brew_bin)"; then
    warn_echo "Homebrew 缺失或不可用，改用 FVM 官方安装器。"
    return 1
  fi
  shellenv_output="$("$BREW_BIN" shellenv 2>/dev/null)" || return 1
  eval "$shellenv_output" || return 1
  info_echo "执行：${BREW_BIN} ${action} fvm"
  HOMEBREW_NO_AUTO_UPDATE=1 "$BREW_BIN" "$action" fvm 2>&1 | tee -a "$LOG_FILE"
  rc=${pipestatus[1]}
  case "$rc" in 129|130|137|143) return "$rc" ;; esac
  if (( rc != 0 )); then
    warn_echo "Homebrew ${action} fvm 失败，退出码：${rc}；自动回退官方安装。"
    return 1
  fi
  if FVM_BIN="$(find_fvm_bin)"; then
    return 0
  else
    rc=$?
    case "$rc" in 129|130|137|143) return "$rc" ;; esac
    warn_echo "Homebrew 返回成功，但 FVM 不可用；自动回退官方安装。"
    return 1
  fi
  return 0
}
# 小型安装脚本也须完整取得，不能把空响应当作获取成功。
jobs_swift_fvm_installer_download_once() {
  local installer_path="$1"
  jobs_swift_flutter_command curl -fSL --connect-timeout 15 --max-time 120 https://fvm.app/install.sh -o "$installer_path" || return $?
  [[ -s "$installer_path" ]] || { warn_echo '官方安装脚本为空，将重新获取。'; return 1; }
}
# 安装返回成功后仍要有可用FVM；父层仅在就绪后激活PATH。
jobs_swift_fvm_installer_run_once() {
  jobs_swift_flutter_command /bin/bash "$1" || return $?
  local health_result=0
  fvm_is_healthy "${OFFICIAL_FVM_DIR}/bin/fvm" || health_result=$?
  case "$health_result" in 129|130|137|143) return "$health_result" ;; esac
  (( health_result==0 )) || { warn_echo 'FVM安装后仍未就绪，将重试获取/安装。'; return 1; }
}
# 下载完整官方脚本后执行，并按实际安装路径二次复检，避免把空下载当成功。
install_fvm_official() {
  local installer_path="" required_tool="" rc=0
  OFFICIAL_FVM_DIR="$(resolve_official_fvm_dir)"
  for required_tool in curl tar; do
    if ! command -v "$required_tool" >/dev/null 2>&1; then
      error_echo "官方安装缺少依赖：${required_tool}。"
      return 1
    fi
  done
  installer_path="$(mktemp "${TMPDIR:-/tmp}/jobs-fvm-install.XXXXXX")" || return 1
  info_echo "下载 FVM 官方安装器：https://fvm.app/install.sh"
  JOBS_FLUTTER_ROUTE_MODE=source JOBS_FLUTTER_ROUTE_SOURCE_URL=https://fvm.app/install.sh \
    jobs_swift_flutter_sdk_run 'FVM官方安装器获取' "$LOG_FILE" "" "" jobs_swift_fvm_installer_download_once "$installer_path"
  rc=$?
  case "$rc" in 129|130|137|143) return "$rc" ;; esac
  if (( rc != 0 )) || [[ ! -s "$installer_path" ]]; then
    error_echo "FVM 官方安装器下载失败（退出码：${rc}）；请检查 fvm.app 网络或代理。"
    rm -f "$installer_path"
    return 1
  fi
  warn_echo "官方安装器将写入 ${OFFICIAL_FVM_DIR}/bin，并可能迁移旧 FVM 安装。"
  FVM_INSTALL_DIR="$OFFICIAL_FVM_DIR" JOBS_FLUTTER_ROUTE_MODE=source JOBS_FLUTTER_ROUTE_SOURCE_URL=https://api.github.com/repos/leoafarias/fvm/releases/latest \
    jobs_swift_flutter_sdk_run 'FVM官方发布安装' "$LOG_FILE" "" "" jobs_swift_fvm_installer_run_once "$installer_path" </dev/null
  rc=$?
  case "$rc" in 129|130|137|143) return "$rc" ;; esac
  rm -f "$installer_path"
  if (( rc != 0 )) || ! fvm_is_healthy "${OFFICIAL_FVM_DIR}/bin/fvm"; then
    error_echo "FVM 官方安装或复检失败（退出码：${rc}）：${OFFICIAL_FVM_DIR}/bin/fvm；请检查 GitHub Releases 网络、代理及目录权限。"
    return 1
  fi
  FVM_BIN="${OFFICIAL_FVM_DIR}/bin/fvm"
  return 0
}
# 复用健康 FVM；只有用户选择安装或升级后才执行来源切换。
ensure_fvm() {
  local brew_action=install discovery_result=0
  if FVM_BIN="$(find_fvm_bin)"; then
    activate_fvm
    if ! ask_any_to_run "是否升级 FVM（Homebrew 不可用时自动使用官方安装器）"; then
      note_echo "已跳过 FVM 升级。"
      return 0
    fi
    brew_action=upgrade
    if [[ "$FVM_BIN" == "$(resolve_official_fvm_dir)/bin/fvm" || "$FVM_BIN" == "${HOME}/fvm/bin/fvm" ]]; then
      install_fvm_official || return $?
      activate_fvm
      return 0
    fi
  else
    discovery_result=$?
    case "$discovery_result" in 129|130|137|143) return "$discovery_result" ;; esac
    warn_echo "未检测到可用 FVM。"
    if ! ask_any_to_run "是否安装 FVM（优先 Homebrew，失败自动使用官方安装器）" "$(flutter_auto_prompt_default)"; then
      warn_echo "已跳过 FVM 安装，无法继续自动安装 Flutter。"
      return 1
    fi
  fi
  local install_result=0
  install_fvm_with_brew "$brew_action" || install_result=$?
  case "$install_result" in 129|130|137|143) return "$install_result" ;; esac
  if (( install_result != 0 )); then
    install_fvm_official || return $?
  fi
  activate_fvm
}
# 定位 Flutter SDK 缓存，保留与 FVM 二进制安装目录的独立性。
detect_fvm_home_and_flutter_bin() {
  local fields="" effective_source="" versions_path="" metadata_result=0
  jobs_swift_flutter_network_load || return $?
  fields="$(jfs_fvm_timed jfs_fvm_context_fields "$FVM_BIN" stable)" || metadata_result=$?
  case "$metadata_result" in 129|130|137|143) return "$metadata_result" ;; esac
  if [[ -n "$fields" ]]; then
    IFS=$'\t' read -r effective_source versions_path <<< "$fields"
    FVM_HOME="${versions_path:h}"
  elif [[ -n "${FVM_CACHE_PATH:-}" ]]; then
    versions_path="${FVM_CACHE_PATH%/}/versions"
    FVM_HOME="$FVM_CACHE_PATH"
  elif [[ -n "$FVM_HOME" && -d "${FVM_HOME}/versions" ]]; then
    versions_path="${FVM_HOME}/versions"
  elif [[ -d "${HOME}/.fvm/versions" && ! -d "${HOME}/fvm/versions" ]]; then
    FVM_HOME="${HOME}/.fvm"
    versions_path="${FVM_HOME}/versions"
  else
    FVM_HOME="${HOME}/fvm"
    versions_path="${FVM_HOME}/versions"
  fi
  FLUTTER_BIN="${versions_path}/stable/bin/flutter"
  info_echo "FVM_HOME：${FVM_HOME}"
  info_echo "Flutter Bin：${FLUTTER_BIN}"
}

# 按需准备 Flutter stable，失败时停止下游操作。
ensure_flutter_stable() {
  local bind_stable=0
  detect_fvm_home_and_flutter_bin || return $?
  if [[ -x "$FLUTTER_BIN" ]]; then
    info_echo "Flutter stable入口：${FLUTTER_BIN}；实际版本由SDK上下文核对。"
    if ask_any_to_run "是否更新并绑定 Flutter stable：fvm install stable && fvm global stable"; then
      jobs_swift_flutter_fvm_install 'Flutter stable 获取' "$LOG_FILE" "$FVM_BIN" stable || return $?
      bind_stable=1
    else
      note_echo '已跳过 Flutter stable 更新。'
    fi
  else
    note_echo '必需 Flutter stable 将自动获取；先检测当前网络，失败持续重测/重试，Ctrl+C取消。'
    jobs_swift_flutter_fvm_install 'Flutter stable 获取' "$LOG_FILE" "$FVM_BIN" stable || return $?
    bind_stable=1
  fi
  detect_fvm_home_and_flutter_bin || return $?
  [[ -x "$FLUTTER_BIN" ]] || { error_echo "未找到已获取的Flutter入口：${FLUTTER_BIN}"; return 1; }
  jobs_swift_flutter_sdk_run 'Flutter stable / Dart 初始化' "$LOG_FILE" "${FLUTTER_BIN:A:h:h}" stable jobs_swift_flutter_command "$FLUTTER_BIN" --version || return $?
  if (( bind_stable )); then
    "$FVM_BIN" global stable || return $?
  fi
  success_echo "Flutter stable 已就绪：${FLUTTER_BIN}"
}

# 获取后立即验证iOS框架存在，未就绪时继续留在获取阶段。
jobs_swift_flutter_precache_ios_once() {
  jobs_swift_flutter_command "$FLUTTER_BIN" precache --ios || return $?
  [[ -d "${FLUTTER_BIN:A:h:h}/bin/cache/artifacts/engine/ios/Flutter.xcframework" ]] || { warn_echo 'iOS引擎目录尚未就绪，继续获取。'; return 1; }
}
# 必需引擎先检测网络再获取，不重复询问或重放后续Pod业务。
precache_flutter_ios() {
  local sdk_root="${FLUTTER_BIN:A:h:h}"
  local xcframework_path="${sdk_root}/bin/cache/artifacts/engine/ios/Flutter.xcframework"
  if [[ -d "$xcframework_path" ]]; then
    success_echo "Flutter iOS 引擎缓存已存在：${xcframework_path}"
    return 0
  fi
  JOBS_FLUTTER_ROUTE_MODE=platform jobs_swift_flutter_sdk_run 'Flutter iOS 平台资源' "$LOG_FILE" "$sdk_root" stable jobs_swift_flutter_precache_ios_once || return $?
  success_echo "Flutter iOS 引擎缓存就绪：${xcframework_path}"
}

# 在默认 Flutter 模块内拉取依赖与生成 iOS 接入文件。
flutter_pub_get_in_my_flutter() {
  if [[ ! -d "$MY_FLUTTER_DIR" ]]; then
    warn_echo "未找到目录：${MY_FLUTTER_DIR}，跳过 flutter pub get。"
    return 0
  fi

  if ! ask_any_to_run "是否在 my_flutter 执行 flutter pub get" "$(flutter_auto_prompt_default)"; then
    note_echo "已跳过 flutter pub get。"
    return 0
  fi

  (
    cd "$MY_FLUTTER_DIR" || exit 1
    "$FLUTTER_BIN" pub get
  )
  local rc=$?

  if [[ $rc -ne 0 ]]; then
    error_echo "flutter pub get 失败，退出码：${rc}。"
    return 1
  fi

  success_echo "my_flutter 依赖拉取完成。"
}
# 依赖复检失败时立即停止 Flutter 操作，由 Podfile 决定非阻断处理。
run_flutter_environment_setup() {
  bold_echo "🚀 开始配置 Flutter 环境"
  info_echo "脚本路径：${SCRIPT_PATH}"
  info_echo "工程根目录：${ROOT_DIR}"
  info_echo "my_flutter：${MY_FLUTTER_DIR}"
  info_echo "日志文件：${LOG_FILE}"

  ensure_fvm || return $?
  ensure_flutter_stable || return $?
  precache_flutter_ios || return $?
  flutter_pub_get_in_my_flutter || return 1

  success_echo "Flutter 环境配置流程结束。"
}
# 编排自述、初始化和环境配置，保留最终业务退出码。
main() {
  show_script_intro_and_wait # 展示用途与影响，独立运行先等待确认。
  initialize_runtime # 确认后初始化 Shell 与日志。
  run_flutter_environment_setup # 按需配置 FVM、Flutter 与模块依赖。
}

main "$@"
