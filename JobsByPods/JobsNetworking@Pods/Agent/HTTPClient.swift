//
//  HTTPClient.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
import Alamofire

protocol HTTPClient {
    func perform(
        _ req: JobsPreparedRequest,
        completion: @escaping (Swift.Result<(Data, HTTPURLResponse), JobsError>) -> Void
    )

    func download(
        absoluteURL: URL,
        headers: HTTPHeaders,
        destinationURL: URL,
        trace: JobsTrace,
        timeout: TimeInterval?,
        completion: @escaping (Swift.Result<(URL, HTTPURLResponse), JobsError>) -> Void
    )

    func uploadMultipart(
        url: URL,
        method: HTTPMethod,
        headers: HTTPHeaders,
        form: [String: AnySendable],
        parts: [JobsMultipartPart],
        trace: JobsTrace,
        timeout: TimeInterval?,
        completion: @escaping (Swift.Result<(Data, HTTPURLResponse), JobsError>) -> Void
    )

    func cancel(requestId: String)
}
