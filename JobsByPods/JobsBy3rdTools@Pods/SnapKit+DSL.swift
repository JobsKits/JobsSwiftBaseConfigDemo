//
//  SnapKit+DSL.swift
//  Pods
//
//  Created by Jobs on 27/1/26.
//

#if os(OSX)
import AppKit
public typealias MASView = NSView
#elseif os(iOS) || os(tvOS)
import UIKit
public typealias MASView = UIView
#endif

import SnapKit
// MARK: - View Masonry-style entry
public extension MASView {
    func mas_makeConstraints(_ closure: (ConstraintMaker) -> Void) { snp.makeConstraints(closure) }
    func mas_updateConstraints(_ closure: (ConstraintMaker) -> Void) { snp.updateConstraints(closure) }
    func mas_remakeConstraints(_ closure: (ConstraintMaker) -> Void) { snp.remakeConstraints(closure) }
    func mas_removeConstraints() { snp.removeConstraints() }
    @discardableResult
    func mas_prepareConstraints(_ closure: (ConstraintMaker) -> Void) -> [Constraint] { snp.prepareConstraints(closure) }
    #if !os(OSX)
    @available(iOS 11.0, tvOS 11.0, *)
    var mas_safeArea: ConstraintRelatableTarget { safeAreaLayoutGuide }
    #endif
}
// MARK: - Masonry-like aliases on SnapKit chain objects
public extension ConstraintMakerExtendable {
    var with: ConstraintMakerExtendable { self }
    @discardableResult
    func mas_equalTo(_ other: ConstraintRelatableTarget) -> ConstraintMakerEditable { equalTo(other) }
    @discardableResult
    func mas_greaterThanOrEqualTo(_ other: ConstraintRelatableTarget) -> ConstraintMakerEditable { greaterThanOrEqualTo(other) }
    @discardableResult
    func mas_lessThanOrEqualTo(_ other: ConstraintRelatableTarget) -> ConstraintMakerEditable { lessThanOrEqualTo(other) }
    @discardableResult
    func mas_equalToSuperview() -> ConstraintMakerEditable { equalToSuperview() }
    @discardableResult
    func mas_greaterThanOrEqualToSuperview() -> ConstraintMakerEditable { greaterThanOrEqualToSuperview() }
    @discardableResult
    func mas_lessThanOrEqualToSuperview() -> ConstraintMakerEditable { lessThanOrEqualToSuperview() }
}
// MARK: - Editable chain aliases (offset/inset/priority/multiplier)
public extension ConstraintMakerEditable {
    var with: ConstraintMakerEditable { self }
    @discardableResult
    func mas_offset(_ amount: ConstraintOffsetTarget) -> ConstraintMakerEditable { offset(amount) }
    @discardableResult
    func mas_inset(_ amount: ConstraintInsetTarget) -> ConstraintMakerEditable { inset(amount) }
    @discardableResult
    func mas_insets(_ amount: ConstraintInsetTarget) -> ConstraintMakerEditable { inset(amount) }
    @discardableResult
    func mas_priority(_ amount: ConstraintPriorityTarget) -> ConstraintMakerFinalizable { priority(amount) }
    @discardableResult
    func mas_multipliedBy(_ amount: ConstraintMultiplierTarget) -> ConstraintMakerEditable { multipliedBy(amount) }
    @discardableResult
    func mas_dividedBy(_ amount: ConstraintMultiplierTarget) -> ConstraintMakerEditable { dividedBy(amount) }
}

// MARK: - Label/Key (SnapKit real API: labeled returns Finalizable)
public extension ConstraintMakerFinalizable {
    @discardableResult
    func mas_labeled(_ label: String) -> ConstraintMakerFinalizable { labeled(label) }
    @discardableResult
    func mas_key(_ key: String) -> ConstraintMakerFinalizable { labeled(key) }
}
