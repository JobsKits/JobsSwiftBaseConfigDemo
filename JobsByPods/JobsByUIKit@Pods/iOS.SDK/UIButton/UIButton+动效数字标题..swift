//
//  UIButton+动效数字标题.swift
//  JobsByUIKit
//
//  UIButton 主标题/副标题数字动效（仅改内容，不改结构/图文布局）
//  - 支持常用 state（normal/selected/disabled/highlighted/focused；组合态自动降级）
//  - 支持富文本：仅替换数字片段，保留原 attributes
//  - iOS15+ Configuration：安装 configurationUpdateHandler 兜底，并在安装时强制 updateConfiguration 一次
//  - 定时器：JobsSwiftTimer（JobsTimer）
//
//  Created by Jobs on 2026/2/21.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftTimer
// MARK: - Assoc
private enum _JobsBtnAnimNumAssocKey { static var store: UInt8 = 0 }
// MARK: - Model
private struct _JobsNumberTemplate {
    let rawString: String
    let numberRanges: [NSRange]
    let numberAttrs: [[NSAttributedString.Key: Any]?]
    let rawAttributed: NSAttributedString?
    var hasNumber: Bool { !numberRanges.isEmpty }
}

private final class _JobsBtnAnimNumChannel {
    var start: Double?
    var step: Double?
    var duration: TimeInterval = 0.8
    var minimumInterval: TimeInterval = 1.0 / 60.0
    var completion: (() -> Void)?

    var timer: JobsTimer?
    var targetValue: Double = 0
    var currentValue: Double = 0
    var deltaPerTick: Double = 0
    var decimals: Int = 0

    var targetTextByState: [UInt: Any] = [:]          // String / NSAttributedString
    var templateByState: [UInt: _JobsNumberTemplate] = [:]
}

private final class _JobsBtnAnimNumStore {
    let main = _JobsBtnAnimNumChannel()
    let sub  = _JobsBtnAnimNumChannel()
    // iOS15+ config 兜底：按“单态 rawValue”存（组合态会降级）
    var mainDisplayByState: [UInt: Any] = [:] // String / NSAttributedString
    var subDisplayByState:  [UInt: Any] = [:] // String / NSAttributedString

    var configHandlerInstalled = false
    var originalConfigHandler: UIButton.ConfigurationUpdateHandler?
}

extension UIButton {
     private var _jobsAnimNumStore: _JobsBtnAnimNumStore {
        if let s = objc_getAssociatedObject(self, &_JobsBtnAnimNumAssocKey.store) as? _JobsBtnAnimNumStore { return s }
        let s = _JobsBtnAnimNumStore()
        objc_setAssociatedObject(self,
                                 &_JobsBtnAnimNumAssocKey.store,
                                 s,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return s
    }
}
// MARK: - Public API（主标题）
extension UIButton {

    @discardableResult
    public func byAnimatedMainTitleNumber(start: Double? = nil,
                                          step: Double? = nil,
                                          duration: TimeInterval = 0.8,
                                          minimumInterval: TimeInterval = 1.0 / 60.0,
                                          completion: (() -> Void)? = nil) -> Self {
        let c = _jobsAnimNumStore.main
        c.start = start
        c.step = step
        c.duration = max(0, duration)
        c.minimumInterval = max(0.000_001, minimumInterval)
        c.completion = completion
        _jobsEnsureConfigHandlerIfNeeded()
        return self
    }

    @discardableResult
    public func byStartAnimatedMainTitleNumber(_ targetText: String,
                                               states: [UIControl.State]? = nil) -> Self {
        _jobsStartAnimatedNumber(channel: _jobsAnimNumStore.main,
                                 kind: .main,
                                 target: targetText,
                                 states: states)
        return self
    }

