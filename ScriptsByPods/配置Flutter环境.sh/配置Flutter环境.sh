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
MY_FLUTTER_DIR="${ROOT_DIR}/my_flutter"
BREW_BIN=""
FVM_BIN=""
FVM_HOME="${FVM_HOME:-}"
FLUTTER_BIN=""

inject_shellenv_block() {
  local profile_file="${1:-}"
  local shellenv_cmd="${2:-}"
  local begin="# >>> Jobs: Homebrew shellenv >>>"
  local end="# <<< Jobs: Homebrew shellenv <<<"

  if [[ -z "$profile_file" || -z "$shellenv_cmd" ]]; then
    warn_echo "shellenv 注入参数缺失，跳过。"
    return 0
  fi

  mkdir -p "$(dirname "$profile_file")" 2>/dev/null || true
  touch "$profile_file" 2>/dev/null || true

  if grep -Fq "$begin" "$profile_file" 2>/dev/null; then
    debug_echo "已存在 Homebrew shellenv 注入块：${profile_file}"
    return 0
  fi

  {
    echo ""
    echo "$begin"
    echo "$shellenv_cmd"
    echo "$end"
    echo ""
  } >> "$profile_file"

  success_echo "已写入 Homebrew 环境注入到：${profile_file}"
}

ensure_brew_shellenv_in_profile() {
  local arch="$(get_cpu_arch)"
  local shell_name="$(basename "${SHELL:-zsh}")"
  local profile_file=""

  case "$shell_name" in
    zsh)  profile_file="${HOME}/.zprofile" ;;
    bash) profile_file="${HOME}/.bash_profile" ;;
    *)    profile_file="${HOME}/.profile" ;;
  esac

  if [[ "$arch" == "arm64" ]]; then
    inject_shellenv_block "$profile_file" 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  else
    inject_shellenv_block "$profile_file" 'eval "$(/usr/local/bin/brew shellenv)"'
  fi
}

activate_brew_shellenv() {
  if [[ -n "$BREW_BIN" && -x "$BREW_BIN" ]]; then
    eval "$("$BREW_BIN" shellenv)" 2>/dev/null || true
  fi
}

ensure_homebrew() {
  local arch="$(get_cpu_arch)"

  if BREW_BIN="$(find_brew_bin 2>/dev/null)"; then
    info_echo "Homebrew 已安装：${BREW_BIN}"
    activate_brew_shellenv
    ensure_brew_shellenv_in_profile

    if ask_any_to_run "是否执行 Homebrew 自检与更新：brew update && brew upgrade && brew cleanup && brew doctor && brew -v"; then
      "$BREW_BIN" update  || warn_echo "brew update 失败，继续。"
      "$BREW_BIN" upgrade || warn_echo "brew upgrade 失败，继续。"
      "$BREW_BIN" cleanup || warn_echo "brew cleanup 失败，继续。"
      "$BREW_BIN" doctor  || warn_echo "brew doctor 返回警告/错误，请按提示处理。"
      "$BREW_BIN" -v      || warn_echo "brew -v 执行失败。"
      success_echo "Homebrew 自检与更新流程结束。"
    else
      note_echo "已跳过 Homebrew 自检与更新。"
    fi
    return 0
  fi

  warn_echo "未检测到 Homebrew。"
  if ! ask_any_to_run "是否安装 Homebrew（架构：${arch}）"; then
    warn_echo "Homebrew 不可用，后续 FVM 安装/升级无法继续。"
    return 1
  fi

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  local rc=$?
  if [[ $rc -ne 0 ]]; then
    error_echo "Homebrew 安装失败，退出码：${rc}。"
    return 1
  fi

  if ! BREW_BIN="$(find_brew_bin 2>/dev/null)"; then
    error_echo "Homebrew 安装后仍未找到 brew 可执行文件。"
    return 1
  fi

  activate_brew_shellenv
  ensure_brew_shellenv_in_profile
  success_echo "Homebrew 安装完成：${BREW_BIN}"
}

find_fvm_bin() {
  if command -v fvm >/dev/null 2>&1; then
    command -v fvm
  elif [[ -x "/opt/homebrew/bin/fvm" ]]; then
    echo "/opt/homebrew/bin/fvm"
  elif [[ -x "/usr/local/bin/fvm" ]]; then
    echo "/usr/local/bin/fvm"
  else
    return 1
  fi
}

ensure_fvm() {
  if FVM_BIN="$(find_fvm_bin 2>/dev/null)"; then
    success_echo "FVM 已可用：$($FVM_BIN --version 2>/dev/null | head -n 1)"
    if ask_any_to_run "是否升级 FVM"; then
      "$BREW_BIN" tap leoafarias/fvm || true
      "$BREW_BIN" upgrade fvm || "$BREW_BIN" upgrade leoafarias/fvm/fvm || warn_echo "FVM 升级失败，继续使用现有版本。"
      FVM_BIN="$(find_fvm_bin 2>/dev/null || echo "$FVM_BIN")"
    else
      note_echo "已跳过 FVM 升级。"
    fi
    return 0
  fi

  warn_echo "未检测到 FVM。"
  if ! ask_any_to_run "是否通过 Homebrew 安装 FVM"; then
    warn_echo "已跳过 FVM 安装，无法继续自动安装 Flutter。"
    return 1
  fi

  "$BREW_BIN" tap leoafarias/fvm || true
  "$BREW_BIN" install fvm || "$BREW_BIN" install leoafarias/fvm/fvm
  local rc=$?
  if [[ $rc -ne 0 ]]; then
    error_echo "FVM 安装失败，退出码：${rc}。"
    return 1
  fi

  if ! FVM_BIN="$(find_fvm_bin 2>/dev/null)"; then
    error_echo "FVM 安装后仍未找到 fvm 可执行文件。"
    return 1
  fi

  success_echo "FVM 安装完成：$($FVM_BIN --version 2>/dev/null | head -n 1)"
}

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
    if ! ask_any_to_run "是否通过 FVM 安装并绑定 Flutter stable"; then
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

precache_flutter_ios() {
  local xcframework_path="${FVM_HOME}/versions/stable/bin/cache/artifacts/engine/ios/Flutter.xcframework"

  if [[ -d "$xcframework_path" ]]; then
    success_echo "Flutter iOS 引擎缓存已存在：${xcframework_path}"
    return 0
  fi

  if ! ask_any_to_run "是否执行 flutter precache --ios"; then
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

flutter_pub_get_in_my_flutter() {
  if [[ ! -d "$MY_FLUTTER_DIR" ]]; then
    warn_echo "未找到目录：${MY_FLUTTER_DIR}，跳过 flutter pub get。"
    return 0
  fi

  if ! ask_any_to_run "是否在 my_flutter 执行 flutter pub get"; then
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

main() {
  show_readme_and_wait

  bold_echo "🚀 开始配置 Flutter 环境"
  info_echo "脚本路径：${SCRIPT_PATH}"
  info_echo "工程根目录：${ROOT_DIR}"
  info_echo "my_flutter：${MY_FLUTTER_DIR}"
  info_echo "日志文件：${LOG_FILE}"

  ensure_homebrew || return 1
  ensure_fvm || return 1
  ensure_flutter_stable || return 1
  precache_flutter_ios || return 1
  flutter_pub_get_in_my_flutter || return 1

  success_echo "Flutter 环境配置流程结束。"
}

main "$@"
