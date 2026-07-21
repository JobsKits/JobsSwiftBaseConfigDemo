//
//  JobsLabelScrollMode.swift
//  JobsScrollingLabel
//
//  Created by Jobs on 2026年7月17日，星期五.
//

import Foundation

/// UILabel 单行长文本的滚动形态。
public enum JobsLabelScrollMode: Sendable {
    /// 首尾留出间距后无缝循环。
    case continuous
    /// 在文本头尾边界之间往返。
    case pingPong
}
