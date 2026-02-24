//
//  SDWebImage.swift
//  Pods
//
//  Created by Jobs on 24/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(SDWebImage)
import SDWebImage
extension UIImageView {
    @discardableResult
    public func bySDLocalGIF(_ url: URL?, fallback: UIImage? = nil) -> Self {
        guard let url, url.isFileURL else {
            image = fallback
            return self
        }
        sd_setImage(with: url, placeholderImage: fallback)
        return self
    }
}
#endif
