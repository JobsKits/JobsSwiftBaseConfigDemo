//
//  UIPageControl+网络背景图.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/16.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import SnapKit

#if canImport(SDWebImage)
import SDWebImage
#endif

#if canImport(Kingfisher)
import Kingfisher
#endif

private var kJobsPCNormalImageKey: UInt8 = 0
private var kJobsPCCurrentImageKey: UInt8 = 0
extension UIPageControl {
    /// 设置“其他页/当前页”指示器图片（本地 UIImage）
    public func jobs_setIndicatorImages(normal: UIImage?, current: UIImage?) {
        objc_setAssociatedObject(self,
                                 &kJobsPCNormalImageKey,
                                 normal,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self,
                                 &kJobsPCCurrentImageKey,
                                 current,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if #available(iOS 14.0, *) {
            self.preferredIndicatorImage = normal
        }
        jobs_applyIndicatorImagesIfNeeded()
    }
    /// 每次 currentPage/numberOfPages 变化后调用它刷新图片
    public func jobs_applyIndicatorImagesIfNeeded() {
        let normal = objc_getAssociatedObject(self, &kJobsPCNormalImageKey) as? UIImage
        let current = objc_getAssociatedObject(self, &kJobsPCCurrentImageKey) as? UIImage
        guard normal != nil || current != nil else { return }
        if #available(iOS 14.0, *) {
            // iOS14+: 先全部设 normal，再把 currentPage 设 current
            if self.numberOfPages > 0 {
                for i in 0..<self.numberOfPages {
                    self.setIndicatorImage(normal, forPage: i)
                }
                if self.currentPage >= 0, self.currentPage < self.numberOfPages {
                    self.setIndicatorImage(current ?? normal, forPage: self.currentPage)
                }
            };return
        }
        // iOS13-: hack：遍历 subviews，在每个 dot 上塞 UIImageView
        let dots = self.subviews
        for (idx, dot) in dots.enumerated() {
            let imageView = jobs_dotImageView(in: dot)
            if idx == self.currentPage {
                imageView.image = current ?? normal
            } else {
                imageView.image = normal
            }
            imageView.contentMode = .scaleAspectFit
        }
    }
    /// DSL：外界只关心：normalURL/currentURL + fallback 图片
    /// 下载成功后会自动调用 jobs_setIndicatorImages(normal:current:)
    public func jobs_setIndicatorImageURLs(
        normalURL: URL?,
        currentURL: URL?,
        fallbackNormal: UIImage?,
        fallbackCurrent: UIImage?
    ) {
        // 先用兜底图顶上，保证立即有 UI
        self.jobs_setIndicatorImages(normal: fallbackNormal, current: fallbackCurrent)
        let group = DispatchGroup()
        var normalImage: UIImage? = fallbackNormal
        var currentImage: UIImage? = fallbackCurrent
        group.enter()
        jobs_loadImage(url: normalURL, fallback: fallbackNormal) { img in
            normalImage = img ?? fallbackNormal
            group.leave()
        }
        group.enter()
        jobs_loadImage(url: currentURL, fallback: fallbackCurrent) { img in
            currentImage = img ?? fallbackCurrent
            group.leave()
        }
        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.jobs_setIndicatorImages(normal: normalImage, current: currentImage)
        }
    }

    private func jobs_dotImageView(in dot: UIView) -> UIImageView {
        if let iv = dot.subviews.compactMap({ $0 as? UIImageView }).first { return iv }
        let iv = UIImageView()
        dot.addSubview(iv)
        // SnapKit 约束：居中 + 尺寸不超过 dot 本身
        iv.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()
            make.height.lessThanOrEqualToSuperview()
        };return iv
    }

    private func jobs_loadImage(url: URL?,
                                fallback: UIImage?,
                                completion: @escaping (UIImage?) -> Void) {
        guard let url else {
            DispatchQueue.main.async { completion(fallback) }
            return
        }
        #if canImport(SDWebImage)
        SDWebImageManager.shared.loadImage(
            with: url,
            options: [.retryFailed, .highPriority],
            progress: nil
        ) { image, _, error, _, _, _ in
            DispatchQueue.main.async {
                if error != nil { completion(fallback) }
                else { completion(image ?? fallback) }
            }
        };return
        #endif

        #if canImport(Kingfisher)
        KingfisherManager.shared.retrieveImage(with: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value): completion(value.image)
                case .failure: completion(fallback)
                }
            }
        };return
        #endif
        // 无 SD/KF：退化 URLSession
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async { completion(image ?? fallback) }
        }
        task.resume()
    }
}
