//
//  JobsLabBridgeHandler.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import Foundation
import WebKit
import JobsByUIKit

/// Hybrid 从“大网页”演进到可注册、独立发布的微应用；Bridge 是网页请求宿主能力的窄接口。
/// 正式接入须验证离线包签名/版本、来源、参数、权限和调用频率，不能把任意 JS 映射成 selector。
final class JobsLabBridgeHandler: NSObject, WKScriptMessageHandler {
    weak var webView: WKWebView?
    var onResult: ((String) -> Void)?

    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        guard let expected = JobsMicroAppLabBaseVC.resourceURL("microapp.html"),
              message.webView === webView,
              message.frameInfo.isMainFrame,
              message.frameInfo.request.url?.standardizedFileURL == expected.standardizedFileURL else {
            onResult?("已拒绝 Bridge：仅允许已注册本地微应用的主 frame。")
            return
        }
        let result = handle(message.body)
        onResult?(result.message)
        guard let data = try? JSONSerialization.data(withJSONObject: ["ok": result.ok, "message": result.message]),
              let json = String(data: data, encoding: .utf8) else {
            return
        }
        message.webView?.jobsEval("window.receiveNative(\(json))")
    }

    /// 纯参数校验方便直接测试；操作名仅命中两项白名单，写入固定命名空间而非由网页指定路径。
    func handle(_ body: Any) -> (ok: Bool, message: String) {
        guard let envelope = body as? [String: Any],
              let action = envelope["action"] as? String,
              Set(envelope.keys).isSubset(of: ["action", "payload"]) else {
            return (false, "已拒绝 Bridge：消息格式不正确。")
        }
        switch action {
        /// 只返回明确允许的非敏感宿主信息
        case "getHostInfo":
            return (true, "Bridge 成功：Swift 宿主 / 教学微应用 v1 / iOS \(ProcessInfo.processInfo.operatingSystemVersion.majorVersion)")
        /// 网页提交受长度约束的文本，由宿主决定存储位置
        case "saveDraft":
            guard let payload = envelope["payload"] as? [String: Any],
                  payload.count == 1,
                  let text = payload["text"] as? String,
                  !text.isEmpty, text.count <= 140 else {
                return (false, "已拒绝 Bridge：草稿必须为 1–140 字文本。")
            }
            do {
                try JobsLabSandboxStore(namespace: "microapp").write(text)
                return (true, "Bridge 成功：草稿已写入 microapp 命名空间。")
            } catch {
                return (false, "Bridge 写入失败：\(error.localizedDescription)")
            }
        /// 通讯录等未授权能力不向微应用开放
        default:
            return (false, "已拒绝 Bridge：\(action) 不在能力白名单。")
        }
    }
}
