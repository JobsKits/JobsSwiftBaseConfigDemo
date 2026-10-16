#!/bin/zsh
# 脚本自述：
# - 脚本名称：拉取Flutter侧三方资源.sh。
# - 核心用途：查找可用 Flutter / FVM，为工程内 Flutter module 拉取依赖并补齐 podhelper。
# - 影响范围：可能更新 Flutter 工程依赖与生成目录；失败不阻断 pod install。
# - 运行提示：先展示内置自述；终端回车确认，Podfile 已确认入口传 JOBS_SKIP_README=1。

SCRIPT_DIR=""
SCRIPT_PATH=""
SCRIPT_BASENAME=""
LOG_FILE="/tmp/拉取Flutter侧三方资源.log"
ROOT_DIR=""
DEFAULT_FLUTTER_DIR=""
DEFAULT_PODHELPER=""
FLUTTER_CMD=()

# 同步输出业务日志到终端和固定日志文件。
log() {
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    printf '%b\n' "$1" | tee -a "$LOG_FILE"
  else
    printf '%b\n' "$1" | /usr/bin/sed $'s/\033\\[[0-9;]*m//g' | tee -a "$LOG_FILE"
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
# 展示固定内置自述，并按明确的 Podfile 开关决定是否等待确认。
show_script_intro_and_wait() {
  print -r -- "======================= 拉取 Flutter 侧三方资源 ======================="
  print -r -- "核心用途：查找可用 Flutter / FVM，为工程内 Flutter module 执行 flutter pub get。"
  print -r -- "影响范围：可能更新 Flutter 依赖和 .ios 生成目录；已有默认 podhelper 时直接跳过。"
  print -r -- "运行策略：失败告警后继续；Podfile 统一确认后可传 JOBS_SKIP_README=1 跳过重复确认。"
  print -r -- "取消方式：按 Ctrl+C 终止；独立运行需按回车继续。"
  print -r -- "日志文件：/tmp/拉取Flutter侧三方资源.log"
  print -r -- "========================================================================"

  if [[ "${JOBS_SKIP_README:-}" == "1" ]]; then
    return 0
  fi

  if [[ ! -t 0 ]]; then
    print -u2 -r -- "✖ 当前没有可交互输入；请在终端运行，或由已确认的 Podfile 入口传 JOBS_SKIP_README=1。"
    exit 1
  fi

  printf "👉 已了解用途与影响，按回车继续执行；按 Ctrl+C 取消："
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

  printf "%s（直接回车跳过；输入任意字符后回车执行）：" "$message"
  IFS= read -r answer || true
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
  gray_echo "危险操作必须输入 YES 后回车；其它输入一律取消。"
  printf "➤ "
  IFS= read -r input || true
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
  if "$tool_path" --version >/dev/null 2>&1; then
    return 0
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
  local candidate=""
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
    fi
  done

  for candidate in "${fvm_candidates[@]}"; do
    if is_tool_available "$candidate"; then
      FLUTTER_CMD=("$candidate" "flutter")
      return 0
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
    "${FLUTTER_CMD[@]}" pub get
  )
  rc=$?

  if [[ $rc -ne 0 ]]; then
    warn_echo "flutter pub get 失败：${project_dir}，退出码：${rc}。继续处理下一个候选目录。"
    return 1
  fi

  success_echo "依赖拉取完成：${project_dir}"
  return 0
}
# 补齐缺失 podhelper，保持辅助任务不阻断主安装流程。
run_flutter_resource_pull() {
  local -a candidates=()
  local project_dir=""
  local generated=0

  bold_echo "🚀 开始拉取 Flutter 侧三方资源"
  info_echo "工程根目录：${ROOT_DIR}"
  info_echo "默认 Flutter 目录：${DEFAULT_FLUTTER_DIR}"
  info_echo "默认 podhelper：${DEFAULT_PODHELPER}"
  info_echo "日志文件：${LOG_FILE}"

  if [[ -f "$DEFAULT_PODHELPER" ]]; then
    success_echo "podhelper.rb 已存在，跳过。"
    return 0
  fi

  if ! find_flutter_command; then
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
    run_flutter_pub_get "$project_dir" || continue

    if [[ -f "$DEFAULT_PODHELPER" ]]; then
      success_echo "已生成默认 podhelper：${DEFAULT_PODHELPER}"
      generated=1
      break
    fi

    if [[ -f "${project_dir}/.ios/Flutter/podhelper.rb" ]]; then
      success_echo "已在候选目录生成 podhelper：${project_dir}/.ios/Flutter/podhelper.rb"
      note_echo "如果 Podfile 固定引用 my_flutter，请确认 my_flutter 指向真实 Flutter module。"
      generated=1
    fi
  done

  if [[ $generated -eq 0 ]]; then
    warn_echo "执行后仍未发现 podhelper.rb，当前脚本保持 non-blocking，不阻断主流程。"
  fi
}
# 编排自述确认、运行时初始化和依赖拉取。
main() {
  show_script_intro_and_wait # 先说明用途与影响，并完成独立运行的回车确认。
  initialize_runtime # 确认后初始化路径、Shell 选项和固定日志。
  run_flutter_resource_pull # 使用健康的 Flutter / FVM 拉取资源，业务失败只告警。
}

main "$@"
