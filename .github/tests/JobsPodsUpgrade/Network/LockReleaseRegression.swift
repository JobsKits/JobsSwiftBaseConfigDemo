//
//  LockReleaseRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

final class ReleaseProbe {
    let action: () -> Void

    init(_ action: @escaping () -> Void) {
        self.action = action
    }

    deinit {
        action()
    }
}

@main
struct LockReleaseRegression {
    static func main() {
        let mode = CommandLine.arguments[1]
        if mode.hasPrefix("token-") {
            let token = JobsRequestToken()
            var releases = 0
            func install() {
                let probe = ReleaseProbe {
                    _ = token.isCancelled
                    releases += 1
                }
                token.setCancel {
                    withExtendedLifetime(probe) {}
                }
            }
            install()
            if mode == "token-replace" {
                token.setCancel {}
            } else {
                token.finish {}
            }
            precondition(releases == 1)
        } else if mode.hasPrefix("async-") {
            let box = JobsAsyncResultBox<Int>()
            var releases = 0
            func token() -> JobsRequestToken {
                let probe = ReleaseProbe {
                    box.cancel()
                    releases += 1
                }
                let token = JobsRequestToken()
                token.setCancel {
                    withExtendedLifetime(probe) {}
                }
                return token
            }
            box.install(token())
            if mode == "async-replace" {
                let replacement = JobsRequestToken()
                box.install(replacement)
                precondition(replacement.isCancelled)
            } else {
                box.complete(.success(1))
            }
            precondition(releases == 1)
        } else if mode.hasPrefix("memory-") {
            let cache = JobsMemoryCache(maximumEntryCount: 1, staleGrace: 0)
            let key = JobsCacheKey(raw: "first")
            var releases = 0
            func value() -> JobsCachedValue {
                let pointer = UnsafeMutableRawPointer.allocate(byteCount: 4_096, alignment: 16)
                pointer.initializeMemory(as: UInt8.self, repeating: 42, count: 4_096)
                let data = Data(bytesNoCopy: pointer, count: 4_096, deallocator: .custom { pointer, _ in
                    pointer.deallocate()
                    cache.removeAll()
                    releases += 1
                })
                return JobsCachedValue(data: data, expiry: mode == "memory-expire" ? .distantPast : .distantFuture)
            }
            cache.set(key: key, value: value())
            switch mode {
            case "memory-replace":
                cache.set(key: key, value: JobsCachedValue(data: Data([1]), expiry: .distantFuture))
            case "memory-evict":
                cache.set(key: JobsCacheKey(raw: "second"), value: JobsCachedValue(data: Data([1]), expiry: .distantFuture))
            case "memory-clear":
                cache.removeAll()
            case "memory-expire":
                precondition(cache.get(key: key) == nil)
            default:
                cache.remove(key: key)
            }
            precondition(releases == 1)
        } else {
            let client = JobsSwiftWebSocketClient()
            var releases = 0
            func install() {
                let probe = ReleaseProbe {
                    _ = client.state
                    releases += 1
                }
                switch mode {
                case "websocket-state":
                    client.onStateChange = { _ in withExtendedLifetime(probe) {} }
                case "websocket-text":
                    client.onTextMessage = { _ in withExtendedLifetime(probe) {} }
                default:
                    client.onDataMessage = { _ in withExtendedLifetime(probe) {} }
                }
            }
            install()
            switch mode {
            case "websocket-state":
                client.onStateChange = nil
            case "websocket-text":
                client.onTextMessage = nil
            default:
                client.onDataMessage = nil
            }
            precondition(releases == 1)
        }
        print("PASS lock release reentrancy: \(mode)")
    }
}
