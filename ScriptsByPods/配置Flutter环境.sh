#!/usr/bin/env bash
set -euo pipefail

# ================================== 基础信息 & 日志 ==================================
SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "${LOG_FILE}" || true

log()            { echo -e "$1" | tee -a "${LOG_FILE}"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
bold_echo()      { log "\033[1m$1\033[0m"; }

# ================================== 路径配置 ==================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
MY_FLUTTER_DIR="${PROJECT_ROOT}/my_flutter"

# 会动态探测
FVM_HOME="${FVM_HOME:-}"
FLUTTER_BIN=""

# ================================== 芯片架构判断 ==================================
get_cpu_arch() { [[ "$(uname -m)" == "arm64" ]] && echo "arm64" || echo "x86_64"; }

# ================================== profile 注入（极限健壮 / 避免 -u 崩溃） ==================================
inject_shellenv_block() {
  local profile_file="${1:-}"
  local shellenv_cmd="${2:-}"

  if [[ -z "${profile_file:-}" || -z "${shellenv_cmd:-}" ]]; then
    warn_echo "⚠ inject_shellenv_block 参数缺失，跳过写入（non-blocking）"
    debug_echo "🐞 profile_file='${profile_file:-<empty>}' shellenv_cmd='${shellenv_cmd:-<empty>}'"
    return 0
  fi

  mkdir -p "$(dirname "${profile_file}")" 2>/dev/null || true
  touch "${profile_file}" 2>/dev/null || true

  local begin="# >>> Jobs: Homebrew shellenv >>>"
  local end="# <<< Jobs: Homebrew shellenv <<<"

  if grep -qF "${begin}" "${profile_file}" 2>/dev/null; then
    # 这里一定要用 ${var:-}，避免任何“变量名边界污染”触发 -u
    debug_echo "🐞 已存在 shellenv 注入块：${profile_file:-<empty>}（跳过）"
    return 0
  fi

  {
    echo ""
    echo "${begin}"
    echo "${shellenv_cmd}"
    echo "${end}"
    echo ""
  } >> "${profile_file}"

  success_echo "✅ 已写入 Homebrew 环境注入到：${profile_file}"
}

ensure_brew_shellenv_in_profile() {
  local arch shell_path profile_file
  arch="$(get_cpu_arch)"
  shell_path="${SHELL##*/}"
  profile_file=""

  case "${shell_path}" in
    zsh)  profile_file="${HOME}/.zprofile" ;;
    bash) profile_file="${HOME}/.bash_profile" ;;
    *)    profile_file="${HOME}/.profile" ;;
  esac

  if [[ "${arch}" == "arm64" ]]; then
    inject_shellenv_block "${profile_file}" 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  else
    inject_shellenv_block "${profile_file}" 'eval "$(/usr/local/bin/brew shellenv)"'
  fi
}

