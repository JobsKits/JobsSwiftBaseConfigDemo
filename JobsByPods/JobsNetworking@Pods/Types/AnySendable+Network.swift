import Foundation
import Alamofire

extension AnySendable {
    func stringValueForNetwork() -> String {
        if let s = value as? String { return s }
        return value.map { String(describing: $0) } ?? "nil"
    }
}
