//
//  JobsWalletCardLayoutDelegate.swift
//  JobsWalletCard
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public protocol JobsWalletCardLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView,
                        reusableHeaderHeightFor section: Int) -> CGFloat

    func collectionView(_ collectionView: UICollectionView,
                        reusableFooterHeightFor section: Int) -> CGFloat
}
