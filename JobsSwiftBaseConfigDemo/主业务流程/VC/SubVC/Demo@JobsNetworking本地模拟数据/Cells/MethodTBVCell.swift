//
//  MethodTBVCell.swift
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

import JobsByUIKit

final class MethodTBVCell: UITableViewCell {

    @discardableResult
    func byData(_ item: MethodDemoItem) -> Self {
        byText("\(item.methodType.title) Demo")
            .bySecondaryText("\(item.path)\n\(item.subTitle)")
            .byAccessoryType(.disclosureIndicator)
    }

    static func cellSizeByData(_ data: Any?) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 88)
    }
}
