#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：清理 Unity 缓存。
# - 核心用途：收集 Unity Library 缓存，确认后删除，并可选执行 brew cleanup。
# - 影响范围：当前工程 Unity 缓存和用户选择的 Homebrew 缓存；删除仍需精确 YES。
# - 运行提示：先展示内置说明并回车确认；check-only / skip 不执行写入任务。

SCRIPT_DIR=""
SCRIPT_PATH=""
SCRIPT_BASENAME=""
LOG_FILE=""
ROOT_DIR=""
UNITY_DIR=""
TARGETS=()

# 同步输出终端与业务日志。
log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
# 输出常规信息。
color_echo()     { log "\033[1;32m$1\033[0m"; }
# 输出环境信息。
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
# 输出已完成的结果。
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
# 输出风险和可恢复告警。
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
# 输出温馨提示。
warm_echo()      { log "\033[1;33m$1\033[0m"; }
# 输出业务说明。
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
# 输出执行错误。
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
# 输出错误正文。
err_echo()       { log "\033[1;31m$1\033[0m"; }
# 输出诊断信息。
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
# 突出关键路径。
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
# 输出次要信息。
gray_echo()      { log "\033[0;90m$1\033[0m"; }
# 输出流程提示。
bold_echo()      { log "\033[1m$1\033[0m"; }
# 输出下划线提示。
underline_echo() { log "\033[4m$1\033[0m"; }

# 确认前只准备展示路径，兼容同名脚本包及旧的单层目录。
prepare_script_context() {
  SCRIPT_PATH="${${(%):-%x}:A}"
  SCRIPT_DIR="${SCRIPT_PATH:h}"
  SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
  LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
  ROOT_DIR="${SCRIPT_DIR:h}"
  [[ "${ROOT_DIR:t}" == ScriptsByPods ]] && ROOT_DIR="${ROOT_DIR:h}"
  UNITY_DIR="${ROOT_DIR}/Unity"
}
# 先展示固定内置自述，钩子和跳过 README 标记不代替回车确认。
show_readme_and_wait() {
  prepare_script_context
  printf '%s\n' '======================= 清理 Unity 缓存 ======================='
  printf '%s\n' '用途：收集当前工程 Unity Library 构建缓存，删除前需再输入精确 YES。'
  printf '%s\n' '影响范围：选定 Unity 缓存；brew cleanup 独立询问，回车跳过。'
  printf '工程根目录：%s\n日志文件：%s\n' "$ROOT_DIR" "$LOG_FILE"
  printf '%s\n' '取消方式：按 Ctrl+C 取消；check-only / skip 不执行写入任务。'
  case "${JOBS_POD_INSTALL_INTERACTION:-interactive}" in
    check-only|skip)
      printf '模式：%s，跳过 Unity 缓存清理和 brew cleanup。\n' "$JOBS_POD_INSTALL_INTERACTION"
      exit 0
      ;;
    interactive) ;;
    *)
      printf '%s\n' '无效的 JOBS_POD_INSTALL_INTERACTION；仅支持 interactive、check-only、skip。' >&2
      exit 2
      ;;
  esac
  if [[ ! -t 0 ]]; then
    printf '%s\n' '当前没有可交互输入；请在终端运行，或选择 check-only / skip。' >&2
    exit 1
  fi
  printf '👉 已了解用途与影响，按回车继续；按 Ctrl+C 取消：'
  IFS= read -r _ || exit 1
}
# 回车确认后才配置 Shell 和写入日志。
initialize_runtime() {
  setopt NO_NOMATCH
  : > "$LOG_FILE" || exit 1
}

# 普通可选操作回车跳过，输入任意字符才执行。
ask_any_to_run() {
  local message="$1"
  local answer=""

  if [[ ! -t 0 ]]; then
    note_echo "非交互环境：${message} -> 默认跳过。"
    return 1
  fi

  printf "%s（直接回车跳过；输入任意字符后回车执行）：" "$message"
  IFS= read -r answer || return 1
  [[ -n "$answer" ]]
}

# 删除等危险操作必须输入精确 YES。
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
  IFS= read -r input || return 1
  [[ "$input" == "YES" ]]
}

# 去掉拖入路径的外层引号。
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

# 识别当前机器架构。
get_cpu_arch() {
  [[ "$(uname -m)" == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# 复用已有 Homebrew，不触发安装。
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

# 只收集存在且位于 Unity Library 范围内的缓存路径。
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

# 收集默认与子工程的常见 Unity 缓存。
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

# 展示目标并在精确 YES 后逐项删除缓存。
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

# 保留 Homebrew 清理的独立可选确认。
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

# 执行已确认的缓存清理，并保留 brew cleanup 的独立选择。
run_unity_cache_cleanup() {
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
# 编排内置说明、运行时初始化和缓存清理。
main() {
  show_readme_and_wait # 展示内置说明，确认前不写入日志或执行清理。
  initialize_runtime # 用户确认后初始化 Shell 和日志。
  run_unity_cache_cleanup # 保留删除 YES 与可选 brew cleanup 的业务确认。
}

main "$@"
