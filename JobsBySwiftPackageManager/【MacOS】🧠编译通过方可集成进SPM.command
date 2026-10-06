#!/bin/zsh
# 脚本自述：
# - 脚本名称：【MacOS】🧠编译通过方可集成进SPM.command
# - 核心用途：递归验证 Jobs Swift Package，并按产品能力运行演示 Client。
# - 影响范围：更新 SwiftPM 构建缓存；只有显式设置 DO_RESET=1 才重置缓存。
# - 运行提示：运行后先展示内置自述；按回车继续，按 Ctrl+C 取消。

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
setopt NO_NOMATCH

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "$LOG_FILE"

DO_RESET="${DO_RESET:-0}"
RUN_CLIENT="${RUN_CLIENT:-1}"

# 同步输出终端与日志，方便定位 SwiftPM 解析和编译失败。
log() { echo -e "$1" | tee -a "$LOG_FILE"; }
info_echo() { log "\033[1;34mℹ $1\033[0m"; }
success_echo() { log "\033[1;32m✔ $1\033[0m"; }
warn_echo() { log "\033[1;33m⚠ $1\033[0m"; }
error_echo() { log "\033[1;31m✖ $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }

# 展示脚本职责；Podfile 等非交互入口可用 JOBS_SKIP_README=1 跳过等待。
show_script_intro_and_wait() {
  highlight_echo "============================== SPM 编译门禁 ==============================" | jobs_intro_style title
  info_echo "用途：依次执行 package resolve、build、test，并运行演示 Client。" | jobs_intro_style body
  info_echo "范围：${SCRIPT_DIR} 下的本地 Package，包括嵌套的独立 Macro Demo。" | jobs_intro_style body
  warn_echo "默认不执行 swift package reset；如需清缓存，请显式设置 DO_RESET=1。" | jobs_intro_style body
  info_echo "日志：${LOG_FILE}" | jobs_intro_style body
  highlight_echo "============================================================================" | jobs_intro_style title

  if [[ "${JOBS_SKIP_README:-0}" != "1" && -t 0 ]]; then
    read -r "?👉 已了解执行内容，按回车继续；按 Ctrl+C 取消：" _
  else
    info_echo "当前为非交互模式，已跳过回车等待。" | jobs_intro_style body
  fi
}

# 确认 Swift 工具链和目录均可用。
check_environment() {
  command -v swift >/dev/null 2>&1 || {
    error_echo "缺少 swift 命令，请先安装完整 Xcode。"
    return 1
  }
  success_echo "$(swift --version | head -n 1)"
}

# 输出所有直接子目录中的本地 Swift Package。
discover_packages() {
  find "$SCRIPT_DIR" -mindepth 2 -maxdepth 4 -name Package.swift \
    -not -path "*/.build/*" -print \
    | while IFS= read -r package_file; do dirname "$package_file"; done \
    | sort -u
}

# 判断当前 Package 是否公开演示 Client 产品。
package_has_demo_client() {
  local package_dir="$1"
  (cd "$package_dir" && swift package dump-package) 2>/dev/null \
    | grep -Fq '"name" : "JobsSPMDemoClient"'
}

# 对单个 Package 执行完整、可重复的构建验证。
validate_package() {
  local package_dir="$1"
  info_echo "开始验证：${package_dir}"

  if [[ "$DO_RESET" == "1" ]]; then
    warn_echo "显式执行 swift package reset：${package_dir}"
    (cd "$package_dir" && swift package reset) 2>&1 | tee -a "$LOG_FILE" || return 1
  fi

  (cd "$package_dir" && swift package resolve) 2>&1 | tee -a "$LOG_FILE" || return 1
  (cd "$package_dir" && swift build) 2>&1 | tee -a "$LOG_FILE" || return 1
  (cd "$package_dir" && swift test) 2>&1 | tee -a "$LOG_FILE" || return 1

  if [[ "$RUN_CLIENT" == "1" ]] && package_has_demo_client "$package_dir"; then
    (cd "$package_dir" && swift run JobsSPMDemoClient) 2>&1 | tee -a "$LOG_FILE" || return 1
  fi
  success_echo "验证通过：${package_dir}"
}

# 串联发现与验证，任一 Package 失败即以非零状态结束。
run_main_flow() {
  show_script_intro_and_wait
  check_environment || return 1

  local packages
  packages="$(discover_packages)"
  if [[ -z "$packages" ]]; then
    error_echo "未找到 Package.swift。"
    return 1
  fi

  local failed=0
  while IFS= read -r package_dir; do
    [[ -n "$package_dir" ]] || continue
    validate_package "$package_dir" || failed=1
  done <<< "$packages"

  if [[ "$failed" == "1" ]]; then
    error_echo "存在验证失败的 Package，请查看 ${LOG_FILE}。"
    return 1
  fi
  success_echo "全部 Swift Package 验证通过。"
}

main() {
  run_main_flow "$@" # 发现并验证基础库 Package 与独立 Macro Demo。
}

main "$@"
