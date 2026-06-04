//
//  ImageLoader.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

final class ImageLoader {
    static let shared = ImageLoader()
    private let cache = NSCache<NSURL, UIImage>()

    @discardableResult
    func load(url: URL?,
              into imageView: UIImageView,
              placeholder: UIImage? = nil) -> URLSessionDataTask? {
        imageView.image = placeholder
        guard let url = url else { return nil }
        if let cached = cache.object(forKey: url as NSURL) { imageView.image = cached; return nil }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            var img: UIImage? = nil
            if let d = data { img = UIImage(data: d) }
            if let i = img { self?.cache.setObject(i, forKey: url as NSURL) }
            DispatchQueue.main.async { imageView.image = img ?? placeholder }
        }
        task.resume()
        return task
    }
}
