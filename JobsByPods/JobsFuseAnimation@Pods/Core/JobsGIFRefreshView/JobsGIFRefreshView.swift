//
//  JobsGIFRefreshView.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ImageIO
import JobsByUIKit
import SnapKit

/// GIF 刷新插件，支持资源名、文件路径和 Data。
public final class JobsGIFRefreshView: UIView, JobsRefreshAnimatorProtocol {
    public var indicatorSize: CGSize {
        didSet {
            indicatorSize = CGSize(
                width: max(1, indicatorSize.width),
                height: max(1, indicatorSize.height)
            )
            invalidateIntrinsicContentSize()
        }
    }

    private let imageView = UIImageView.jobsMake { _ in }
    private var animatedImage: UIImage?
    private var firstFrame: UIImage?
    private var wantsAnimating = false

    public convenience init(gifNamed name: String,
                            bundle: Bundle = .main) {
        let resourceName = (name as NSString).deletingPathExtension
        let pathExtension = (name as NSString).pathExtension.isEmpty
            ? "gif"
            : (name as NSString).pathExtension
        let path = bundle.path(forResource: resourceName, ofType: pathExtension) ?? ""
        self.init(gifPath: path)
    }

    public convenience init(gifPath path: String) {
        let data = path.isEmpty ? Data() : (try? Data(contentsOf: URL(fileURLWithPath: path))) ?? Data()
        self.init(gifData: data)
    }

    public init(gifData data: Data) {
        indicatorSize = CGSize(width: 20, height: 20)
        super.init(frame: .zero)
        jobs_setupGIFRefreshView()
        jobs_decodeGIF(data)
    }

    required init?(coder: NSCoder) {
        indicatorSize = CGSize(width: 20, height: 20)
        super.init(coder: coder)
        jobs_setupGIFRefreshView()
    }

    public override var intrinsicContentSize: CGSize {
        indicatorSize
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        if wantsAnimating, window != nil {
            byResume()
        } else if window == nil {
            imageView.byImage(firstFrame)
        }
    }

    @discardableResult
    public func byStart() -> Self {
        wantsAnimating = true
        imageView.byImage(UIAccessibility.isReduceMotionEnabled ? firstFrame : animatedImage)
        byHidden(false)
        return self
    }

    @discardableResult
    public func byPause() -> Self {
        wantsAnimating = false
        imageView.byImage(firstFrame)
        return self
    }

    @discardableResult
    public func byResume() -> Self {
        byStart()
    }

    @discardableResult
    public func byStop() -> Self {
        wantsAnimating = false
        imageView.byImage(firstFrame)
        return self
    }

    public var refreshAnimatorView: UIView {
        self
    }

    public var refreshAnimatorPreferredSize: CGSize {
        indicatorSize
    }

    public func refreshAnimatorApply(phase: JobsRefreshAnimatorPhase,
                                     progress: CGFloat) {
        let normalizedProgress = min(1, max(0, progress))
        switch phase {
        /// 下拉过程展示 GIF 首帧并渐显缩放
        case .pulling:
            byStop()
                .byHidden(false)
                .byAlpha(0.35 + normalizedProgress * 0.65)
                .byTransform(CGAffineTransform(
                    scaleX: 0.8 + normalizedProgress * 0.2,
                    y: 0.8 + normalizedProgress * 0.2
                ))
        /// 达到阈值后展示完整首帧
        case .ready:
            byStop()
                .byHidden(false)
                .byAlpha(1)
                .byTransform(.identity)
        /// 刷新中播放 GIF
        case .refreshing:
            byAlpha(1)
                .byTransform(.identity)
            byStart()
        /// 回弹阶段停在首帧
        case .ending:
            byStop()
                .byHidden(false)
                .byAlpha(1)
                .byTransform(.identity)
        /// 空闲、失效或被替换时隐藏
        case .idle, .inactive:
            byStop()
                .byHidden(true)
                .byAlpha(0)
                .byTransform(.identity)
        }
    }

    private func jobs_setupGIFRefreshView() {
        byUserInteractionEnabled(false)
        imageView
            .byContentMode(.scaleAspectFit)
            .byUserInteractionEnabled(false)
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
    }

    private func jobs_decodeGIF(_ data: Data) {
        guard !data.isEmpty,
              let source = CGImageSourceCreateWithData(data as CFData, nil) else { return }
        var frames: [UIImage] = []
        var duration: TimeInterval = 0
        let count = CGImageSourceGetCount(source)
        for index in 0..<count {
            guard let imageRef = CGImageSourceCreateImageAtIndex(source, index, nil) else { continue }
            frames.append(UIImage(
                cgImage: imageRef,
                scale: UIScreen.main.scale,
                orientation: .up
            ))
            duration += jobs_delay(at: index, source: source)
        }
        guard let firstFrame = frames.first else { return }
        self.firstFrame = firstFrame
        animatedImage = UIImage.animatedImage(
            with: frames,
            duration: max(duration, Double(frames.count) * 0.08)
        )
        indicatorSize = CGSize(width: max(1, firstFrame.size.width), height: max(1, firstFrame.size.height))
        imageView.byImage(firstFrame)
    }

    private func jobs_delay(at index: Int,
                            source: CGImageSource) -> TimeInterval {
        let defaultDelay = 0.08
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [CFString: Any],
              let gifProperties = properties[kCGImagePropertyGIFDictionary] as? [CFString: Any] else {
            return defaultDelay
        }
        let unclampedDelay = gifProperties[kCGImagePropertyGIFUnclampedDelayTime] as? TimeInterval
        let clampedDelay = gifProperties[kCGImagePropertyGIFDelayTime] as? TimeInterval
        return max(0.02, unclampedDelay ?? clampedDelay ?? defaultDelay)
    }
}
