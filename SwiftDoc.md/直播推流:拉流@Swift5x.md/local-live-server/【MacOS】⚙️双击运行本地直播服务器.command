#!/usr/bin/env bash
# NodeMediaServer 本地推流服务器一键启动脚本

# 不开 set -u，避免 .command 场景因为未定义变量直接挂掉
# 仅渲染自述：标题红色加粗，编号正文蓝色常规字重；非彩色终端输出纯文本。
jobs_intro_style() {
  local intro_color=0
  if [ -t 1 ] && [ -n "${TERM:-}" ] && [ "${TERM:-}" != dumb ] &&
     [ -z "${NO_COLOR+x}" ] && [ "${PLAIN_OUTPUT:-0}" != 1 ] &&
     [ "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]; then
    intro_color=1
  fi
  /usr/bin/awk -v color="$intro_color" -v role="${1:-body}" '
    BEGIN { esc = sprintf("%c", 27) }
    {
      gsub(esc "\\[[0-9;]*m", "")
      gsub(/\\(033|e|x1[bB])\[[0-9;]*m/, "")
      if (!color || $0 ~ /^[[:space:]]*$/) { print; next }
      numbered = ($0 ~ /^[[:space:]➤ℹ🔹✔⚠]*([0-9]+[、.)）]|[0-9]+️⃣|[-•])/)
      heading = ($0 ~ /^[[:space:]]*#{1,6}[[:space:]]/ || $0 ~ /[：:][[:space:]]*$/ || $0 ~ /^[[:space:]]*[=━─-]{3}/)
      title = (!numbered && (role == "title" || heading))
      if (role == "auto" && !seen && !numbered) title = 1
      if ($0 !~ /^[[:space:]]*[=━─-]+[[:space:]]*$/) seen = 1
      printf "%s%s%s\n", esc (title ? "[1;31m" : "[0;34m"), $0, esc "[0m"
    }
  '
}
set -eo pipefail

# ================================== 日志与基础变量 ==================================
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
# 用 $0 计算脚本所在目录，兼容双击 .command
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

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

# ================================== 自述信息 ==================================
print_intro() {
    clear
    echo "" | jobs_intro_style body
    info_echo "🎥 本脚本用于在当前目录启动本地 NodeMediaServer（HaishinKit 本机推流用）" | jobs_intro_style body
    echo "👉 流程概览：" | jobs_intro_style title
    echo "1️⃣ 自检 Homebrew / Node / npm 环境，必要时自动安装" | jobs_intro_style body
    echo "2️⃣ 在当前目录安装 node-media-server@2.3.8（如未安装）" | jobs_intro_style body
    echo "3️⃣ 检查是否已有 node server.js 在运行，有就先安全杀掉" | jobs_intro_style body
    echo "4️⃣ 使用 node server.js 启动本地推流服务器（日志同步写入 ${LOG_FILE})" | jobs_intro_style body
    echo "=======================================" | jobs_intro_style title
    read -r -p "📎 确认在『local-live-server』目录中运行，按回车继续..." _
}

# ================================== Homebrew 相关 ==================================
inject_shellenv_block() {
    local profile_file="$1"
    local shellenv="$2"
    local header="# >>> brew shellenv (auto) >>>"

    if [[ -z "$profile_file" || -z "$shellenv" ]]; then
        error_echo "❌ 缺少参数：inject_shellenv_block <profile_file> <shellenv>"
        return 1
    fi

    touch "$profile_file" 2>/dev/null || {
        error_echo "❌ 无法写入配置文件：$profile_file"
        return 1
    }

    if grep -Fq "$shellenv" "$profile_file" 2>/dev/null; then
        info_echo "📌 配置文件中已存在 brew shellenv：$profile_file"
    else
        {
            echo ""
            echo "$header"
            echo "$shellenv"
        } >> "$profile_file"
        success_echo "✅ 已写入 brew shellenv 到：$profile_file"
    fi

    eval "$shellenv"
    success_echo "🟢 Homebrew 环境已在当前终端生效"
}

get_cpu_arch() {
    [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

install_homebrew() {
    local arch shell_path profile_file brew_bin shellenv_cmd
    arch="$(get_cpu_arch)"
    shell_path="${SHELL##*/}"

    # 还没装 brew：直接自动安装
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

        shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

        case "$shell_path" in
            zsh)  profile_file="$HOME/.zprofile" ;;
            bash) profile_file="$HOME/.bash_profile" ;;
            *)    profile_file="$HOME/.profile" ;;
        esac

        inject_shellenv_block "$profile_file" "$shellenv_cmd"
        return
    fi

    # 已经有 brew：让你选择要不要 update
    info_echo "🍺 已检测到 Homebrew：$(brew -v | head -n 1)"
    read -r -p "↪ 按回车跳过 brew update，输入任意字符后回车执行 brew update：" choice

    if [[ -z "$choice" ]]; then
        info_echo "⏭ 已跳过 brew update"
        return
    fi

    info_echo "🔄 正在执行 brew update..."
    if brew update >>"$LOG_FILE" 2>&1; then
        success_echo "✅ Homebrew 已更新"
    else
        warn_echo "⚠️ brew update 过程中出现问题，请稍后自行检查 ${LOG_FILE}"
    fi
}

# ================================== Node / npm / NMS 环境 ==================================
ensure_node_and_npm() {
    if command -v node &>/dev/null && command -v npm &>/dev/null; then
        info_echo "🧪 Node.js / npm 已安装："
        gray_echo "  - node: $(node -v)"
        gray_echo "  - npm : $(npm -v)"
        return 0
    fi

    warn_echo "🧩 未检测到 node 或 npm，准备通过 Homebrew 安装 Node.js..."
    install_homebrew

    if ! command -v brew &>/dev/null; then
        error_echo "❌ brew 仍然不可用，无法安装 Node.js"
        exit 1
    fi

    info_echo "📦 正在安装 Node.js（brew install node）..."
    if brew install node >>"$LOG_FILE" 2>&1; then
        success_echo "✅ Node.js 安装完成"
        gray_echo "  - node: $(node -v)"
        gray_echo "  - npm : $(npm -v)"
    else
        error_echo "❌ Node.js 安装失败，请检查 ${LOG_FILE}"
        exit 1
    fi
}

ensure_node_media_server() {
    cd "$SCRIPT_DIR"

    if [[ ! -f package.json ]]; then
        note_echo "📄 当前目录缺少 package.json，自动初始化 npm 项目（npm init -y）..."
        if npm init -y >>"$LOG_FILE" 2>&1; then
            success_echo "✅ 已生成 package.json"
        else
            error_echo "❌ npm init 失败，请检查 ${LOG_FILE}"
            exit 1
        fi
    fi

    info_echo "🧪 检查 node-media-server@2.3.8 是否已安装..."
    if npm list node-media-server@2.3.8 --depth=0 >/dev/null 2>&1; then
        success_echo "✅ 已检测到 node-media-server@2.3.8"
    else
        info_echo "📦 安装 node-media-server@2.3.8（npm install node-media-server@2.3.8）..."
        if npm install node-media-server@2.3.8 >>"$LOG_FILE" 2>&1; then
            success_echo "✅ node-media-server@2.3.8 安装完成"
        else
            error_echo "❌ 安装 node-media-server@2.3.8 失败，请检查 ${LOG_FILE}"
            exit 1
        fi
    fi
}

# ================================== ffmpeg 自检 & 安装 ==================================
ensure_ffmpeg() {
    if command -v ffmpeg &>/dev/null; then
        info_echo "🧪 已检测到 ffmpeg："
        gray_echo "  - $(ffmpeg -version | head -n 1)"
        return 0
    fi

    warn_echo "🧩 未检测到 ffmpeg，准备通过 Homebrew 安装 ffmpeg..."

    # 确认 brew 已存在，不存在就先装 brew
    if ! command -v brew &>/dev/null; then
        warn_echo "⚠️ 当前系统未检测到 Homebrew，先尝试安装 Homebrew..."
        install_homebrew
    fi

    # 再次确认 brew 存在，才能执行 brew install ffmpeg
    if ! command -v brew &>/dev/null; then
        error_echo "❌ Homebrew 仍不可用，无法安装 ffmpeg，请手动检查环境"
        exit 1
    fi

    info_echo "📦 正在安装 ffmpeg（brew install ffmpeg）..."
    if brew install ffmpeg >>"$LOG_FILE" 2>&1; then
        success_echo "✅ ffmpeg 安装完成"
        gray_echo "  - $(ffmpeg -version | head -n 1)"
    else
        error_echo "❌ ffmpeg 安装失败，请检查 ${LOG_FILE}"
        exit 1
    fi
}

# ================================== 进程管理 & 启动服务器 ==================================
kill_existing_server() {
    cd "$SCRIPT_DIR"
    info_echo "🧪 检查是否已有 node server.js 正在运行..."

    if pgrep -f "node server.js" >/dev/null 2>&1; then
        warn_echo "🛑 检测到已有 node server.js 进程，正在尝试结束..."
        if pkill -f "node server.js"; then
            success_echo "✅ 旧的 node server.js 进程已结束"
        else
            warn_echo "⚠️ pkill -f \"node server.js\" 执行失败，尝试 pkill -f server.js..."
            if pkill -f "server.js"; then
                success_echo "✅ 旧的 server.js 进程已结束"
            else
                error_echo "❌ 无法结束已有 server.js 进程，请手动检查"
                exit 1
            fi
        fi
    else
        info_echo "✅ 未检测到 server.js 运行中进程，跳过停止步骤"
    fi
}

start_node_server() {
    cd "$SCRIPT_DIR"
    note_echo "🚀 即将启动 node server.js（工作目录：$SCRIPT_DIR）"
    note_echo "📜 所有输出会同时写入终端与日志：${LOG_FILE}"
    echo ""
    node server.js | tee -a "$LOG_FILE"
}

# ================================== 主流程 ==================================
main() {
    print_intro
    install_homebrew          # 确保 brew 存在 & 可选 update
    ensure_node_and_npm       # 确保 node / npm
    ensure_ffmpeg             # 在确认 brew 已存在的基础上安装 ffmpeg（如缺失）
    ensure_node_media_server  # 确保 node-media-server@2.3.8
    kill_existing_server      # 停掉旧 server.js
    start_node_server         # 启动新 server.js
}

main "$@"
