//
//  String+通用工具.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: 一 其他通用工具
extension String {
    /// 复制当前字符串到系统剪切板
    public func paste(){
        UIPasteboard.general.string = self
    }
    /// 安全取字符
    public subscript(_ index: Int) -> Character? {
        guard index >= 0 && index < count else { return nil }
        let i = self.index(startIndex, offsetBy: index)
        return self[i]
    }
    
    public func boundingHeight(width: CGFloat, font: UIFont) -> CGFloat {
        guard width > 0 else { return 0 }
        return ceil((self as NSString).boundingRect(
            with: CGSize(width: width, height: .greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: font],
            context: nil
        ).height)
    }
}
// MARK: 一 换行处理
extension String {
    /// 处理换行："一等奖"->"一\n等\n奖\n"
    public var verticalByNewline: String {
        guard !isEmpty else { return "" }
        var result = ""
        for ch in self {
            result.append(ch)
            result.append("\n")
        };return result
    }
    /// 处理换行："一等奖" -> "一\n等\n奖"（如果你有时候不想要最后那个 `\n` 可以用这个）
    public func verticalByNewline(_ trimLastNewline: Bool) -> String {
        // ✅ 共用上面的计算属性
        var result = verticalByNewline
        if trimLastNewline, result.hasSuffix("\n") {
            result.removeLast()
        };return result
    }
    /// 处理换行：去掉字符串中的所有换行符（\n / \r / \r\n）
    public var rnl: String {
        components(separatedBy: .newlines).joined()
    }
    /// 将字符串竖排化：每字符一行（Emoji/空格也原样拆分）
    public var verticalized: String {
        guard !isEmpty else { return self }
        return self.map { String($0) }.joined(separator: "\n")
    }
}
// MARK: 一 路径相关
extension String {
    /// 尝试将任意字符串转为“可打开”的 URL：
    /// - 无 scheme 且像域名 → 自动补 `https://`
    /// - 做百分号编码，保证中文/空格安全
    public static func makeURL(from raw: String) -> URL? {
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }
        // 已包含 scheme：直接编码重建
        if trimmed.contains("://") {
            return percentEncodedURL(trimmed)
        }
        // 没有 scheme：如果像域名/路径，自动补 https://
        // 简单启发式：包含点号或以 "www." 开头，就按网址处理
        if trimmed.hasPrefix("www.") || trimmed.contains(".") {
            return percentEncodedURL("https://" + trimmed)
        };return nil// 既没 scheme 又不像网址：当成无效
    }
    /// 百分号编码（保留合法字符，编码空格、中文、emoji 等）
    public static func percentEncodedURL(_ s: String) -> URL? {
        // 尽量宽松地保留 URL 合法字符，其余编码
        var allowed = CharacterSet.urlQueryAllowed
        allowed.insert(charactersIn: "/:#?&=@!$'()*+,;[]%._~-") // 常见保留
        let encoded = s.addingPercentEncoding(withAllowedCharacters: allowed) ?? s
        return URL(string: encoded)
    }
    /// 只保留 0-9 与最前面的 '+'
    public static func sanitizePhone(_ s: String) -> String {
        let t = s.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !t.isEmpty else { return "" }
        var result = ""
        var seenPlus = false
        for ch in t {
            if ch == "+" && !seenPlus && result.isEmpty {
                result.append(ch)
                seenPlus = true
            } else if ch.isNumber {
                result.append(ch)
            }
        };return result
    }
    /// 解析多个邮箱：支持逗号/分号/空格
    public static func _parseEmails(_ raw: String) -> [String] {
        raw.split { ",; ".contains($0) }
           .map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
           .filter { !$0.isEmpty && $0.contains("@") }
    }

    public static func _makeMailtoURL(to: [String],
                               subject: String?,
                               body: String?,
                               cc: [String],
                               bcc: [String]) -> URL? {
        var comps = URLComponents()
        comps.scheme = "mailto"
        comps.path = to.joined(separator: ",")
        var items: [URLQueryItem] = []
        if let subject, !subject.isEmpty { items.append(.init(name: "subject", value: subject)) }
        if let body, !body.isEmpty       { items.append(.init(name: "body", value: body)) }
        if !cc.isEmpty { items.append(.init(name: "cc", value: cc.joined(separator: ","))) }
        if !bcc.isEmpty { items.append(.init(name: "bcc", value: bcc.joined(separator: ","))) }
        comps.queryItems = items.isEmpty ? nil : items
        return comps.url
    }
}
