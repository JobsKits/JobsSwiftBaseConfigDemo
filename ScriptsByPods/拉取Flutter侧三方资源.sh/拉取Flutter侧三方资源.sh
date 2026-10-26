#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：拉取Flutter侧三方资源.sh。
# - 核心用途：查找可用 Flutter / FVM，拉取依赖并验证或重生成当前电脑可用的 iOS 配置。
# - 影响范围：可能更新 Flutter 工程依赖与生成目录；失败不阻断 pod install。
# - 运行提示：交互运行先展示内置自述并回车确认；非交互须显式 JOBS_FLUTTER_AUTO_SETUP=1，check-only / skip 优先跳过。

SCRIPT_DIR=""
SCRIPT_PATH=""
SCRIPT_BASENAME=""
LOG_FILE="/tmp/拉取Flutter侧三方资源.log"
ROOT_DIR=""
DEFAULT_FLUTTER_DIR=""
DEFAULT_PODHELPER=""
FLUTTER_CMD=()
FLUTTER_HEALTH_REASON=""

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
# 展示固定内置自述并确认执行；钩子标记不代替用户确认。
show_script_intro_and_wait() {
  print -r -- "======================= 拉取 Flutter 侧三方资源 ======================="
  print -r -- "核心用途：查找可用 Flutter / FVM，为工程内 Flutter module 拉取依赖并修复跨电脑残留路径。"
  print -r -- "影响范围：仅完整健康的 iOS 配置直接跳过；必要时备份两份过期配置后重试官方 pub get。"
  print -r -- "修复边界：不手改生成源码，不手动删除 .ios、Pods 或锁文件；重生成失败恢复原配置，不声称已修复。"
  print -r -- "运行策略：交互运行均需确认；非交互须显式 JOBS_FLUTTER_AUTO_SETUP=1，check-only / skip 优先跳过。"
  print -r -- "取消方式：按 Ctrl+C 终止；独立运行需按回车继续。"
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
  gray_echo "危险操作必须输入 YES 后回车；其它输入一律取消。"
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
