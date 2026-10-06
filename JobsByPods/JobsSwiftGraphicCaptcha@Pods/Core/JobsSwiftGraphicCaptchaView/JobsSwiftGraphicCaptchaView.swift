//
//  JobsSwiftGraphicCaptchaView.swift
//  JobsSwiftGraphicCaptcha
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsSwiftDSL

#if os(iOS) || os(tvOS)
public struct JobsGraphicCaptchaChallenge {
    public let identifier: String
    public let image: UIImage
    public let expiresAt: Date?

    public init(identifier: String, image: UIImage, expiresAt: Date? = nil) {
        self.identifier = identifier
        self.image = image
        self.expiresAt = expiresAt
    }
}

public enum JobsGraphicCaptchaError: Error {
    case serverProviderMissing
    case challengeUnavailable
    case cancelled
    case timedOut
}

public final class JobsSwiftGraphicCaptchaView: UIView {
    public var config: JobsSwiftGraphicCaptchaConfig = .defaultConfig {
        didSet { refreshCaptcha() }
    }
    public var captchaText: String = "" {
        didSet { setNeedsDisplay() }
    }
    public var font: UIFont = JobsFont.boldSystemFont(ofSize: 18)
    public var textColor: UIColor?
    public var captchaBackgroundColor: UIColor = UIColor(gray: 255, alpha: 0.92)
    public var interferenceLineCount: Int = 7
    public var noisePointCount: Int = 18
    public var shouldRefreshWhenTapped: Bool = true
    public var refreshHandler: ((String) -> Void)?
    public var usesServerValidation = false {
        didSet { refreshCaptcha() }
    }
    public var requestTimeout: TimeInterval = 15
    public var serverChallengeProvider: ((@escaping (Result<JobsGraphicCaptchaChallenge, Error>) -> Void) -> (() -> Void)?)?
    public var serverVerifier: ((String, String, @escaping (Result<Bool, Error>) -> Void) -> (() -> Void)?)?
    public var onChallengeChanged: ((JobsGraphicCaptchaChallenge?) -> Void)?
    public var onChallengeFailure: ((Error) -> Void)?
    public private(set) var serverChallenge: JobsGraphicCaptchaChallenge?
    private var refreshGeneration: UInt64 = 0
    private var isLoadingChallenge = false
    private var refreshCancellation: (() -> Void)?
    private var refreshTimeoutWork: DispatchWorkItem?
    private var verificationGeneration: UInt64 = 0
    private var verificationID: UUID?
    private var verificationCompletion: ((Result<Bool, Error>) -> Void)?
    private var verificationCancellation: (() -> Void)?
    private var verificationTimeoutWork: DispatchWorkItem?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    deinit {
        refreshTimeoutWork?.cancel()
        verificationTimeoutWork?.cancel()
        refreshCancellation?()
        verificationCancellation?()
    }

    public func refreshCaptcha() {
        let generation = refreshGeneration &+ 1
        cancelPendingRequests()
        guard refreshGeneration == generation else { return }
        serverChallenge = nil
        onChallengeChanged?(nil)
        guard refreshGeneration == generation else { return }
        if !usesServerValidation {
            captchaText = JobsSwiftGraphicCaptchaGenerator.randomText(config: config)
            refreshHandler?(captchaText)
            return
        }
        captchaText = ""
        guard let provider = serverChallengeProvider else {
            onChallengeFailure?(JobsGraphicCaptchaError.serverProviderMissing)
            return
        }
        isLoadingChallenge = true
        let work = DispatchWorkItem { [weak self] in
            guard let self, self.refreshGeneration == generation, self.isLoadingChallenge else { return }
            let cancel = self.refreshCancellation
            self.finishChallenge(.failure(JobsGraphicCaptchaError.timedOut), generation: generation)
            cancel?()
        }
        refreshTimeoutWork = work
        DispatchQueue.main.asyncAfter(deadline: .now() + effectiveTimeout, execute: work)
        let cancel = provider { [weak self] result in
            DispatchQueue.main.async {
                self?.finishChallenge(result, generation: generation)
            }
        }
        if refreshGeneration == generation, isLoadingChallenge {
            refreshCancellation = cancel
        } else {
            cancel?()
        }
    }

