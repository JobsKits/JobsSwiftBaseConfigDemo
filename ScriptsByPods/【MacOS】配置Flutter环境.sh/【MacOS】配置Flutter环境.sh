#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 检查 FVM、Flutter stable 与 iOS 缓存；Homebrew 安装失败时回退 FVM 官方安装器。
# - 会安装工具、更新 Flutter 缓存及 my_flutter 生成文件；官方安装器可能迁移旧 FVM。
# - 每次交互运行先回车确认；check-only / skip 不执行，显式自动配置保留原有范围。

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
  gray_echo "危险操作必须输入 YES 后回车；其它输入一律取消。"
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
