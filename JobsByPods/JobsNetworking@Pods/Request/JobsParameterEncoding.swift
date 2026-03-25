import Foundation

public enum JobsParameterEncoding: Codable, Sendable {
    case urlQuery
    case jsonBody
    case formURLEncoded
    case multipart
    case rawData(Data)
}
