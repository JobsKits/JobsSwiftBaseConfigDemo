#!/bin/bash
set -euo pipefail

# ================================== 基础：路径 / 日志 ==================================
SCRIPT_PATH="$0"
# 兼容双击与软链接
if command -v python3 >/dev/null 2>&1; then
  SCRIPT_PATH="$(python3 - <<'PY'
import os,sys
p=sys.argv[1]
print(os.path.realpath(p))
PY
"$SCRIPT_PATH")"
else
  # fallback：尽量 realpath
  SCRIPT_PATH="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)/$(basename "$SCRIPT_PATH")"
fi

SCRIPT_BASENAME="$(basename "$SCRIPT_PATH")"
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"

LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "$LOG_FILE"

log() { printf '%s %s\n' "$(date '+%F %T')" "$*" >> "$LOG_FILE"; }

color_echo() { printf '%b\n' "$*"; }
info_echo() { color_echo "ℹ️  $*"; log "INFO $*"; }
success_echo() { color_echo "✅ $*"; log "OK $*"; }
warn_echo() { color_echo "⚠️  $*"; log "WARN $*"; }
error_echo() { color_echo "❌ $*"; log "ERR $*"; }

open_log() {
  # 失败时保留“自动打开日志”的传统
  if command -v open >/dev/null 2>&1; then
    open "$LOG_FILE" >/dev/null 2>&1 || true
  fi
}

die() {
  error_echo "$*"
  info_echo "看日志：$LOG_FILE"
  open_log
  exit 1
}

trap 'rc=$?; if [ $rc -ne 0 ]; then log "TRAP_ERR exit_code=$rc line=$LINENO cmd=$BASH_COMMAND"; open_log; fi' EXIT

# ================================== UI ==================================
banner() {
  cat <<'EOF'
📦==================================================
                iOS IPA 打包助手
==================================================
• 多 Scheme：用 fzf 选择要打的 Scheme（自动过滤 Pods/Tests/Flutter Assemble）
• 自动主工程 Scheme：优先用“与工程同名”的 Scheme，其次按常见主工程规则自动挑选
• 工程定位：优先脚本所在目录；自动避开 Flutter Runner 壳工程
• 强制真机：xcodebuild -destination generic/platform=iOS
• 优先从 Build Settings 精确定位 .app；失败则自动从 DerivedData 回退匹配
• 编译生成 .app 后，组装并导出为 .ipa 到指定目录（默认桌面）
• 失败时自动 open 日志
• 支持交互确认模式（--confirm）
==================================================
EOF
}

# ================================== 参数 ==================================
CONFIRM=0
CONFIG="Release"
OUT_DIR="${HOME}/Desktop"
ALLOW_UPDATES=0
DERIVED_DATA="${HOME}/Library/Developer/Xcode/DerivedData/JobsIpaBuild"

while [ $# -gt 0 ]; do
  case "$1" in
    --confirm) CONFIRM=1; shift ;;
    --debug) CONFIG="Debug"; shift ;;
    --release) CONFIG="Release"; shift ;;
    --out) OUT_DIR="$2"; shift 2 ;;
    --allow-updates) ALLOW_UPDATES=1; shift ;;
    --derived-data) DERIVED_DATA="$2"; shift 2 ;;
    *)
      warn_echo "未知参数：$1（忽略）"
      shift
      ;;
  esac
done

# ================================== 工程定位（核心修复：只看脚本目录） ==================================
cd "$SCRIPT_DIR"
info_echo "📂 工作目录：$SCRIPT_DIR"
log "SCRIPT_DIR=$SCRIPT_DIR"
log "PWD=$PWD"
log "CONFIG=$CONFIG"
log "OUT_DIR=$OUT_DIR"
log "DERIVED_DATA=$DERIVED_DATA"

is_flutter_shell_workspace() {
  # 排除 Flutter Runner 壳工程（iOS / macOS）
  # 例：.../my_flutter/ios/Runner.xcworkspace 或 .../macos/Runner.xcworkspace
  case "$1" in
    *"/ios/Runner.xcworkspace"*) return 0 ;;
    *"/macos/Runner.xcworkspace"*) return 0 ;;
    *"/windows/"*) return 0 ;;
    *"/linux/"*) return 0 ;;
    *) return 1 ;;
  esac
}

