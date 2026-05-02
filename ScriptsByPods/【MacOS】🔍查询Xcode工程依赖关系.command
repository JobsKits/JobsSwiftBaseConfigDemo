#!/bin/zsh

set -u

# ✅ 日志输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ 自述信息
print_banner() {
  highlight_echo "═════════════════════════════════════════════════════════════════════"
  highlight_echo "🔍 Podspec 依赖分析器 - 查询 Xcode / CocoaPods 工程依赖关系"
  highlight_echo "═════════════════════════════════════════════════════════════════════"
}

# ✅ 打印脚本说明
# wait：显示自述后等待用户回车
# skip：显示自述后不等待，适合已自动识别工程目录
print_readme() {
  local wait_mode="${1:-wait}"

  note_echo "功能说明："
  color_echo "1. 优先检测脚本所在目录和上一层目录；若包含 Podfile，则直接作为分析目录。"
  color_echo "2. 若自动检测不到，再让你拖入一个包含 Podfile 的目录。支持普通文件夹、Unix symlink、Finder 替身。"
  color_echo "3. 递归查找所有 *.podspec，并生成 Markdown 依赖报告，包含总览、0 依赖 Pod、明细和 Mermaid 图。"
  color_echo "4. 生成可搜索、可缩放、可拖拽的动态 HTML 依赖图。"
  color_echo "5. 会先自检 Homebrew；未安装时按芯片架构安装，再安装或升级 Graphviz 并尝试生成 PNG 图。"
  warm_echo ""
  warm_echo "输出目录会创建在工程目录下：PodspecDependencyReport，新报告会覆盖旧数据。"
  info_echo "日志文件：$LOG_FILE"
  warm_echo ""

  if [[ "$wait_mode" == "wait" ]]; then
    bold_echo "准备好后按 Enter 继续..."
    IFS= read -r _
  else
    success_echo "已自动识别工程目录，跳过回车确认，直接执行。"
  fi
}

# ✅ 处理终端拖入路径
normalize_drag_path() {
  RAW_FOR_RUBY="$1" /usr/bin/ruby <<'RUBY'
require 'shellwords'

s = ENV.fetch('RAW_FOR_RUBY', '').strip

begin
  parts = Shellwords.split(s)
  s = parts.join(' ') unless parts.empty?
rescue ArgumentError
  s = s.gsub(/\\(.)/, '\1')
  if (s.start_with?('"') && s.end_with?('"')) || (s.start_with?("'") && s.end_with?("'"))
    s = s[1...-1]
  end
end

puts File.expand_path(s)
RUBY
}

# ✅ 解析真实路径：支持普通目录、普通 symlink、Finder「替身」
resolve_real_path() {
  local input_path="$1"
  local real_path=""
  local alias_resolved=""

  real_path="$(REAL_PATH_FOR_RUBY="$input_path" /usr/bin/ruby <<'RUBY'
path = ENV.fetch('REAL_PATH_FOR_RUBY', '').strip
begin
  puts File.realpath(path)
rescue
  puts File.expand_path(path)
end
RUBY
)"

  if [[ -d "$real_path" ]]; then
    echo "$real_path"
    return 0
  fi

  alias_resolved="$(/usr/bin/osascript - "$input_path" <<'APPLESCRIPT' 2>/dev/null || true
on run argv
  set inputPath to item 1 of argv

  tell application "Finder"
    try
      set aliasFile to (POSIX file inputPath) as alias
      set originalItem to original item of aliasFile
      return POSIX path of (originalItem as alias)
    on error
      return ""
    end try
  end tell
end run
APPLESCRIPT
)"

  alias_resolved="$(printf "%s" "$alias_resolved" | sed '/^[[:space:]]*$/d' | tail -n 1)"

  if [[ -n "${alias_resolved//[[:space:]]/}" ]]; then
    REAL_PATH_FOR_RUBY="$alias_resolved" /usr/bin/ruby <<'RUBY'
path = ENV.fetch('REAL_PATH_FOR_RUBY', '').strip
begin
  puts File.realpath(path)
rescue
  puts File.expand_path(path)
end
RUBY
    return 0
  fi

  echo "$real_path"
}

# ✅ 判断目录是否可用：必须是目录，并且当前目录下直接包含 Podfile
is_valid_project_dir() {
  local dir="$1"
  [[ -d "$dir" && -f "$dir/Podfile" ]]
}

# ✅ 获取脚本所在目录
get_script_dir() {
  local script_path="${0:A}"
  dirname "$script_path"
}

# ✅ 最高优先级：自动检测脚本所在目录，以及脚本所在目录的上一层目录
detect_target_dir_from_script_location() {
  local script_dir=""
  local parent_dir=""

  SELECTED_TARGET_DIR=""

  script_dir="$(get_script_dir)"
  parent_dir="$(dirname "$script_dir")"

  info_echo "优先检测脚本所在目录是否包含 Podfile：$script_dir"
  if is_valid_project_dir "$script_dir"; then
    SELECTED_TARGET_DIR="$script_dir"
    success_echo "已自动识别工程目录：$SELECTED_TARGET_DIR"
    return 0
  fi

  info_echo "继续检测脚本所在目录的上一层是否包含 Podfile：$parent_dir"
  if is_valid_project_dir "$parent_dir"; then
    SELECTED_TARGET_DIR="$parent_dir"
    success_echo "已自动识别工程目录：$SELECTED_TARGET_DIR"
    return 0
  fi

  warn_echo "脚本所在目录及上一层目录均未发现 Podfile，需要手动拖入包含 Podfile 的目录。"
  return 1
}

