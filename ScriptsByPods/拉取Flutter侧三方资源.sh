#!/usr/bin/env bash
set +e

# ================================== 拉取Flutter侧三方资源 ==================================
# 目的：
# - 当 podhelper.rb 不存在时，尝试在同级目录下寻找 Flutter 工程（可能多个）
# - 高亮列出候选 Flutter 目录
# - 逐个执行 `flutter pub get` 以触发生成 `.ios/Flutter/podhelper.rb`
# - 全程 non-blocking：失败只打印日志，不影响 pod install 主流程

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

DEFAULT_FLUTTER_DIR="${ROOT_DIR}/my_flutter"
DEFAULT_PODHELPER="${DEFAULT_FLUTTER_DIR}/.ios/Flutter/podhelper.rb"

log()  { printf "%s\n" "$*"; }
hl()   { printf "\033[1;33m%s\033[0m\n" "$*"; }   # yellow bold
ok()   { printf "\033[1;32m%s\033[0m\n" "$*"; }   # green
warn() { printf "\033[1;31m%s\033[0m\n" "$*"; }   # red

log "[flutter_hook] Root: ${ROOT_DIR}"
log "[flutter_hook] Default: ${DEFAULT_FLUTTER_DIR}"
log "[flutter_hook] podhelper: ${DEFAULT_PODHELPER}"

if [[ -f "${DEFAULT_PODHELPER}" ]]; then
  ok "[flutter_hook] ✅ podhelper.rb already exists, skip."
  exit 0
fi

if ! command -v flutter >/dev/null 2>&1; then
  warn "[flutter_hook] ⚠️ flutter not found in PATH, skip (non-blocking)."
  exit 0
fi

# 1) 收集候选 Flutter 目录（优先 my_flutter，其次在 ROOT 下扫描）
candidates=()

if [[ -f "${DEFAULT_FLUTTER_DIR}/pubspec.yaml" ]]; then
  candidates+=("${DEFAULT_FLUTTER_DIR}")
fi

# 扫描 ROOT 下可能的 Flutter 工程
# - 含 pubspec.yaml
# - 排除 Pods/Unity/.git 等目录
while IFS= read -r -d '' f; do
  d="$(dirname "$f")"
  case "$d" in
    */Pods|*/Pods/*|*/.git|*/.git/*|*/Unity|*/Unity/*) continue ;;
  esac
  # 只取目录本身（pubspec.yaml 的所在目录）
  candidates+=("$d")
done < <(find "${ROOT_DIR}" -maxdepth 4 -name pubspec.yaml -print0 2>/dev/null)

# 去重
uniq=()
seen=""
for d in "${candidates[@]}"; do
  [[ -d "$d" ]] || continue
  if [[ "$seen" == *"|$d|"* ]]; then
    continue
  fi
  seen="${seen}|$d|"
  uniq+=("$d")
done
candidates=("${uniq[@]}")

log "[flutter_hook] Candidates:"
if [[ ${#candidates[@]} -eq 0 ]]; then
  warn "[flutter_hook] ⚠️ No Flutter projects found (non-blocking)."
  exit 0
fi
for d in "${candidates[@]}"; do
  hl "  ➤ ${d}"
done

# 2) 逐个 flutter pub get
for d in "${candidates[@]}"; do
  log "[flutter_hook] Run: (cd "${d}" && flutter pub get)"
  (cd "${d}" && flutter pub get)
  rc=$?

  if [[ $rc -ne 0 ]]; then
    warn "[flutter_hook] ⚠️ flutter pub get failed for: ${d} (code=${rc})"
    continue
  fi

  # 如果默认目录的 podhelper 出现，直接成功
  if [[ -f "${DEFAULT_PODHELPER}" ]]; then
    ok "[flutter_hook] ✅ Generated: ${DEFAULT_PODHELPER}"
    exit 0
  fi

  # 如果当前候选目录生成了 podhelper，也提示（但不强行复制/覆盖）
  if [[ -f "${d}/.ios/Flutter/podhelper.rb" ]]; then
    ok "[flutter_hook] ✅ Generated in candidate: ${d}/.ios/Flutter/podhelper.rb"
    log "[flutter_hook] ℹ️  Note: Podfile uses my_flutter; if this is the real module, make sure my_flutter points to it."
  fi
done

warn "[flutter_hook] ⚠️ Still missing podhelper.rb after attempts (non-blocking)."
exit 0
