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

ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
UNITY_DIR="${ROOT_DIR}/Unity"
TARGETS=()

append_target_if_exists() {
  local target_path="$1"
  local existing=""

  [[ -e "$target_path" ]] || return 0

  case "$target_path" in
    "${UNITY_DIR}/Library/"*|"${UNITY_DIR}/"*/Library/*)
      ;;
    *)
      warn_echo "跳过非 Unity Library 缓存路径：${target_path}"
      return 0
      ;;
  esac

  for existing in "${TARGETS[@]}"; do
    [[ "$existing" == "$target_path" ]] && return 0
  done

  TARGETS+=("$target_path")
}

collect_unity_cache_targets() {
  local version_file=""
  local project_settings_dir=""
  local project_root=""

  append_target_if_exists "${UNITY_DIR}/Library/Il2cppBuildCache"
  append_target_if_exists "${UNITY_DIR}/Library/Bee"
  append_target_if_exists "${UNITY_DIR}/Library/BuildCache"
  append_target_if_exists "${UNITY_DIR}/Library/ScriptAssemblies"
  append_target_if_exists "${UNITY_DIR}/Library/Tundra"

  while IFS= read -r -d '' version_file; do
    project_settings_dir="$(dirname "$version_file")"
    project_root="$(dirname "$project_settings_dir")"
    append_target_if_exists "${project_root}/Library/Il2cppBuildCache"
    append_target_if_exists "${project_root}/Library/Bee"
    append_target_if_exists "${project_root}/Library/BuildCache"
    append_target_if_exists "${project_root}/Library/ScriptAssemblies"
    append_target_if_exists "${project_root}/Library/Tundra"
  done < <(find "${UNITY_DIR}" -maxdepth 5 -type f -path "*/ProjectSettings/ProjectVersion.txt" -print0 2>/dev/null)
}

delete_unity_cache_targets() {
  local target_path=""
  local deleted=0
  local failed=0

  if [[ ${#TARGETS[@]} -eq 0 ]]; then
    note_echo "未发现需要清理的 Unity 缓存目录。"
    return 0
  fi

  warn_echo "即将处理以下 Unity 缓存目录："
  for target_path in "${TARGETS[@]}"; do
    gray_echo "  - ${target_path}"
  done

  if ! confirm_yes "确认删除以上 Unity 缓存目录。"; then
    note_echo "未输入 YES，已取消 Unity 缓存清理。"
    return 0
  fi

  for target_path in "${TARGETS[@]}"; do
    if [[ -e "$target_path" ]]; then
      info_echo "删除：${target_path}"
      rm -rf "$target_path"
      local rc=$?
      if [[ $rc -eq 0 ]]; then
        deleted=$((deleted + 1))
      else
        failed=$((failed + 1))
        warn_echo "删除失败：${target_path}，退出码：${rc}。"
      fi
    fi
  done

  success_echo "Unity 缓存清理结束：成功 ${deleted} 个，失败 ${failed} 个。"
}

run_brew_cleanup_if_available() {
  local brew_bin=""

  if ! brew_bin="$(find_brew_bin 2>/dev/null)"; then
    note_echo "未检测到 Homebrew，跳过 brew cleanup。"
    return 0
  fi

  if ! ask_any_to_run "是否顺手执行 brew cleanup 清理 Homebrew 旧版本包和缓存"; then
    note_echo "已跳过 brew cleanup。"
    return 0
  fi

  "$brew_bin" cleanup || warn_echo "brew cleanup 返回警告/错误，主流程不阻断。"
}

main() {
  show_readme_and_wait

  bold_echo "🚀 开始清理 Unity 缓存"
  info_echo "脚本路径：${SCRIPT_PATH}"
  info_echo "工程根目录：${ROOT_DIR}"
  info_echo "Unity 目录：${UNITY_DIR}"
  info_echo "日志文件：${LOG_FILE}"

  if [[ ! -d "$UNITY_DIR" ]]; then
    note_echo "未找到 Unity 目录，跳过。"
    run_brew_cleanup_if_available
    return 0
  fi

  collect_unity_cache_targets
  delete_unity_cache_targets
  run_brew_cleanup_if_available
}

main "$@"