    @discardableResult
    public func byStartAnimatedMainTitleNumber(_ targetText: NSAttributedString,
                                               states: [UIControl.State]? = nil) -> Self {
        _jobsStartAnimatedNumber(channel: _jobsAnimNumStore.main,
                                 kind: .main,
                                 target: targetText,
                                 states: states)
        return self
    }

    @discardableResult
    public func byStopAnimatedMainTitleNumber() -> Self {
        _jobsStopAnimatedNumber(_jobsAnimNumStore.main)
        return self
    }
}
// MARK: - Public API（副标题）
extension UIButton {

    @discardableResult
    public func byAnimatedSubTitleNumber(start: Double? = nil,
                                         step: Double? = nil,
                                         duration: TimeInterval = 0.8,
                                         minimumInterval: TimeInterval = 1.0 / 60.0,
                                         completion: (() -> Void)? = nil) -> Self {
        let c = _jobsAnimNumStore.sub
        c.start = start
        c.step = step
        c.duration = max(0, duration)
        c.minimumInterval = max(0.000_001, minimumInterval)
        c.completion = completion
        _jobsEnsureConfigHandlerIfNeeded()
        return self
    }

    @discardableResult
    public func byStartAnimatedSubTitleNumber(_ targetText: String,
                                              states: [UIControl.State]? = nil) -> Self {
        _jobsStartAnimatedNumber(channel: _jobsAnimNumStore.sub,
                                 kind: .sub,
                                 target: targetText,
                                 states: states)
        return self
    }

    @discardableResult
    public func byStartAnimatedSubTitleNumber(_ targetText: NSAttributedString,
                                              states: [UIControl.State]? = nil) -> Self {
        _jobsStartAnimatedNumber(channel: _jobsAnimNumStore.sub,
                                 kind: .sub,
                                 target: targetText,
                                 states: states)
        return self
    }

    @discardableResult
    public func byStopAnimatedSubTitleNumber() -> Self {
        _jobsStopAnimatedNumber(_jobsAnimNumStore.sub)
        return self
    }
}
// MARK: - Core
extension UIButton {
    private enum _JobsAnimTitleKind { case main, sub }
    private func _jobsStopAnimatedNumber(_ channel: _JobsBtnAnimNumChannel) {
        channel.timer?.stop()
        channel.timer = nil
    }

    private func _jobsStartAnimatedNumber(channel: _JobsBtnAnimNumChannel,
                                          kind: _JobsAnimTitleKind,
                                          target: Any,
                                          states: [UIControl.State]?) {

        _jobsStopAnimatedNumber(channel)

        let states = states ?? _jobsCommonStates()
        channel.targetTextByState.removeAll()
        channel.templateByState.removeAll()

        let targetString = (target as? NSAttributedString)?.string ?? (target as? String) ?? ""
        guard let targetNumber = _jobsParseFirstNumber(targetString) else {
            _jobsApplyText(target, kind: kind, states: states)
            channel.completion?()
            return
        }

        let from = channel.start ?? _jobsParseFirstNumber(_jobsCurrentText(kind: kind, state: .normal)) ?? 0
        if from == targetNumber {
            _jobsApplyText(target, kind: kind, states: states)
            channel.completion?()
            return
        }

        channel.targetValue = targetNumber
        channel.currentValue = from
        channel.decimals = _jobsDecimalPlaces(of: targetString)

        let interval = max(0.000_001, channel.minimumInterval)
        let ticks = max(1, Int((channel.duration / interval).rounded(.toNearestOrAwayFromZero)))
        let delta = targetNumber - from

        let perTick: Double
        if let userStep = channel.step, userStep != 0 {
            let s = abs(userStep)
            perTick = delta > 0 ? s : -s
        } else {
            perTick = delta / Double(ticks)
        }
        channel.deltaPerTick = perTick
        // 模板：优先用“当前 state 已显示内容”；若拿不到数字（比如 configuration 延迟渲染导致空），回退用 target 作为模板
        for st in states {
            let raw = _jobsCurrentRaw(kind: kind, state: st)
            let tpl = _jobsMakeTemplate(from: raw)
            if tpl.hasNumber {
                channel.templateByState[st.rawValue] = tpl
            } else {
                channel.templateByState[st.rawValue] = _jobsMakeTemplate(from: target)
            }
            channel.targetTextByState[st.rawValue] = target
        }

        // 先落起点帧（保证第一帧就有字）
        _jobsApplyFrame(value: from,
                        channel: channel,
                        kind: kind,
                        states: states)
        let cfg = JobsSwiftTimerConfig(interval: interval,
                                       repeats: true,
                                       tolerance: 0,
                                       queue: .main,
                                       runLoop: .main,
                                       runLoopMode: .common,
                                       pauseInBackground: true,
                                       autoManageAppState: true)

        let timer = JobsTimer(kind: .foundation, config: cfg) { [weak self] in
            self?._jobsTick(channel: channel,
                            kind: kind,
                            states: states)
        }
        channel.timer = timer
        timer.start()
    }

