//
//  RootFloatingClockLayout.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import UIKit

enum RootFloatingClockLayout {

    static let horizontalPadding: CGFloat = 16
    static let verticalPadding: CGFloat = 10
    static let timeTemplate = "88:88:88"

    static func size(title: String,
                     titleFont: UIFont,
                     timeFont: UIFont,
                     availableSize: CGSize) -> CGSize {
        let naturalWidth = ceil(max((title as NSString).size(withAttributes: [.font: titleFont]).width,
                                    (timeTemplate as NSString).size(withAttributes: [.font: timeFont]).width))
            + horizontalPadding * 2
        let widthLimit = availableSize.width > 0 ? availableSize.width : naturalWidth
        let width = min(max(44, naturalWidth), widthLimit)
        let textWidth = max(1, width - horizontalPadding * 2)
        let titleHeight = textHeight(title,
                                     font: titleFont,
                                     width: textWidth)
        let timeHeight = textHeight(timeTemplate,
                                    font: timeFont,
                                    width: textWidth)
        let naturalHeight = max(44, titleHeight + timeHeight + verticalPadding * 2)
        let heightLimit = availableSize.height > 0 ? availableSize.height : naturalHeight
        return CGSize(width: width,
                      height: min(naturalHeight, heightLimit))
    }

    /// 尺寸或安全区改变时保留已吸附的边，其余位置仅做边界钳制。
    static func frame(size: CGSize,
                      currentFrame: CGRect,
                      previousArea: CGRect?,
                      availableArea: CGRect) -> CGRect {
        var origin = currentFrame.origin
        if let previousArea {
            if abs(currentFrame.minX - previousArea.minX) <= 1 {
                origin.x = availableArea.minX
            } else if abs(currentFrame.maxX - previousArea.maxX) <= 1 {
                origin.x = availableArea.maxX - size.width
            }
            if abs(currentFrame.minY - previousArea.minY) <= 1 {
                origin.y = availableArea.minY
            } else if abs(currentFrame.maxY - previousArea.maxY) <= 1 {
                origin.y = availableArea.maxY - size.height
            }
        }
        origin.x = min(max(availableArea.minX, origin.x),
                       max(availableArea.minX, availableArea.maxX - size.width))
        origin.y = min(max(availableArea.minY, origin.y),
                       max(availableArea.minY, availableArea.maxY - size.height))
        return CGRect(origin: origin,
                      size: size)
    }

    /// 只在首次真实导航布局完成后使用；以后绝不以初始位置覆盖用户落点。
    static func initialFrame(size: CGSize,
                             navigationBottom: CGFloat,
                             availableArea: CGRect) -> CGRect {
        frame(size: size,
              currentFrame: CGRect(origin: CGPoint(x: availableArea.minX + 15,
                                                    y: max(availableArea.minY, navigationBottom + 8)),
                                   size: size),
              previousArea: nil,
              availableArea: availableArea)
    }

    static func dockedFrame(_ frame: CGRect,
                            availableArea: CGRect) -> CGRect {
        let distances = [abs(frame.midX - availableArea.minX),
                         abs(availableArea.maxX - frame.midX),
                         abs(frame.midY - availableArea.minY),
                         abs(availableArea.maxY - frame.midY)]
        var docked = frame
        switch distances.enumerated().min(by: { $0.element < $1.element })?.offset {
        case 0:
            docked.origin.x = availableArea.minX
        case 1:
            docked.origin.x = availableArea.maxX - frame.width
        case 2:
            docked.origin.y = availableArea.minY
        default:
            docked.origin.y = availableArea.maxY - frame.height
        }
        return self.frame(size: frame.size,
                          currentFrame: docked,
                          previousArea: nil,
                          availableArea: availableArea)
    }

    private static func textHeight(_ text: String,
                                   font: UIFont,
                                   width: CGFloat) -> CGFloat {
        let bounds = (text as NSString).boundingRect(with: CGSize(width: width,
                                                                 height: .greatestFiniteMagnitude),
                                                    options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                    attributes: [.font: font],
                                                    context: nil)
        return ceil(max(font.lineHeight, bounds.height))
    }
}
