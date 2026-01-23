//
//  String+格式转换.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: 字符串相关格式的（通用）转换
extension String {
    /// String 转 Int
    public func intValue() -> Int? {
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        };return num.intValue
    }

    public func toInt() -> Int {
        return Int(self) ?? 0
    }
    /// String 转 Int64
    public func toInt64() -> Int64? {
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        };return num.int64Value
    }
    /// String 转 Double
    public func toDouble() -> Double? {
        let formatter = NumberFormatter()
            .byLocale(Locale(identifier: "en_US_POSIX")) // 固定使用 . 作为小数点
            .byNumberStyle(.decimal)
            .byGroupingSeparator(",")                   // 千分位逗号
            .byDecimalSeparator(".")                    // 小数点 .
        return formatter.number(from: self.trimmingCharacters(in: .whitespacesAndNewlines))?.doubleValue
    }
    /// String 转 Double
    public func toDouble(_ max: Int, _ min: Int) -> Double? {
        let format = NumberFormatter()
            .byMaximumFractionDigits(max)
            .byMinimumFractionDigits(min)
        guard let num = format.number(from: self) else {
            return nil
        };return num.doubleValue
    }
    /// String 转 Float
    public func toFloat() -> Float? {
        guard let num = NumberFormatter().number(from: self) else {
            return nil
        };return num.floatValue
    }
    /// String 转 Bool
    public func toBool() -> Bool? {
        let trimmedString = self
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
        switch trimmedString {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    /// String 转 NSString
    public var toNSString: NSString {
        return self as NSString
    }
    /// String 转 NSAttributedString
    /// 转富文本（默认空属性）
    public var rich: NSAttributedString {
        NSAttributedString(string: self)
    }
    /// 转富文本并附加属性
    public func rich(_ attrs: [NSAttributedString.Key: Any]) -> NSAttributedString {
        NSAttributedString(string: self, attributes: attrs)
    }
    /// 将字符串竖排化：每字符一行（Emoji/空格也原样拆分）
    public var verticalized: String {
        guard !isEmpty else { return self }
        return self.map { String($0) }.joined(separator: "\n")
    }
}
