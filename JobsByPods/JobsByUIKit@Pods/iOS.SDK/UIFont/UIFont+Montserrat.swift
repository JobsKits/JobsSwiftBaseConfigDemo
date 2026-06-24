//
//  UIFont+Montserrat.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

extension UIFont {
    
    public enum Montserrat {

        public static func Regular(_ size: CGFloat) -> UIFont {
            switch Bundle.lang() {
            case .vietnamese, .turkish:
                return UIFont.Roboto.Regular(size)
            case .thai:
                return UIFont.Mitr.Regular(size)
            case .arabic:
                return UIFont.SFArabic.Regular(size)
            default:
                return make("Montserrat-Regular", size, fallback: .regular)
            }
        }

        public static func Medium(_ size: CGFloat) -> UIFont {
            switch Bundle.lang() {
            case .vietnamese, .turkish:
                return UIFont.Roboto.Regular(size)
            case .thai:
                return UIFont.Mitr.Regular(size)
            case .arabic:
                return UIFont.SFArabic.Regular(size)
            default:
                return make("Montserrat-Medium", size, fallback: .medium)
            }
        }

        public static func Semibold(_ size: CGFloat) -> UIFont {
            switch Bundle.lang() {
            case .vietnamese, .turkish:
                return UIFont.Roboto.Regular(size)
            case .thai:
                return UIFont.Mitr.Regular(size)
            case .arabic:
                return UIFont.SFArabic.Regular(size)
            default:
                return make("Montserrat-SemiBold", size, fallback: .semibold)
            }
        }

        public static func SemiboldItalic(_ size: CGFloat) -> UIFont {
            switch Bundle.lang() {
            case .vietnamese, .turkish:
                return UIFont.Roboto.Regular(size)
            case .thai:
                return UIFont.Mitr.Regular(size)
            case .arabic:
                return UIFont.SFArabic.Regular(size)
            default:
                return make("Montserrat-SemiBoldItalic", size, fallback: .semibold)
            }
        }

        private static func make(_ name: String,
                                 _ size: CGFloat,
                                 fallback: UIFont.Weight) -> UIFont {
            UIFont(name: name, size: size) ?? .systemFont(ofSize: size, weight: fallback)
        }
    }
}
