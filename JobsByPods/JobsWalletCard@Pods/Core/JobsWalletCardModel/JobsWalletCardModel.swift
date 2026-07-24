//
//  JobsWalletCardModel.swift
//  JobsWalletCard
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public struct JobsWalletCardModel {
    public let bankName: String
    public let lastDigits: String
    public let holder: String
    public let brand: String
    public let gradientColors: [UIColor]

    public init(bankName: String,
                lastDigits: String,
                holder: String,
                brand: String,
                gradientColors: [UIColor]) {
        self.bankName = bankName
        self.lastDigits = lastDigits
        self.holder = holder
        self.brand = brand
        self.gradientColors = gradientColors
    }
}
