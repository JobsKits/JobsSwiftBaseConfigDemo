#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：解压 Unity 大资源。
# - 核心用途：定位当前工程的 Unity 分卷合并脚本，并保留其原有业务行为。
# - 影响范围：Unity 导出资源；目标脚本失败仅告警，不阻断外层 Podfile。
# - 运行提示：先展示内置说明并回车确认；check-only / skip 不执行写入任务。

SCRIPT_DIR=""
SCRIPT_PATH=""
SCRIPT_BASENAME=""
LOG_FILE=""
ROOT_DIR=""
UNITY_ROOT=""
TARGET_REL="xcode_effectTest/Libraries/【MacOS】🧩子卷➤合而为一源文件.command"
TARGET_PATH=""

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
  UNITY_ROOT="${ROOT_DIR}/Unity"
  TARGET_PATH="${UNITY_ROOT}/${TARGET_REL}"
}
# 先展示固定内置自述，钩子和跳过 README 标记不代替回车确认。
show_readme_and_wait() {
  prepare_script_context
  printf '%s\n' '======================= 解压 Unity 大资源 ======================='
  printf '%s\n' '用途：定位并执行 Unity 导出资源的分卷合并脚本，保留目标脚本自身交互。'
  printf '%s\n' '影响范围：Unity 导出资源；目标脚本失败仅告警，不阻断外层流程。'
  printf '目标脚本：%s\n日志文件：%s\n' "$TARGET_PATH" "$LOG_FILE"
  printf '%s\n' '取消方式：按 Ctrl+C 取消；check-only / skip 不执行写入任务。'
  case "${JOBS_POD_INSTALL_INTERACTION:-interactive}" in
    check-only|skip)
      printf '模式：%s，跳过 Unity 资源合并。\n' "$JOBS_POD_INSTALL_INTERACTION"
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

# 按目标可执行状态和 shebang 调用资源合并脚本。
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

# 执行已确认的资源合并，目标失败继续采用非阻断行为。
run_unity_resource_unpack() {
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
# 编排内置说明、运行时初始化和资源合并。
main() {
  show_readme_and_wait # 展示内置说明，确认前不写日志或执行目标脚本。
  initialize_runtime # 用户确认后初始化 Shell 和日志。
  run_unity_resource_unpack # 定位目标并保留其原有执行与失败处理方式。
}

main "$@"
