import Foundation

public enum JobsSPMDemoKit {
    public static let version = "1.0.0"

    public static var packageSummary: String {
        "JobsSPMDemoKit v\(version)｜Library + Resource + Concurrency + Generic + Macro"
    }

    public static var macroSummary: String {
        "@EquatableBy 属于编译器宿主插件，由 swift test 与 JobsSPMDemoClient 真正执行；iOS App 不链接宏插件运行时。"
    }
}

public struct JobsSPMDemoFeature: Codable, Hashable, Identifiable, Sendable {
    public let id: String
    public let title: String
    public let detail: String

    public init(id: String, title: String, detail: String) {
        self.id = id
        self.title = title
        self.detail = detail
    }
}

public struct JobsSPMDemoCatalog: Codable, Sendable {
    public let title: String
    public let features: [JobsSPMDemoFeature]

    public init(title: String, features: [JobsSPMDemoFeature]) {
        self.title = title
        self.features = features
    }

    public static func loadBundled() throws -> JobsSPMDemoCatalog {
        guard let url = Bundle.module.url(forResource: "DemoFeatures", withExtension: "json") else {
            throw JobsSPMDemoError.resourceNotFound("DemoFeatures.json")
        };return try JSONDecoder().decode(JobsSPMDemoCatalog.self, from: Data(contentsOf: url))
    }
}

public actor JobsSPMDemoRepository {
    private let catalog: JobsSPMDemoCatalog
    private var searchCount = 0

    public init(catalog: JobsSPMDemoCatalog) {
        self.catalog = catalog
    }

    public func search(_ keyword: String) -> [JobsSPMDemoFeature] {
        searchCount += 1
        let normalized = keyword.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !normalized.isEmpty else { return catalog.features };return catalog.features.filter {
            $0.title.lowercased().contains(normalized)
                || $0.detail.lowercased().contains(normalized)
        }
    }

    public func statistics() -> String {
        "Actor 已安全处理 \(searchCount) 次查询"
    }
}

public enum JobsSPMDemoFormatter {
    public static func lines<C: Collection>(_ values: C) -> String where C.Element: CustomStringConvertible {
        values.enumerated().map { "\($0.offset + 1). \($0.element.description)" }.joined(separator: "\n")
    }
}

public enum JobsSPMDemoError: Error, LocalizedError, Sendable {
    case resourceNotFound(String)

    public var errorDescription: String? {
        switch self {
        case .resourceNotFound(let name): "SPM 资源不存在：\(name)"
        }
    }
}
