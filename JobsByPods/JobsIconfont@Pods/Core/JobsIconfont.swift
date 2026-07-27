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

    public init(_ onCancel: @escaping () -> Void = {}) {
        self.onCancel = onCancel
    }

    public func cancel() {
        guard cancelled == false else { return }
        cancelled = true
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
    private let iconFontPostScriptName = "iconfontyyy"
    private let textFontPostScriptName = "AlimamaShuZhiTiVF-Regular"
    private let fontLock = NSLock()
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

    public func iconImage(
        _ glyph: JobsIconfontGlyph,
        size: CGSize,
        color: UIColor,
        backgroundColor: UIColor = .clear
    ) -> UIImage {
        let format = UIGraphicsImageRendererFormat.default()
        format.opaque = backgroundColor.cgColor.alpha >= 1
        format.scale = UIScreen.main.scale
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
    public func load(
        _ asset: JobsIconfontRemoteAsset,
        into imageView: UIImageView,
        targetSize: CGSize? = nil,
        forceRefresh: Bool = false,
        event: ((JobsIconfontLoadEvent) -> Void)? = nil
    ) -> JobsIconfontLoadToken {
        let representedAsset = asset.identifier
        let resolvedSize = targetSize.flatMap {
            $0.width > 1 && $0.height > 1 ? $0 : nil
        } ?? CGSize(width: 96, height: 96)
        let placeholder = placeholderImage(for: asset, size: resolvedSize)

        (objc_getAssociatedObject(imageView, &Self.loadTokenKey) as? JobsIconfontLoadToken)?.cancel()
        objc_setAssociatedObject(
            imageView,
            &Self.representedAssetKey,
            representedAsset,
            .OBJC_ASSOCIATION_COPY_NONATOMIC
        )
        imageView.image = placeholder
        event?(.placeholder)

        let imageToken = JobsImageLoader.shared.load(
            .remote(asset.remoteURL),
            options: .init(
                preferredLoader: .automatic,
                targetSize: resolvedSize,
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
                imageView.image = value.image
                event?(.success(
                    loader: JobsIconfontLoader(value.loaderKind),
                    isCacheHit: value.isCacheHit
                ))
            case .failure(let error):
                imageView.image = placeholder
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

    public func cancelLoad(in imageView: UIImageView) {
        (objc_getAssociatedObject(imageView, &Self.loadTokenKey) as? JobsIconfontLoadToken)?.cancel()
        objc_setAssociatedObject(imageView, &Self.loadTokenKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(imageView, &Self.representedAssetKey, nil, .OBJC_ASSOCIATION_COPY_NONATOMIC)
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
        let image = JobsIconfont.shared.iconImage(glyph, size: size, color: color)
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
        }
        return ownerBundle
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