find_best_project() {
  # 优先：当前目录下的 *.xcworkspace（排除 Flutter Runner 壳工程）
  # 其次：*.xcodeproj
  # 评分：路径越短越优先；排除明显不对的
  local best="" best_kind="" best_score=999999

  # 1) workspace
  while IFS= read -r p; do
    [ -z "$p" ] && continue
    # 过滤
    case "$p" in
      *"/Pods/"*|*"/Carthage/"*|*".bundle/"*) continue ;;
    esac
    if is_flutter_shell_workspace "$p"; then
      continue
    fi

    # score = depth（越小越好）
    local depth
    depth="$(echo "$p" | awk -F/ '{print NF}')"
    if [ "$depth" -lt "$best_score" ]; then
      best="$p"
      best_kind="workspace"
      best_score="$depth"
    fi
  done < <(find "$SCRIPT_DIR" -maxdepth 4 -name "*.xcworkspace" -print 2>/dev/null | sort)

  if [ -n "$best" ]; then
    printf '%s|%s\n' "$best_kind" "$best"
    return 0
  fi

  # 2) xcodeproj
  while IFS= read -r p; do
    [ -z "$p" ] && continue
    case "$p" in
      *"/Pods/"*|*"/Carthage/"*|*".bundle/"*) continue ;;
    esac
    local depth
    depth="$(echo "$p" | awk -F/ '{print NF}')"
    if [ "$depth" -lt "$best_score" ]; then
      best="$p"
      best_kind="project"
      best_score="$depth"
    fi
  done < <(find "$SCRIPT_DIR" -maxdepth 4 -name "*.xcodeproj" -print 2>/dev/null | sort)

  if [ -n "$best" ]; then
    printf '%s|%s\n' "$best_kind" "$best"
    return 0
  fi

  return 1
}

proj_info="$(find_best_project || true)"
[ -n "$proj_info" ] || die "未找到 .xcworkspace/.xcodeproj（请确认脚本放在工程目录内）"

PROJECT_KIND="${proj_info%%|*}"
PROJECT_PATH="${proj_info#*|}"
PROJECT_NAME="$(basename "$PROJECT_PATH")"
PROJECT_BASE="${PROJECT_NAME%.*}"

success_echo "发现工程：$PROJECT_NAME"
log "PROJECT_KIND=$PROJECT_KIND"
log "PROJECT_PATH=$PROJECT_PATH"

# ================================== Scheme 列表解析（严禁把彩色文字塞进变量） ==================================
xcodebuild_list() {
  if [ "$PROJECT_KIND" = "workspace" ]; then
    /usr/bin/xcodebuild -list -workspace "$PROJECT_PATH"
  else
    /usr/bin/xcodebuild -list -project "$PROJECT_PATH"
  fi
}

get_schemes() {
  # 输出纯 schemes（每行一个）
  local out rc
  out="$(xcodebuild_list 2>&1)" || rc=$?
  rc="${rc:-0}"
  log "XCODEBUILD_LIST_EXIT=$rc"
  log "XCODEBUILD_LIST_OUTPUT_BEGIN"
  log "$out"
  log "XCODEBUILD_LIST_OUTPUT_END"

  [ "$rc" -eq 0 ] || return 1

  echo "$out" | awk '
    BEGIN{in_s=0}
    /Schemes:/ {in_s=1; next}
    in_s==1 {
      if ($0 ~ /^[[:space:]]*$/) exit
      gsub(/^[[:space:]]+/, "", $0)
      print $0
    }
  '
}

raw_schemes="$(get_schemes || true)"
if [ -z "${raw_schemes:-}" ]; then
  die "未找到 Schemes（或 xcodebuild -list 失败）"
fi

# 过滤掉明显不是主工程 scheme 的项（但要留 fallback）
filter_scheme() {
  case "$1" in
    Pods-*|*-Tests|*Tests|*UITests|Flutter\ Assemble|AFNetworking|Alamofire|SnapKit|Flutter|FlutterPluginRegistrant)
      return 1 ;;
    *)
      return 0 ;;
  esac
}