    private func _jobsTick(channel: _JobsBtnAnimNumChannel,
                           kind: _JobsAnimTitleKind,
                           states: [UIControl.State]) {

        guard channel.timer != nil else { return }

        let target = channel.targetValue
        var cur = channel.currentValue
        let step = channel.deltaPerTick

        cur += step
        channel.currentValue = cur

        let reached = step > 0 ? (cur >= target) : (cur <= target)
        if reached {
            for st in states {
                if let t = channel.targetTextByState[st.rawValue] {
                    _jobsApplyTextOneState(t, kind: kind, state: st)
                }
            }
            _jobsStopAnimatedNumber(channel)
            channel.completion?()
            return
        }

        _jobsApplyFrame(value: cur,
                        channel: channel,
                        kind: kind,
                        states: states)
    }

    private func _jobsApplyFrame(value: Double,
                                 channel: _JobsBtnAnimNumChannel,
                                 kind: _JobsAnimTitleKind,
                                 states: [UIControl.State]) {

        let numberString = _jobsFormatNumber(value, decimals: channel.decimals)
        for st in states {
            guard let tpl = channel.templateByState[st.rawValue], tpl.hasNumber else { continue }

            if let rawAttr = tpl.rawAttributed {
                let m = NSMutableAttributedString(attributedString: rawAttr)
                for (idx, r) in tpl.numberRanges.enumerated().reversed() {
                    let attrs = tpl.numberAttrs[idx] ?? rawAttr.attributes(at: max(0, min(r.location, max(0, rawAttr.length - 1))), effectiveRange: nil)
                    m.replaceCharacters(in: r, with: NSAttributedString(string: numberString, attributes: attrs))
                }
                _jobsApplyTextOneState(m, kind: kind, state: st)
            } else {
                var s = tpl.rawString as NSString
                for r in tpl.numberRanges.reversed() {
                    s = (s.replacingCharacters(in: r, with: numberString)) as NSString
                }
                _jobsApplyTextOneState(s as String, kind: kind, state: st)
            }
        }
    }

    private func _jobsApplyText(_ target: Any,
                                kind: _JobsAnimTitleKind,
                                states: [UIControl.State]) {
        states.forEach { _jobsApplyTextOneState(target, kind: kind, state: $0) }
    }

