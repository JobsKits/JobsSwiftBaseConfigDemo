#!/bin/zsh
# 脚本自述：
# - 检查 FVM、Flutter stable 与 iOS 缓存；Homebrew 安装失败时回退 FVM 官方安装器。
# - 会安装工具、更新 Flutter 缓存及 my_flutter 生成文件；官方安装器可能迁移旧 FVM。
# - 独立运行先回车确认；Podfile 已统一确认时使用 JOBS_SKIP_README=1。

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

# 同步终端与文件日志，非彩色环境剥离展示用 ANSI 控制码。
log() {
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    printf '%b\n' "$1" | tee -a "$LOG_FILE"
  else
    printf '%b\n' "$1" | /usr/bin/sed $'s/\033\\[[0-9;]*m//g' | tee -a "$LOG_FILE"
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
# 打印固定自述；已由 Podfile 确认或显式自动配置时避免重复阻塞。
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
  printf '%s日志：%s；按 Ctrl+C 可取消。%s\n' "$body_style" "$LOG_FILE" "$reset_style"
  [[ "${JOBS_SKIP_README:-}" == 1 || "${JOBS_FLUTTER_AUTO_SETUP:-}" == 1 ]] && return 0
  if [[ ! -t 0 ]]; then
    printf '%s\n' '当前无交互输入；请在终端运行，或显式设置 JOBS_FLUTTER_AUTO_SETUP=1。' >&2
    exit 1
  fi
  read -r '?👉 已了解用途与影响，按回车继续；按 Ctrl+C 取消：' _ || exit 1
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

  printf "%s（直接回车跳过；输入任意字符后回车执行）：" "$message"
  IFS= read -r answer || true
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
  gray_echo "危险操作必须输入 YES 后回车；其它输入一律取消。"
  printf "➤ "
  IFS= read -r input || true
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
  version_output="$("$1" --version 2>/dev/null)" || return 1
  [[ -n "$version_output" ]]
}
# 跳过损坏的 PATH shim，兼容官方安装、Pub 与两种 Homebrew 前缀。
find_fvm_bin() {
  local candidate=""
  for candidate in "$(command -v fvm 2>/dev/null)" \
      "$(resolve_official_fvm_dir)/bin/fvm" "${HOME}/fvm/bin/fvm" \
      "${HOME}/.pub-cache/bin/fvm" /opt/homebrew/bin/fvm /usr/local/bin/fvm; do
    fvm_is_healthy "$candidate" || continue
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
  if (( rc != 0 )); then
    warn_echo "Homebrew ${action} fvm 失败，退出码：${rc}；自动回退官方安装。"
    return 1
  fi
  if ! FVM_BIN="$(find_fvm_bin)"; then
    warn_echo "Homebrew 返回成功，但 FVM 不可用；自动回退官方安装。"
    return 1
  fi
  return 0
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
  curl -fSL --connect-timeout 15 --max-time 120 --retry 1 \
    https://fvm.app/install.sh -o "$installer_path" 2>&1 | tee -a "$LOG_FILE"
  rc=${pipestatus[1]}
  if (( rc != 0 )) || [[ ! -s "$installer_path" ]]; then
    error_echo "FVM 官方安装器下载失败（退出码：${rc}）；请检查 fvm.app 网络或代理。"
    rm -f "$installer_path"
    return 1
  fi
  warn_echo "官方安装器将写入 ${OFFICIAL_FVM_DIR}/bin，并可能迁移旧 FVM 安装。"
  FVM_INSTALL_DIR="$OFFICIAL_FVM_DIR" /bin/bash "$installer_path" </dev/null 2>&1 | tee -a "$LOG_FILE"
  rc=${pipestatus[1]}
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
  local brew_action=install
  if FVM_BIN="$(find_fvm_bin)"; then
    activate_fvm
    if ! ask_any_to_run "是否升级 FVM（Homebrew 不可用时自动使用官方安装器）"; then
      note_echo "已跳过 FVM 升级。"
      return 0
    fi
    brew_action=upgrade
    if [[ "$FVM_BIN" == "$(resolve_official_fvm_dir)/bin/fvm" || "$FVM_BIN" == "${HOME}/fvm/bin/fvm" ]]; then
      install_fvm_official || return 1
      activate_fvm
      return 0
    fi
  else
    warn_echo "未检测到可用 FVM。"
    if ! ask_any_to_run "是否安装 FVM（优先 Homebrew，失败自动使用官方安装器）" "$(flutter_auto_prompt_default)"; then
      warn_echo "已跳过 FVM 安装，无法继续自动安装 Flutter。"
      return 1
    fi
  fi
  install_fvm_with_brew "$brew_action" || install_fvm_official || return 1
  activate_fvm
}
# 定位 Flutter SDK 缓存，保留与 FVM 二进制安装目录的独立性。
detect_fvm_home_and_flutter_bin() {
  if [[ -n "$FVM_HOME" && -d "${FVM_HOME}/versions" ]]; then
    :
  elif [[ -d "${HOME}/fvm/versions" ]]; then
    FVM_HOME="${HOME}/fvm"
  elif [[ -d "${HOME}/.fvm/versions" ]]; then
    FVM_HOME="${HOME}/.fvm"
  else
    FVM_HOME="${HOME}/fvm"
  fi

  FLUTTER_BIN="${FVM_HOME}/versions/stable/bin/flutter"
  info_echo "FVM_HOME：${FVM_HOME}"
  info_echo "Flutter Bin：${FLUTTER_BIN}"
}
# 按需准备 Flutter stable，失败时停止下游操作。
ensure_flutter_stable() {
  detect_fvm_home_and_flutter_bin

  if [[ -x "$FLUTTER_BIN" ]]; then
    success_echo "Flutter stable 已存在：$($FLUTTER_BIN --version 2>/dev/null | head -n 1)"
    if ask_any_to_run "是否更新并绑定 Flutter stable：fvm install stable && fvm global stable"; then
      "$FVM_BIN" install stable || warn_echo "fvm install stable 失败。"
      "$FVM_BIN" global stable  || warn_echo "fvm global stable 失败。"
    else
      note_echo "已跳过 Flutter stable 更新。"
    fi
  else
    warn_echo "未找到 Flutter stable 可执行文件：${FLUTTER_BIN}"
    if ! ask_any_to_run "是否通过 FVM 安装并绑定 Flutter stable" "$(flutter_auto_prompt_default)"; then
      warn_echo "已跳过 Flutter 安装。"
      return 1
    fi
    "$FVM_BIN" install stable || return 1
    "$FVM_BIN" global stable  || return 1
  fi

  detect_fvm_home_and_flutter_bin
  if [[ ! -x "$FLUTTER_BIN" ]]; then
    error_echo "仍未找到 Flutter 可执行文件：${FLUTTER_BIN}"
    return 1
  fi

  success_echo "Flutter stable 就绪：$($FLUTTER_BIN --version 2>/dev/null | head -n 1)"
}
# 仅在引擎缓存缺失且已确认时下载 iOS 引擎。
precache_flutter_ios() {
  local xcframework_path="${FVM_HOME}/versions/stable/bin/cache/artifacts/engine/ios/Flutter.xcframework"

  if [[ -d "$xcframework_path" ]]; then
    success_echo "Flutter iOS 引擎缓存已存在：${xcframework_path}"
    return 0
  fi

  if ! ask_any_to_run "是否执行 flutter precache --ios" "$(flutter_auto_prompt_default)"; then
    warn_echo "已跳过 iOS 引擎预缓存；后续 pod install 可能找不到 Flutter.xcframework。"
    return 0
  fi

  "$FLUTTER_BIN" precache --ios
  local rc=$?
  if [[ $rc -ne 0 ]]; then
    error_echo "flutter precache --ios 失败，退出码：${rc}。"
    return 1
  fi

  if [[ -d "$xcframework_path" ]]; then
    success_echo "Flutter iOS 引擎缓存就绪：${xcframework_path}"
  else
    warn_echo "未检测到 Flutter.xcframework：${xcframework_path}"
  fi
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

  ensure_fvm || return 1
  ensure_flutter_stable || return 1
  precache_flutter_ios || return 1
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