SCHEMES_FILTERED=""
while IFS= read -r s; do
  [ -z "$s" ] && continue
  if filter_scheme "$s"; then
    SCHEMES_FILTERED="${SCHEMES_FILTERED}${s}"$'\n'
  fi
done <<< "$raw_schemes"

SCHEMES_TO_USE="$SCHEMES_FILTERED"
if [ -z "${SCHEMES_TO_USE//[$'\n\r\t ']}" ]; then
  # 过滤后为空：回退到全部
  SCHEMES_TO_USE="$raw_schemes"$'\n'
fi

# ================================== 自动主工程 Scheme（你要求的“优先同名”） ==================================
pick_default_scheme() {
  # 1) 完全同名：优先
  while IFS= read -r s; do
    [ -z "$s" ] && continue
    if [ "$s" = "$PROJECT_BASE" ]; then
      echo "$s"; return 0
    fi
  done <<< "$SCHEMES_TO_USE"

  # 2) 次优：包含同名（例如 xxx-Release 之类）
  while IFS= read -r s; do
    [ -z "$s" ] && continue
    case "$s" in
      *"$PROJECT_BASE"*) echo "$s"; return 0 ;;
    esac
  done <<< "$SCHEMES_TO_USE"

  # 3) 再次优：排除 Pods/Tests/Flutter Assemble 后的第一个
  while IFS= read -r s; do
    [ -z "$s" ] && continue
    echo "$s"; return 0
  done <<< "$SCHEMES_TO_USE"

  return 1
}

DEFAULT_SCHEME="$(pick_default_scheme || true)"
[ -n "$DEFAULT_SCHEME" ] || die "无法自动选择 scheme"

# 如果有 fzf，且候选多于 1，则给选择；否则直接用默认
choose_scheme() {
  local count
  count="$(printf "%s\n" "$SCHEMES_TO_USE" | awk 'NF{c++} END{print c+0}')"
  if command -v fzf >/dev/null 2>&1 && [ "$count" -gt 1 ]; then
    printf "%s\n" "$SCHEMES_TO_USE" | awk 'NF' | fzf --prompt="选择 scheme > " --height=40% --reverse --header="默认：$DEFAULT_SCHEME" || true
  else
    echo "$DEFAULT_SCHEME"
  fi
}

SCHEME="$(choose_scheme)"
[ -n "${SCHEME:-}" ] || SCHEME="$DEFAULT_SCHEME"

success_echo "选择 scheme：$SCHEME"
success_echo "输出目录：$OUT_DIR"
info_echo "🐛 DERIVED_DATA=$DERIVED_DATA"

log "SCHEME=$SCHEME"

# ================================== 编译（强制真机） ==================================
ALLOW_UPDATES_ARGS=()
if [ "$ALLOW_UPDATES" -eq 1 ]; then
  ALLOW_UPDATES_ARGS+=("-allowProvisioningUpdates")
fi

DESTINATION_ARGS=("-destination" "generic/platform=iOS")

build() {
  info_echo "开始编译：$SCHEME ($CONFIG)"
  if [ "$PROJECT_KIND" = "workspace" ]; then
    /usr/bin/xcodebuild \
      -workspace "$PROJECT_PATH" \
      -scheme "$SCHEME" \
      -configuration "$CONFIG" \
      -sdk iphoneos \
      "${DESTINATION_ARGS[@]}" \
      -derivedDataPath "$DERIVED_DATA" \
      "${ALLOW_UPDATES_ARGS[@]}" \
      build
  else
    /usr/bin/xcodebuild \
      -project "$PROJECT_PATH" \
      -scheme "$SCHEME" \
      -configuration "$CONFIG" \
      -sdk iphoneos \
      "${DESTINATION_ARGS[@]}" \
      -derivedDataPath "$DERIVED_DATA" \
      "${ALLOW_UPDATES_ARGS[@]}" \
      build
  fi
}

