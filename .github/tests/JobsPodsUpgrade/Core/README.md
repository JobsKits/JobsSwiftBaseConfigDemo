# <span id="前言">Core 回归入口</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

## 一、运行 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

在工程根目录使用所选 [Xcode](https://developer.apple.com/xcode/) 工具链运行，无须执行 CocoaPods 安装或 xcodebuild：

```sh
ruby .github/tests/JobsPodsUpgrade/Core/run_regressions.rb
```

默认在系统临时目录保存编译产物和每条命令的日志。可显式指定输出目录：

```sh
ruby .github/tests/JobsPodsUpgrade/Core/run_regressions.rb --output /tmp/JobsPodsCoreRegression
```

真实 [WebKit](https://developer.apple.com/documentation/webkit) 资源回归使用 AppKit 桌面进程和本机临时 HTTP 端口，按需启用：

```sh
ruby .github/tests/JobsPodsUpgrade/Core/run_regressions.rb --webkit
```

`JOBS_CORE_WEBKIT=1` 等价于 `--webkit`。选择该项后，渲染超时或桌面 WebKit 不可用都会失败，不把环境失败当作通过。普通 CI 先运行默认 Foundation 组；桌面探针可在有可用 WindowServer / WebKit 进程环境的 macOS runner 独立启用。

默认运行 6 组回归、6 次执行与 18 条编译/执行命令；启用 WebKit 后为 7 组、8 次执行、21 条命令，包含禁止和允许两次 HTTP 对照。

## 二、证据范围 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 回归 | 实际验证 | 明确边界 |
| ---- | ---- | ---- |
| 既有 JobsSwiftBlockRegression | 真实 NSObject 工厂与 JobsCallbackable | 直接编译这两个生产文件，不使用工厂替身 |
| Block 存储释放 | 真实 JobsCallbackable 清除/替换时捕获析构重入读写和调用，覆盖 NSObject 与纯 Swift 宿主 | 析构发生在宿主仍存活期间；存储安全不替代捕获业务状态的并发隔离 |
| Numeric | 真实 SafeCodable、Snowflake、UserDefaults、Array Builder、BinaryInteger | ISO8601DateFormatter 工厂用 ByUIKitFixture 承接；DSLFixture 只再导出，不证明生产 UIKit / DSL 工厂 |
| Patch | 真实 Runtime patch 管理器、继承隔离、ABI 拒绝、快照、乱序回滚、并发安装 | 普通对象返回的具体业务类型必须由调用方保证兼容 NSDictionary；运行时 `@` 不能证明具体类型 |
| Worker / Task | 全部 TaskCenter / Worker 的 macOS 有效源码，双队列交叉 execute、等待取消、最后事件、异步 drain、弱释放、同键替换及中心回收 | TimerFixture 是独立 GCD 计时替身；真实 Timer 配置、枚举与协议参加编译，四内核实现、RunLoop 剩余时间与 iOS UI Binder 不在此组验证 |
| l10n | 真实 Foundation 语言管理、Bundle override、slot 绑定、重绑与释放 | 使用隔离 UserDefaults suite；不改用户 standard 偏好；UIKit 独立属性设置由 iOS 测试覆盖 |
| WebKit 可选组 | 真实 index.html、Jobs 自有 jobs-markdown.js 与原样第三方资源，真实 WKWebView / CSP / 内容规则 / 锚点 | 原生 UIKit JobsMarkdownView 未参加本探针；禁止模式必须零 HTTP 请求，允许模式必须大于零，使用对照排除环境自身不联网的假通过 |

这些测试使用 [Swift](https://www.swift.org/) 5 语言模式，输出中的模块名是测试产物；它们不替代每个真实 iOS Pod 单元与宿主工程整体编译，也不替代 IME、滚动和前后台的设备交互验收。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
