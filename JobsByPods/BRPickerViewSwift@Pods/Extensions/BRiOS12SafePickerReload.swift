
import UIKit

enum BRiOS12SafePickerReload {
    /// iOS 12/13 wheel picker can glitch if you reload synchronously during scrolling.
    static func reload(_ picker: UIPickerView, component: Int? = nil) {
        br_on_main_async {
            if let c = component { picker.reloadComponent(c) }
            else { picker.reloadAllComponents() }
        }
    }
}