# ✅ 手动拖入目录
prompt_target_dir() {
  local raw_path=""
  local input_path=""
  local target_dir=""

  SELECTED_TARGET_DIR=""

  while true; do
    warm_echo ""
    bold_echo "请把要分析的工程文件夹拖到这里，然后按 Enter（该目录下必须包含 Podfile）："
    IFS= read -r raw_path

    if [[ -z "${raw_path//[[:space:]]/}" ]]; then
      warn_echo "输入为空，请重新拖入文件夹。"
      continue
    fi

    input_path="$(normalize_drag_path "$raw_path")"
    target_dir="$(resolve_real_path "$input_path")"

    if is_valid_project_dir "$target_dir"; then
      SELECTED_TARGET_DIR="$target_dir"
      success_echo "已识别有效工程目录：$SELECTED_TARGET_DIR"
      return 0
    fi

    if [[ -d "$target_dir" ]]; then
      error_echo "目录存在，但当前目录下没有 Podfile：$target_dir"
    else
      error_echo "不是有效文件夹：$target_dir"
    fi
  done
}

# ✅ 获取当前 CPU 架构
get_cpu_arch() {
  /usr/bin/uname -m
}

# ✅ 根据架构推导 Homebrew 默认安装路径
get_brew_bin_by_arch() {
  local arch="$1"

  if [[ "$arch" == "arm64" ]]; then
    echo "/opt/homebrew/bin/brew"
  else
    echo "/usr/local/bin/brew"
  fi
}

# ✅ 根据当前 shell 推导 profile 文件
get_shell_profile_file() {
  local shell_path="${SHELL##*/}"

  case "$shell_path" in
    zsh)  echo "$HOME/.zprofile" ;;
    bash) echo "$HOME/.bash_profile" ;;
    *)    echo "$HOME/.profile" ;;
  esac
}

# ✅ 写入 Homebrew shellenv 到对应配置文件，并让当前终端立即生效
inject_shellenv_block() {
  local profile_file="$1"
  local shellenv="$2"
  local header="# >>> homebrew_env 环境变量 >>>"
  local footer="# <<< homebrew_env 环境变量 <<<"
  local tmp_file=""

  if [[ -z "$profile_file" || -z "$shellenv" ]]; then
    error_echo "缺少参数：inject_shellenv_block <profile_file> <shellenv>"
    return 1
  fi

  mkdir -p "$(dirname "$profile_file")"
  touch "$profile_file"

  if grep -Fq "$shellenv" "$profile_file"; then
    info_echo "Homebrew shellenv 已存在：$profile_file"
  else
    if grep -Fq "$header" "$profile_file"; then
      warn_echo "检测到旧 Homebrew 环境变量块，将替换：$profile_file"
      tmp_file="$(mktemp)"
      /usr/bin/awk -v header="$header" -v footer="$footer" '
        $0 == header { skip = 1; next }
        $0 == footer { skip = 0; next }
        skip != 1 { print }
      ' "$profile_file" > "$tmp_file" && mv "$tmp_file" "$profile_file"
    fi

    {
      echo ""
      echo "$header"
      echo "$shellenv"
      echo "$footer"
    } >> "$profile_file"

    success_echo "已写入 Homebrew 环境变量：$profile_file"
  fi

  eval "$shellenv"
  success_echo "Homebrew shellenv 已在当前终端生效"
}

# ✅ Homebrew 自检
install_homebrew() {
  local arch="$(get_cpu_arch)"
  local shell_path="${SHELL##*/}"
  local profile_file="$(get_shell_profile_file)"
  local brew_bin="$(get_brew_bin_by_arch "$arch")"
  local shellenv_cmd=""
  local confirm=""

  warm_echo ""
  info_echo "开始 Homebrew 自检..."
  info_echo "当前架构：$arch；当前 Shell：$shell_path"

  if ! command -v brew >/dev/null 2>&1 && [[ -x "$brew_bin" ]]; then
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""
    info_echo "检测到 Homebrew 已安装但未进入 PATH，开始注入环境变量..."
    inject_shellenv_block "$profile_file" "$shellenv_cmd" || return 1
  fi

  if ! command -v brew >/dev/null 2>&1; then
    warn_echo "未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2>&1 | tee -a "$LOG_FILE"
      local install_exit_code=${pipestatus[1]}
      if [[ $install_exit_code -ne 0 ]]; then
        error_echo "Homebrew 安装失败（arm64），状态码：$install_exit_code"
        return 1
      fi
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2>&1 | tee -a "$LOG_FILE"
      local install_exit_code=${pipestatus[1]}
      if [[ $install_exit_code -ne 0 ]]; then
        error_echo "Homebrew 安装失败（x86_64），状态码：$install_exit_code"
        return 1
      fi
      brew_bin="/usr/local/bin/brew"
    fi

    success_echo "Homebrew 安装成功"

    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""
    inject_shellenv_block "$profile_file" "$shellenv_cmd" || return 1
  else
    brew_bin="$(command -v brew)"
    success_echo "Homebrew 已安装：$brew_bin"

    info_echo "是否执行 Homebrew 更新与自检？"
    warm_echo "直接按 Enter：跳过 Homebrew 更新，只执行 brew -v 轻量检查"
    warm_echo "输入任意字符后回车：执行 brew update && brew upgrade && brew cleanup && brew doctor && brew -v"
    IFS= read -r confirm

    if [[ -z "$confirm" ]]; then
      note_echo "已选择跳过 Homebrew 更新"
      info_echo "执行轻量自检：brew -v"
      brew -v 2>&1 | tee -a "$LOG_FILE" || warn_echo "打印 brew 版本失败，可忽略。"
    else
      info_echo "正在执行 brew update..."
      brew update 2>&1 | tee -a "$LOG_FILE"
      local update_exit_code=${pipestatus[1]}
      [[ $update_exit_code -eq 0 ]] || { error_echo "brew update 失败，状态码：$update_exit_code"; return 1; }

      info_echo "正在执行 brew upgrade..."
      brew upgrade 2>&1 | tee -a "$LOG_FILE"
      local upgrade_exit_code=${pipestatus[1]}
      [[ $upgrade_exit_code -eq 0 ]] || { error_echo "brew upgrade 失败，状态码：$upgrade_exit_code"; return 1; }

      info_echo "正在执行 brew cleanup..."
      brew cleanup 2>&1 | tee -a "$LOG_FILE"
      local cleanup_exit_code=${pipestatus[1]}
      [[ $cleanup_exit_code -eq 0 ]] || { error_echo "brew cleanup 失败，状态码：$cleanup_exit_code"; return 1; }

      info_echo "正在执行 brew doctor..."
      brew doctor 2>&1 | tee -a "$LOG_FILE"
      local doctor_exit_code=${pipestatus[1]}
      [[ $doctor_exit_code -eq 0 ]] || warn_echo "brew doctor 有警告/错误，请按提示处理。"

      brew -v 2>&1 | tee -a "$LOG_FILE" || warn_echo "打印 brew 版本失败，可忽略。"
      success_echo "Homebrew 更新与自检完成"
    fi
  fi
}

