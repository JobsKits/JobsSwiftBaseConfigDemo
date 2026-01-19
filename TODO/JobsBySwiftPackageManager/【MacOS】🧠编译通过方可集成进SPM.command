#!/usr/bin/env bash
set -euo pipefail

# ============================== 工作目录修复（关键） ==============================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$SCRIPT_DIR"

# ============================== 配置 ==============================
CONTINUE_ON_FAIL="${CONTINUE_ON_FAIL:-1}" # 1=继续，0=立即退出
DO_RESET="${DO_RESET:-1}"                 # 1=执行 reset，0=跳过

# ============================== fzf 参数（数组，避免空格拆坏） ==============================
FZF_ARGS=(
  --multi
  --height=70%
  --layout=reverse
  --border
  --prompt="Select SPM packages > "
)

# ============================== 输出 ==============================
# 说明：本脚本仅允许“函数返回值”走 stdout，其它日志一律走 stderr，避免污染 fzf 选择结果。
info() { printf "ℹ️  %s\n" "$*" >&2; }
ok()   { printf "✅ %s\n" "$*" >&2; }
warn() { printf "⚠️  %s\n" "$*" >&2; }
err()  { printf "❌ %s\n" "$*" >&2; }
die()  { err "$*"; exit 1; }

need_cmd() { command -v "$1" >/dev/null 2>&1 || die "缺少命令：$1"; }

# ============================== 环境自检 ==============================
check_environment() {
  need_cmd swift
  info "当前工作目录：$(pwd -P)"
  ok "swift: $(swift --version | head -n 1)"
}

check_fzf_if_needed() {
  need_cmd fzf
  ok "fzf:  $(fzf --version 2>/dev/null | head -n 1 || echo unknown)"
}

# ============================== SPM 自检 ==============================
check_pkg_dir_basic() {
  local dir="$1"

  [[ -d "$dir" ]] || { err "目录不存在：$dir"; return 1; }
  [[ -f "$dir/Package.swift" ]] || { err "缺少 Package.swift：$dir"; return 1; }

  local first_line
  first_line="$(head -n 1 "$dir/Package.swift" || true)"
  [[ "$first_line" =~ ^//\ swift-tools-version:\  ]] || {
    err "Package.swift 第1行缺少 swift-tools-version：$dir/Package.swift"
    return 1
  }

  if [[ -d "$dir/Sources/Tests" ]]; then
    err "发现 $dir/Sources/Tests（测试目录放错位置，会导致 overlapping sources）"
    return 1
  fi

  if grep -q '\.testTarget' "$dir/Package.swift"; then
    if [[ ! -d "$dir/Tests" ]] || ! find "$dir/Tests" -type f -name "*.swift" -maxdepth 4 | grep -q .; then
      warn "[$dir] 检测到 testTarget，但 Tests 目录可能不完整：$dir/Tests"
    fi
  fi

  return 0
}

check_local_swift_syntax_path_if_used() {
  local dir="$1"
  local pkg="$dir/Package.swift"

  # 1) 抓取所有 `.package(path: "...")` 行（允许有空格/缩进/注释）
  local lines
  lines="$(grep -nE '\.package\s*\(\s*path\s*:\s*".*"\s*\)' "$pkg" || true)"
  [[ -n "$lines" ]] || return 0

  # 2) 在这些行里找包含 swift-syntax 的那一行（避免匹配到其它本地包）
  local hit
  hit="$(printf "%s\n" "$lines" | grep -i 'swift-syntax' | head -n 1 || true)"
  [[ -n "$hit" ]] || return 0

  local lineno line path abs
  lineno="${hit%%:*}"
  line="${hit#*:}"

  # 3) 从该行提取 path 字符串，并 trim + 去掉 CR
  path="$(printf "%s" "$line" \
    | sed -E 's/.*path[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/' \
    | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//; s/\r$//')"

  # 4) 强力调试输出：把不可见字符都显示出来
  warn "[$dir] swift-syntax line@${lineno}=<$(printf "%s" "$line" | cat -A)>"
  warn "[$dir] swift-syntax path=<'$(printf "%s" "$path" | cat -A)'>"

  [[ -n "$path" ]] || { err "[$dir] 解析 swift-syntax path 失败"; return 1; }

  # 5) 计算绝对路径：必须相对于包目录 dir
  abs="$(cd "$dir" && cd "$path" 2>/dev/null && pwd -P || true)"
  warn "[$dir] swift-syntax abs=<'$(printf "%s" "$abs" | cat -A)'>"

  # 6) 判断是否为有效 SwiftPM 包
  [[ -n "$abs" && -f "$abs/Package.swift" ]] || {
    err "[$dir] 本地 swift-syntax 路径无效：$path"
    # 额外提示：列出 dir 上一级目录，帮助你确认实际存在什么
    warn "[$dir] 上级目录内容：$(ls -1 "$dir/.." 2>/dev/null | tr '\n' ' ' | sed 's/[[:space:]]\+/ /g')"
    return 1
  }

  ok "[$dir] 本地 swift-syntax OK：$path"
  return 0
}


# ============================== 发现 SPM 包 ==============================
discover_packages() {
  local list
  list="$(find . -mindepth 2 -maxdepth 2 -name Package.swift -print 2>/dev/null \
    | sed 's|^\./||' \
    | xargs -I {} dirname "{}" \
    | sort -u)"

  [[ -n "$list" ]] || die "当前目录下没有发现任何 SPM 包（子目录/Package.swift）。请确认脚本与这些包在同一级目录。"
  printf "%s\n" "$list"
}

# ============================== 选择（>=2 才用 fzf；增加“全选”；=1 直接跑） ==============================
fzf_select_packages() {
  local all="$1"
  local count
  count="$(printf "%s\n" "$all" | sed '/^$/d' | wc -l | tr -d ' ')"

  # 0 个：兜底
  if [[ "$count" -le 0 ]]; then
    return 1
  fi

  # 1 个：不走 fzf，直接返回
  if [[ "$count" -eq 1 ]]; then
    printf "%s\n" "$all"
    return 0
  fi

  # >=2：才需要 fzf
  check_fzf_if_needed

  local binds_base="ctrl-a:select-all,ctrl-d:deselect-all"
  local header_base="TAB: toggle, ENTER: run | Ctrl+A: select all, Ctrl+D: clear"

  local all_tag="__ALL__"
  local all_item="✅ 全选"

  local picked
  picked="$(
    {
      printf "%s\t%s\n" "$all_tag" "$all_item"
      while IFS= read -r d; do
        [[ -n "$d" ]] || continue
        printf "%s\t%s\n" "$d" "$d"
      done <<< "$all"
    } | fzf "${FZF_ARGS[@]}" \
      --with-nth=2.. \
      --delimiter=$'\t' \
      --bind "$binds_base" \
      --header "$header_base | 选择「全选」= 选中所有包"
  )" || return 1

  # 选了“全选”：直接返回全部（忽略其它选择）
  if printf "%s\n" "$picked" | awk -F'\t' '{print $1}' | grep -qx "$all_tag"; then
    printf "%s\n" "$all"
    return 0
  fi

  # 返回用户选中的包
  printf "%s\n" "$picked" | awk -F'\t' '{print $1}'
}