# 把 xcodebuild 输出同时写入日志
{
  log "XCODEBUILD_BUILD_BEGIN"
  build
  log "XCODEBUILD_BUILD_END"
} 2>&1 | tee -a "$LOG_FILE"

# ================================== 定位 .app（优先 Build Settings） ==================================
show_build_settings() {
  if [ "$PROJECT_KIND" = "workspace" ]; then
    /usr/bin/xcodebuild -showBuildSettings \
      -workspace "$PROJECT_PATH" \
      -scheme "$SCHEME" \
      -configuration "$CONFIG" \
      -sdk iphoneos \
      "${DESTINATION_ARGS[@]}" \
      -derivedDataPath "$DERIVED_DATA"
  else
    /usr/bin/xcodebuild -showBuildSettings \
      -project "$PROJECT_PATH" \
      -scheme "$SCHEME" \
      -configuration "$CONFIG" \
      -sdk iphoneos \
      "${DESTINATION_ARGS[@]}" \
      -derivedDataPath "$DERIVED_DATA"
  fi
}

bs_out="$(show_build_settings 2>&1 || true)"
log "SHOW_BUILD_SETTINGS_OUTPUT_BEGIN"
log "$bs_out"
log "SHOW_BUILD_SETTINGS_OUTPUT_END"

BUILT_PRODUCTS_DIR="$(echo "$bs_out" | sed -n 's/^[[:space:]]*BUILT_PRODUCTS_DIR[[:space:]]*=[[:space:]]*//p' | tail -n 1)"
CODESIGNING_FOLDER_PATH="$(echo "$bs_out" | sed -n 's/^[[:space:]]*CODESIGNING_FOLDER_PATH[[:space:]]*=[[:space:]]*//p' | tail -n 1)"
WRAPPER_NAME="$(echo "$bs_out" | sed -n 's/^[[:space:]]*WRAPPER_NAME[[:space:]]*=[[:space:]]*//p' | tail -n 1)"

APP_PATH=""
if [ -n "$CODESIGNING_FOLDER_PATH" ] && [ -e "$CODESIGNING_FOLDER_PATH" ]; then
  APP_PATH="$CODESIGNING_FOLDER_PATH"
elif [ -n "$BUILT_PRODUCTS_DIR" ] && [ -n "$WRAPPER_NAME" ] && [ -e "$BUILT_PRODUCTS_DIR/$WRAPPER_NAME" ]; then
  APP_PATH="$BUILT_PRODUCTS_DIR/$WRAPPER_NAME"
fi

# 回退：DerivedData 搜索
if [ -z "$APP_PATH" ]; then
  APP_PATH="$(find "$DERIVED_DATA" -type d -name "*.app" -path "*iphoneos*" 2>/dev/null | head -n 1 || true)"
fi

[ -n "$APP_PATH" ] || die "未能定位 .app（编译已过但未找到产物）"
[ -d "$APP_PATH" ] || die "定位到的 .app 不是目录：$APP_PATH"

success_echo "定位 .app：$APP_PATH"
log "APP_PATH=$APP_PATH"

# ================================== 打包 IPA ==================================
TMP_DIR="$(mktemp -d "/tmp/ipa_build.XXXXXX")"
PAYLOAD_DIR="$TMP_DIR/Payload"
mkdir -p "$PAYLOAD_DIR"

APP_NAME="$(basename "$APP_PATH")"
cp -R "$APP_PATH" "$PAYLOAD_DIR/$APP_NAME"

TS="$(date '+%Y%m%d_%H%M%S')"
IPA_NAME="${SCHEME}_${CONFIG}_${TS}.ipa"
IPA_PATH="${OUT_DIR%/}/$IPA_NAME"

( cd "$TMP_DIR" && /usr/bin/zip -qry "$IPA_PATH" "Payload" ) || die "zip 打包失败"

rm -rf "$TMP_DIR" || true

success_echo "🎉 IPA 已生成：$IPA_PATH"
info_echo "日志：$LOG_FILE"
if [ "$CONFIRM" -eq 1 ]; then
  open "$OUT_DIR" >/dev/null 2>&1 || true
fi