# ✅ 检查 Graphviz
ensure_graphviz() {
  warm_echo ""
  info_echo "检查 Graphviz..."

  install_homebrew || {
    warn_echo "Homebrew 自检或安装失败。动态 HTML 图仍会生成；PNG 图可能无法生成。"
    return 0
  }

  if command -v brew >/dev/null 2>&1; then
    if brew list --versions graphviz >/dev/null 2>&1; then
      info_echo "检测到 Graphviz 已通过 Homebrew 安装，开始升级..."
      brew upgrade graphviz 2>&1 | tee -a "$LOG_FILE" || true
    else
      info_echo "未检测到 Homebrew 版 Graphviz，开始安装..."
      brew install graphviz 2>&1 | tee -a "$LOG_FILE" || true
    fi
  fi

  if command -v dot >/dev/null 2>&1; then
    success_echo "Graphviz 可用：$(command -v dot)"
  else
    warn_echo "未检测到 dot 命令。动态 HTML 图仍会生成；PNG 图不会生成。"
  fi
}

# ✅ 创建报告输出目录：固定使用 PodspecDependencyReport，新的报告会覆盖旧数据
prepare_report_dir() {
  local target_dir="$1"
  local report_dir="$target_dir/PodspecDependencyReport"

  if [[ -e "$report_dir" ]]; then
    warn_echo "检测到旧报告目录，将删除并重新生成：$report_dir" >&2
    rm -rf "$report_dir"
  fi

  mkdir -p "$report_dir"
  echo "$report_dir"
}