    private func _jobsApplyTextOneState(_ target: Any,
                                        kind: _JobsAnimTitleKind,
                                        state: UIControl.State) {
        switch kind {
        case .main:
            if let a = target as? NSAttributedString {
                setAttributedTitle(a, for: state)
                _jobsAnimNumStore.mainDisplayByState[state.rawValue] = a
            } else {
                let t = target as? String
                setTitle(t, for: state)
                _jobsAnimNumStore.mainDisplayByState[state.rawValue] = (t ?? "")
            }

        case .sub:
            if let a = target as? NSAttributedString {
                if responds(to: NSSelectorFromString("byRichSubTitle:")) {
                    _ = perform(NSSelectorFromString("byRichSubTitle:"), with: a)
                } else if responds(to: NSSelectorFromString("byAttributedSubTitle:for:")) {
                    _ = perform(NSSelectorFromString("byAttributedSubTitle:for:"), with: a, with: state)
                } else {
                    bySubTitle(a.string, for: state)
                }
                _jobsAnimNumStore.subDisplayByState[state.rawValue] = a
            } else {
                let t = target as? String
                bySubTitle(t, for: state)
                _jobsAnimNumStore.subDisplayByState[state.rawValue] = (t ?? "")
            }
        }

        if #available(iOS 15.0, *) { setNeedsUpdateConfiguration() }
    }
}
// MARK: - iOS15+ Configuration 兜底（关键：避免“后创建 configuration 导致 title 丢失”）
extension UIButton {

     private func _jobsResolvedStateKey(_ state: UIControl.State) -> UInt {
        let s = _jobsAnimNumStore
        let raw = state.rawValue
        if s.mainDisplayByState[raw] != nil || s.subDisplayByState[raw] != nil { return raw }
        if state.contains(.disabled) { return UIControl.State.disabled.rawValue }
        if state.contains(.selected) { return UIControl.State.selected.rawValue }
        if state.contains(.highlighted) { return UIControl.State.highlighted.rawValue }
        if state.contains(.focused) { return UIControl.State.focused.rawValue }
        return UIControl.State.normal.rawValue
    }

    @available(iOS 15.0, *)
    private func _jobsSeedDisplayCachesAndSyncConfigTitleIfNeeded() {
        let s = _jobsAnimNumStore
        let states = _jobsCommonStates()
        // 1) seed cache：优先 legacy（因为 configuration 可能刚被创建且 title=nil）
        for st in states {
            if s.mainDisplayByState[st.rawValue] == nil {
                if let a = attributedTitle(for: st) {
                    s.mainDisplayByState[st.rawValue] = a
                } else if let t = title(for: st) ?? title(for: .normal), !t.isEmpty {
                    s.mainDisplayByState[st.rawValue] = t
                }
            }
        }
        // 2) 若 configuration 已存在但 title 丢失：立刻把 cache 的 normal 填回 cfg.title/attributedTitle
        guard var cfg = configuration else { return }
        if cfg.title == nil && cfg.attributedTitle == nil {
            if let a = s.mainDisplayByState[UIControl.State.normal.rawValue] as? NSAttributedString {
                cfg.attributedTitle = AttributedString(a)
                configuration = cfg
            } else if let t = s.mainDisplayByState[UIControl.State.normal.rawValue] as? String, !t.isEmpty {
                cfg.title = t
                configuration = cfg
            }
        }
        // subtitle seed（只能 string 兜底）
        if let sub = cfg.subtitle, !sub.isEmpty {
            for st in states where s.subDisplayByState[st.rawValue] == nil { s.subDisplayByState[st.rawValue] = sub }
        }
    }

    private func _jobsEnsureConfigHandlerIfNeeded() {
        guard #available(iOS 15.0, *) else { return }
        let s = _jobsAnimNumStore
        if s.configHandlerInstalled { return }
        s.configHandlerInstalled = true

        let existing = configurationUpdateHandler
        s.originalConfigHandler = existing
        automaticallyUpdatesConfiguration = true

        _jobsSeedDisplayCachesAndSyncConfigTitleIfNeeded()

        configurationUpdateHandler = { [weak self] btn in
            existing?(btn)
            guard let self else { return }
            guard var cfg = btn.configuration else { return }

            let key = self._jobsResolvedStateKey(btn.state)
            var changed = false

            // main
            if let a = s.mainDisplayByState[key] as? NSAttributedString {
                cfg.attributedTitle = AttributedString(a)
                changed = true
            } else if let t = s.mainDisplayByState[key] as? String {
                cfg.title = t
                changed = true
            }

            // sub：configuration 只能兜底 string
            if let a = s.subDisplayByState[key] as? NSAttributedString {
                cfg.subtitle = a.string
                changed = true
            } else if let t = s.subDisplayByState[key] as? String {
                cfg.subtitle = t
                changed = true
            }

            if changed { btn.configuration = cfg }
        }
        // 立刻触发一次，让 UI 不等下一帧/下一次系统更新
        setNeedsUpdateConfiguration()
        updateConfiguration()
    }
}
// MARK: - Current Text / Template
extension UIButton {

