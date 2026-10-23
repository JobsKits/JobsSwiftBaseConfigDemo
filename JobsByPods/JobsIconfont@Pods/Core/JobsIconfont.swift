//
//  JobsIconfont.swift
//  JobsIconfont
//
//  Created by Jobs on 2026年7月25日，星期六.
//

import CoreText
import JobsImageTools
import ObjectiveC
import UIKit

import JobsSwiftDSL

public enum JobsIconfontRemoteAsset: CaseIterable {
    case logo
    case fontBanner
    case usageGuide
    case invalidURL

    public var title: String {
        switch self {
        case .logo: return "iconfont Logo"
        case .fontBanner: return "阿里妈妈·智造字"
        case .usageGuide: return "iOS 接入说明"
        case .invalidURL: return "错误 URL"
        }
    }
}

public enum JobsIconfontGlyph: CaseIterable {
    case switcher
    case iPhone
    case direction
    case picture
    case lodging
    case sort
    case previous
    case next
    case verified
    case component

    public var title: String {
        switch self {
        case .switcher: return "切换"
        case .iPhone: return "iPhone"
        case .direction: return "方向"
        case .picture: return "图片"
        case .lodging: return "住宿"
        case .sort: return "排序"
        case .previous: return "上一个"
        case .next: return "下一个"
        case .verified: return "实名认证"
        case .component: return "组件"
        }
    }
}

public enum JobsIconfontLoader: String {
    case sdwebimage = "SDWebImage"
    case kingfisher = "Kingfisher"
    case urlSession = "URLSession"
    case unknown = "Unknown"
}

public enum JobsIconfontLoadEvent {
    case placeholder
    case success(loader: JobsIconfontLoader, isCacheHit: Bool)
    case failure(Error)
}

public final class JobsIconfontLoadToken {
    private let onCancel: () -> Void
    private var cancelled = false
    private let lock = NSLock()

    public init(_ onCancel: @escaping () -> Void = {}) {
        self.onCancel = onCancel
    }

    public func cancel() {
        lock.lock()
        guard !cancelled else {
            lock.unlock()
            return
        }
        cancelled = true
        lock.unlock()
        onCancel()
    }

    deinit {
        cancel()
    }
}

public final class JobsIconfont {
    public static let shared = JobsIconfont()

    private static var representedAssetKey: UInt8 = 0
    private static var loadTokenKey: UInt8 = 0
    private static var scaleObservationKey: UInt8 = 0
    private static var reloadForScaleKey: UInt8 = 0
    fileprivate static var glyphScaleObservationKey: UInt8 = 0
    fileprivate static var glyphReloadKey: UInt8 = 0
    private let iconFontPostScriptName = "iconfontyyy"
    private let textFontPostScriptName = "AlimamaShuZhiTiVF-Regular"
    private let fontLock = NSLock.jobsMake { _ in }
    private var registeredFontFiles = Set<String>()

    public init() {}

    public func iconFont(ofSize size: CGFloat) -> UIFont {
        registerFont(filename: "JobsIconfontSample.ttf")
        return UIFont(name: iconFontPostScriptName, size: size)
            ?? UIFont.systemFont(ofSize: size)
    }

    public func textFont(ofSize size: CGFloat) -> UIFont {
        registerFont(filename: "AlimamaShuzhiti-Regular.ttf")
        return UIFont(name: textFontPostScriptName, size: size)
            ?? UIFont.systemFont(ofSize: size)
    }

    @available(*, deprecated, message: "Use iconImage(_:size:color:backgroundColor:traitCollection:) with the rendering view traits.")
    public func iconImage(
        _ glyph: JobsIconfontGlyph,
        size: CGSize,
        color: UIColor,
        backgroundColor: UIColor = .clear
    ) -> UIImage {
        return iconImage(glyph,
                         size: size,
                         color: color,
                         backgroundColor: backgroundColor,
                         traitCollection: .current)
    }