# ============================== 执行 ==============================
run_for_one() {
  local dir="$1"
  info "▶︎ [$dir] start"

  if ! check_pkg_dir_basic "$dir"; then
    err "[$dir] 自检失败：跳过"
    return 2
  fi

  if ! check_local_swift_syntax_path_if_used "$dir"; then
    err "[$dir] swift-syntax 自检失败：跳过"
    return 2
  fi

  pushd "$dir" >/dev/null

  if [[ "$DO_RESET" == "1" ]]; then
    info "[$dir] swift package reset"
    swift package reset
  else
    warn "[$dir] 跳过 reset（DO_RESET=0）"
  fi

  info "[$dir] swift package resolve"
  swift package resolve

  info "[$dir] swift build"
  swift build

  popd >/dev/null
  ok "✔︎ [$dir] done"
  return 0
}

main() {
  check_environment

  local all selected
  all="$(discover_packages)"

  info "发现以下 SPM 包："
  while IFS= read -r d; do [[ -n "$d" ]] && printf "  - %s\n" "$d"; done <<< "$all"

  selected="$(fzf_select_packages "$all" || true)"
  [[ -n "${selected:-}" ]] || die "未选择任何包，已退出"

  info "将执行以下包："
  while IFS= read -r d; do [[ -n "$d" ]] && printf "  - %s\n" "$d"; done <<< "$selected"

  local failed=0
  while IFS= read -r dir; do
    [[ -n "$dir" ]] || continue
    if ! run_for_one "$dir"; then
      failed=1
      if [[ "$CONTINUE_ON_FAIL" != "1" ]]; then
        die "遇到失败并退出（CONTINUE_ON_FAIL=0）"
      fi
    fi
  done <<< "$selected"

  if [[ "$failed" == "1" ]]; then
    err "完成：存在失败/跳过的包（见上方日志）"
    exit 1
  fi

  ok "全部完成"
}

main "$@"
