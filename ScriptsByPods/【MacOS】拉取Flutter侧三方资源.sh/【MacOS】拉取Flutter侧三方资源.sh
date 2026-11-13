#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：【MacOS】拉取Flutter侧三方资源.sh。
# - 核心用途：查找可用 Flutter / FVM，拉取依赖并验证或重生成当前电脑可用的 iOS 配置。
# - 影响范围：可能补齐SDK、更新工程依赖与生成目录；业务失败由 Podfile 既有非阻断策略处理。
# - 运行提示：交互运行先展示内置自述并回车确认；非交互须显式 JOBS_FLUTTER_AUTO_SETUP=1，check-only / skip 优先跳过。

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
LOG_FILE="/tmp/拉取Flutter侧三方资源.log"
ROOT_DIR=""
DEFAULT_FLUTTER_DIR=""
DEFAULT_PODHELPER=""
FLUTTER_CMD=()
FLUTTER_HEALTH_REASON=""
JOBS_RESOURCE_SDK_ADAPTER="${${(%):-%x}:A:h}/Scripts/【MacOS】FlutterSDK命令适配.sh/【MacOS】FlutterSDK命令适配.sh"

# 独立复制仍带完整SDK准备；仅获取子进程选路，原配置修复策略保留。
jobs_resource_sdk_command() {
  [[ -r "$JOBS_RESOURCE_SDK_ADAPTER" ]] || { print -u2 '缺少随包SDK适配模块，请保留完整脚本目录。'; return 1; }
  JOBS_FLUTTER_ROUTE_LOG="$LOG_FILE" /bin/sh "$JOBS_RESOURCE_SDK_ADAPTER" "$@"
}

