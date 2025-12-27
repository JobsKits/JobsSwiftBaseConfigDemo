#!/usr/bin/env bash
set +e

# ================================== 清理Unity缓存 ==================================
# 目的：
# - 解决 Unity Bee/Tundra/Il2cppBuildCache 等缓存导致的跨机器/路径编译失败问题
# - non-blocking：失败只提示，不影响 pod install

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
UNITY_DIR="${ROOT_DIR}/Unity"

log()  { printf "%s\n" "$*"; }
ok()   { printf "\033[1;32m%s\033[0m\n" "$*"; }
warn() { printf "\033[1;31m%s\033[0m\n" "$*"; }

log "[unity_cache] Root: ${ROOT_DIR}"
log "[unity_cache] Unity: ${UNITY_DIR}"

if [[ ! -d "${UNITY_DIR}" ]]; then
  log "[unity_cache] ℹ️  Unity folder not found, skip."
  exit 0
fi

targets=(
  "${UNITY_DIR}/Library/Il2cppBuildCache"
  "${UNITY_DIR}/Library/Bee"
  "${UNITY_DIR}/Library/BuildCache"
  "${UNITY_DIR}/Library/ScriptAssemblies"
)

deleted=0
for p in "${targets[@]}"; do
  if [[ -e "${p}" ]]; then
    log "[unity_cache] rm -rf "${p}""
    rm -rf "${p}"
    rc=$?
    if [[ $rc -eq 0 ]]; then
      deleted=$((deleted+1))
    else
      warn "[unity_cache] ⚠️ Failed to delete: ${p} (code=${rc})"
    fi
  fi
done

# 额外：Unity 工程可能嵌套（保险扫描一层）
while IFS= read -r -d '' d; do
  if [[ -d "${d}/Library/Il2cppBuildCache" ]]; then
    log "[unity_cache] rm -rf "${d}/Library/Il2cppBuildCache""
    rm -rf "${d}/Library/Il2cppBuildCache" || true
    deleted=$((deleted+1))
  fi
done < <(find "${UNITY_DIR}" -maxdepth 3 -type f -name "ProjectVersion.txt" -path "*/ProjectSettings/*" -print0 2>/dev/null | xargs -0 -I{} dirname "{}" | xargs -0 -I{} dirname "{}" -print0 2>/dev/null)

ok "[unity_cache] ✅ Done (deleted=${deleted})."
exit 0
