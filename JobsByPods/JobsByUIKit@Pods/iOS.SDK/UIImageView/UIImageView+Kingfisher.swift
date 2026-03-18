//
//  UIImageView+Kingfisher.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsImageTools
import JobsSwiftBaseDefines
//  ================================== 语义统一 ==================================
//  这里的 placeholder 统一为「兜底图(Fallback)」：
//  - URL 无效 / 本地找不到 / 请求失败：展示 placeholder
//  - 请求中：不展示 placeholder（如果要 loading 占位，请用 byShimmeringAsyncImageKF）
//  ============================================================================
//
#if canImport(Kingfisher)
import Kingfisher
extension UIImageView {
    /// placeholder = 兜底图（仅失败/无效时显示），加载中不显示
    @discardableResult
    public func kf_setImage(
        _ string: String,
        placeholder: UIImage? = nil,
        fade: TimeInterval = 0.25
    ) -> Self {
        switch string.imageSource {
        case .remote(let url)?:
            jobs_remoteURL = url
            // 复用场景建议先 cancel
            kf.cancelDownloadTask()
            // 注意：placeholder 传 nil，避免和 shimmer / 其它占位策略重复
            kf.setImage(
                with: url,
                placeholder: nil,
                options: [.transition(.fade(fade))]
            ) { [weak self] result in
                guard let self else { return }
                // 只在失败时落兜底图
                if case .failure = result {
                    self.image = placeholder
                }
            }

        case .local(let name)?:
            jobs_remoteURL = nil
            image = UIImage(named: name) ?? placeholder

        case nil:
            jobs_remoteURL = nil
            image = placeholder
        };return self
    }
    // MARK: - Shimmer Loading（两种模式）
    /// 模式 1：不配置兜底图 -> 失败后持续 shimmer
    @discardableResult
    public func byShimmeringAsyncImageKF(
        _ src: String,
        shimmerConfig: JobsShimmerConfig = .default,
        fade: TimeInterval = 0.25
    ) -> Self {
        kf_setImage(
            src,
            fallback: nil,
            fade: fade,
            shimmerConfig: shimmerConfig
        );return self
    }
    /// 模式 2：配置兜底图 -> 请求中 shimmer；失败后显示兜底图并停止 shimmer
    @discardableResult
    public func byShimmeringAsyncImageKF(
        _ src: String,
        fallback: @autoclosure @escaping @Sendable () -> UIImage,
        shimmerConfig: JobsShimmerConfig = .default,
        fade: TimeInterval = 0.25
    ) -> Self {
        kf_setImage(
            src,
            fallback: fallback(),
            fade: fade,
            shimmerConfig: shimmerConfig
        );return self
    }
    /// placeholder 在这里等价于「兜底图」
    @discardableResult
    public func byShimmeringAsyncImageKF(
        _ src: String,
        placeholder: @autoclosure @escaping @Sendable () -> UIImage
    ) -> Self {
        byShimmeringAsyncImageKF(src,
                                 fallback: placeholder(),
                                 shimmerConfig: .default,
                                 fade: 0.25)
    }
    /// 保持原来的 async 版本（不带 shimmer）
    #if compiler(>=5.5)
    @discardableResult
    public func byAsyncImageKF(
        _ src: String,
        fallback: @autoclosure @escaping @Sendable () -> UIImage
    ) -> Self {
        // 统一记录 URL，便于 JobsImageCacheCleaner 遍历重下
        if case .remote(let url)? = src.imageSource { jobs_remoteURL = url } else { jobs_remoteURL = nil }
        if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
            // iOS13+：保留 async/await 路径（内部仍用 onMainAsync）
            onMainAsync { @MainActor in
                let img = await src.kfLoadImage(fallbackImage: fallback())
                self.image = img
            }
        } else {
            // iOS12-：走 Kingfisher 回调路径（能做事）
            guard let url = (src.imageSource.flatMap { source -> URL? in
                if case .remote(let u) = source { return u }
                return nil
            }) else {
                onMainAsync { @MainActor in
                    self.image = fallback()
                };return self
            }
            // 这里用 KingfisherManager 直接下载
            KingfisherManager.shared.retrieveImage(with: url) { [weak self] result in
                guard let self else { return }
                let img: UIImage
                switch result {
                case .success(let value):
                    img = value.image
                case .failure:
                    img = fallback()
                }
                onMainAsync { @MainActor in
                    self.image = img
                }
            }
        };return self
    }
    #endif
}
#endif
