
import UIKit

enum BRPickerHaptics {
    static func successIfNeeded(_ enabled: Bool) {
        guard enabled else { return }
        if #available(iOS 10.0, *) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}
