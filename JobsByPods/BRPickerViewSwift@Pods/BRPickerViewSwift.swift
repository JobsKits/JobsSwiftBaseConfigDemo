//
//  BRPickerViewSwift.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/23/25.
//

import Foundation

extension Collection {
     public subscript(safe i: Index) -> Element? {
        indices.contains(i) ? self[i] : nil
    }
}

extension Comparable {
    public func clamped(_ r: ClosedRange<Self>) -> Self {
        min(max(self, r.lowerBound), r.upperBound)
    }
}

public enum BRTextPickerMode: Int { case single, multi, cascade }
public enum BRDatePickerMode: Int {
    case date, dateAndTime, time, countDownTimer
    case ymdhms, ymdhm, ymdh, mdhm, ymd, ym, y, md, hms, hm, ms, yq, ymw, yw
}

public protocol TextCascadeNode {
    var text: String { get }
    var value: String? { get }
    var children: [TextCascadeNode] { get }
}
// 级联数据节点（示例）
public struct RegionNode: TextCascadeNode {
    public let text: String
    public let value: String?
    public let children: [TextCascadeNode]
    public init(text: String,
                value: String? = nil,
                children: [TextCascadeNode] = []) {
        self.text = text
        self.value = value
        self.children = children
    }
}

public final class BRTextModel: NSObject {
    public let text: String
    public let value: String?
    public init(_ text: String, value: String? = nil) {
        self.text = text
        self.value = value
    }
    public override var description: String {
        value ?? text
    }
}
