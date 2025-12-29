#!/usr/bin/env bash
set -euo pipefail

# ================================== 基础信息 & 日志 ==================================
SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                   # 设置对应的日志文件路径
: > "$LOG_FILE" || true

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }          # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }        # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }        # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }        # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }          # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }        # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }        # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }          # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }       # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }       # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }          # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }             # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }             # 🔗 下划线

# ================================== 获取脚本目录 / 工程根目录 ==================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MY_FLUTTER_DIR="$PROJECT_ROOT/my_flutter"

# ================================== 芯片架构判断（ARM64 / x86_64） ==================================
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ================================== 往 profile 注入 shellenv 块（幂等） ==================================
inject_shellenv_block() {
  local profile_file="$1"
  local shellenv_cmd="$2"

  mkdir -p "$(dirname "$profile_file")" 2>/dev/null || true
  touch "$profile_file" 2>/dev/null || true

  local begin="# >>> Jobs: Homebrew shellenv >>>"
  local end="# <<< Jobs: Homebrew shellenv <<<"

  if grep -qF "$begin" "$profile_file" 2>/dev/null; then
    debug_echo "🐞 已存在 shellenv 注入块：$profile_file（跳过）"
    return 0
  fi

  {
    echo ""
    echo "$begin"
    echo "$shellenv_cmd"
    echo "$end"
    echo ""
  } >> "$profile_file"

  success_echo "✅ 已写入 Homebrew 环境注入到：$profile_file"
}

# ================================== 写 Homebrew 的环境变量（区分架构） ==================================
ensure_brew_shellenv_in_profile() {
  local arch
  arch="$(get_cpu_arch)"

  if [[ "$arch" == "arm64" ]]; then
    inject_shellenv_block "$HOME/.zprofile" 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  else
    inject_shellenv_block "$HOME/.bash_profile" 'eval "$(/usr/local/bin/brew shellenv)"'
  fi
}

# ================================== 自检安装 🍺Homebrew（并按规范：回车跳过，输入任意字符执行更新） ==================================
install_homebrew() {
  local arch shell_path profile_file brew_bin shellenv_cmd
  arch="$(get_cpu_arch)"
  shell_path="${SHELL##*/}"
  profile_file=""
  brew_bin=""
  shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
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

    success_echo "✅ Homebrew 安装成功"

    # ==== 注入 shellenv 到对应配置文件（自动生效） ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""
    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac
    inject_shellenv_block "$profile_file" "$shellenv_cmd"

    # 立刻对当前会话生效（不等重开终端）
    eval "$(${brew_bin} shellenv)"

  else
    info_echo "🍺 Homebrew 已安装。"
    echo "👉 直接回车：跳过更新"
    echo "👉 输入任意字符后回车：执行更新（brew update && brew upgrade && brew cleanup && brew doctor && brew -v）"
    local confirm
    IFS= read -r confirm

    if [[ -z "$confirm" ]]; then
      note_echo "⏭️ 已选择跳过 Homebrew 更新"
    else
      info_echo "⏳ 正在更新 Homebrew..."
      brew update       || { error_echo "❌ brew update 失败"; return 1; }
      brew upgrade      || { error_echo "❌ brew upgrade 失败"; return 1; }
      brew cleanup      || { error_echo "❌ brew cleanup 失败"; return 1; }
      brew doctor       || { warn_echo  "⚠️  brew doctor 有警告/错误，请按提示处理"; }
      brew -v           || { warn_echo  "⚠️  打印 brew 版本失败（可忽略）"; }
      success_echo "✅ Homebrew 已更新"
    fi
  fi
}

# ================================== 安装/升级 FVM（必须通过 brew） ==================================
install_or_upgrade_fvm() {
  info_echo "🔍 准备安装/升级 FVM（通过 Homebrew）"

  # 先确保 brew 环境变量写入 profile（防止 pod install 环境找不到 brew）
  ensure_brew_shellenv_in_profile

  # Tap + 安装/升级
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

# ================================== 通过 FVM 安装 Flutter（默认 stable 最新） ==================================
install_flutter_by_fvm() {
  info_echo "🧩 通过 FVM 安装 Flutter（stable）..."
  fvm install stable
  success_echo "✅ Flutter(stable) 已安装"
}

# ================================== 在 ./my_flutter 下执行 flutter pub get ==================================
flutter_pub_get_in_my_flutter() {
  if [[ ! -d "$MY_FLUTTER_DIR" ]]; then
    warn_echo "⚠ 未找到目录：$MY_FLUTTER_DIR（跳过 flutter pub get）"
    return 0
  fi

  info_echo "📁 进入 my_flutter：$MY_FLUTTER_DIR"
  pushd "$MY_FLUTTER_DIR" >/dev/null

  # 使用 fvm 的 flutter，确保跟你安装的 stable 对齐
  info_echo "📦 执行：fvm flutter pub get"
  fvm flutter pub get

  success_echo "✅ my_flutter 依赖已拉取完成"
  popd >/dev/null
}

# ================================== 自述 & 等待用户回车 ==================================
show_epilogue_and_wait() {
  echo ""
  bold_echo "============================== 脚本自述 =============================="
  note_echo "本脚本由 Podfile 在 pod install 的 pre_install 阶段自动调用。"
  note_echo "它会做以下事情："
  gray_echo "  1) 自检/安装 Homebrew（可选择是否更新）"
  gray_echo "  2) 通过 Homebrew 安装或升级 FVM"
  gray_echo "  3) 通过 FVM 安装 Flutter stable"
  gray_echo "  4) 在 ./my_flutter 目录执行：fvm flutter pub get"
  note_echo "日志文件：$LOG_FILE"
  bold_echo "======================================================================"
  echo ""
  echo "👉 按回车结束（继续 pod install）"
  IFS= read -r _
}

# ================================== main（统一调用入口） ==================================
main() {
  bold_echo "🚀 开始准备 Flutter 环境（Pod install 挂载脚本）"
  info_echo "工程根目录：$PROJECT_ROOT"
  info_echo "日志输出：$LOG_FILE"

  install_homebrew
  install_or_upgrade_fvm
  install_flutter_by_fvm
  flutter_pub_get_in_my_flutter

  success_echo "🎉 Flutter 环境准备完成"
  show_epilogue_and_wait
}

main "$@"