# ✅ 写入 Ruby 解析器
write_generator_script() {
  local generator="$1"

  cat > "$generator" <<'RUBY'
require 'find'
require 'set'
require 'digest'
require 'pathname'
require 'json'

root = File.expand_path(ARGV[0])
out_dir = File.expand_path(ARGV[1])

def strip_comment(line)
  result = +''
  quote = nil
  escaped = false

  line.each_char do |ch|
    if escaped
      result << ch
      escaped = false
      next
    end

    if quote
      if ch == '\\'
        result << ch
        escaped = true
      elsif ch == quote
        quote = nil
        result << ch
      else
        result << ch
      end
    else
      if ch == "'" || ch == '"'
        quote = ch
        result << ch
      elsif ch == '#'
        break
      else
        result << ch
      end
    end
  end

  result
end

def md_escape(value)
  value.to_s.gsub('\\', '\\\\').gsub('|', '\|').gsub("\n", ' ')
end

def md_link_text_escape(value)
  md_escape(value).gsub('[', '\[').gsub(']', '\]')
end

def html_attr_escape(value)
  value.to_s.gsub('&', '&amp;').gsub('"', '&quot;').gsub('<', '&lt;').gsub('>', '&gt;')
end

def html_escape(value)
  value.to_s.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;').gsub('"', '&quot;')
end

def rel_path(path, root)
  Pathname.new(path).relative_path_from(Pathname.new(root)).to_s
rescue
  path
end

def detail_anchor(pod_name)
  pod_name.to_s
end

def local_pod_target(dep_name, pod_names)
  dep = dep_name.to_s
  return dep if pod_names.include?(dep)

  base = dep.split('/').first
  return base if pod_names.include?(base)

  nil
end

def pod_detail_link(label, pod_names, bold: false)
  target = local_pod_target(label, pod_names)
  escaped = md_link_text_escape(label)
  escaped = "**#{escaped}**" if bold

  return escaped unless target

  "[#{escaped}](##{detail_anchor(target)})"
end

def extract_first_source_url(line)
  github_match = line.match(%r{https?://github\.com/[A-Za-z0-9_.-]+(?:/[A-Za-z0-9_.-]+)?})
  return github_match[0].sub(/\.git\z/, '') if github_match

  generic_match = line.match(%r{https?://[^\s'"<>)，,]+})
  return nil unless generic_match

  generic_match[0].sub(/[。；;，,、]+$/, '')
end

def collect_pod_source_urls(root)
  urls = {}
  podfile_paths = []

  Find.find(root) do |path|
    next unless File.file?(path)
    next if path.include?('/PodspecDependencyReport/')

    basename = File.basename(path)
    next unless basename == 'Podfile' ||
                basename.start_with?('Podfile.') ||
                basename.downcase.end_with?('.podfile')

    podfile_paths << path
  end

  podfile_paths.sort.each do |path|
    File.readlines(path, invalid: :replace, undef: :replace, replace: '').each do |line|
      pod_line = line.sub(/\A\s*#\s*/, '')
      next unless pod_line =~ /\bpod\s*\(?\s*['"]([^'"]+)['"]/

      pod_name = Regexp.last_match(1).strip
      source_url = extract_first_source_url(line)
      next if source_url.nil? || source_url.empty?

      urls[pod_name] ||= source_url

      base_name = pod_name.split('/').first
      urls[base_name] ||= source_url
    end
  rescue => e
    warn "读取 Podfile 来源注释失败：#{path} #{e.message}"
  end

  [urls, podfile_paths]
end

def dependency_link(dep_name, pod_names, source_urls)
  target = local_pod_target(dep_name, pod_names)
  return pod_detail_link(dep_name, pod_names) if target

  source_url = source_urls[dep_name.to_s] || source_urls[dep_name.to_s.split('/').first]
  return "[#{md_link_text_escape(dep_name)}](#{source_url})" if source_url && !source_url.empty?

  md_escape(dep_name)
end

def mermaid_id(label)
  'N' + Digest::MD5.hexdigest(label.to_s)[0, 12]
end

def mermaid_label(label)
  label.to_s.gsub('"', "'")
end

def dot_escape(label)
  label.to_s.gsub('\\', '\\\\').gsub('"', '\"')
end

def make_mermaid(edges, nodes = [])
  lines = ['flowchart LR']
  node_labels = nodes.to_set

  edges.each do |edge|
    node_labels << edge[:from]
    node_labels << edge[:to]
  end

  if edges.empty?
    if node_labels.empty?
      lines << '  EMPTY["未发现依赖关系"]'
    else
      node_labels.to_a.sort.each do |label|
        lines << %(  #{mermaid_id(label)}["#{mermaid_label(label)}"])
      end
    end
  else
    edges.map { |e| [e[:from], e[:to]] }.uniq.sort.each do |from, to|
      lines << %(  #{mermaid_id(from)}["#{mermaid_label(from)}"] --> #{mermaid_id(to)}["#{mermaid_label(to)}"])
    end
  end

  lines.join("\n")
end

def make_dot(edges, nodes = [])
  lines = []
  lines << 'digraph PodspecDependencies {'
  lines << '  rankdir=LR;'
  lines << '  node [shape=box, fontname="Helvetica"];'

  node_labels = nodes.to_set
  edges.each do |edge|
    node_labels << edge[:from]
    node_labels << edge[:to]
  end

  node_labels.to_a.sort.each do |label|
    lines << %(  "#{dot_escape(label)}";)
  end

  edges.map { |e| [e[:from], e[:to]] }.uniq.sort.each do |from, to|
    lines << %(  "#{dot_escape(from)}" -> "#{dot_escape(to)}";)
  end

  lines << '}'
  lines.join("\n")
end

def parse_podspec(path)
  text = File.read(path, invalid: :replace, undef: :replace, replace: '')
  lines = text.lines
  basename = File.basename(path, '.podspec')

  pod_name = nil
  root_vars = Set.new

  lines.each do |line|
    cleaned = strip_comment(line)

    if cleaned =~ /Pod::(?:Specification|Spec)\.new\s+do\s+\|(\w+)\|/
      root_vars << Regexp.last_match(1)
    end

    if pod_name.nil? && cleaned =~ /(?:^|[^\w])(?:\w+\.)?name\s*=\s*['"]([^'"]+)['"]/
      pod_name = Regexp.last_match(1).strip
    end
  end

  pod_name ||= basename

  deps = []
  depth = 0
  contexts = {}
  stack = []

  lines.each_with_index do |line, index|
    cleaned = strip_comment(line).strip
    next if cleaned.empty?

    if cleaned =~ /(?:^|[^\w])(\w+)\.subspec\s+['"]([^'"]+)['"]\s+do\s+\|(\w+)\|/
      parent_var = Regexp.last_match(1)
      sub_name = Regexp.last_match(2)
      sub_var = Regexp.last_match(3)

      parent_name = contexts[parent_var]&.first || pod_name
      full_name = "#{parent_name}/#{sub_name}"

      contexts[sub_var] = [full_name, depth + 1]
      stack << [sub_var, depth + 1]
    end

    cleaned.scan(/(?:(\w+(?:\.\w+)*)\.)?\bdependency\b\s*\(?\s*['"]([^'"]+)['"]([^#]*)/) do |receiver, dep_name, rest|
      receiver_var = receiver&.split('.')&.first

      declared_in = nil
      declared_in = contexts[receiver_var]&.first if receiver_var
      declared_in ||= contexts[stack.last&.first]&.first if receiver.nil? && stack.any?
      declared_in ||= pod_name

      requirement = rest.to_s.strip
      requirement = requirement.sub(/\A\s*,\s*/, '').strip
      requirement = requirement.sub(/\)\s*\z/, '').strip
      requirement = '' if requirement == ','

      deps << {
        dep: dep_name.strip,
        requirement: requirement,
        line: index + 1,
        declared_in: declared_in
      }
    end

    opens = cleaned.scan(/\bdo\b/).length + cleaned.count('{')
    closes = cleaned.scan(/\bend\b/).length + cleaned.count('}')
    depth += opens - closes

    while stack.any? && stack.last[1] > depth
      var, = stack.pop
      contexts.delete(var)
    end
  end

  deps.uniq! { |d| [d[:dep], d[:requirement], d[:declared_in], d[:line]] }

  {
    name: pod_name,
    path: path,
    deps: deps
  }
end

def make_interactive_html(data_json)
  <<~HTML
  <!doctype html>
  <html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <title>Podspec 依赖动态图</title>
    <style>
      body { margin: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; background: #f6f7f9; color: #222; }
      header { padding: 14px 18px; background: #111827; color: white; }
      header h1 { margin: 0 0 8px; font-size: 20px; }
      header .meta { opacity: .8; font-size: 13px; }
      .toolbar { display: flex; gap: 10px; align-items: center; padding: 12px 18px; background: white; border-bottom: 1px solid #ddd; }
      input, select, button { height: 32px; font-size: 14px; }
      input { width: 260px; padding: 0 10px; }
      button { padding: 0 12px; cursor: pointer; }
      .layout { display: grid; grid-template-columns: 1fr 320px; height: calc(100vh - 112px); }
      #stage { position: relative; overflow: hidden; background: linear-gradient(45deg, #fafafa, #f0f3f7); cursor: grab; }
      #canvas { position: absolute; left: 0; top: 0; transform-origin: 0 0; }
      svg { overflow: visible; }
      .node { cursor: pointer; }
      .node rect { fill: white; stroke: #5b6b84; stroke-width: 1.4; rx: 8; }
      .node text { font-size: 12px; pointer-events: none; }
      .node.focus rect { stroke-width: 3; }
      .edge { stroke: #718096; stroke-width: 1.2; marker-end: url(#arrow); }
      aside { overflow: auto; background: white; border-left: 1px solid #ddd; padding: 14px; }
      aside h2 { font-size: 16px; margin: 0 0 10px; }
      aside h3 { font-size: 14px; margin: 18px 0 8px; }
      aside ul { padding-left: 18px; }
      .muted { color: #6b7280; font-size: 13px; }
      .badge { display: inline-block; padding: 2px 8px; background: #edf2f7; border-radius: 999px; margin-right: 6px; font-size: 12px; }
    </style>
  </head>
  <body>
    <header>
      <h1>Podspec 依赖动态图</h1>
      <div class="meta" id="meta"></div>
    </header>

    <div class="toolbar">
      <input id="search" placeholder="搜索 Pod / 依赖">
      <select id="mode">
        <option value="internal">只看仓库内 Pod 关联</option>
        <option value="all">全部依赖</option>
      </select>
      <select id="depth">
        <option value="1">点击节点后显示 1 层邻居</option>
        <option value="2">点击节点后显示 2 层邻居</option>
        <option value="3">点击节点后显示 3 层邻居</option>
      </select>
      <button id="fit">适配视图</button>
      <button id="reset">重置</button>
    </div>

    <div class="layout">
      <div id="stage">
        <div id="canvas">
          <svg id="svg" width="2000" height="1400">
            <defs>
              <marker id="arrow" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
                <path d="M0,0 L0,6 L9,3 z" fill="#718096"></path>
              </marker>
            </defs>
            <g id="edges"></g>
            <g id="nodes"></g>
          </svg>
        </div>
      </div>
      <aside id="detail"></aside>
    </div>

    <script>
      const data = #{data_json};
      const state = {
        mode: 'internal',
        search: '',
        focus: null,
        depth: 1,
        scale: 1,
        tx: 20,
        ty: 20,
        nodes: [],
        edges: []
      };

      const stage = document.getElementById('stage');
      const canvas = document.getElementById('canvas');
      const svg = document.getElementById('svg');
      const edgesGroup = document.getElementById('edges');
      const nodesGroup = document.getElementById('nodes');

      document.getElementById('meta').textContent =
        `分析目录：${data.root} ｜ 生成时间：${data.generatedAt} ｜ Pod 数：${data.pods.length}`;

      function allEdges() {
        return state.mode === 'internal' ? data.internalEdges : data.allEdges;
      }

      function nodeNames() {
        const names = new Set(data.pods.map(p => p.name));
        allEdges().forEach(e => {
          names.add(e.from);
          names.add(e.to);
        });
        return [...names].sort();
      }

      function collectVisibleNames() {
        let names = new Set(nodeNames());
        const q = state.search.trim().toLowerCase();

        if (q) {
          names = new Set([...names].filter(n => n.toLowerCase().includes(q)));
          allEdges().forEach(e => {
            if (e.from.toLowerCase().includes(q) || e.to.toLowerCase().includes(q)) {
              names.add(e.from);
              names.add(e.to);
            }
          });
        }

        if (state.focus) {
          const visible = new Set([state.focus]);
          let frontier = new Set([state.focus]);

          for (let i = 0; i < state.depth; i++) {
            const next = new Set();
            allEdges().forEach(e => {
              if (frontier.has(e.from)) {
                next.add(e.to);
                visible.add(e.to);
              }
              if (frontier.has(e.to)) {
                next.add(e.from);
                visible.add(e.from);
              }
            });
            frontier = next;
          }

          names = visible;
        }

        return names;
      }

      function layout(names) {
        const arr = [...names].sort();
        const cols = Math.max(1, Math.ceil(Math.sqrt(arr.length)));
        const w = 210;
        const h = 90;

        return arr.map((name, i) => ({
          name,
          x: (i % cols) * w + 60,
          y: Math.floor(i / cols) * h + 60,
          width: 160,
          height: 38
        }));
      }

      function applyTransform() {
        canvas.style.transform = `translate(${state.tx}px, ${state.ty}px) scale(${state.scale})`;
      }

      function render() {
        const visibleNames = collectVisibleNames();
        state.nodes = layout(visibleNames);
        const nodeMap = new Map(state.nodes.map(n => [n.name, n]));

        state.edges = allEdges().filter(e => nodeMap.has(e.from) && nodeMap.has(e.to));

        edgesGroup.innerHTML = '';
        state.edges.forEach(e => {
          const a = nodeMap.get(e.from);
          const b = nodeMap.get(e.to);
          const line = document.createElementNS('http://www.w3.org/2000/svg', 'line');
          line.setAttribute('class', 'edge');
          line.setAttribute('x1', a.x + a.width);
          line.setAttribute('y1', a.y + a.height / 2);
          line.setAttribute('x2', b.x);
          line.setAttribute('y2', b.y + b.height / 2);
          edgesGroup.appendChild(line);
        });

        nodesGroup.innerHTML = '';
        state.nodes.forEach(n => {
          const g = document.createElementNS('http://www.w3.org/2000/svg', 'g');
          g.setAttribute('class', 'node' + (state.focus === n.name ? ' focus' : ''));
          g.setAttribute('transform', `translate(${n.x}, ${n.y})`);

          const rect = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
          rect.setAttribute('width', n.width);
          rect.setAttribute('height', n.height);

          const text = document.createElementNS('http://www.w3.org/2000/svg', 'text');
          text.setAttribute('x', 10);
          text.setAttribute('y', 24);
          text.textContent = n.name.length > 22 ? n.name.slice(0, 21) + '…' : n.name;

          g.appendChild(rect);
          g.appendChild(text);

          g.addEventListener('click', event => {
            event.stopPropagation();
            state.focus = state.focus === n.name ? null : n.name;
            render();
          });

          nodesGroup.appendChild(g);
        });

        updateDetail();
      }

      function updateDetail() {
        const box = document.getElementById('detail');

        if (!state.focus) {
          const zero = data.pods.filter(p => !p.deps || p.deps.length === 0).map(p => p.name).sort();
          box.innerHTML = `
            <h2>总览</h2>
            <p><span class="badge">Pod ${data.pods.length}</span><span class="badge">边 ${allEdges().length}</span></p>
            <p class="muted">点击节点查看上下游依赖。</p>
            <h3>0 依赖 Pod</h3>
            <ul>${zero.map(n => `<li>${n}</li>`).join('')}</ul>
          `;
          return;
        }

        const deps = allEdges().filter(e => e.from === state.focus).map(e => e.to).sort();
        const users = allEdges().filter(e => e.to === state.focus).map(e => e.from).sort();

        box.innerHTML = `
          <h2>${state.focus}</h2>
          <h3>它依赖了谁</h3>
          <ul>${deps.length ? deps.map(n => `<li>${n}</li>`).join('') : '<li class="muted">无</li>'}</ul>
          <h3>谁依赖它</h3>
          <ul>${users.length ? users.map(n => `<li>${n}</li>`).join('') : '<li class="muted">无</li>'}</ul>
        `;
      }

      function fitView() {
        state.scale = 1;
        state.tx = 20;
        state.ty = 20;
        applyTransform();
      }

      document.getElementById('mode').addEventListener('change', e => {
        state.mode = e.target.value;
        state.focus = null;
        render();
        fitView();
      });

      document.getElementById('search').addEventListener('input', e => {
        state.search = e.target.value;
        state.focus = null;
        render();
        fitView();
      });

      document.getElementById('depth').addEventListener('change', e => {
        state.depth = Number(e.target.value);
        render();
      });

      document.getElementById('fit').addEventListener('click', fitView);

      document.getElementById('reset').addEventListener('click', () => {
        state.search = '';
        state.focus = null;
        state.depth = 1;
        document.getElementById('search').value = '';
        document.getElementById('depth').value = '1';
        render();
        fitView();
      });

      let dragging = false;
      let lastX = 0;
      let lastY = 0;

      stage.addEventListener('mousedown', e => {
        dragging = true;
        lastX = e.clientX;
        lastY = e.clientY;
      });

      window.addEventListener('mousemove', e => {
        if (!dragging) return;
        state.tx += e.clientX - lastX;
        state.ty += e.clientY - lastY;
        lastX = e.clientX;
        lastY = e.clientY;
        applyTransform();
      });

      window.addEventListener('mouseup', () => dragging = false);

      stage.addEventListener('wheel', e => {
        e.preventDefault();
        const delta = e.deltaY > 0 ? 0.9 : 1.1;
        state.scale = Math.max(0.2, Math.min(3, state.scale * delta));
        applyTransform();
      }, { passive: false });

      render();
      fitView();
    </script>
  </body>
  </html>
  HTML
end

podspec_paths = []

Find.find(root) do |path|
  next unless File.file?(path)
  next if path.include?('/PodspecDependencyReport/')
  podspec_paths << path if path.end_with?('.podspec')
end

podspec_paths.sort!

reports = []
errors = []

podspec_paths.each do |path|
  begin
    reports << parse_podspec(path)
  rescue => e
    errors << [path, e.message]
  end
end

pod_names = reports.map { |r| r[:name] }.to_set
all_edges = []
internal_edges = []

reports.each do |report|
  report[:deps].each do |dep|
    edge = {
      from: report[:name],
      to: dep[:dep],
      requirement: dep[:requirement],
      declared_in: dep[:declared_in],
      line: dep[:line],
      file: rel_path(report[:path], root)
    }

    all_edges << edge

    dep_base_name = dep[:dep].split('/').first
    internal_edges << edge if pod_names.include?(dep_base_name)
  end
end

all_nodes = reports.map { |r| r[:name] }
zero_dependency_reports = reports.select { |r| r[:deps].empty? }.sort_by { |r| r[:name] }
source_urls, source_podfile_paths = collect_pod_source_urls(root)

md_path = File.join(out_dir, 'PodspecDependencies.md')
html_path = File.join(out_dir, 'PodspecDependencies_interactive.html')
all_mmd_path = File.join(out_dir, 'PodspecDependencies_all.mmd')
internal_mmd_path = File.join(out_dir, 'PodspecDependencies_internal.mmd')
all_dot_path = File.join(out_dir, 'PodspecDependencies_all.dot')
internal_dot_path = File.join(out_dir, 'PodspecDependencies_internal.dot')

all_mermaid = make_mermaid(all_edges, all_nodes)
internal_mermaid = make_mermaid(internal_edges, all_nodes)

File.write(all_mmd_path, all_mermaid)
File.write(internal_mmd_path, internal_mermaid)
File.write(all_dot_path, make_dot(all_edges, all_nodes))
File.write(internal_dot_path, make_dot(internal_edges, all_nodes))

html_data = {
  root: root,
  generatedAt: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
  pods: reports.sort_by { |r| r[:name] }.map do |r|
    {
      name: r[:name],
      file: rel_path(r[:path], root),
      deps: r[:deps]
    }
  end,
  allEdges: all_edges,
  internalEdges: internal_edges
}

File.write(html_path, make_interactive_html(JSON.generate(html_data)))

File.open(md_path, 'w') do |md|
  top_link = '<a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>'

  md.puts '# Podspec 依赖分析报告'
  md.puts '![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")'
  md.puts '[toc]'
  md.puts
  md.puts "## 🔥 <font id=前言>前言</font> #{top_link}"
  md.puts
  md.puts "- 分析目录：`#{root}`"
  md.puts "- 生成时间：`#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}`"
  md.puts "- Podspec 数量：`#{reports.length}`"
  md.puts "- 0 依赖 Pod 数量：`#{zero_dependency_reports.length}`"
  md.puts "- 全部依赖边数量：`#{all_edges.map { |e| [e[:from], e[:to]] }.uniq.length}`"
  md.puts "- 仓库内 Pod 依赖边数量：`#{internal_edges.map { |e| [e[:from], e[:to]] }.uniq.length}`"
  md.puts "- 外部依赖来源注释文件数量：`#{source_podfile_paths.length}`"
  md.puts "- 已识别外部依赖来源链接数量：`#{source_urls.length}`"
  md.puts
  md.puts "> 更易读的动态关系图见：`PodspecDependencies_interactive.html`。"
  md.puts

  if podspec_paths.empty?
    md.puts '> 没有找到任何 `.podspec` 文件。'
    md.puts
    md.puts '<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>'
    next
  end

  unless errors.empty?
    md.puts '#### 解析失败的文件'
    md.puts
    md.puts '| Podspec | 错误 |'
    md.puts '|---|---|'
    errors.each do |path, message|
      rel = rel_path(path, root)
      md.puts "| **`#{md_escape(rel)}`** | #{md_escape(message)} |"
    end
    md.puts
  end

  md.puts "## 一、总览 #{top_link}"
  md.puts
  md.puts '| Pod | Podspec | 依赖数量 | 依赖 |'
  md.puts '|---|---|---:|---|'

  reports.sort_by { |r| r[:name] }.each do |report|
    rel = rel_path(report[:path], root)
    deps = report[:deps].map { |d| d[:dep] }.uniq.sort
    dep_links = deps.map { |dep_name| dependency_link(dep_name, pod_names, source_urls) }.join(', ')
    md.puts "| #{pod_detail_link(report[:name], pod_names, bold: true)} | `#{md_escape(rel)}` | #{deps.length} | #{dep_links} |"
  end

  md.puts
  md.puts "## 二、0 依赖 Pod #{top_link}"
  md.puts

  if zero_dependency_reports.empty?
    md.puts '没有 0 依赖 Pod。'
  else
    md.puts '| Pod | Podspec |'
    md.puts '|---|---|'
    zero_dependency_reports.each do |report|
      rel = rel_path(report[:path], root)
      md.puts "| #{pod_detail_link(report[:name], pod_names, bold: true)} | `#{md_escape(rel)}` |"
    end
  end

  md.puts
  md.puts "## 三、仓库内 Pod 相互依赖图 Mermaid #{top_link}"
  md.puts
  md.puts '只展示依赖目标也在本次扫描到的 `.podspec` 里存在的关系。'
  md.puts
  md.puts '```mermaid'
  md.puts internal_mermaid
  md.puts '```'
  md.puts

  md.puts "## 四、全部依赖图 Mermaid #{top_link}"
  md.puts
  md.puts '```mermaid'
  md.puts all_mermaid
  md.puts '```'
  md.puts

  md.puts "## 五、明细 #{top_link}"

  reports.sort_by { |r| r[:name] }.each_with_index do |report, index|
    rel = rel_path(report[:path], root)

    md.puts
    md.puts %(### #{index + 1}、<font id="#{html_attr_escape(detail_anchor(report[:name]))}">#{md_escape(report[:name])}</font> #{top_link})
    md.puts
    md.puts "Podspec：`#{rel}`"
    md.puts

    if report[:deps].empty?
      md.puts '未发现依赖。'
      next
    end

    md.puts '| 声明位置 | 依赖 | 版本/参数 |'
    md.puts '|---|---|---|'

    report[:deps].sort_by { |d| [d[:declared_in], d[:dep], d[:line]] }.each do |dep|
      declared_link = pod_detail_link(dep[:declared_in], pod_names, bold: true)
      dep_link = dependency_link(dep[:dep], pod_names, source_urls)
      md.puts "| #{declared_link} | #{dep_link} | `#{md_escape(dep[:requirement])}` |"
    end
  end

  md.puts
  md.puts "## 六、生成的文件 #{top_link}"
  md.puts
  md.puts '- `PodspecDependencies_interactive.html`：可搜索、可拖拽、可缩放动态图'
  md.puts '- `PodspecDependencies.md`：本报告'
  md.puts '- `PodspecDependencies_all.mmd`：全部依赖 Mermaid 图源码'
  md.puts '- `PodspecDependencies_internal.mmd`：仓库内 Pod 相互依赖 Mermaid 图源码'
  md.puts '- `PodspecDependencies_all.dot`：全部依赖 Graphviz DOT 源码'
  md.puts '- `PodspecDependencies_internal.dot`：仓库内 Pod 相互依赖 Graphviz DOT 源码'
  md.puts
  md.puts '<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>'
end

puts md_path
puts html_path
RUBY
}

# ✅ 执行 Ruby 解析器
run_generator() {
  local generator="$1"
  local target_dir="$2"
  local report_dir="$3"
  local generator_exit_code=0

  info_echo "开始扫描并生成依赖报告..."

  /usr/bin/ruby "$generator" "$target_dir" "$report_dir" 2>&1 | tee -a "$LOG_FILE"
  generator_exit_code=${pipestatus[1]}

  rm -f "$generator"

  if [[ $generator_exit_code -ne 0 ]]; then
    error_echo "生成失败，状态码：$generator_exit_code"
    exit $generator_exit_code
  fi

  success_echo "依赖报告生成完成。"
}

# ✅ 如果系统可用 dot，则额外生成 Graphviz PNG 图片
generate_graphviz_png() {
  local report_dir="$1"
  local dot_all="$report_dir/PodspecDependencies_all.dot"
  local dot_internal="$report_dir/PodspecDependencies_internal.dot"
  local png_all="$report_dir/PodspecDependencies_all.png"
  local png_internal="$report_dir/PodspecDependencies_internal.png"

  if command -v dot >/dev/null 2>&1; then
    info_echo "开始生成 Graphviz PNG 图片..."
    dot -Tpng "$dot_all" -o "$png_all" 2>&1 | tee -a "$LOG_FILE" || true
    dot -Tpng "$dot_internal" -o "$png_internal" 2>&1 | tee -a "$LOG_FILE" || true

    warm_echo ""
    success_echo "已生成 Graphviz PNG："
    [[ -f "$png_all" ]] && color_echo "$png_all"
    [[ -f "$png_internal" ]] && color_echo "$png_internal"
  else
    warn_echo "未检测到 dot 命令，跳过 PNG 生成。"
  fi
}

# ✅ 打开主要产物
open_outputs() {
  local report_dir="$1"
  local md_file="$report_dir/PodspecDependencies.md"
  local html_file="$report_dir/PodspecDependencies_interactive.html"
  local png_internal="$report_dir/PodspecDependencies_internal.png"

  [[ -f "$html_file" ]] && open "$html_file"
  [[ -f "$md_file" ]] && open "$md_file"
  [[ -f "$png_internal" ]] && open "$png_internal"

  warm_echo ""
  success_echo "报告已生成：$report_dir"
  warm_echo ""
  note_echo "推荐先看动态 HTML：$html_file"
}

# ✅ 主流程
main() {
  : > "$LOG_FILE"

  local target_dir=""
  local report_dir=""
  local generator=""

  print_banner

  # 1. 最高优先级：先检测脚本所在目录和上一层目录是否包含 Podfile。
  # 2. 自动检测成功时，不等待“准备好后按 Enter”，直接继续执行。
  # 3. 自动检测失败时，显示自述并等待回车，然后进入手动拖入目录流程。
  if detect_target_dir_from_script_location; then
    print_readme "skip"
  else
    print_readme "wait"
    prompt_target_dir
  fi

  target_dir="$SELECTED_TARGET_DIR"

  ensure_graphviz

  report_dir="$(prepare_report_dir "$target_dir")"
  generator="$report_dir/.generate_podspec_dependency_report.rb"

  write_generator_script "$generator"
  run_generator "$generator" "$target_dir" "$report_dir"
  generate_graphviz_png "$report_dir"
  open_outputs "$report_dir"
}

main "$@"
