//
//  DioMethodCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit

final class DioMethodCell: UITableViewCell {

    @discardableResult
    func byData(_ item: DioMethodDemoItem) -> Self {
        byText("\(item.methodType.title) Demo")
            .bySecondaryText("\(item.path)\n\(item.subTitle)")
            .byAccessoryType(.disclosureIndicator)
    }

    static func cellSizeByData(_ data: Any?) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 88)
    }
}