    /// Synchronous comparison is only for the local demonstration generator.
    public func validateInput(_ input: String?) -> Bool {
        guard !usesServerValidation else { return false }
        return JobsSwiftGraphicCaptchaGenerator.validate(input: input,
                                                          captcha: captchaText,
                                                          caseSensitive: config.caseSensitive)
    }

    public func verifyInput(_ input: String?, completion: @escaping (Result<Bool, Error>) -> Void) {
        verificationGeneration &+= 1
        let generation = verificationGeneration
        finishVerification(.failure(JobsGraphicCaptchaError.cancelled), cancelOperation: true)
        guard verificationGeneration == generation else {
            completion(.failure(JobsGraphicCaptchaError.cancelled))
            return
        }
        guard usesServerValidation else {
            completion(.success(validateInput(input)))
            return
        }
        guard let challenge = serverChallenge,
              challenge.expiresAt.map({ $0 > Date() }) ?? true,
              let input, !input.isEmpty else {
            completion(.failure(JobsGraphicCaptchaError.challengeUnavailable))
            return
        }
        guard let verifier = serverVerifier else {
            completion(.failure(JobsGraphicCaptchaError.serverProviderMissing))
            return
        }
        let id = UUID()
        verificationID = id
        verificationCompletion = completion
        let work = DispatchWorkItem { [weak self] in
            guard self?.verificationID == id else { return }
            self?.finishVerification(.failure(JobsGraphicCaptchaError.timedOut), cancelOperation: true)
        }
        verificationTimeoutWork = work
        DispatchQueue.main.asyncAfter(deadline: .now() + effectiveTimeout, execute: work)
        let cancel = verifier(challenge.identifier, input) { [weak self] result in
            DispatchQueue.main.async {
                guard let self, self.verificationID == id else { return }
                var didConsumeChallenge = false
                if case .success(true) = result {
                    self.serverChallenge = nil
                    didConsumeChallenge = true
                    self.setNeedsDisplay()
                }
                self.finishVerification(result, cancelOperation: false, beforeCallback: {
                    if didConsumeChallenge {
                        self.onChallengeChanged?(nil)
                    }
                })
            }
        }
        if verificationID == id {
            verificationCancellation = cancel
        } else {
            cancel?()
        }
    }

    public func cancelPendingRequests() {
        refreshGeneration &+= 1
        verificationGeneration &+= 1
        isLoadingChallenge = false
        refreshTimeoutWork?.cancel()
        refreshTimeoutWork = nil
        let cancel = refreshCancellation
        refreshCancellation = nil
        finishVerification(.failure(JobsGraphicCaptchaError.cancelled), cancelOperation: true)
        cancel?()
    }

    private var effectiveTimeout: TimeInterval {
        requestTimeout.isFinite && requestTimeout > 0 ? min(requestTimeout, 300) : 15
    }

    private func finishChallenge(_ result: Result<JobsGraphicCaptchaChallenge, Error>, generation: UInt64) {
        guard refreshGeneration == generation, isLoadingChallenge else { return }
        isLoadingChallenge = false
        refreshTimeoutWork?.cancel()
        refreshTimeoutWork = nil
        refreshCancellation = nil
        switch result {
        case .success(let challenge):
            guard !challenge.identifier.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                  challenge.expiresAt.map({ $0 > Date() }) ?? true else {
                onChallengeFailure?(JobsGraphicCaptchaError.challengeUnavailable)
                return
            }
            serverChallenge = challenge
            onChallengeChanged?(challenge)
            setNeedsDisplay()
        case .failure(let error):
            onChallengeFailure?(error)
        }
    }

