#!/bin/zsh

setopt NO_NOMATCH

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "$LOG_FILE"
PACKAGE_DIR="${SCRIPT_DIR}/JobsSPMDemoPackage"

# 同步输出终端与日志。
log() { echo -e "$1" | tee -a "$LOG_FILE"; }
info_echo() { log "\033[1;34mℹ $1\033[0m"; }
success_echo() { log "\033[1;32m✔ $1\033[0m"; }
warn_echo() { log "\033[1;33m⚠ $1\033[0m"; }
error_echo() { log "\033[1;31m✖ $1\033[0m"; }

# 解释当前脚本只预解析依赖，不再维护易丢失的同级源码副本。
show_script_intro_and_wait() {
  info_echo "本脚本通过 swift package resolve 下载 Package.swift 锁定的 swift-syntax 603.0.2。"
  warn_echo "不会删除目录，也不会手工 git clone；依赖由 SwiftPM 缓存统一管理。"
  info_echo "日志：${LOG_FILE}"
  if [[ "${JOBS_SKIP_README:-0}" != "1" && -t 0 ]]; then
    read -r "?👉 按回车开始解析；按 Ctrl+C 取消：" _
  fi
}

# 验证 Package 后交给 SwiftPM 解析官方依赖。
resolve_swift_syntax() {
  command -v swift >/dev/null 2>&1 || {
    error_echo "缺少 swift 命令。"
    return 1
  }
  [[ -f "$PACKAGE_DIR/Package.swift" ]] || {
    error_echo "缺少 ${PACKAGE_DIR}/Package.swift。"
    return 1
  }
  (cd "$PACKAGE_DIR" && swift package resolve) 2>&1 | tee -a "$LOG_FILE"
}

# 串联说明和依赖解析。
run_main_flow() {
  show_script_intro_and_wait
  resolve_swift_syntax || return 1
  success_echo "swift-syntax 已由 SwiftPM 解析完成。"
}

main() {
  # 主入口只委托安全的依赖解析流程。
  run_main_flow "$@"
}

main "$@"
