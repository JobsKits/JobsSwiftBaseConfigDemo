#!/bin/zsh
setopt NO_NOMATCH 2>/dev/null || true

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "$LOG_FILE" 2>/dev/null || true

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
warm_echo()      { log "\033[1;33m$1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
err_echo()       { log "\033[1;31m$1\033[0m"; }
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
bold_echo()      { log "\033[1m$1\033[0m"; }
underline_echo() { log "\033[4m$1\033[0m"; }

show_readme_and_wait() {
  local readme_path="${SCRIPT_DIR}/README.md"

  if [[ "${JOBS_SKIP_README:-}" == "1" ]]; then
    return 0
  fi

  if [[ ! -t 0 ]]; then
    note_echo "非交互环境：跳过 README 阻塞展示。"
    return 0
  fi

  clear
  if [[ -f "$readme_path" ]]; then
    highlight_echo "============================== README.md =============================="
    cat "$readme_path" | tee -a "$LOG_FILE"
    highlight_echo "======================================================================="
  else
    warn_echo "未找到 README.md，继续执行内置流程说明。"
  fi
  echo ""
  printf "👉 已阅读自述文件，按回车继续执行；按 Ctrl+C 取消："
  IFS= read -r _ || true
}

ask_any_to_run() {
  local message="$1"
  local answer=""

  if [[ ! -t 0 ]]; then
    note_echo "非交互环境：${message} -> 默认跳过。"
    return 1
  fi

  printf "%s（直接回车跳过；输入任意字符后回车执行）：" "$message"
  IFS= read -r answer || true
  [[ -n "$answer" ]]
}

confirm_yes() {
  local message="$1"
  local input=""

  if [[ ! -t 0 ]]; then
    warn_echo "非交互环境无法输入 YES：${message} -> 默认取消。"
    return 1
  fi

  echo ""
  warn_echo "⚠ ${message}"
  gray_echo "危险操作必须输入 YES 后回车；其它输入一律取消。"
  printf "➤ "
  IFS= read -r input || true
  [[ "$input" == "YES" ]]
}

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

get_cpu_arch() {
  [[ "$(uname -m)" == "arm64" ]] && echo "arm64" || echo "x86_64"
}

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

# 当前脚本位于 `ScriptsByPods/脚本名/脚本本体`，上溯两级才是工程根目录。
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
UNITY_ROOT="${ROOT_DIR}/Unity"
TARGET_REL="xcode_effectTest/Libraries/【MacOS】🧩子卷➤合而为一源文件.command"
TARGET_PATH="${UNITY_ROOT}/${TARGET_REL}"

run_shell_file() {
  local file_path="$1"
  local first_line=""
  local runner="/bin/zsh"

  if [[ -x "$file_path" ]]; then
    "$file_path"
    return $?
  fi

  first_line="$(head -n 1 "$file_path" 2>/dev/null || true)"
  case "$first_line" in
    *bash*) runner="/bin/bash" ;;
    *zsh*)  runner="/bin/zsh" ;;
    *)      runner="/bin/zsh" ;;
  esac

  "$runner" "$file_path"
}

main() {
  show_readme_and_wait

  bold_echo "🚀 开始解压 Unity 大资源"
  info_echo "脚本路径：${SCRIPT_PATH}"
  info_echo "工程根目录：${ROOT_DIR}"
  info_echo "Unity 根目录：${UNITY_ROOT}"
  info_echo "目标脚本：${TARGET_PATH}"
  info_echo "日志文件：${LOG_FILE}"

  if [[ ! -e "$TARGET_PATH" ]]; then
    note_echo "未找到目标脚本，按 non-blocking 规则跳过。"
    return 0
  fi

  run_shell_file "$TARGET_PATH"
  local rc=$?

  if [[ $rc -ne 0 ]]; then
    warn_echo "目标脚本执行失败，退出码：${rc}。当前脚本保持 non-blocking，不阻断主流程。"
    return 0
  fi

  success_echo "Unity 大资源解压流程完成。"
}

main "$@"
