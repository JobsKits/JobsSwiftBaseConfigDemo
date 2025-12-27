#!/usr/bin/env bash
set +e

# ================================== 解压Unity大资源 ==================================
# 目的：
# - 在 pod install 时尝试执行 Unity 导出工程提供的“合而为一”脚本
# - non-blocking：失败只提示，不影响 pod install

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

UNITY_ROOT="${ROOT_DIR}/Unity"
TARGET_REL="xcode_effectTest/Libraries/【MacOS】🧩子卷➤合而为一源文件"
TARGET_PATH="${UNITY_ROOT}/${TARGET_REL}"

log()  { printf "%s\n" "$*"; }
ok()   { printf "\033[1;32m%s\033[0m\n" "$*"; }
warn() { printf "\033[1;31m%s\033[0m\n" "$*"; }

log "[unity_unpack] Unity root: ${UNITY_ROOT}"
log "[unity_unpack] Target: ${TARGET_PATH}"

if [[ ! -e "${TARGET_PATH}" ]]; then
  log "[unity_unpack] ℹ️  Not found, skip."
  exit 0
fi

# 直接执行文件；如果不可执行则用 bash 执行
if [[ -x "${TARGET_PATH}" ]]; then
  "${TARGET_PATH}"
  rc=$?
else
  /usr/bin/env bash "${TARGET_PATH}"
  rc=$?
fi

if [[ $rc -ne 0 ]]; then
  warn "[unity_unpack] ⚠️ Failed with code ${rc} (non-blocking)."
  exit 0
fi

ok "[unity_unpack] ✅ Done."
exit 0
