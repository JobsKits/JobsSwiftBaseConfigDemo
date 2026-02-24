//
//  Kingfisher.swift
//  Pods
//
//  Created by Jobs on 24/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(Kingfisher)
import Kingfisher
extension UIImageView {
    @discardableResult
    public func byKfLocalGIF(_ url: URL, fallback: UIImage? = nil) -> Self {
        guard url.isFileURL else { self.image = fallback; return self}
        kf.setImage(with: url, placeholder: fallback)
        return self
    }
}
#endif
