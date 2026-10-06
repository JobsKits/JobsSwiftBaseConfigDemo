# <span id="前言">Network / Device 原生回归</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

## 一、运行 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

在工程根目录使用所选 [Xcode](https://developer.apple.com/xcode/) 的 [Swift](https://www.swift.org/) 工具链运行：

```sh
ruby .github/tests/JobsPodsUpgrade/Network/run_regressions.rb \
  --output-dir /tmp/JobsPodsNetworkRegression
```

需要项目已经安装的 Alamofire 源码。runner 不执行 pod install、不访问外网、不申请蓝牙、录音或通知权限。`--repo-root` 可指定工程，`SWIFTC` 可选择编译器；Swift 编译默认单任务，可用 `--swift-jobs` 调整；`--timeout-seconds` 指定单条命令上限，默认 600 秒。析构重入子进程最多 10 秒，卡死直接失败。系统并行构建造成资源压力时，应先降低并发并重试，不能把超时记为通过。

每一步保留独立日志，最终写入 `results.json`。普通 Core / 网络回归不替代真实 iOS Pod target 和宿主构建。

## 二、真实源码与覆盖边界 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 组 | 被测实现与重点 | 边界 |
| --- | --- | --- |
| Swift 6 值模型 | 实际 JobsValue、Envelope、Token、缓存接口等类型检查 | 选定非 UI 核心，未宣称整个工程严格并发迁移 |
| 锁释放 | 实际 Token、AsyncBox、MemoryCache、WebSocket 的 12 个析构重入场景 | 每例独立子进程；无传输或业务实现替身 |
| Crypto | 实际系统 CryptoKit/Security/CommonCrypto 路径，认证篡改、密钥/参数、legacy 格式 | macOS 原生路径；iOS 设备分支另由编译/设备验收 |
| Bluetooth | 实际 CoreBluetooth 类型、Manager/Command/Profile，加 Mock 事件控制 | Mock 覆盖就绪、MTU/队列/重试/ACK/回调重入，不证明物理外设 |
| Network controlled | 实际生产 Agent、Token、请求/缓存/上传下载代码，可控 HTTPClient | 精确控制完成/取消/安装顺序；真实网络另有对照 |
| HTTP | 实际 Alamofire 与 localhost HTTP，query/body、状态/短响应、摘要、原文件保护、fileURL multipart | 本机协议与文件测试，外网 TLS/服务端部署另验 |
| WebSocket | 实际 URLSessionWebSocketTask 与 localhost 握手、回显、pong/缺失 pong、释放/重连 | 复杂 TLS/后台/旧任务竞争仍需对应集成 |

`NativeDSLFactoryFixture.swift` 只承接两个 Foundation 工厂（JSONDecoder、URLSessionConfiguration）的 CLI 环境。iOS 工程使用实际 JobsSwiftDSL；网络传输与密码算法不使用 fixture 替代。

## 三、编译门禁 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

整个自建 Pod 门禁使用 `.github/tests/JobsPodsUpgrade/validate_builds.rb`。默认请求 2 个 Xcode 构建任务，并向 Swift 传递 `-j1`（Xcode SwiftDriver 仍可生成其它任务参数），支持 `--jobs` / `--swift-jobs`，减少多个工程同时构建时的内存压力。完整升级结果与运行限制见工程根目录 [升级与编译验收报告](../../../../JobsByPods升级与编译验收报告.md)。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
