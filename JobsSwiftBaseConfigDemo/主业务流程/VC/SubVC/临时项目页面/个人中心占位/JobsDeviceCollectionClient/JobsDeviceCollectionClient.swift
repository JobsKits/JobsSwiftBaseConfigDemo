//
//  JobsDeviceCollectionClient.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月6日，星期五.
//

import Foundation

import JobsNetworking

final class JobsDeviceCollectionClient {

    private let baseURL: URL
    private let timeout: TimeInterval
    private let agent: JobsDefaultAgent

    var siteAddress: String {
        baseURL.absoluteString
    }

    init() {
        let configured = Bundle.main.object(forInfoDictionaryKey: "JobsDeviceInfoBaseURL") as? String
        let candidate = URL(string: configured ?? "")
        let defaultURL = URL(string: "https://jobs-device-info-pages.pages.dev/")!
        if let candidate,
           candidate.scheme == "https",
           candidate.host != nil,
           candidate.user == nil,
           candidate.password == nil,
           candidate.query == nil,
           candidate.fragment == nil {
            baseURL = candidate
        } else {
            baseURL = defaultURL
        }
        let configuredTimeout = Bundle.main.object(forInfoDictionaryKey: "JobsDeviceInfoRequestTimeout") as? Double ?? 6
        timeout = configuredTimeout.isFinite ? min(15, max(2, configuredTimeout)) : 6
        let config = JobsRequestConfig(baseURL: baseURL,
                                      timeout: timeout,
                                      defaultRetryPolicy: JobsRetryPolicy(maxRetries: 0,
                                                                          initialDelay: 0,
                                                                          multiplier: 1),
                                      logger: JobsLogger(isEnabled: false),
                                      usesEphemeralSession: true)
        // 同一个 agent 保留本轮内存 Cookie；不创建磁盘业务缓存。
        agent = JobsDefaultAgent(config: config,
                                 diskCache: JobsMemoryCache())
    }

    func request(_ path: String,
                 method: HTTPMethod = .get,
                 completion: @escaping (Result<JobsDeviceCollectionSession.Response, JobsError>) -> Void) -> JobsRequestToken {
        let origin = "\(baseURL.scheme!)://\(baseURL.host!)\(baseURL.port.map { ":\($0)" } ?? "")"
        // 绝对 URL 避免全局 Demo 调试环境把短期采集凭据送到其它后端。
        let request = JobsRequest(path: baseURL.appendingPathComponent(path).absoluteString,
                                  method: method,
                                  body: method == .post ? [:] : nil,
                                  headers: ["Origin": origin, "Accept": "application/json"],
                                  timeout: timeout,
                                  encoding: .jsonBody,
                                  cachePolicy: .disabled)
        return agent.send(request,
                          as: JobsDeviceCollectionSession.Response.self,
                          completion: completion)
    }

    func pairingURL(token: String) -> URL? {
        guard token.range(of: "^[0-9a-f]{64}$",
                          options: .regularExpression) != nil else {
            return nil
        }
        var components = URLComponents(url: baseURL,
                                       resolvingAgainstBaseURL: false)
        components?.fragment = "pair=\(token)"
        return components?.url
    }
}
