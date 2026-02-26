
import UIKit

public extension UIColor {
    convenience init?(br_hex: String) {
        var s = br_hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if s.hasPrefix("#") { s.removeFirst() }
        guard s.count == 6 || s.count == 8 else { return nil }
        var v: UInt64 = 0
        guard Scanner(string: s).scanHexInt64(&v) else { return nil }
        let a: CGFloat
        let r: CGFloat
        let g: CGFloat
        let b: CGFloat
        if s.count == 8 {
            a = CGFloat((v & 0xFF000000) >> 24) / 255.0
            r = CGFloat((v & 0x00FF0000) >> 16) / 255.0
            g = CGFloat((v & 0x0000FF00) >> 8) / 255.0
            b = CGFloat(v & 0x000000FF) / 255.0
        } else {
            a = 1.0
            r = CGFloat((v & 0xFF0000) >> 16) / 255.0
            g = CGFloat((v & 0x00FF00) >> 8) / 255.0
            b = CGFloat(v & 0x0000FF) / 255.0
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
