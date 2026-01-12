//
//  SimpleImageLoader.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/20/25.
//

import Foundation
/// 可以进行升级
final class SimpleImageLoader {

    static let shared = SimpleImageLoader()
    private let cache = NSCache<NSURL, UIImage>()

    private init() { cache.countLimit = 240 }

    func cachedImage(for url: URL) -> UIImage? {
        cache.object(forKey: url as NSURL)
    }

    @discardableResult
    func load(_ url: URL, completion: @escaping (UIImage?) -> Void) -> URLSessionDataTask? {
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