    private func finishVerification(_ result: Result<Bool, Error>, cancelOperation: Bool,
                                    beforeCallback: (() -> Void)? = nil) {
        let callback = verificationCompletion
        let cancel = verificationCancellation
        verificationCompletion = nil
        verificationID = nil
        verificationCancellation = nil
        verificationTimeoutWork?.cancel()
        verificationTimeoutWork = nil
        if cancelOperation {
            cancel?()
        }
        beforeCallback?()
        callback?(result)
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard !rect.isEmpty, let context = UIGraphicsGetCurrentContext() else { return }
        captchaBackgroundColor.setFill()
        UIRectFill(rect)
        if usesServerValidation {
            serverChallenge?.image.draw(in: rect)
        } else {
            drawNoise(in: rect, context: context)
            drawCaptchaText(in: rect, context: context)
        }
    }
}

private extension JobsSwiftGraphicCaptchaView {
    func commonInit() {
        isOpaque = false
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                    action: #selector(jobs_refreshCaptchaByTap)))
        refreshCaptcha()
    }

    @objc func jobs_refreshCaptchaByTap() {
        if shouldRefreshWhenTapped {
            refreshCaptcha()
        }
    }

    func drawCaptchaText(in rect: CGRect, context: CGContext) {
        let text = captchaText.isEmpty ? JobsSwiftGraphicCaptchaGenerator.randomText(config: config) : captchaText
        let characters = text.map { String($0) }
        guard !characters.isEmpty else { return }
        let cellWidth = rect.width / CGFloat(characters.count)
        let centerY = rect.midY
        for (idx, character) in characters.enumerated() {
            let textColor = self.textColor ?? JobsSwiftGraphicCaptchaView.randomColor(alpha: 0.95)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: textColor
            ]
            let textSize = character.size(withAttributes: attributes)
            let x = cellWidth * CGFloat(idx) + max(2, (cellWidth - textSize.width) / 2) + Self.randomCGFloat(-2, 2)
            let y = centerY - textSize.height / 2 + Self.randomCGFloat(-4, 4)
            context.saveGState()
            context.translateBy(x: x + textSize.width / 2, y: y + textSize.height / 2)
            context.rotate(by: Self.randomCGFloat(-0.28, 0.28))
            character.draw(at: CGPoint(x: -textSize.width / 2, y: -textSize.height / 2),
                           withAttributes: attributes)
            context.restoreGState()
        }
    }

    func drawNoise(in rect: CGRect, context: CGContext) {
        context.setLineWidth(1)
        for _ in 0..<max(0, min(interferenceLineCount, 1_000)) {
            context.setStrokeColor(Self.randomColor(alpha: 0.72).cgColor)
            context.move(to: CGPoint(x: Self.randomCGFloat(rect.minX, rect.maxX),
                                     y: Self.randomCGFloat(rect.minY, rect.maxY)))
            context.addLine(to: CGPoint(x: Self.randomCGFloat(rect.minX, rect.maxX),
                                        y: Self.randomCGFloat(rect.minY, rect.maxY)))
            context.strokePath()
        }
        for _ in 0..<max(0, min(noisePointCount, 10_000)) {
            let pointRect = CGRect(x: Self.randomCGFloat(rect.minX, rect.maxX),
                                   y: Self.randomCGFloat(rect.minY, rect.maxY),
                                   width: Self.randomCGFloat(1, 2.4),
                                   height: Self.randomCGFloat(1, 2.4))
            Self.randomColor(alpha: 0.55).setFill()
            UIRectFill(pointRect)
        }
    }

    static func randomCGFloat(_ minValue: CGFloat, _ maxValue: CGFloat) -> CGFloat {
        guard maxValue > minValue else { return minValue };return minValue + (maxValue - minValue) * CGFloat.random(in: 0...1)
    }

    static func randomColor(alpha: CGFloat) -> UIColor {
        UIColor(h: randomCGFloat(0, 1),
                s: randomCGFloat(0.45, 0.95),
                b: randomCGFloat(0.45, 0.95),
                a: alpha)
    }
}
#endif