    private func _jobsCurrentRaw(kind: _JobsAnimTitleKind, state: UIControl.State) -> Any {
        switch kind {
        case .main:
            if let a = attributedTitle(for: state) { return a }
            return title(for: state) ?? title(for: .normal) ?? ""
        case .sub:
            if let a = _jobsPerformReturnObject("attributedSubTitleForState:", arg: state.rawValue) as? NSAttributedString { return a }
            if let t = _jobsPerformReturnObject("subTitleForState:", arg: state.rawValue) as? String { return t }
            if #available(iOS 15.0, *), let cfg = configuration, let sub = cfg.subtitle, !sub.isEmpty { return sub }
            return ""
        }
    }

    private func _jobsCurrentText(kind: _JobsAnimTitleKind, state: UIControl.State) -> String {
        let raw = _jobsCurrentRaw(kind: kind, state: state)
        return (raw as? NSAttributedString)?.string ?? (raw as? String) ?? ""
    }

    private func _jobsPerformReturnObject(_ selName: String, arg: UInt) -> AnyObject? {
        let sel = NSSelectorFromString(selName)
        guard responds(to: sel) else { return nil }
        return perform(sel, with: arg)?.takeUnretainedValue()
    }

    private func _jobsMakeTemplate(from raw: Any) -> _JobsNumberTemplate {
        if let a = raw as? NSAttributedString {
            let s = a.string
            let ranges = _jobsFindNumberRanges(in: s)
            let attrs = ranges.map { r -> [NSAttributedString.Key: Any]? in
                let loc = max(0, min(r.location, max(0, a.length - 1)))
                return a.attributes(at: loc, effectiveRange: nil)
            }
            return .init(rawString: s,
                         numberRanges: ranges,
                         numberAttrs: attrs,
                         rawAttributed: a)
        } else {
            let s = (raw as? String) ?? ""
            let ranges = _jobsFindNumberRanges(in: s)
            return .init(rawString: s,
                         numberRanges: ranges,
                         numberAttrs: Array(repeating: nil, count: ranges.count),
                         rawAttributed: nil)
        }
    }
}
// MARK: - Helpers
extension UIButton {

    private func _jobsCommonStates() -> [UIControl.State] { [.normal, .selected, .disabled, .highlighted, .focused] }

    private func _jobsParseFirstNumber(_ str: String) -> Double? {
        let ns = str as NSString
        let ranges = _jobsFindNumberRanges(in: str)
        guard let r = ranges.first else { return nil }
        return Double(ns.substring(with: r))
    }

    private func _jobsFindNumberRanges(in str: String) -> [NSRange] {
        let pattern = #"[+-]?\d+(?:\.\d+)?"#
        let ns = str as NSString
        guard let re = try? NSRegularExpression(pattern: pattern, options: []) else { return [] }
        return re.matches(in: str, options: [], range: NSRange(location: 0, length: ns.length)).map { $0.range }
    }

    private func _jobsDecimalPlaces(of str: String) -> Int {
        guard let dot = str.firstIndex(of: ".") else { return 0 }
        let frac = str[str.index(after: dot)...]
        return frac.prefix { $0.isNumber }.count
    }

    private func _jobsFormatNumber(_ v: Double, decimals: Int) -> String {
        if decimals <= 0 { return "\(Int(v.rounded()))" }
        return String(format: "%.\(decimals)f", v)
    }
}