    public func iconImage(
        _ glyph: JobsIconfontGlyph,
        size: CGSize,
        color: UIColor,
        backgroundColor: UIColor = .clear,
        traitCollection: UITraitCollection
    ) -> UIImage {
        let size = CGSize(width: size.width.isFinite && size.width > 0 ? min(size.width, 1_024) : 96,
                          height: size.height.isFinite && size.height > 0 ? min(size.height, 1_024) : 96)
        let backgroundColor = backgroundColor.resolvedColor(with: traitCollection)
        let color = color.resolvedColor(with: traitCollection)
        let format = UIGraphicsImageRendererFormat.default()
        format.opaque = backgroundColor.cgColor.alpha >= 1
        format.scale = max(traitCollection.displayScale, 1)
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { context in
            backgroundColor.setFill()
            context.fill(CGRect(origin: .zero, size: size))
            let pointSize = max(1, min(size.width, size.height) * 0.72)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: iconFont(ofSize: pointSize),
                .foregroundColor: color
            ]
            let string = glyph.unicodeString as NSString
            let bounds = string.boundingRect(
                with: size,
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                attributes: attributes,
                context: nil
            )
            string.draw(
                at: CGPoint(
                    x: (size.width - ceil(bounds.width)) / 2,
                    y: (size.height - ceil(bounds.height)) / 2
                ),
                withAttributes: attributes
            )
        }
    }

    public func placeholderImage(
        for asset: JobsIconfontRemoteAsset,
        size: CGSize,
        color: UIColor = .systemGray3
    ) -> UIImage {
        iconImage(asset.fallbackGlyph, size: size, color: color)
    }

    @discardableResult
    @MainActor
    public func load(
        _ asset: JobsIconfontRemoteAsset,
        into imageView: UIImageView,
        targetSize: CGSize? = nil,
        forceRefresh: Bool = false,
        event: ((JobsIconfontLoadEvent) -> Void)? = nil
    ) -> JobsIconfontLoadToken {
        let reloadForScale: () -> Void = { [weak imageView, weak self] in
            guard let imageView, let self else {
                return
            }
            self.load(asset, into: imageView, targetSize: targetSize, forceRefresh: forceRefresh, event: event)
        }
        objc_setAssociatedObject(imageView, &Self.reloadForScaleKey, reloadForScale, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        if #available(iOS 17.0, *), objc_getAssociatedObject(imageView, &Self.scaleObservationKey) == nil {
            objc_setAssociatedObject(imageView, &Self.scaleObservationKey, true, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            imageView.registerForTraitChanges([UITraitDisplayScale.self]) { (view: UIImageView, _: UITraitCollection) in
                (objc_getAssociatedObject(view, &Self.reloadForScaleKey) as? () -> Void)?()
            }
        }
        let representedAsset = asset.identifier + "#" + UUID().uuidString
        let resolvedSize = targetSize.flatMap {
            $0.width.isFinite && $0.height.isFinite && $0.width > 1 && $0.height > 1
                ? CGSize(width: min($0.width, 1_024), height: min($0.height, 1_024)) : nil
        } ?? CGSize(width: 96, height: 96)
        let placeholder = iconImage(asset.fallbackGlyph, size: resolvedSize, color: .systemGray3, traitCollection: imageView.traitCollection)

        (objc_getAssociatedObject(imageView, &Self.loadTokenKey) as? JobsIconfontLoadToken)?.cancel()
        objc_setAssociatedObject(
            imageView,
            &Self.representedAssetKey,
            representedAsset,
            .OBJC_ASSOCIATION_COPY_NONATOMIC
        )
        imageView.byImage(placeholder)
        event?(.placeholder)

        let imageToken = JobsImageLoader.shared.load(
            .remote(asset.remoteURL),
            options: .init(
                preferredLoader: .automatic,
                targetSize: resolvedSize,
                scale: imageView.traitCollection.displayScale,
                forceRefresh: forceRefresh
            )
        ) { [weak imageView] result in
            guard let imageView,
                  objc_getAssociatedObject(
                    imageView,
                    &Self.representedAssetKey
                  ) as? String == representedAsset else { return }
            switch result {
            case .success(let value):
                imageView.byImage(value.image)
                event?(.success(
                    loader: JobsIconfontLoader(value.loaderKind),
                    isCacheHit: value.isCacheHit
                ))
            case .failure(let error):
                imageView.byImage(placeholder)
                event?(.failure(error))
            }
        }
        let token = JobsIconfontLoadToken { imageToken.cancel() }
        objc_setAssociatedObject(
            imageView,
            &Self.loadTokenKey,
            token,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        return token
    }

    @MainActor
    public func cancelLoad(in imageView: UIImageView) {
        (objc_getAssociatedObject(imageView, &Self.loadTokenKey) as? JobsIconfontLoadToken)?.cancel()
        objc_setAssociatedObject(imageView, &Self.loadTokenKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(imageView, &Self.representedAssetKey, nil, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(imageView, &Self.reloadForScaleKey, nil, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }

    public func clearImageCache(_ completion: (() -> Void)? = nil) {
        JobsImageLoader.shared.clearMemoryCache()
        let group = DispatchGroup()
        group.enter()
        JobsImageCacheCleaner.clearSDWebImageCache { group.leave() }
        group.enter()
        JobsImageCacheCleaner.clearKingfisherCache { group.leave() }
        group.notify(queue: .main) {
            completion?()
        }
    }
}

public extension UIImageView {
    @discardableResult
    func byJobsIconfont(
        _ asset: JobsIconfontRemoteAsset,
        targetSize: CGSize? = nil,
        forceRefresh: Bool = false,
        event: ((JobsIconfontLoadEvent) -> Void)? = nil
    ) -> Self {
        JobsIconfont.shared.load(
            asset,
            into: self,
            targetSize: targetSize,
            forceRefresh: forceRefresh,
            event: event
        )
        return self
    }

    @discardableResult
    func byCancelJobsIconfontLoad() -> Self {
        JobsIconfont.shared.cancelLoad(in: self)
        return self
    }
}

public extension UILabel {
    @discardableResult
    func byJobsIconfont(
        _ glyph: JobsIconfontGlyph,
        size: CGFloat,
        color: UIColor
    ) -> Self {
        font = JobsIconfont.shared.iconFont(ofSize: size)
        text = glyph.unicodeString
        textColor = color
        return self
    }

    @discardableResult
    func byJobsIconfontText(size: CGFloat) -> Self {
        font = JobsIconfont.shared.textFont(ofSize: size)
        return self
    }
}

public extension UIButton {
    @discardableResult
    func byJobsIconfont(
        _ glyph: JobsIconfontGlyph,
        size: CGSize,
        color: UIColor,
        for state: UIControl.State = .normal
    ) -> Self {
        var reloads = objc_getAssociatedObject(self, &JobsIconfont.glyphReloadKey) as? [UInt: (UIButton) -> Void] ?? [:]
        reloads[state.rawValue] = { button in
            let image = JobsIconfont.shared.iconImage(glyph,
                                                      size: size,
                                                      color: color,
                                                      traitCollection: button.traitCollection)
            button.setImage(image, for: state)
        }
        objc_setAssociatedObject(self, &JobsIconfont.glyphReloadKey, reloads, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if #available(iOS 17.0, *), objc_getAssociatedObject(self, &JobsIconfont.glyphScaleObservationKey) == nil {
            objc_setAssociatedObject(self, &JobsIconfont.glyphScaleObservationKey, true, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            registerForTraitChanges([UITraitDisplayScale.self, UITraitUserInterfaceStyle.self]) { (button: UIButton, _: UITraitCollection) in
                let reloads = objc_getAssociatedObject(button, &JobsIconfont.glyphReloadKey) as? [UInt: (UIButton) -> Void] ?? [:]
                reloads.values.forEach { reload in
                    reload(button)
                }
            }
        }
        let image = JobsIconfont.shared.iconImage(glyph, size: size, color: color, traitCollection: traitCollection)
        setImage(image, for: state)
        return self
    }
}

private extension JobsIconfont {
    final class BundleToken {}

    var resourceBundle: Bundle {
        let ownerBundle = Bundle(for: BundleToken.self)
        let urls = [
            ownerBundle.url(forResource: "JobsIconfontAssets", withExtension: "bundle"),
            Bundle.main.url(forResource: "JobsIconfontAssets", withExtension: "bundle")
        ]
        for url in urls.compactMap({ $0 }) {
            if let bundle = Bundle(url: url) { return bundle }
        };return ownerBundle
    }

    func registerFont(filename: String) {
        fontLock.lock()
        defer { fontLock.unlock() }
        guard registeredFontFiles.contains(filename) == false else { return }
        let file = filename as NSString
        guard let url = resourceBundle.url(
            forResource: file.deletingPathExtension,
            withExtension: file.pathExtension
        ) else { return }
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterFontsForURL(
            url as CFURL,
            .process,
            &error
        )
        let postScriptName = filename == "JobsIconfontSample.ttf"
            ? iconFontPostScriptName
            : textFontPostScriptName
        if success || UIFont(name: postScriptName, size: 12) != nil {
            registeredFontFiles.insert(filename)
        }
    }
}

private extension JobsIconfontRemoteAsset {
    var identifier: String {
        switch self {
        case .logo: return "logo"
        case .fontBanner: return "fontBanner"
        case .usageGuide: return "usageGuide"
        case .invalidURL: return "invalidURL"
        }
    }

    var remoteURL: URL {
        switch self {
        case .logo:
            return URL(string: "https://img.alicdn.com/imgextra/i4/O1CN01XZe8pH1USpiUNT1QN_!!6000000002517-2-tps-114-114.png")!
        case .fontBanner:
            return URL(string: "https://img.alicdn.com/imgextra/i1/O1CN01vqHHzA1JvGYdLg5KV_!!6000000001090-2-tps-2280-452.png")!
        case .usageGuide:
            return URL(string: "https://img.alicdn.com/tfscom/T1R3VxFuRnXXaCwpjX.png")!
        case .invalidURL:
            return URL(string: "https://at.alicdn.com/t/jobs-iconfont-invalid-demo.png")!
        }
    }

    var fallbackGlyph: JobsIconfontGlyph {
        switch self {
        case .logo: return .component
        case .fontBanner: return .switcher
        case .usageGuide: return .iPhone
        case .invalidURL: return .picture
        }
    }
}

private extension JobsIconfontGlyph {
    var unicodeString: String {
        switch self {
        case .switcher: return "\u{e601}"
        case .iPhone: return "\u{e602}"
        case .direction: return "\u{e603}"
        case .picture: return "\u{e605}"
        case .lodging: return "\u{e606}"
        case .sort: return "\u{e607}"
        case .previous: return "\u{e608}"
        case .next: return "\u{e609}"
        case .verified: return "\u{e60a}"
        case .component: return "\u{e60c}"
        }
    }
}

private extension JobsIconfontLoader {
    init(_ kind: JobsImageLoaderKind) {
        switch kind {
        case .sdwebimage: self = .sdwebimage
        case .kingfisher: self = .kingfisher
        case .urlSession: self = .urlSession
        case .unknown: self = .unknown
        }
    }
}
