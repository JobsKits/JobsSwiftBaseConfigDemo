import Foundation

public extension JobsValue {
    func stringValueForNetwork() -> String {
        Self.stringify(raw)
    }

    private static func stringify(_ value: Any?) -> String {
        guard let value else { return "nil" }

        switch value {
        case let value as String:
            return value
        case let value as NSNumber:
            return value.stringValue
        case let value as URL:
            return value.absoluteString
        case let value as Date:
            return ISO8601DateFormatter().string(from: value)
        case let value as Data:
            return value.base64EncodedString()
        case let value as [String: JobsValue]:
            return value
                .sorted { $0.key < $1.key }
                .map { "\($0.key):\(stringify($0.value.raw))" }
                .joined(separator: ",")
        case let value as [String: Any]:
            return value
                .sorted { $0.key < $1.key }
                .map { "\($0.key):\(stringify($0.value))" }
                .joined(separator: ",")
        case let value as [JobsValue]:
            return value.map { stringify($0.raw) }.joined(separator: ",")
        case let value as [Any]:
            return value.map { stringify($0) }.joined(separator: ",")
        default:
            return String(describing: value)
        }
    }
}
