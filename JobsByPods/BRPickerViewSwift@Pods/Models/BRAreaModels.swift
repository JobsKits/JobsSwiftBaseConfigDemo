
import Foundation

public struct BRAreaNode: Codable, Equatable {
    public var name: String
    public var children: [BRAreaNode]?

    public init(name: String, children: [BRAreaNode]? = nil) {
        self.name = name
        self.children = children
    }
}

public struct BRAreaSelection: Equatable {
    public var province: String
    public var city: String?
    public var district: String?

    public init(province: String, city: String? = nil, district: String? = nil) {
        self.province = province
        self.city = city
        self.district = district
    }
}