# ================================== Homebrew ==================================
install_homebrew() {
  local arch brew_bin
  arch="$(get_cpu_arch)"
  brew_bin=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：${arch}）"

    if [[ "${arch}" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（arm64）"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    # 立刻对当前会话生效
    eval "$("${brew_bin}" shellenv)" || true
    ensure_brew_shellenv_in_profile

    success_echo "✅ Homebrew 安装成功"
    return 0
  fi

  info_echo "🍺 Homebrew 已安装。"

  # Pod install 里尽量不要卡交互；你需要交互时才问
  if [[ -t 0 ]]; then
    echo "👉 直接回车：跳过更新"
    echo "👉 输入任意字符后回车：执行更新（brew update && brew upgrade && brew cleanup && brew doctor && brew -v）"
    local confirm
    IFS= read -r confirm || true
    if [[ -z "${confirm:-}" ]]; then
      note_echo "⏭️ 已选择跳过 Homebrew 更新"
      return 0
    fi

    info_echo "⏳ 正在更新 Homebrew..."
    brew update  || { warn_echo "⚠ brew update 失败（继续执行）"; }
    brew upgrade || { warn_echo "⚠ brew upgrade 失败（继续执行）"; }
    brew cleanup || { warn_echo "⚠ brew cleanup 失败（继续执行）"; }
    brew doctor  || { warn_echo "⚠ brew doctor 有警告/错误，请按提示处理"; }
    brew -v      || { warn_echo "⚠ 打印 brew 版本失败（可忽略）"; }
    success_echo "✅ Homebrew 更新流程结束"
  else
    note_echo "⏭️ 非交互环境：默认跳过 Homebrew 更新"
  fi
}

# ================================== FVM（通过 Homebrew） ==================================
install_or_upgrade_fvm() {
  info_echo "🔍 准备安装/升级 FVM（通过 Homebrew）"

  ensure_brew_shellenv_in_profile

  brew tap leoafarias/fvm || true

  if command -v fvm &>/dev/null; then
    info_echo "🔄 已检测到 fvm，准备升级到最新..."
    brew upgrade fvm || brew upgrade leoafarias/fvm/fvm || true
  else
    info_echo "📦 未检测到 fvm，准备安装最新..."
    brew install fvm || brew install leoafarias/fvm/fvm
  fi

  if command -v fvm &>/dev/null; then
    success_echo "✅ FVM 可用：$(fvm --version | head -n 1)"
  else
    error_echo "❌ FVM 安装失败：请检查 Homebrew 与网络"
    exit 1
  fi
}

# ================================== 探测 FVM_HOME & Flutter Bin（不用 fvm flutter / 不用 PATH flutter） ==================================
detect_fvm_home_and_flutter_bin() {
  # 1) 优先使用已设置的 FVM_HOME 且目录有效
  if [[ -n "${FVM_HOME:-}" && -d "${FVM_HOME}/versions" ]]; then
    :
  # 2) 常见路径兜底（你机器报错路径就是 ~/fvm）
  elif [[ -d "${HOME}/fvm/versions" ]]; then
    FVM_HOME="${HOME}/fvm"
  elif [[ -d "${HOME}/.fvm/versions" ]]; then
    FVM_HOME="${HOME}/.fvm"
  else
    # 3) 最后一层兜底：仍按 ~/fvm
    FVM_HOME="${HOME}/fvm"
  fi

  FLUTTER_BIN="${FVM_HOME}/versions/stable/bin/flutter"

  info_echo "🧭 FVM_HOME：${FVM_HOME:-<empty>}"
  info_echo "🧭 Flutter Bin：${FLUTTER_BIN:-<empty>}"
}

# ================================== 安装 Flutter stable + 绑定 global stable ==================================
install_flutter_by_fvm() {
  info_echo "🧩 通过 FVM 安装 Flutter（stable）..."

  # 安装 stable
  fvm install stable || true

  # 强制绑定全局 stable（让 fvm 状态一致）
  fvm global stable || true

  detect_fvm_home_and_flutter_bin

  if [[ ! -x "${FLUTTER_BIN}" ]]; then
    error_echo "❌ 未找到 flutter 可执行文件：${FLUTTER_BIN:-<empty>}"
    error_echo "   请手动执行：fvm install stable && fvm global stable"
    exit 1
  fi

  success_echo "✅ Flutter(stable) 已安装且可执行"
  info_echo "🔎 Flutter 版本：$("${FLUTTER_BIN}" --version | head -n 1)"
}

# ================================== precache iOS（确保 Flutter.xcframework 存在） ==================================
precache_flutter_ios() {
  info_echo "📦 预缓存 Flutter iOS 引擎：flutter precache --ios"

  "${FLUTTER_BIN}" precache --ios || {
    error_echo "❌ flutter precache --ios 执行失败（会导致 pod install post_install 报 Flutter.xcframework 不存在）"
    exit 1
  }

  local xcframework_path
  xcframework_path="${FVM_HOME}/versions/stable/bin/cache/artifacts/engine/ios/Flutter.xcframework"

  if [[ -d "${xcframework_path}" ]]; then
    success_echo "✅ 已就绪：${xcframework_path}"
  else
    error_echo "❌ 未检测到：${xcframework_path}"
    error_echo "   请手动执行：${FLUTTER_BIN} precache --ios"
    exit 1
  fi
}

# ================================== my_flutter 下 pub get（用绝对 flutter） ==================================
flutter_pub_get_in_my_flutter() {
  if [[ ! -d "${MY_FLUTTER_DIR}" ]]; then
    warn_echo "⚠ 未找到目录：${MY_FLUTTER_DIR}（跳过 flutter pub get）"
    return 0
  fi

  info_echo "📁 进入 my_flutter：${MY_FLUTTER_DIR}"
  pushd "${MY_FLUTTER_DIR}" >/dev/null

  info_echo "📦 执行：flutter pub get"
  "${FLUTTER_BIN}" pub get || {
    error_echo "❌ flutter pub get 失败：请检查 my_flutter/pubspec.yaml 与网络"
    popd >/dev/null || true
    exit 1
  }

  success_echo "✅ my_flutter 依赖已拉取完成"
  popd >/dev/null
}

# ================================== 自述（仅交互环境等待） ==================================
show_epilogue_and_wait() {
  echo ""
  bold_echo "============================== 脚本自述 =============================="
  note_echo "本脚本由 Podfile 在 pod install 的 pre_install 阶段自动调用。"
  note_echo "它会做以下事情："
  gray_echo "  1) 自检/安装 Homebrew（可选择是否更新）"
  gray_echo "  2) 通过 Homebrew 安装或升级 FVM"
  gray_echo "  3) 通过 FVM 安装并绑定 Flutter stable（fvm global stable）"
  gray_echo "  4) 预缓存 iOS 引擎：flutter precache --ios（确保 Flutter.xcframework 存在）"
  gray_echo "  5) 在 ./my_flutter 目录执行：flutter pub get"
  note_echo "日志文件：${LOG_FILE}"
  bold_echo "======================================================================"
  echo ""

  if [[ -t 0 ]]; then
    echo "👉 按回车结束（继续 pod install）"
    IFS= read -r _ || true
  else
    note_echo "⏭️ 非交互环境：跳过等待回车"
  fi
}

# ================================== main（保持极简清晰） ==================================
main() {
  bold_echo "🚀 开始准备 Flutter 环境（Pod install 挂载脚本）"
  info_echo "工程根目录：${PROJECT_ROOT}"
  info_echo "日志输出：${LOG_FILE}"

  install_homebrew
  install_or_upgrade_fvm
  install_flutter_by_fvm
  precache_flutter_ios
  flutter_pub_get_in_my_flutter

  success_echo "🎉 Flutter 环境准备完成"
  show_epilogue_and_wait
}

main "$@"
