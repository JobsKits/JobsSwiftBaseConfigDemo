//
//  WalletLayoutDelegate.swift
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

protocol WalletLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView,
                        reusableHeaderHeightFor section: Int) -> CGFloat

    func collectionView(_ collectionView: UICollectionView,
                        reusableFooterHeightFor section: Int) -> CGFloat
}
