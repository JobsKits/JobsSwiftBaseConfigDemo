//
//  JobsSimpleImageLoader.swift
//  JobsImageTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
/// 可以进行升级

public final class JobsSimpleImageLoader {

    public static let shared = JobsSimpleImageLoader()
    private let cache = NSCache<NSURL, UIImage>()

    private init() { cache.countLimit = 240 }

    public func cachedImage(for url: URL) -> UIImage? {
        cache.object(forKey: url as NSURL)
    }

    @discardableResult
    public func load(_ url: URL, completion: @escaping (UIImage?) -> Void) -> URLSessionDataTask? {
        if let img = cache.object(forKey: url as NSURL) {
            DispatchQueue.main.async { completion(img) }
            return nil
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let self else { return }
            guard let data, let img = UIImage(data: data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            self.cache.setObject(img, forKey: url as NSURL)
            DispatchQueue.main.async { completion(img) }
        }
        task.resume()
        return task
    }
}