# 同步输出业务日志到终端和固定日志文件。
log() {
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    printf '%b\n' "$1" | jobs_prompt_tee "$LOG_FILE"
  else
    printf '%b\n' "$1" | /usr/bin/sed $'s/\033\\[[0-9;]*m//g' | jobs_prompt_tee "$LOG_FILE"
  fi
}
# 输出绿色常规日志。
color_echo()     { log "\033[1;32m$1\033[0m"; }
# 输出信息日志。
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
# 输出成功日志。
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
# 输出告警日志。
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
# 输出黄色提示。
warm_echo()      { log "\033[1;33m$1\033[0m"; }
# 输出业务说明。
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
# 输出错误日志。
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
# 输出红色纯文本日志。
err_echo()       { log "\033[1;31m$1\033[0m"; }
# 输出调试日志。
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
# 输出突出提示。
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
# 输出次要说明。
gray_echo()      { log "\033[0;90m$1\033[0m"; }
# 输出加粗日志。
bold_echo()      { log "\033[1m$1\033[0m"; }
# 输出下划线日志。
underline_echo() { log "\033[4m$1\033[0m"; }
# 展示固定内置自述并确认执行；钩子标记不代替用户确认。
show_script_intro_and_wait() {
  print -r -- "======================= 拉取 Flutter 侧三方资源 ======================="
  print -r -- "核心用途：查找可用 Flutter / FVM，为工程内 Flutter module 拉取依赖并修复跨电脑残留路径。"
  print -r -- "影响范围：仅完整健康的 iOS 配置直接跳过；必要时备份两份过期配置后重试官方 pub get。"
  print -r -- "修复边界：不手改生成源码，不手动删除 .ios、Pods 或锁文件；重生成失败恢复原配置，不声称已修复。"
  print -r -- "运行策略：交互运行均需确认；非交互须显式 JOBS_FLUTTER_AUTO_SETUP=1，check-only / skip 优先跳过。"
  print -r -- "SDK策略：下载前检测本次网络，失败持续重试至就绪或 Ctrl+C；仅子进程选路，不改系统网络。"
  jobs_prompt_output print -r -- "取消方式：按 Ctrl+C 终止；独立运行需按回车继续。"
  print -r -- "日志文件：/tmp/拉取Flutter侧三方资源.log"
  print -r -- "========================================================================"

  case "${JOBS_POD_INSTALL_INTERACTION:-interactive}" in
    check-only|skip)
      print -r -- "模式：${JOBS_POD_INSTALL_INTERACTION}，跳过 Flutter 资源拉取和配置修复。"
      exit 0
      ;;
    interactive) ;;
    *)
      print -u2 -r -- "✖ 无效的 JOBS_POD_INSTALL_INTERACTION；仅支持 interactive、check-only、skip。"
      exit 2
      ;;
  esac
  if [[ ! -t 0 ]]; then
    if [[ "${JOBS_FLUTTER_AUTO_SETUP:-}" == 1 ]]; then
      print -r -- "已显式允许非交互准备 Flutter module；仅复用现有工具、拉取依赖并按需恢复配置。"
      return 0
    fi
    print -u2 -r -- "✖ 当前没有可交互输入；请在终端运行，或显式设置 JOBS_FLUTTER_AUTO_SETUP=1；check-only / skip 仅跳过。"
    exit 1
  fi

  jobs_prompt_output printf "👉 已了解用途与影响，按回车继续执行；按 Ctrl+C 取消："
  if ! IFS= read -r _; then
    print -u2 -r -- "✖ 未收到确认，停止执行。"
    exit 1
  fi
}
# 确认后初始化路径、Shell 选项和日志。
initialize_runtime() {
  setopt NO_NOMATCH
  SCRIPT_PATH="${${(%):-%x}:A}"
  SCRIPT_DIR="${SCRIPT_PATH:h}"
  SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
  ROOT_DIR="$(resolve_project_root)" || exit 1
  DEFAULT_FLUTTER_DIR="${ROOT_DIR}/my_flutter"
  DEFAULT_PODHELPER="${DEFAULT_FLUTTER_DIR}/.ios/Flutter/podhelper.rb"
  if ! : > "$LOG_FILE"; then
    print -u2 -r -- "✖ 无法初始化日志：${LOG_FILE}"
    exit 1
  fi
}
# 普通可选操作默认跳过，输入任意内容才执行。
ask_any_to_run() {
  local message="$1"
  local answer=""

  if [[ ! -t 0 ]]; then
    note_echo "非交互环境：${message} -> 默认跳过。"
    return 1
  fi

  jobs_prompt_output printf "%s（直接回车跳过；输入任意字符后回车执行）：" "$message"
  IFS= read -r answer || return 1
  [[ -n "$answer" ]]
}
# 危险操作仅接受明确的大写 YES。
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
# 清理拖入路径的首尾引号和换行。
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
# 返回当前 CPU 对应的安装架构。
get_cpu_arch() {
  [[ "$(uname -m)" == "arm64" ]] && echo "arm64" || echo "x86_64"
}
# 从脚本位置解析工程根目录。
resolve_project_root() {
  local parent_dir="$(cd "${SCRIPT_DIR}/.." && pwd)"

  if [[ "$(basename "$parent_dir")" == "ScriptsByPods" ]]; then
    cd "${parent_dir}/.." && pwd
  else
    echo "$parent_dir"
  fi
}
# 查找 PATH 或系统常见位置中的 Homebrew。
find_brew_bin() {
  if command -v brew >/dev/null 2>&1; then
    command -v brew
  elif [[ -x "/opt/homebrew/bin/brew" ]]; then
    echo "/opt/homebrew/bin/brew"
  elif [[ -x "/usr/local/bin/brew" ]]; then
    echo "/usr/local/bin/brew"
  else
    return 1
  fi
}
# 验证候选命令可以运行，跳过残缺 shim 或损坏安装。
is_tool_available() {
  local tool_path="$1"

  [[ -n "$tool_path" && -x "$tool_path" ]] || return 1
  local health_result=0
  if jobs_resource_sdk_command "$tool_path" --version; then
    return 0
  else
    health_result=$?
    case "$health_result" in 129|130|137|143) return "$health_result" ;; esac
  fi

  warn_echo "候选工具健康检查失败：${tool_path} --version，继续查找其它安装。"
  return 1
}
# 与安装入口一致地解析官方 FVM 自定义目录。
resolve_official_fvm_dir() {
  local install_dir="${FVM_INSTALL_DIR:-${HOME}/fvm}"
  case "$install_dir" in
    '~') install_dir="$HOME" ;;
    '~/'*) install_dir="${HOME}/${install_dir#\~/}" ;;
  esac
  printf '%s\n' "${install_dir%/}"
}
# 保留原 Flutter 优先级，补充官方和 Dart Pub 安装的 FVM 入口。
find_flutter_command() {
  local candidate="" health_result=0
  local -aU flutter_candidates=(
    "$(command -v flutter 2>/dev/null)"
    "${HOME}/fvm/versions/stable/bin/flutter"
    "${HOME}/.fvm/versions/stable/bin/flutter"
  )
  local -aU fvm_candidates=(
    "$(command -v fvm 2>/dev/null)"
    "$(resolve_official_fvm_dir)/bin/fvm"
    "${HOME}/fvm/bin/fvm"
    "${HOME}/.pub-cache/bin/fvm"
    "/opt/homebrew/bin/fvm"
    "/usr/local/bin/fvm"
  )

  FLUTTER_CMD=()
  for candidate in "${flutter_candidates[@]}"; do
    if is_tool_available "$candidate"; then
      FLUTTER_CMD=("$candidate")
      return 0
    else
      health_result=$?
      case "$health_result" in 129|130|137|143) return "$health_result" ;; esac
    fi
  done

  for candidate in "${fvm_candidates[@]}"; do
    if is_tool_available "$candidate"; then
      FLUTTER_CMD=("$candidate" "flutter")
      return 0
    else
      health_result=$?
      case "$health_result" in 129|130|137|143) return "$health_result" ;; esac
    fi
  done

  return 1
}
# 按现有扫描深度收集并去重 Flutter 工程目录。
collect_flutter_projects() {
  local -a candidates=()
  local -a uniq=()
  local pubspec_path=""
  local project_dir=""
  local seen="|"

  if [[ -f "${DEFAULT_FLUTTER_DIR}/pubspec.yaml" ]]; then
    candidates+=("${DEFAULT_FLUTTER_DIR}")
  fi

  while IFS= read -r -d '' pubspec_path; do
    project_dir="$(dirname "$pubspec_path")"
    case "$project_dir" in
      */Pods|*/Pods/*|*/.git|*/.git/*|*/Unity|*/Unity/*|*/build|*/build/*|*/.dart_tool|*/.dart_tool/*)
        continue
        ;;
    esac
    candidates+=("$project_dir")
  done < <(find "${ROOT_DIR}" -maxdepth 4 -type f -name "pubspec.yaml" -print0 2>/dev/null)

  for project_dir in "${candidates[@]}"; do
    [[ -d "$project_dir" ]] || continue
    case "$seen" in
      *"|${project_dir}|"*) continue ;;
    esac
    seen="${seen}${project_dir}|"
    uniq+=("$project_dir")
  done

  if [[ ${#uniq[@]} -gt 0 ]]; then
    printf '%s\0' "${uniq[@]}"
  fi
}
# 在候选工程内拉取 Flutter 依赖，保留失败后继续的策略。
run_flutter_pub_get() {
  local project_dir="$1"
  local rc=0

  info_echo "执行：cd '${project_dir}' && flutter pub get"
  (
    cd "$project_dir" || exit 1
    jobs_resource_sdk_command "${FLUTTER_CMD[@]}" pub get
  )
  rc=$?

  if [[ $rc -ne 0 ]]; then
    warn_echo "flutter pub get 失败：${project_dir}，退出码：${rc}。继续处理下一个候选目录。"
    (( rc >= 128 )) && return "$rc"
    return 1
  fi

  success_echo "依赖拉取完成：${project_dir}"
  return 0
}
# 只读提取官方生成配置中的唯一键值，不执行 export 脚本或展开其中的 Shell 表达式。
read_flutter_generated_value() {
  local config_path="$1"
  local config_key="$2"
  local config_style="${3:-xcconfig}"
  [[ -f "$config_path" && -r "$config_path" ]] || return 1
  /usr/bin/awk -v key="$config_key" -v style="$config_style" '
    {
      line = $0
      sub(/\r$/, "", line)
      sub(/^[[:space:]]+/, "", line)
      sub(/[[:space:]]+$/, "", line)
      if (style == "export") {
        if (line !~ /^export[[:space:]]+/) next
        sub(/^export[[:space:]]+/, "", line)
        first = substr(line, 1, 1)
        last = substr(line, length(line), 1)
        if ((first == "\"" || first == sprintf("%c", 39)) && last == first)
          line = substr(line, 2, length(line) - 2)
      }
      assignment = index(line, "=")
      if (!assignment || substr(line, 1, assignment - 1) != key) next
      value = substr(line, assignment + 1)
      first = substr(value, 1, 1)
      last = substr(value, length(value), 1)
      if ((first == "\"" || first == sprintf("%c", 39)) && last == first)
        value = substr(value, 2, length(value) - 2)
      count++
      result = value
    }
    END {
      if (count != 1 || result == "") exit 1
      print result
    }
  ' "$config_path"
}
# 校验 module helper、SDK helper 与两份生成配置的真实路径，识别旧用户名及旧工程目录。
flutter_module_is_ready() {
  local project_dir="$1"
  local flutter_dir="${project_dir}/.ios/Flutter"
  local generated_config="${flutter_dir}/Generated.xcconfig"
  local export_script="${flutter_dir}/flutter_export_environment.sh"
  local sdk_root="" application_path="" export_root="" export_application=""
  FLUTTER_HEALTH_REASON=""
  if [[ ! -f "${flutter_dir}/podhelper.rb" || ! -r "${flutter_dir}/podhelper.rb" ]]; then
    FLUTTER_HEALTH_REASON="module podhelper 缺失或不可读：${flutter_dir}/podhelper.rb"
    return 1
  fi
  sdk_root="$(read_flutter_generated_value "$generated_config" FLUTTER_ROOT)" || {
    FLUTTER_HEALTH_REASON="Generated.xcconfig 缺少唯一有效的 FLUTTER_ROOT：${generated_config}"
    return 1
  }
  if [[ "$sdk_root" != /* || ! -d "$sdk_root" || ! -f "${sdk_root}/packages/flutter_tools/bin/podhelper.rb" || ! -r "${sdk_root}/packages/flutter_tools/bin/podhelper.rb" ]]; then
    FLUTTER_HEALTH_REASON="Generated.xcconfig 的 FLUTTER_ROOT 无可用 SDK podhelper：${sdk_root}"
    return 1
  fi
  application_path="$(read_flutter_generated_value "$generated_config" FLUTTER_APPLICATION_PATH)" || {
    FLUTTER_HEALTH_REASON="Generated.xcconfig 缺少唯一有效的 FLUTTER_APPLICATION_PATH。"
    return 1
  }
  if [[ "$application_path" != /* || ! -d "$application_path" || "${application_path:A}" != "${project_dir:A}" ]]; then
    FLUTTER_HEALTH_REASON="Generated.xcconfig 的 FLUTTER_APPLICATION_PATH 不是当前 module：${application_path}"
    return 1
  fi
  export_root="$(read_flutter_generated_value "$export_script" FLUTTER_ROOT export)" || {
    FLUTTER_HEALTH_REASON="export 环境脚本缺失或 FLUTTER_ROOT 无效：${export_script}"
    return 1
  }
  export_application="$(read_flutter_generated_value "$export_script" FLUTTER_APPLICATION_PATH export)" || {
    FLUTTER_HEALTH_REASON="export 环境脚本的 FLUTTER_APPLICATION_PATH 无效。"
    return 1
  }
  if [[ "$export_root" != /* || ! -d "$export_root" || "${export_root:A}" != "${sdk_root:A}" ]]; then
    FLUTTER_HEALTH_REASON="export 环境脚本的 FLUTTER_ROOT 与当前 SDK 不一致：${export_root}"
    return 1
  fi
  if [[ "$export_application" != /* || ! -d "$export_application" || "${export_application:A}" != "${project_dir:A}" ]]; then
    FLUTTER_HEALTH_REASON="export 环境脚本的 FLUTTER_APPLICATION_PATH 不是当前 module：${export_application}"
    return 1
  fi
  return 0
}
# 恢复已移出的原配置，并把失败生成的新文件保留在备份目录供排查。
restore_flutter_generated_configs() {
  local project_dir="$1"
  local backup_dir="$2"
  local restore_missing="${3:-0}"
  local config_name="" config_path="" restore_rc=0
  for config_name in Generated.xcconfig flutter_export_environment.sh; do
    config_path="${project_dir}/.ios/Flutter/${config_name}"
    if [[ ! -f "${backup_dir}/${config_name}" && ! -L "${backup_dir}/${config_name}" && "$restore_missing" != 1 ]]; then
      continue
    fi
    if [[ -e "$config_path" || -L "$config_path" ]]; then
      if [[ -d "$config_path" ]] || ! /bin/mv -- "$config_path" "${backup_dir}/attempted.${config_name}"; then
        error_echo "无法移走失败生成的配置，原文件仍在备份：${backup_dir}/${config_name}"
        restore_rc=1
        continue
      fi
    fi
    if [[ -f "${backup_dir}/${config_name}" || -L "${backup_dir}/${config_name}" ]]; then
      if ! /bin/cp -pP -- "${backup_dir}/${config_name}" "$config_path"; then
        error_echo "无法恢复原配置，请从备份手动恢复：${backup_dir}/${config_name}"
        restore_rc=1
      fi
    fi
  done
  return "$restore_rc"
}
# 将两份过期配置移入本次独立备份，留下缺失的 Generated.xcconfig 触发官方重生成。
backup_flutter_generated_configs() {
  local project_dir="$1"
  local backup_dir="$2"
  local config_name="" config_path=""
  for config_name in Generated.xcconfig flutter_export_environment.sh; do
    config_path="${project_dir}/.ios/Flutter/${config_name}"
    if [[ -e "$config_path" && ! -f "$config_path" && ! -L "$config_path" ]]; then
      warn_echo "配置路径不是普通文件，保留原状：${config_path}"
      return 1
    fi
  done
  for config_name in Generated.xcconfig flutter_export_environment.sh; do
    config_path="${project_dir}/.ios/Flutter/${config_name}"
    if [[ -f "$config_path" || -L "$config_path" ]]; then
      if ! /bin/mv -- "$config_path" "${backup_dir}/${config_name}"; then
        warn_echo "无法备份配置：${config_path}"
        return 1
      fi
    fi
  done
}
# 通过缺失配置后的第二次 pub get 强制官方重生成，失败或中断时恢复原配置。
regenerate_flutter_generated_configs() {
  setopt LOCAL_TRAPS
  local project_dir="$1"
  local backup_dir="" regenerated=0 backup_complete=0 regeneration_rc=0
  backup_dir="$(/usr/bin/mktemp -d "${TMPDIR:-/tmp}/jobs-flutter-config-backup.XXXXXXXX")" || {
    warn_echo "无法创建旧配置备份目录，停止重生成：${project_dir}"
    return 1
  }
  warn_echo "pub get 后配置仍不健康：${FLUTTER_HEALTH_REASON}"
  note_echo "原配置备份目录：${backup_dir}；仅移出两份生成配置，不删除 .ios、Pods 或锁文件。"
  trap 'return 130' INT
  trap 'return 143' TERM
  {
    if backup_flutter_generated_configs "$project_dir" "$backup_dir"; then
      backup_complete=1
      if run_flutter_pub_get "$project_dir"; then
        if flutter_module_is_ready "$project_dir"; then
          regenerated=1
          success_echo "官方 pub get 已重生成并通过完整配置复检：${project_dir}"
        else
          warn_echo "官方重生成后配置仍未通过复检：${FLUTTER_HEALTH_REASON}"
        fi
      else
        regeneration_rc=$?
        warn_echo "官方配置重生成命令失败：${project_dir}"
        (( regeneration_rc >= 128 )) && return "$regeneration_rc"
      fi
    else
      warn_echo "原配置备份未完成，停止本次重生成：${project_dir}"
    fi
  } always {
    if (( regenerated == 0 )); then
      restore_flutter_generated_configs "$project_dir" "$backup_dir" "$backup_complete"
      warn_echo "重生成未完成，已尝试恢复原配置；备份及失败产物：${backup_dir}"
    fi
  }
  (( regenerated == 1 ))
}
# 拉取后必须复检，只有命令成功但旧配置仍在时才启动一次有备份的重生成。
prepare_flutter_module() {
  local project_dir="$1"
  if flutter_module_is_ready "$project_dir"; then
    success_echo "Flutter iOS 配置完整健康，跳过：${project_dir}"
    return 0
  fi
  warn_echo "Flutter iOS 配置需要修复：${FLUTTER_HEALTH_REASON}"
  run_flutter_pub_get "$project_dir" || return $?
  if flutter_module_is_ready "$project_dir"; then
    success_echo "Flutter iOS 配置已通过完整复检：${project_dir}"
    return 0
  fi
  regenerate_flutter_generated_configs "$project_dir"
}
# 校验并修复可用的 module 配置；失败返回给 Podfile 辅助任务，由宿主保持非阻断。
run_flutter_resource_pull() {
  local -a candidates=()
  local project_dir=""
  local generated=0
  local prepare_rc=0

  bold_echo "🚀 开始拉取 Flutter 侧三方资源"
  info_echo "工程根目录：${ROOT_DIR}"
  info_echo "默认 Flutter 目录：${DEFAULT_FLUTTER_DIR}"
  info_echo "默认 podhelper：${DEFAULT_PODHELPER}"
  info_echo "日志文件：${LOG_FILE}"

  if flutter_module_is_ready "$DEFAULT_FLUTTER_DIR"; then
    success_echo "默认 Flutter iOS 配置完整健康，跳过。"
    return 0
  fi

  if find_flutter_command; then
    :
  else
    prepare_rc=$?
    case "$prepare_rc" in 129|130|137|143) return "$prepare_rc" ;; esac
    warn_echo "未检测到 flutter / fvm，按 non-blocking 规则跳过。"
    return 0
  fi

  while IFS= read -r -d '' project_dir; do
    candidates+=("$project_dir")
  done < <(collect_flutter_projects)

  if [[ ${#candidates[@]} -eq 0 ]]; then
    warn_echo "未找到 Flutter 工程候选目录，按 non-blocking 规则跳过。"
    return 0
  fi

  note_echo "候选 Flutter 工程："
  for project_dir in "${candidates[@]}"; do
    highlight_echo "  ➤ ${project_dir}"
  done

  for project_dir in "${candidates[@]}"; do
    prepare_flutter_module "$project_dir"
    prepare_rc=$?
    if (( prepare_rc >= 128 )); then
      return "$prepare_rc"
    fi
    (( prepare_rc != 0 )) && continue

    if flutter_module_is_ready "$DEFAULT_FLUTTER_DIR"; then
      success_echo "默认 Flutter iOS 配置已通过完整复检：${DEFAULT_FLUTTER_DIR}"
      generated=1
      break
    fi

    if flutter_module_is_ready "$project_dir"; then
      success_echo "候选 Flutter iOS 配置已通过完整复检：${project_dir}"
      note_echo "如果 Podfile 固定引用 my_flutter，请确认 my_flutter 指向真实 Flutter module。"
      generated=1
    fi
  done

  if [[ $generated -eq 0 ]]; then
    warn_echo "执行后仍未获得健康 Flutter iOS 配置；返回失败供 Podfile 告警，宿主保持 non-blocking。"
    return 1
  fi
  if [[ -f "${DEFAULT_FLUTTER_DIR}/pubspec.yaml" ]] && ! flutter_module_is_ready "$DEFAULT_FLUTTER_DIR"; then
    warn_echo "其它候选不能替代默认 module；默认 Flutter 配置仍不可用：${FLUTTER_HEALTH_REASON}"
    return 1
  fi
  return 0
}
# 编排自述确认、运行时初始化和依赖拉取。
main() {
  show_script_intro_and_wait # 先说明用途与影响，并完成独立运行的回车确认。
  initialize_runtime # 确认后初始化路径、Shell 选项和固定日志。
  run_flutter_resource_pull # 拉取并复检真实配置，失败交由 Podfile 辅助任务告警。
}

main "$@"
