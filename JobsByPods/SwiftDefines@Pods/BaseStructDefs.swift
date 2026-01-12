//
//  BaseStructDefines.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/2/25.
//

import Foundation
import UIKit
// MARK: - ShadowDirection
struct ShadowDirection: OptionSet {
    let rawValue: UInt
    static let top        = ShadowDirection([])
    static let down       = ShadowDirection(rawValue: 1 << 0)
    static let left       = ShadowDirection(rawValue: 1 << 1)
    static let right      = ShadowDirection(rawValue: 1 << 2)
    static let leftTop    = ShadowDirection(rawValue: 1 << 3)
    static let leftDown   = ShadowDirection(rawValue: 1 << 4)
    static let rightTop   = ShadowDirection(rawValue: 1 << 5)
    static let rightDown  = ShadowDirection(rawValue: 1 << 6)
    static let all: ShadowDirection = [.top, .down, .left, .right, .leftTop, .leftDown, .rightTop, .rightDown]
}
// MARK: - UIBorderSideType
struct UIBorderSideType: OptionSet {
    let rawValue: UInt
    static let all    = UIBorderSideType([])
    static let top    = UIBorderSideType(rawValue: 1 << 0)
    static let bottom = UIBorderSideType(rawValue: 1 << 1)
    static let left   = UIBorderSideType(rawValue: 1 << 2)
    static let right  = UIBorderSideType(rawValue: 1 << 3)
}
// MARK: - 这样写的话，外面可以JobsIndexPath.section 进行调用
struct JobsIndexPath {
    var section: Int
    var rowOrItem: Int
}
// MARK: - 无数据占位图的类型
struct JobsEmptyViewType: OptionSet {
    let rawValue: UInt
    static let none       = JobsEmptyViewType([])
    static let label      = JobsEmptyViewType(rawValue: 1 << 0)
    static let button     = JobsEmptyViewType(rawValue: 1 << 1)
    static let customView = JobsEmptyViewType(rawValue: 1 << 2)
}
