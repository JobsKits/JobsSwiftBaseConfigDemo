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

resolve_project_root() {
  local parent_dir="$(cd "${SCRIPT_DIR}/.." && pwd)"

  if [[ "$(basename "$parent_dir")" == "ScriptsByPods" ]]; then
    cd "${parent_dir}/.." && pwd
  else
    echo "$parent_dir"
  fi
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

ROOT_DIR="$(resolve_project_root)"
DEFAULT_FLUTTER_DIR="${ROOT_DIR}/my_flutter"
DEFAULT_PODHELPER="${DEFAULT_FLUTTER_DIR}/.ios/Flutter/podhelper.rb"
FLUTTER_CMD=()

find_flutter_command() {
  if command -v flutter >/dev/null 2>&1; then
    FLUTTER_CMD=("$(command -v flutter)")
    return 0
  fi

  if [[ -x "${HOME}/fvm/versions/stable/bin/flutter" ]]; then
    FLUTTER_CMD=("${HOME}/fvm/versions/stable/bin/flutter")
    return 0
  fi

  if [[ -x "${HOME}/.fvm/versions/stable/bin/flutter" ]]; then
    FLUTTER_CMD=("${HOME}/.fvm/versions/stable/bin/flutter")
    return 0
  fi

  if command -v fvm >/dev/null 2>&1; then
    FLUTTER_CMD=("$(command -v fvm)" "flutter")
    return 0
  fi

  return 1
}

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

main() {
  local -a candidates=()
  local project_dir=""
  local generated=0

  show_readme_and_wait

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

main "$@"
