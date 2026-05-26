#!/usr/bin/env bash
set -u

LABEL="[CodeGraph]"

log() {
  printf '%s %s\n' "$LABEL" "$*"
}

fail() {
  printf '%s ❌ %s\n' "$LABEL" "$*" >&2
  exit 1
}

lowercase() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]'
}

add_path_if_exists() {
  local dir="$1"
  if [ -d "$dir" ]; then
    case ":$PATH:" in
      *":$dir:"*) ;;
      *) export PATH="$dir:$PATH" ;;
    esac
  fi
}

resolve_project_root() {
  local script_dir
  script_dir="$(cd "$(dirname "$0")" && pwd)" || return 1
  cd "$script_dir/../.." && pwd
}

should_run() {
  if [ "${CODEGRAPH_AUTO_INIT:-}" = "1" ]; then
    return 0
  fi

  if [ ! -t 0 ]; then
    log "当前不是交互式终端，跳过 CodeGraph 生成。需要强制执行可设置 CODEGRAPH_AUTO_INIT=1。"
    return 1
  fi

  printf '\n%s pod install 已完成。按回车自检/安装/升级 CodeGraph 并执行 codegraph init -i；输入 n 跳过：' "$LABEL"
  local answer
  IFS= read -r answer || answer="n"
  answer="$(lowercase "${answer:-}")"

  case "$answer" in
    n|no|q|quit|s|skip|跳过)
      log "已跳过 CodeGraph 生成。"
      return 1
      ;;
    *)
      return 0
      ;;
  esac
}

find_brew() {
  if command -v brew >/dev/null 2>&1; then
    BREW_BIN="$(command -v brew)"
    return 0
  fi

  if [ -x /opt/homebrew/bin/brew ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
    return 0
  fi

  if [ -x /usr/local/bin/brew ]; then
    BREW_BIN="/usr/local/bin/brew"
    return 0
  fi

  return 1
}

load_brew_shellenv() {
  if [ -n "${BREW_BIN:-}" ]; then
    eval "$("$BREW_BIN" shellenv)"
  fi
}

ensure_brew() {
  add_path_if_exists /opt/homebrew/bin
  add_path_if_exists /usr/local/bin

  if find_brew; then
    load_brew_shellenv
    log "Homebrew 已就绪：$(brew --version | head -n 1)"
    return 0
  fi

  if [ "$(uname -s)" != "Darwin" ]; then
    fail "未检测到 Homebrew，且当前不是 macOS，无法自动安装。"
  fi

  command -v curl >/dev/null 2>&1 || fail "未检测到 curl，无法安装 Homebrew。"

  log "未检测到 Homebrew，开始安装 Homebrew。"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || fail "Homebrew 安装失败。"

  find_brew || fail "Homebrew 安装后仍不可用，请检查 PATH。"
  load_brew_shellenv
  log "Homebrew 安装完成：$(brew --version | head -n 1)"
}

ensure_npm() {
  add_path_if_exists /opt/homebrew/bin
  add_path_if_exists /usr/local/bin

  if command -v npm >/dev/null 2>&1; then
    log "npm 已就绪：$(npm --version)"
    return 0
  fi

  log "未检测到 npm，使用 Homebrew 安装 node。"
  brew install node || fail "通过 Homebrew 安装 node/npm 失败。"
  hash -r 2>/dev/null || true

  add_path_if_exists "$(brew --prefix 2>/dev/null)/bin"

  command -v npm >/dev/null 2>&1 || fail "node 安装后仍未检测到 npm，请检查 PATH。"
  log "npm 安装完成：$(npm --version)"
}

ensure_codegraph() {
  local npm_global_bin
  npm_global_bin="$(npm prefix -g 2>/dev/null)/bin"
  add_path_if_exists "$npm_global_bin"

  if command -v codegraph >/dev/null 2>&1; then
    log "CodeGraph 已安装：$(codegraph --version 2>/dev/null || printf 'version unknown')"
    log "开始使用 npm 升级 CodeGraph：npm i -g @colbymchenry/codegraph"
  else
    log "未检测到 CodeGraph，开始安装：npm i -g @colbymchenry/codegraph"
  fi

  npm i -g @colbymchenry/codegraph || fail "CodeGraph 安装/升级失败。"
  hash -r 2>/dev/null || true

  npm_global_bin="$(npm prefix -g 2>/dev/null)/bin"
  add_path_if_exists "$npm_global_bin"

  command -v codegraph >/dev/null 2>&1 || fail "CodeGraph 安装后仍不可用，请检查 npm global bin：$npm_global_bin"
  log "CodeGraph 已就绪：$(codegraph --version 2>/dev/null || printf 'version unknown')"
}

main() {
  local project_root
  project_root="$(resolve_project_root)" || fail "无法定位工程根目录。"
  cd "$project_root" || fail "无法进入工程根目录：$project_root"

  should_run || exit 0

  log "工程根目录：$project_root"
  ensure_brew
  ensure_npm
  ensure_codegraph

  log "执行：codegraph init -i"
  codegraph init -i || fail "codegraph init -i 执行失败。"
  log "✅ CodeGraph 生成完成。"
}

main "$@"
