//
//  JobsCellConfig.swift
//  Pods
//
//  Created by Jobs on 18/1/2569 BE.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsTextTools
// MARK: - 通用于 UITableViewCell 和 UICollectionViewCell 的模型组件
public struct JobsCellConfig {
    public let title: JobsText?
    public let detail: JobsText?
    public let image: UIImage?
    public let data: Any?

    public init(title: JobsText? = nil,
                detail: JobsText? = nil,
                image: UIImage? = nil,
                data: Any? = nil) {
        self.title = title
        self.detail = detail
        self.image = image
        self.data = data
    }
}
