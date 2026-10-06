# JobsByPods 自建 Pod 审阅与升级建议报告

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 本报告保留升级前审阅快照，原行号对应当时源码。后续实际实施和构建结论见 [升级与编译验收报告](./JobsByPods升级与编译验收报告.md)。

审阅日期：**2026-10-05，Asia/Shanghai**。对象为本工程 `JobsByPods/` 下除 `ManualBySwiftPods@Pods/` 外的自建目录，以审阅时的**当前工作区源码，包括已有未提交修改**为基准。

结论：**有必要继续升级，但主要收益来自修复边界行为、闭合异步生命周期、建立针对性回归和缩小模块依赖。现有分层与大量成熟封装值得保留。** 功能已经能演示，不等于取消、失败、重入、复用、多窗口和异常数据路径已经可靠。

本报告由 [**Codex**](https://openai.com/codex) 对实际实现、依赖定义、宿主测试和使用入口进行审阅，结合独立探针复核部分问题。语言与构建基础涉及 <u>[**Swift**](https://www.swift.org/)</u>、[**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)、[**CocoaPods**](https://cocoapods.org/) 和 [**Xcode**](https://developer.apple.com/xcode/)。报告中的建议尚未应用到 Pod 源码。

## 一、先做什么与保留什么 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 安排 | 重点对象 | 目标 |
| --- | --- | --- |
| 优先修复 | `JobsNetworking`、`JobsGetWindow`、`JobsInheritance`、`JobsSwiftDSL`、`JobsSwiftBaseTools`、`JobsSwiftFoundation`、`JobsSwiftMarkdown`、`JobsSwiftPatch` | 消除静默错数据、合法输入崩溃及范围外的运行时修改 |
| 同一轮完成生命周期加固 | `JobsSwiftTaskCenter`、`JobsSwiftWorker`、`JobsSwiftTools`、`BRPickerViewSwift`、`JobsCountdownButton`、`JobsSwiftRefresher` | 取消可收口、终态一次、旧异步回调失效、对象释放后停止工作 |
| 按真实使用推进 | `JobsBluetooth`、`JobsCryptoKit`、`JobsImageTools`、`JobsScreenCapture`、`JobsSwiftCalendar` | 明确能力承诺、传输确认、格式兼容、缓存和场景边界 |
| 保持设计并扩大有效回归 | `JobsSwiftTimer`、`JobsSwiftTimerMgr`、`JobsSwiftBlock` | 保留已实现的生命周期锁、generation、背压、精准取消与真实测试 |
| 分阶段做工程升级 | 基础封装和第三方适配 Pods | 渐进并发检查、按需依赖、独立消费验证、发布资源完整性 |
| 按需保留 | 薄桥接、扩展占位和小型稳定组件 | 明确状态；以真实业务需求决定扩展，不按代码量判断价值 |

值得保留的实现包括：

- `JobsSwiftTimer` 已有四种内核、时间真值、回调投递策略和生命周期治理；`JobsSwiftTimerMgr` 已有稳定标识、替换保护、`expectedTimer` 精准取消及 Scope。宿主测试覆盖这些机制，后续以补真实缺口为主。
- `JobsSwiftBlock` 将创建工厂与回调存储收口，已有独立回归；本次实际运行通过。
- `JobsNetworking` 的 Agent、请求配置、缓存、重试、上传/下载分层清晰。已发现的问题可以在现有分层中修复，保留上层统一入口。
- `JobsSwiftDSL` 与系统创建工厂已经分离；显式 podspec 依赖图未发现自建模块循环。中文 README 普遍已经说明架构和能力边界。
- 薄桥接 README 已说明 DSL 迁移，蓝牙 README 已说明未消费的命令参数；这些诚实的边界声明应继续保留。

## 二、范围、方法和验证结果 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 2.1、覆盖口径 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 结果 |
| --- | --- |
| 自建一级目录 | 67 个，含 2 个无源码/podspec 的目录 |
| podspec / README | 各 65 份 |
| 源文件物理清点 | 636 个 `.swift/.h/.m/.mm`，88,704 行，含空行和注释 |
| podspec 语法 | 65/65 通过 `ruby -c` |
| 显式自建依赖循环 | 未发现；按 `dependency` 字面量去重计算，不代表完整链接分析 |
| Pod 内 `test_spec` | 0；宿主中实际存在测试，不等于没有测试 |
| 宿主 XCTest / UI 测试方法 | 14 / 4 个；UI 部分包含模板和启动测试 |
| 自建 Pod 隐私清单 | 发现 1 份，位于 `JobsBluetooth`，已声明资源 bundle |

先通过工程已有 [**CodeGraph**](https://github.com/colbymchenry/codegraph) 定位和读取关键实现，再检查索引未覆盖部分、配置、README、宿主使用及测试。对网络/设备、并发/数据、UI/生命周期分别审阅并交叉复核。**全目录清点与重点链路审阅，不是对 8.9 万行每一行都完成形式化证明。** 第四章标明各模块的阅读深度。

排除 `ManualBySwiftPods@Pods/`、根 `Pods/` 的第三方实现、供应商及生成代码；必要时只读上游声明核对 API 类型。发布脚本未执行，也未进行完整 Shell 行为审计。现有未提交源码、Podfile、锁文件、工程和 README 的改动未被本任务改写。

### 2.2、证据等级与优先级 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 标识 | 含义 |
| --- | --- |
| 实测 | 当前真实源码或明确标出的独立最小探针已运行；只证明该探针覆盖的行为 |
| 源码确认 | 能指出完整触发路径；尚未在完整 App 或设备上执行 |
| 条件性加固 | 使用范围、平台或接入约定决定必要性，先确认需求再实施 |
| P1 | 优先处理：可导致崩溃、错数据、取消后写操作、越界修改或关键异步流程不收尾 |
| P2 | 应安排：常见失败/重入/复用路径不可靠，或独立交付与能力契约不完整 |
| P3 | 按需：模块瘦身、兼容期治理、工程便利性与新增能力 |

优先级不是已上线事故数量，也不是利用难度评级。对可选入口，只有真实启用后才产生对应影响；不能把每个库都视为必须立刻重写。

### 2.3、已执行与尚未执行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

实际执行：65 份 podspec 的 Ruby 语法检查、源文件/资源/依赖存在性清点、`JobsSwiftBlock` 的既有 macOS Foundation 回归，以及第三章注明的独立边界探针。探针产物均在系统临时目录，不加入工程或发布包。

未执行：`pod install` / `pod lib lint`、整工程 `xcodebuild`、宿主 XCTest / UI 测试、模拟器双架构回归 IR、真机蓝牙/相机/录音/多 Scene 验证、App Store 上传及最终隐私报告。**不能将语法通过、独立探针或源码确认写成整个 App 已通过验证。**

## 三、具体问题与最小升级方案 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、P1｜JobsNetworking：错误下载可以覆盖已有有效文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认，未发真实下载请求。** [JobsNetworking / HTTPClient.swift L135](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:135>) 使用最终目标与 `.removePreviousFile`，下载没有状态校验；[JobsNetworking / JobsDefaultAgent+Download.swift L39](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:39>) 只要存在文件和 response 就回报成功。

触发：服务器返回带正文的 404/500，传输和移动文件本身成功。错误 HTML/JSON 会替换旧好文件。普通 `send` 已检查 2xx，下载链路未沿用该保护。

**最小升级**：下载到本次临时文件，校验 2xx、必要的长度/内容或校验和、取消状态后原子替换；失败保留旧文件。只在上层补状态判断仍无法挽回已被覆盖的旧文件。

**验收**：回显服务覆盖 200/404/500/断流/取消；只有有效成功可改变旧文件，所有结果恰好一次。底层 [**Alamofire**](https://github.com/Alamofire/Alamofire) 提供 [响应校验机制](https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md)，需显式接入。

### 3.2、P1｜JobsNetworking：取消没有覆盖重试等待与令牌注册 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：部分实测，其余源码确认。** [JobsNetworking / JobsDefaultAgent.swift L181](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:181>) 在退避后直接再发请求，发请求前没有检查取消，直到响应才检查；[JobsNetworking / JobsDefaultAgent+Upload.swift L99](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:99>) 上传重试也如此。取消退避中的 PUT/DELETE 等请求后仍可能发送下一次写操作。

[JobsNetworking / JobsRequestToken.swift L17](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:17>) 对“先 cancel、后 setCancel”只存 handler，不承接已发生的取消。真实源码探针输出 `cancel_before_registration_invoked=false`。其 `isCancelled` 读取也未受写入锁保护。

[JobsNetworking / JobsAgent+Async.swift L17](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Async/JobsAgent+Async.swift:17>) 及上传/下载 Async 桥接共享无锁局部 token；Task 提前或赋值前取消可能看到 nil，随后请求仍创建。这部分竞态尚未在宿主实跑。

**最小升级**：受同步保护的 request context 统一管理取消、实际请求、待重试任务及一次性终态；绑定 handler 时承接旧取消，创建请求前核验，取消时撤销重试。Async 使用同一 context。

**验收**：预先取消、绑定中取消、退避取消、上传取消、完成与取消并发；取消后新增请求数为 0，等待/回调按约定返回且只有一次。

### 3.3、P2｜JobsNetworking：请求准备会静默丢弃参数或附件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认。** [JobsNetworking / JobsPreparedRequest.swift L51](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Agent/JobsPreparedRequest.swift:51>) 允许 query 与 JSON/Form body 并存，但 [JobsNetworking / JobsDefaultAgent.swift L223](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:223>) 相关分支仅消费 body。POST/PATCH 的租户等 query 没到服务端，缓存却仍按 query 区分。

[JobsNetworking / JobsDefaultAgent+Upload.swift L44](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:44>) 用 `compactMap + try?` 读取附件。一个必需文件不可读会从本次上传附件列表中静默遗漏，其余 part 仍发送，服务端甚至可回报成功。

**最小升级**：URL 查询与 body 编码分通道准备；不支持的组合明确拒绝。发送前检查所有指定附件，失败返回带文件身份的错误；只有显式可选附件允许跳过。

**验收**：回显服务核对 query 和 body 各出现一次，包含中文、`&/=`、数组及 URL 原有 query；“有效文件 + 不存在文件”不得发包。大文件流式上传可另在体量测试后安排。

### 3.4、P2｜JobsNetworking：缓存身份会碰撞，长键让磁盘缓存失效 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：碰撞与长文件名已实测；rawData 缺失由源码确认。** [JobsNetworking / JobsCacheKey.swift L31](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:31>) 未转义拼接 `key=value&...`：`["a":"x&b=y"]` 和 `["a":"x","b":"y"]` 得到同 key，输出 `cache_key_collision=true`。[JobsNetworking / JobsDefaultAgent.swift L266](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:266>) 未把实际 rawData 字节纳入身份。

[JobsNetworking / JobsCacheStore.swift L103](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:103>) 用完整键的 Base64 作文件名；仅 220 字符参数产生 378 字节文件名，写后 `long_key_disk_cache_hit=false`，`try?` 隐藏了失败。

**最小升级**：按真正发送的请求构造带类型、递归排序且无歧义的身份，包括 raw body 和响应范围；磁盘名使用固定长度摘要，写失败可诊断。保留显式 userScope，敏感信息不写入文件名。

**验收**：碰撞对必须不同；同嵌套对象不同插入次序必须相同；不同 raw body/userScope 不复用；长 URL/emoji 查询跨 cache 实例可读且文件名固定长度。

### 3.5、P2｜JobsNetworking：同一请求并发发送时取消登记错配 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认。** [JobsNetworking / HTTPClient.swift L230](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:230>) 按 trace.requestId 只保存一个 Request，完成时无条件删除；值类型 JobsRequest 的 trace 在构造时产生。

触发：同一个 request 变量同时 send 两次。后请求覆盖前请求；前请求完成又可删除后请求登记，token 可能取消另一执行或找不到活动执行。

**最小升级**：每次发送生成内部 executionId，业务 trace ID 继续用于追踪；完成/取消按执行身份处理。若明确禁止并发复用，应主动报告冲突。

**验收**：同 request 并发两次，独立取消一条不影响另一条；先完成者不删除后者登记。

### 3.6、P1｜JobsGetWindow：空容器造成无限递归 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认，未跑 UIKit。** [JobsGetWindow / UIApplication.swift L87](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsGetWindow@Pods/UIApplication.swift:87>) 对空 Nav/Tab/Split 回退容器自身，再次递归同一对象，没有终止条件。启动装配或空容器下 `jobsTopMostVC(from:)` 可递归至栈溢出。

**最小升级**：无有效 child 时直接返回当前容器；递归 child 必须不同于当前对象。先处理 presented，再下钻容器，避免漏掉容器直接 present 的页面。

**验收**：三种空容器快速返回；容器直接 present 返回真正前台页面；普通子页与忽略 Alert 的既有合同保持一致。

### 3.7、P1/P2｜JobsInheritance：JS 合法 nil 会崩，初始化配置未生效 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**P1，源码确认**：[JobsInheritance / BaseWebView.swift L363](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:363>) 的 TaskGroup 元素为 `Any?`，`group.next()` 为 `Any??`，`group.next()!!` 同时强解包两层。`evalAsyncRaw("void 0")` 的正常 nil 被当成非法值。仅校验外层有结果，保留内部 nil；验收数字/字符串/对象/undefined、抛错、超时与调用取消。JS 无返回值为 nil 的合同可核对 [WebKit 官方声明](https://github.com/WebKit/WebKit/blob/main/Source/WebKit/UIProcess/API/Cocoa/WKWebView.h)。

**P2，源码确认**：[JobsInheritance / BaseWebView.swift L110](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:110>) 创建配置时没有执行保存的 constructor hook；[JobsInheritance / BaseWebView+ConfigDSL.swift L66](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:66>) 的数据仓库等 DSL 又在 WKWebView 已创建后只改变量。[JobsInheritance / BaseWebVC.swift L38](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:38>) 当前实际传入持久化配置，但结果仍是 nonPersistent；inspectable 的配置也被写死值绕开。

**最小升级**：默认配置 → 用户 hook → WKWebView 构造；必须初始化前确定的属性进入 constructor builder，事后修改需明确拒绝或显式重建。

**验收**：hook 恰好执行一次且早于构造；persistent/nonpersistent 的 Cookie 行为正确，inspectable 关闭生效；不能用已存在网页会话假装构造测试通过。

### 3.8、P1/P2｜JobsSwiftDSL：颜色转换与 HEX 构造存在崩溃边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认；CoreGraphics 边界实测。** [JobsSwiftDSL / UIColor.swift L266](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/Others@SDK/UIColor.swift:266>) 只检查 components 非 nil 就访问 `[0]/[1]/[2]`。独立 `CGColor(gray:0.5,alpha:1)` 探针确认数组仅 2 项，不能据此读取第三项。灰度 UIColor 进入该 API 或 getRGBDelta 会越界；尚未跑 UIKit 调用。

**最小升级**：复用同文件已有的 `getRed` 转换；明确动态色的 trait 解析和不可转换颜色的错误语义。单纯检查 count 后返回任意颜色不能保证结果正确。

**P2，源码确认，未跑 UIKit**：[JobsSwiftDSL / UIColor.swift L113](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/Others@SDK/UIColor.swift:113>) 在移除前缀前检查长度，`"#12345"` 通过初检，移除 `#` 后 L129 的 NSString 切片越界。转大写后仍匹配小写 `"0x"`，与声明的格式不符；扫描成功未检查，最终也未传入 alpha。先规范化前缀、严格验证六位及扫描结果，再带透明度构造。

**验收**：灰度/RGB/P3/pattern/动态色在两种主题下都不崩，转换成功或失败有明确语义；HEX 短串/非法字符返回 nil，`0x` 格式和非1 alpha 按声明生效。

### 3.9、P1/P2｜JobsSwiftBaseTools：容错解码可崩，日期解码规则不统一 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**P1，实测**：[JobsSwiftBaseTools / SafeCodable.swift L212](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:212>) 在 Int 解码失败后从 Double 直接 `Int(d)`。真实源码加只承接 Foundation 工厂的小 stub，解码 JSON `1e100` 为 `SafeCodable<Int>` 得到 SIGTRAP；`try?`/catch 不能捕获数值 trap。

**最小升级**：检查有限性，明确小数策略，使用可失败转换；保留 defaulted/failed 上报。不要只以 `Double(Int.max)` 比较，上界浮点舍入也需处理。

**P2，源码确认**：同文件先尝试 `decode(Date.self)`，成功时由 decoder 的日期策略决定语义；失败才进入宽松转换。[JobsSwiftBaseTools / SafeCodable.swift L339](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339>) 的整数回退直接按秒，数字字符串经 Double 回退则可按大数判断毫秒。原生日期解码与宽松回退的规则不统一；JSON 数字写成 `.0` 也不保证进入 Double 分支。

**验收**：Int 边界、超大正负数、小数均不崩；明确支持的 decoder 日期策略矩阵，对比同值 number/string 及原生/回退路径。优先提供字段级显式单位，启发式保留为兼容回退。

### 3.10、P2｜JobsSwiftFoundation：uint32 安全读取仍可越界崩溃 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：真实源码独立实测。** [JobsSwiftFoundation / UserDefaults.swift L67](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:67>) 只检查非负后 `UInt32(i)`。只读 ProbeDefaults 返回 `UInt32.max+1`，产生 SIGTRAP；没有写用户设置。

**最小升级**：用 `UInt32(exactly:i)`，超范围返回 nil，维持可选读取的语义。

**验收**：负数、0、max、max+1、Int.max 和已有合法值 round-trip；异常数据不终止进程。

### 3.11、P1｜JobsSwiftMarkdown：正常锚点调用产生系统异常 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：表达式实测，未跑 WKWebView。** [JobsSwiftMarkdown / JobsMarkdownView.swift L153](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftMarkdown@Pods/Core/JobsMarkdownView.swift:153>) 直接把 anchor String 交给 `JSONSerialization.data(withJSONObject:)`，未允许 fragment。普通 `"section"` 产生 SIGABRT / NSInvalidArgumentException；`try?` 不能捕获 Objective-C 异常。

**最小升级**：`JSONEncoder().encode(anchor)` 或显式 fragmentsAllowed，继续进行 JS 参数编码。

**验收**：英文、中文、引号、反斜线、换行和空锚点均不崩；真实渲染后能定位 heading，无匹配时按合同处理。

### 3.12、P1｜JobsSwiftPatch：子类补丁改变父类，签名与回滚需要收口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：继承污染实测；其它路径源码确认。** [JobsSwiftPatch / JobsSwiftPatch.swift L44](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:44>) 取继承 Method 后直接替换。只给 Child 安装补丁，真实源码探针中 Base.payload 也从 base 变为 patched。[class_getInstanceMethod](https://developer.apple.com/documentation/objectivec/class_getinstancemethod(_:_:)) 会搜索父类。

公开 API 可对任意 selector 安装固定对象返回 block，未验证 ABI；同 Class+SEL 的多 identifier 补丁还可能在乱序回滚时恢复已释放 IMP。记录字典加锁不覆盖整个替换/回滚事务。

**最小升级**：收窄到经过编码校验的真实 payload 方法合同；继承方法先在目标类落本地 override；按 Class+SEL 管理唯一槽位/补丁栈，安装/回滚串行事务，不恢复已释放 IMP。

**验收**：父类/兄弟类不变；不兼容签名被拒；重装、乱序回滚、并发安装回滚始终得到有效原实现。未执行危险的释放 IMP 调用探针。

### 3.13、P1/P2｜JobsSwiftTaskCenter：等待不收尾，最后事件先于终态的合同被颠倒 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**P1，源码确认**：[JobsSwiftTaskCenter / JobsTask.swift L359](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:359>) 的执行次数/下次执行等待只注册 action，之后取消或提前结束可无人恢复 continuation；waitUntilFinished 也未响应 waiter 自身取消。waitAny 拿到首条结果后 cancelAll，但未结束的等待子任务仍挂住。[TaskGroup](https://developer.apple.com/documentation/swift/taskgroup) 必须等待子任务退出，取消是协作信号。

**P2，源码确认**：[JobsSwiftTaskCenter / JobsTask.swift L271](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:271>) 先安排下一周期，有限计划在无下一段时发布 finished，再执行最后 action；[JobsSwiftTaskCenter / JobsTaskExecutionSequence.swift L31](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:31>) 的终态观察先 finish/解绑，可能丢最后事件。doAsync 未保存 Task 句柄，任务状态不等于异步业务完成/取消。

**最小升级**：等待同时监听 execution/terminal/cancellation，一次性恢复并解绑；明确“未达次数已结束”的返回方式。先完成本次 action/事件再发布终态；异步 action 管理句柄与活跃数量，明确调度完成和业务完成的区别。

**验收**：取消 waiter/JobsTask、计划提前结束、waitAny(有限+无限) 在短期限返回；一次任务有 1 条、N 次有 N 条事件；完成等待后最后副作用已结束，取消能传到异步 action。

### 3.14、P2｜JobsSwiftWorker：派生订阅保留、once 重入及调度替换缺少闭环 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**保留问题已实测**：[JobsSwiftWorker / JobsObservable+Transform.swift L13](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:13>) 丢订阅 token，上游 closure 强持派生值；[JobsSwiftWorker / JobsObservable+Combine.swift L14](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Combine.swift:14>) 双源 closure 互持。真实原语加只提供 JobsPeriod 的 stub：释放后 `mapped-released=false`、combine 输入/输出全部未释放。

**once 源码确认**：[JobsSwiftWorker / JobsWorkerFactory.swift L36](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWorker@Pods/JobsWorkerFactory.swift:36>) 在业务回调后才解绑；回调内 accept 可重入同 observer。[JobsSwiftWorker / JobsWorker.swift L27](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:27>) 对已 disposed 设置 disposer 时在锁内调用用户清理，重入可能死锁。

**调度源码确认**：[JobsSwiftWorker / JobsWorkerScheduler.swift L21](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:21>) 的 cancel→create→add→store 不是同一事务，并发同 key 能留下两个任务；完成任务没有按身份从 scheduler/center 回收。

**最小升级**：下游单向拥有上游 token，上游弱持下游；once 在回调前原子抢占；清理 closure 锁外调用；调度按 key generation 预留、比较身份投递与删除，owner 析构清理任务。

**验收**：释放 weak probes、反复构造 1000 条派生链、回调 accept/自取消、并发同 key、旧完成不删新任务；恰好一次、观察器数和任务数回归基线。

### 3.15、P2｜JobsSwiftBaseTools：Snowflake 并发重复 ID，节点 32 与 0 别名 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：真实源码实测。** [JobsSwiftBaseTools / SnowflakeSwift.swift L33](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:33>) 接受 32，但 5 bit 节点只能表示 0…31，传 IDCID/machineID=32 解码为 0。nextID 对 sequence/last timestamp 无同步，同实例 20,000 次并发实测有 904 个重复；重复数随调度变化。

严格串行使用可避开并发风险，但节点越界仍应由公开构造拒绝。此处已验证 mask 的表达式优先级，不能误报为优先级 bug。

**最小升级**：可失败的合法节点构造，所有生成状态以锁/actor 串行化；序列满、时钟回拨和 epoch 边界定义有界行为，支持注入时间。

**验收**：多队列大批次无重复；31 成功、32 被拒；同毫秒耗尽/回拨均可复现且无死锁。

### 3.16、P2｜Jobsl10n：资源回退会自指，重绑控件累积旧注册 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认，未在宿主启用 override 实跑。** 已调用 `enableLanguageOverride()` 后，选择缺失 lproj 的语言，[Jobsl10n / LanguageManager.swift L33](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/Jobsl10n@Pods/LanguageManager.swift:33>) 回退 Bundle.main，[Jobsl10n / Bundle+多语言国际化.swift L17](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:17>) 的 main override 又可关联自身，localizedString 再调用自身递归。followSystemLanguage 改语言码/通知，却没有同步清理或更新 override。

[Jobsl10n / TRAutoRefresh.swift L51](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:51>) 只 append 注册，活着的同一 target/属性没有 slot 替换。复用 cell 多次重绑后切语言会执行历史 apply；refresh 与通用 register 也未用完整同一同步合同。

**最小升级**：禁止 self bundle 回退，统一语言模式/资源来源/override 的状态切换；target identity+slot 唯一绑定并可解绑，统一主线程或锁协议。显式 key 绑定优于最近一次线程 marker。

**验收**：缺失/地区语言码不递归，系统与自定义往返一致；同槽重绑 1000 次只应用最后一次，不同按钮状态独立，释放回收。

### 3.17、P2｜JobsSwiftStandardLibrary：安全 Builder 包装了可逃逸临时指针 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认，未执行悬空写入。** [JobsSwiftStandardLibrary / Array.swift L41](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:41>) 的 public Builder 持有临时 `UnsafeMutablePointer<[Element]>`；闭包可以把 Builder 保存到外部，退出作用域后普通 addBy 仍可调用，却访问无效内存。[指针文档](https://developer.apple.com/documentation/swift/withunsafemutablepointer(to:_:)) 仅保证闭包期间有效。

[JobsSwiftStandardLibrary / BinaryInteger.swift L22](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftStandardLibrary@Pods/整形/BinaryInteger.swift:22>) 的通用整数工具把任意 BinaryInteger 直接转 Int；UInt64.max 等超范围输入也会 trap。

**最小升级**：Builder 自有安全数组存储，闭包结束读取结果，保持链式输出；整数工具用原类型运算或可失败转换。

**验收**：正常链式构造不变，Builder 逃逸不写返回数组/已释放栈；整数最大值不崩，Address Sanitizer 专项通过。

### 3.18、P2｜BRPickerViewSwift：取消后的 awaitResult 永久悬挂 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认。** [BRPickerViewSwift / BRBasePicker.swift L118](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:118>) 只在成功结果 resume，cancelSelection 为空；[BRPickerViewSwift / BRPickerPanel.swift L152](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:152>) 遮罩直接 dismiss。Task 取消没有处理，连续 await 还会覆盖旧 handler。

**最小升级**：保留同步 byResult，增加 typed outcome/optional/throws 的可取消 async 合同；确认、取消、遮罩、Task 取消、展示失败统一一次性终态并清理，禁止同 picker 同时多个等待。

**验收**：上述每个出口在期限内返回，双点完成不重复 resume，重复等待有明确拒绝或独立会话。

### 3.19、P1/P2｜JobsSwiftTools：多选结果写入无隔离，权限与代理生命周期过宽 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**P1 风险路径源码确认，竞争频率待运行**：[JobsSwiftTools / MediaPickerService.swift L174](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:174>) 多个 NSItemProvider 异步回调同时 append 一个 Array，DispatchGroup 只等待，不串行化写入；结果也按完成顺序排列。本机 SDK 明确 item provider completion 使用内部队列，不能假设多个 provider 共享有序 UI 队列。

**P2**：同文件第 49–62 行在创建 PHPicker 前要求 readWrite 权限，拒绝授权时阻止本来无需该权限的系统选择器。[Apple Photos picker 说明](https://developer.apple.com/videos/play/wwdc2020/10652/) 明确按需选图不必获取整个图库访问；真实 PhotoKit 资产操作再请求权限。

第 234 行把 proxy 强挂在 presenter，结束后不清理；callback 若强捕获 presenter 可形成环。

**P2，无宿主边界源码确认**：[JobsSwiftTools / MediaPickerService.swift L245](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:245>) 及 L253/L262 的三个便利入口强拆 `jobsTopMostVC()`。没有可用窗口时仍会崩，与第3.6节空容器递归是独立问题，未实跑 UIKit。

**最小升级**：按选择索引存结果，单一执行域写入，限制并发解码和内存，错误可见；按实际资产操作申请权限；会话结束清 proxy，核验身份避免旧会话清新会话；便利入口 guard 宿主并返回明确失败，优先使用已有显式 presenter 接口。

**验收**：乱序完成保持选择顺序、TSan 无竞争；拒绝 PhotoKit 仍可用 PHPicker；成功/取消后宿主和 proxy 可释放；无窗口调用不崩且可获知失败。

### 3.20、P2｜JobsCountdownButton：旧主线程 Task 跨越停止与重启 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认。** [JobsCountdownButton / JobsCountdownBtnCtrl.swift L148](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:148>) tick 通过 onMainAsync 再投递，[JobsCountdownButton / JobsCountdownBtnCtrl.swift L188](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:188>) 到 UI 后只检查 button，没有运行 generation/isRunning。底层 Timer 的保护无法覆盖后来新建的 Task。

触发：tick 排队后 stop，或 stop+start；旧 tick 可扣新倒计时、重写恢复 UI、再次 finish。iOS 15 stop 还无条件 enable，没有恢复原禁用状态。

**最小升级**：UI owner/入口归 MainActor，start/stop 改 generation，投递与 UI 处理核验身份，用户 onTick 重入后旧流程不能 finish 新操作；短信时长按实际截止时间计算，视觉暂停另定义策略。

**验收**：排队后 stop 不改 UI；重启首值不被旧回调扣减；onTick 内 stop/start 安全，finish 一次；原 disabled 状态恢复。

### 3.21、P2｜JobsSwiftRefresher：noMore、移除和替换没有完整撤销 inset <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认。** [JobsSwiftRefresher / JobsRefreshProxy.swift L357](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftRefresher@Pods/JobsRefreshProxy.swift:357>) 正在 refreshing 时直接改 noMore，[JobsSwiftRefresher / JobsRefreshProxy.swift L137](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftRefresher@Pods/JobsRefreshProxy.swift:137>) detach 只移除 view；begin 加的 inset 没有撤销。重配 slot 也未先清旧实例，可能留白累积。

**最小升级**：所有离开 refreshing 的出口恢复该 slot 实际贡献值，再进 noMore/removed；替换先 detach，结束动画用 generation。不能用新动画高度扣旧 inset。

**验收**：normal/noMore/removed/替换路径 inset 回原值且保留宿主自定义值；刷新中换高度、快速重启不受旧 completion 影响，只有一个刷新器。

### 3.22、P2｜JobsToast：旧消失回调清新引用，ASSIGN 不是真正弱引用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认。** [JobsToast / JobsToast.swift L156](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsToast@Pods/JobsToast.swift:156>) 使用 `.OBJC_ASSOCIATION_ASSIGN`，对象外部移除后不保证清零；[JobsToast / JobsToast.swift L179](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsToast@Pods/JobsToast.swift:179>) 的旧动画 completion 无条件清 currentToast。

触发：A 消失动画中显示 B，A 完成清掉 B 登记，再显示 C 不能移除 B；外部移除对象后读 ASSIGN 关联值也不安全。

**最小升级**：retained holder 内 weak 引用或可精确释放的强持有；清引用前核验当前对象仍是 self；记录实际宿主 window，取消旧定时任务。

**验收**：快速 A/B/C 每窗只一条，外部移除后再 show 不崩，两个窗口独立，旧 completion 不清新对象。

### 3.23、P2｜JobsFuseAnimation：气泡源释放后重复 Timer 仍空转 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认。** [JobsFuseAnimation / UIView+JobsFuseBubbleAnimation.swift L44](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:44>) Timer 加主 RunLoop，closure 弱持 runner，runner 无 deinit invalidate。源 view/runner 释放后 timer 被 RunLoop 保留，默认每 0.16 秒，或按配置的发射间隔继续唤醒。此问题针对气泡，不涉及已有充能长按回归。

**最小升级**：runner 释放、source/host 消失可靠 invalidate；离屏 pause/resume 按需求配置。重复 Timer 的持有语义见 [Apple Timer](https://developer.apple.com/documentation/foundation/timer)。

**验收**：创建销毁 100 次活跃计时器回基线；stop 不再发射，离屏无无用周期唤醒。

### 3.24、P2｜JobsImageTools 与 JobsSwiftSplash：派生图混用及坏缓存不自愈 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**源码确认，内存峰值待测。** [JobsImageTools / JobsSimpleImageLoader.swift L312](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:312>) 的 URLSession fallback 缓存仅按 URL，忽略 targetSize/scale；小头像先缓存后大预览可复用低分辨率图。第 328 行按压缩 data.count 记成本，80MB 上限不是实际解码像素预算。

[JobsSwiftSplash / JobsSplashMediaCache.swift L71](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftSplash@Pods/Core/JobsSplashMediaCache.swift:71>) 图片下载忽略 HTTP 状态，L50 的 cachedFileURL 仅检查文件存在及非空；[JobsSwiftSplash / JobsSplashVC.swift L279](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftSplash@Pods/Core/JobsSplashVC.swift:279>) 命中坏缓存解码失败后仍 return，404→恢复200也不再拉取。视频永久404也进入持续重试，应与用户已有“持续预加载直到成功”的产品策略一起评估，不能直接删除该行为。

**最小升级**：缓存身份包含尺寸/scale/处理器，成本按像素存储估计；下载先验证状态与可解码性，坏缓存清理重拉，临时文件原子发布，失败展示本地素材。持久预加载保留目标，区分临时/永久错误并提供可配置预算与诊断。

**验收**：同 URL 小/大尺寸正逆序结果正确；高压缩大图实测内存；坏文件/404恢复自愈、并发不互删、离线回退正常；重试符合已确认产品合同且不无界消耗。

### 3.25、P2｜JobsBluetooth：连接与扫描代际、传输确认尚未形成可靠层 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认，真设备行为待验。** [JobsBluetooth / JobsBluetoothManager.swift L122](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.swift:122>) 任一服务发现特征就 ready，断连/新连接未清全部旧 characteristic，也未筛当前 peripheral 的晚到回调。A→B 可组合 B 与 A 的旧特征。

第 58 行扫描 timeout 无 generation/可取消任务，旧扫描 deadline 会提前停止新扫描。第 87–89 行优先 withoutResponse，直接写全 payload 后立即 success；timeout/retry/priority/matcher 尚未消费，README 已明确是骨架。

**最小升级**：连接/扫描身份与终态隔离；必要 UUID/属性齐全才 ready；按写类型、长度和背压发送，分别定义 submitted/writeAcknowledged/applicationResponse。真实设备命令业务需要队列/超时，Mock 小包可保持简洁。

**验收**：旧设备晚到事件不改新连接，扫描重启不受旧 timer 影响；缺 UUID、拒写、大包、拥塞、无应答可观察且一次终结。写入语义核对 [CoreBluetooth 官方 API](https://developer.apple.com/documentation/corebluetooth/cbperipheral/writevalue(_:for:type:))。

### 3.26、条件 P1/P2｜JobsCryptoKit：安全入口与 legacy CBC 必须分开 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**完整性差异已实测**：[JobsCryptoKit / AESGCM.swift L62](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:62>) 的统一 decrypt 也接受无认证 0x02 CBC；自己的合成密文只改 IV，仍成功返回改变的明文，输出 `legacy_CBC_modified_IV_accepted=true`。README 已承认 CBC 不提供完整性，不是隐瞒。

**必要性**：用于不可信密文、敏感数据或权限判断时是 P1；仅显式旧协议兼容时是 P2。没有据此证明某个业务凭证已被攻击。

**最小升级**：安全默认入口只写/收认证格式；legacy 读使用显式接口与迁移策略。确需旧系统新格式，评估 Encrypt-then-MAC 及独立派生 key，先认证再解密；不得悄悄改变旧 0x02 含义。认证加密语义参考 [Apple AES.GCM](https://developer.apple.com/documentation/cryptokit/aes/gcm)。

**参数边界源码确认**：[JobsCryptoKit / PBKDF2.swift L19](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsCryptoKit@Pods/PBKDF2.swift:19>) 在校验前分配 count，随后直接 UInt32(rounds)；负 keyByteCount、负 rounds 或超出 UInt32 的 rounds 可触发参数/数值 trap。空缓冲的 baseAddress 强解包也需检查，但尚未运行该边界，不能断言所有空 Data 必崩。randomBytes 需明确 count 合法范围。

**验收**：篡改认证密文必失败，legacy 仅显式兼容；存量迁移/错key/截断/空明文；PBKDF2 合法测试向量和非法参数均返回明确结果。

### 3.27、P2｜JobsLocalNotification：重复时间会异常，公开配置和错误返回不足 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**源码确认 + macOS 同框架系统 API 实测，未提交通知。** [JobsLocalNotification / JobsMakeLocalNotification.swift L21](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:21>) 仅 max 到1，repeats=true 且小于60会触发 NSInternalInconsistencyException。探针用 Objective-C @try/@catch 捕获；[Apple 约束](https://developer.apple.com/documentation/usernotifications/untimeintervalnotificationtrigger/init(timeinterval:repeats:)) 要求重复至少60秒。默认 repeats=false，不能说默认 Demo 按钮必崩。

[JobsLocalNotification / JobsLocalNotificationModel.swift L14](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsLocalNotification@Pods/JobsLocalNotificationModel.swift:14>) 字段是 internal，外部普通 Swift 调用无法配置；提交只打印结果。默认模型 Demo 不能证明业务配置可用。

**最小升级**：公开 typed initializer/Jobs 模型 DSL，验证有限正数和重复下界，提交用 completion/async Result 返回；宿主仍负责授权/前台策略。

**验收**：独立 target 可配置两条通知并拿到失败；0/1/59/60/NaN/infinity 不向系统送非法参数，标识覆盖行为明确。

### 3.28、P2｜JobsAudioRecorder：启动回报没有反映系统真实结果 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**源码确认，设备失败场景待验。** [JobsAudioRecorder / JobsAudioRecorderEngine.swift L52](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:52>) 忽略 record 返回值后总发 didStart，[JobsAudioRecorder / JobsAudioPlayerEngine.swift L23](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:23>) 忽略 play 返回值后总返回 true。

**最小升级**：检查实际 Bool，失败统一清状态/临时文件并按 AudioSession 所有权回滚；每次录音有身份，旧 delegate 回调不能清新会话。来电/耳机/媒体重置和录播共用 session 在真机明确策略。

**验收**：prepare/record/play 失败注入，回调状态真实且资源释放；正常短录音、取消、时长结束、快速重录与中断。返回值合同见 [Apple record API](https://developer.apple.com/documentation/avfaudio/avaudiorecorder/record())。

### 3.29、P2｜JobsSwiftCalendar：week 模式仍按月份生成和翻页 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**证据：源码确认，视觉待跑。** [JobsSwiftCalendar / JobsSwiftCalendar.swift L84](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendar/JobsSwiftCalendar.swift:84>) week 只隐藏后五行，[JobsSwiftCalendar / JobsSwiftCalendar.swift L311](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendar/JobsSwiftCalendar.swift:311>) 日期仍从当月1日所在周生成，currentPage 归月初、swipe 加减月。月中切 week 看不到目标周。

**最小升级**：按 scope 定义页锚点与步进；week 使用 Calendar 周区间起始日生成7天并按周翻，month 保留42格。

**验收**：月中、跨月/跨年、firstWeekday1/2、DST、日期上下限，切 scope 保留选择，周翻页恰好7日历天。

### 3.30、条件 P2｜JobsInheritance Native Bridge：消息来源与字符串编码缺口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**来源闸门缺失由源码确认，实际敏感动作暴露依宿主配置。** [JobsInheritance / BaseWebView+Bridge.swift L20](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:20>) 仅把 channel/body 交给处理器，未保留 frameInfo/securityOrigin；导航 allowedHosts 不等于 native action 消息授权。第122行 token 直接放单引号，特殊字符可破坏 JS。

**最小升级**：消息处理保留 frame 来源，每动作声明可信 scheme/host/port/main-frame 策略，敏感动作不接未知 origin；特殊值复用已有 JSON literal 工具。来源可通过 [WKScriptMessage.frameInfo](https://developer.apple.com/documentation/webkit/wkscriptmessage/frameinfo) 获取。

**验收**：可信页成功、非授权 origin/iframe 明确拒绝；引号/反斜线/换行原样回传；导航变化后旧来源消息不进入新会话。没有声称已发生 Token 泄漏。

### 3.31、条件 P2｜JobsScreenCapture：找到内部子视图不等于保护已经有效 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**代码判定确认，设备保护效果待验证。** [JobsScreenCapture / JobsScreenshotProtectionView.swift L61](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsScreenCapture@Pods/Core/JobsScreenshotProtectionView/JobsScreenshotProtectionView.swift:61>) 找不到指定 CanvasView 时回退任意 subviews.first，并将 available=true。业务依赖此标志时可能把普通内部视图当作有效截图保护；实现依赖未公开视图结构。

**最小升级**：不以任意子视图作成功判断；明示能力等级、不可用状态与敏感内容遮盖回退。系统截图后通知不能承诺阻止截图。根据 [isSecureTextEntry 官方定义](https://developer.apple.com/documentation/uikit/uitextinputtraits/issecuretextentry)，其稳定合同是安全文本输入，并未保证任意 UIView canvas 技巧；这是 API 边界推论。

**验收**：支持系统的真机截图/录屏/镜像，触摸/键盘/布局正常；缺内部容器明确不可用并回退。若仅普通截图保存，可保留现有 typed error/addOnly 授权设计。

### 3.32、其它已定位的边界与条件性加固 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 位置 | 级别/证据 | 缺口 | 最小升级与验收 |
| --- | --- | --- | --- |
| [JobsSwiftTools / CrashLogCenter.swift L482](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:482>) | P2，源码确认 | 信号 handler 构造 Date/String 并走 FileManager/URL/Data，非信号安全；源码和 README 已坦承。 | 正常启动预开 fd，极简 C 层写固定字节；完整格式化下次启动。独立故障进程验系统 crash 与最小记录。 |
| [JobsSwiftTools / FlutterBridge.swift L39](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:39>) | P2，源码确认，引擎待跑 | 强 callback/pending 会话只在 channel 出口清理；原生返回/展示拒绝没有统一清理。setup 第二 engine 时 channel 不重绑，run 失败也先标 started。 | 会话取消/销毁/拒绝共用终态，run 成功才登记；引擎重置明确支持或拒绝。验原生 back/busy/失败重试/换 engine。 |
| [JobsByUIKit / UIKitAttributes.swift L177](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:177>) | P2，源码确认 | 公开 Any? 参数内部 as! 系统 Attribute.Value，错误类型从编译期问题变运行时崩溃。 | 公开真实类型，动态兼容入口可失败转换；验正确值、清除值和错误值，移除未落地的模板注释。 |
| [JobsOCDSL / JobsOCDSL.podspec L1](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsOCDSL@Pods/JobsOCDSL.podspec:1>) | P2，物理存在性确认 | require_relative 的 JobsPodspecKit.rb 不存在；Core/Support 未交付，仅头/spec/README。该 Pod 当前未集成，不能推断宿主因此构建失败。 | 明确兼容残留或独立交付目标；恢复自有实现/helper或规范实际形态，语义加载/最小消费者验收；不自动删除。 |
| [JobsSwiftTimer / JobsSwiftTimerConfig.swift L17](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerConfig.swift:17>) | P2，源码确认，非法运行待验 | public var 可在 init normalize 后改 NaN/Inf；引擎转换 Int(tolerance*1000) 未再校验。 | 执行入口再验证或受约束配置；覆盖 init 后突变和超大有限值。保留现有状态机。 |
| [JobsSwiftExcel / JobsSwiftExcelView.swift L106](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftExcel@Pods/Core/JobsSwiftExcelView/JobsSwiftExcelView.swift:106>) | P2/P3，源码确认 | freezeThroughColumn+1 在 clamp 前，Int.max 可溢出；全量创建 UILabel/约束不适合大表。 | 先夹取再加。小表只补边界，大表需求确定后做复用/虚拟化；记录行列规模与性能基线。 |
| [JobsSwiftBaseDefines / JobsBaseObserver.swift L79](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:79>) | P2，源码确认，IME待跑 | 先通知业务新文本再问原 delegate；delegate veto 后模型已收到未接受的值。 | 按真实接受/提交文本组织事件，定义 markedText；验 veto、中文候选、粘贴、emoji。 |
| [JobsGestureUnlock / GestureUnlockView.swift L98](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:98>) | P2，源码确认，UIKit未跑 | 公开 configuration 重建 nodes 时未清 selected。3×3 输入保留节点8后改为2×2，再 showError/showSelected，L269 访问 nodes[8] 越界。 | 重建前取消当前输入并清选择/路径，保护索引；验缩小/扩大网格、输入中重配与错误状态刷新。 |
| [JobsGestureUnlock / Apple滑动开锁🔒.swift L138](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:138>) | P2，源码确认，UIKit未跑 | ended/cancelled/failed 共用成功判断；进度>0.85 时系统取消也 completeUnlock，并调用 onUnlock。 | 只有 ended 可完成，cancelled/failed 明确回退；验阈值前后取消、正常完成与重复手势，不把视觉完成当宿主认证。 |
| [JobsSwiftMarkdown / jobs-markdown.js L297](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftMarkdown@Pods/Resource/jobs-markdown.js:297>) | 条件 P2，源码确认，联网待验 | allowsRemoteContent=false 只删显式http(s) src，遗漏srcset/协议相对/CSS，且先插DOM后删。 | 在插入前处理并用内容规则/CSP阻断；本地HTTP计数验零请求，保留合法本地资源。 |
| [JobsTextTools / JobsText.swift L31](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsTextTools@Pods/JobsText.swift:31>) | 条件 P2，并发属性待验 | NSAttributedString.copy 不能证明任意自定义attribute/attachment对象深度不可变，unchecked Sendable 合同过宽。 | 限制/复制支持属性或限定并发域；验外部属性别名及附件修改。 |
| [JobsSwiftWebSocket / JobsSwiftWebSocketClient.swift L135](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftWebSocket@Pods/Core/JobsSwiftWebSocketClient/JobsSwiftWebSocketClient.swift:135>) | P3，生命周期防误用 | client持session且session持delegate，漏调disconnect时deinit收尾无法破环；README已要求显式断开。 | 保留disconnect，按需求加弱代理/独立owner；验握手/活跃/重连时释放，无重连残留。 |
| [JobsSwiftBlock / JobsCallbackable.swift L15](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:15>) | 条件 P2/P3 | NSMutableDictionary回调存储无统一actor/lock；本次单线程回归通过不代表跨线程安全。 | 先声明支持线程；UI归主线程，通用多线程存储完整加锁且锁外回调；不重写工厂。 |

信号安全依据：[Apple sigaction 手册](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man2/sigaction.2.html) 限定 handler 可调用函数；不等于所有 IO 都不能调用，问题在于当前路径经过不受保证的 Swift/Foundation 操作。

另有按规模安排的方向：录音中断/旧 delegate 身份、磁盘缓存容量与 stale grace、GIF 解码预算、Markdown 渲染版本/进程失败与主线程 I/O、Open 浏览器加载失败、列表空态/重试、Auth submitting 状态、图标生成原子发布和图像重下载复用保护。具体模块见第四章，未统一定成已发生事故。


## 四、逐 Pod 升级必要性与覆盖清单 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

“深入”表示已阅读核心状态/错误/生命周期路径，“抽查”表示关键公开实现和典型调用，“概览”表示实现结构和接口边界，“桥接/空目录”按实际状态记录。表中 P2/P3 的建议不自动等于已确认缺陷；具体证据见第三章。源码数是物理清点，用于估计范围，不用于评价质量。

| Pod / 目录（均在 JobsByPods） | 源文件 / 行数 | 覆盖深度 | 升级必要性 | 行动与保留价值 |
| --- | --- | --- | --- | --- |
| `BRPickerViewSwift@Pods` | 18 / 1,691 | 深入核心/具体Picker概览 | P2必要 | 取消/关闭 await 收尾；Panel强owner/Picker弱Panel的模型保留 |
| `JobsAppDoor@Pods` | 16 / 2,208 | 深入 | P3按生产接入 | 保留两种切换/键盘/视频清理；加submitting/error/cancel接口，服务端验证归接入层 |
| `JobsAppEnvironmentRibbon@Pods` | 0 / 0 | 空目录 | 按需决策 | 无源码/podspec，不把目录名算已实现能力 |
| `JobsAppIconRibbon@Pods` | 1 / 259 | 深入 | P3防误配置 | 校验source/output不同、先渲染验证再原子发布；默认命名无冲突，不先删旧好产物 |
| `JobsAudioRecorder@Pods` | 5 / 305 | 深入 | P2必要 | 检查系统启动结果；随后真机验中断/快速重录，保留文件/引擎/UI分层 |
| `JobsBluetooth@Pods` | 6 / 312 | 深入 | P2真设备接入前 | 连接/扫描身份、特征齐全、传输确认；保留Profile/Command/Mock骨架 |
| `JobsBy3rdTools@Pods` | 37 / 4,177 | 关键实现抽查 | P2/P3条件 | 播放器资源失败改可观察恢复；依赖按需拆分。现shader已在spec与宿主，不能写成缺失 |
| `JobsByPDFKit@Pods` | 1 / 8 | 8行桥接 | P3按需 | DSL已迁移，维护兼容入口，不复制第二套实现 |
| `JobsByPhotosUI@Pods` | 8 / 114 | 桥接/占位概览 | P3按需 | README已坦承TODO；真正选图业务归Tools，按需求补扩展 |
| `JobsByQuartzCore@Pods` | 1 / 8 | 8行桥接 | P3按需 | 兼容导出明确即可 |
| `JobsByUIKit@Pods` | 163 / 22,431 | 重点API/依赖抽查 | P2必要/P3模块化 | 公开Attribute强类型；保持工厂，审查图像/异步边界，第三方能力按需 |
| `JobsByWebKit@Pods` | 1 / 8 | 8行桥接 | P3按需 | 非网页容器；风险主要在Inheritance，维护import兼容 |
| `JobsCountdownButton@Pods` | 4 / 530 | 深入 | P2必要 | 旧UI Task代际与禁用状态恢复，保留配置renderer/弱按钮 |
| `JobsCryptoKit@Pods` | 9 / 616 | 深入/合成数据实测 | 条件P1/P2 | 分离legacy与安全默认；参数guard，保留CryptoKit/Security标准实现 |
| `JobsDebugPanel@Pods` | 9 / 660 | 深入 | 维持/P3回归 | DEBUG/MainActor/每Scene overlay/不抢key/disconnect清理较成熟 |
| `JobsEmptyView@Pods` | 1 / 60 | 全文件概览 | 维持/P3可访问性 | 已有点击重试；按需补动态字体/VoiceOver按钮语义，为其它列表复用 |
| `JobsFuseAnimation@Pods` | 12 / 2,662 | 核心深入/其余抽查 | P2局部 | 气泡Timer释放；保留ReduceMotion/window暂停及长按回归 |
| `JobsGestureUnlock@Pods` | 5 / 745 | 深入 | P2必要 | 重建网格清状态、cancelled/failed不成功；认证凭证/限流归宿主 |
| `JobsGetWindow@Pods` | 3 / 273 | 深入 | P1必要/P3多窗 | 空容器终止；调用方传实际window/scene，保留显式Scene API |
| `JobsIconfont@Pods` | 1 / 392 | 深入 | 维持/P3回归 | bundle/fontLock/取消/representedAsset已有；同asset重绑可补generation |
| `JobsImageRotation@Pods` | 3 / 321 | Rotator深入/Clock概览 | 维持/P3时序 | 弱target/主线程/析构stop良好；按elapsed定义速度与改interval重建 |
| `JobsImageTools@Pods` | 3 / 912 | 深入 | P2必要 | 尺寸缓存、像素预算、坏响应；批量重下增加URL/generation复用校验 |
| `JobsInheritance@Pods` | 23 / 2,830 | Web深入/其它概览 | P1/P2必要 | JS nil/config/Bridge；保留weak handler/KVO清理与分文件职责 |
| `JobsLocalNotification@Pods` | 2 / 61 | 全部/系统API探针 | P2必要 | 重复下界、公开配置、提交错误；维持小型model+submit |
| `JobsLuckyEnvelopeRain@Pods` | 2 / 440 | 核心抽查 | 维持/P3生命周期 | spawn/fall分离、析构stop良好；前后台与暂停按产品定义 |
| `JobsMarqueeView@Pods` | 1 / 921 | 核心抽查 | 维持/P3回归 | elapsed/空源/手动恢复已有；按需求治理离屏与数据更新 |
| `JobsNavBar@Pods` | 4 / 473 | 核心抽查 | 维持/P3回归 | provider/KVO析构/外观布局分离已有；测试快速Web绑定与多窗 |
| `JobsNetworking@Pods` | 41 / 2,296 | 深入/多个探针 | P1/P2必要 | 下载/取消优先，再query/上传/缓存/并发登记；保留可注入client与统一Agent |
| `JobsOCDSL@Pods` | 1 / 29 | 残缺交付核验 | P2独立使用前 | 缺helper/Core/Support；明确是否保留独立交付，不推断主工程失败 |
| `JobsOCSkeletonView@Pods` | 0 / 0 | 空目录 | 按需决策 | 无源码/podspec，先确认需求，不自动填充第三方实现 |
| `JobsProgressBar@Pods` | 2 / 1,357 | 核心抽查 | 维持/P3回归 | clamp/autoStop/析构清理已有；多次拖动/程序更新与bubble回归 |
| `JobsScale@Pods` | 1 / 169 | 全文件概览 | P3条件 | 正有限设计尺寸、breakpoint顺序与Scene上下文；保留字体/布局比例分开 |
| `JobsScreenCapture@Pods` | 3 / 273 | 深入 | 条件P2必要 | 保护能力需真机验证/降级；普通截图typed error/addOnly/主线程可保留 |
| `JobsSwiftAppTools@Pods` | 1 / 465 | 核心概览/依赖核验 | P3模块化 | 启动分类/格式化保留；减少聚合传递依赖，持久状态复用基础层 |
| `JobsSwiftBaseDefines@Pods` | 15 / 3,073 | 关键机制深入 | P2局部 | 输入veto/IME、主题读写线程合同；主线程helper与弱主题表保留 |
| `JobsSwiftBaseTools@Pods` | 9 / 1,806 | 关键机制深入/实测 | P1/P2必要 | SafeCodable/Snowflake/时间单位；保留失败上报和回拨检测 |
| `JobsSwiftBlock@Pods` | 5 / 348 | 深入/既有回归通过 | 维持/条件P2 | 工厂不重写；按支持范围补回调存储线程合同 |
| `JobsSwiftCalendar@Pods` | 4 / 729 | 深入 | P2使用week时 | 正确周锚点/翻页；保留Calendar按日历加减与弱delegate |
| `JobsSwiftComment@Pods` | 5 / 653 | 深入 | P3空态/规模 | 复用空态/重试，分页重置、回复深度/数量预算；保留数据渲染分开 |
| `JobsSwiftCountryCodeCtrl@Pods` | 1 / 298 | 核心抽查 | 维持/P3数据 | 地区数据来源/版本、号码边界回归；保留country验证与delegate |
| `JobsSwiftDSL@Pods` | 75 / 14,808 | 重点API抽查 | P1/P2局部/P3模块化 | 灰度/HEX颜色边界；UI隔离与真实返回类型，保持DSL/工厂分工 |
| `JobsSwiftDebugTools@Pods` | 3 / 155 | 核心核验 | 维持/P3回归 | DEBUG守卫与关联销毁监听保留；多窗日志/主线程及资源声明 |
| `JobsSwiftExcel@Pods` | 6 / 443 | 核心概览 | P2边界/P3大表 | 冻结极值先clamp；小表保持，大规模再虚拟化与性能测试 |
| `JobsSwiftFoundation@Pods` | 6 / 333 | 核心深入/实测 | P2必要 | uint32和可失败读写；保留UInt64字串/Decimal避免Double |
| `JobsSwiftGraphicCaptcha@Pods` | 3 / 351 | Generator深入/其它概览 | P3真实接入 | 本地UI保留；真实challenge/verify/限流/过期接服务端 |
| `JobsSwiftLinkageMenuView@Pods` | 1 / 296 | 核心抽查 | 维持/P3空态 | 空menu/动态尺寸/缺页回归；保留菜单内容分离与selection归一 |
| `JobsSwiftMarkdown@Pods` | 5 / 544 | 自有核心深入/探针 | P1/P2必要 | 锚点、远程策略、失败/版本/I/O；Vendor未审阅，保留本地资源 |
| `JobsSwiftNumberStepper@Pods` | 1 / 272 | 全文件概览 | 维持/P3回归 | overflow reporting/minmax/输入Range已有；成熟的小组件继续保持 |
| `JobsSwiftOpen@Pods` | 3 / 217 | 核心概览 | P3条件 | completion区分展示/加载，失败/重试与防重；保留轻量内外统一入口 |
| `JobsSwiftPatch@Pods` | 1 / 91 | 深入/真实探针 | P1必要 | 继承、ABI、同槽所有权、回滚事务；公开接口小，适合渐进收口 |
| `JobsSwiftRefresher@Pods` | 6 / 2,461 | 深入 | P2必要 | inset/替换/结束动画收尾；保留状态机与动画插件分离 |
| `JobsSwiftSearcher@Pods` | 2 / 532 | 核心抽查 | 维持/P3账户范围 | 已有去重/历史上限；按账号隔离history与清理策略 |
| `JobsSwiftSplash@Pods` | 7 / 1,019 | 深入 | P2必要/P3预算 | 图片坏缓存自愈、GIF尺寸/帧预算；持续视频预加载按既定产品策略治理 |
| `JobsSwiftStandardLibrary@Pods` | 21 / 445 | 核心深入 | P2必要 | 安全Builder/通用整数；保留Collection.Index安全下标与单遍minMax |
| `JobsSwiftTaskCenter@Pods` | 16 / 2,481 | 深入 | P1/P2必要 | 等待取消、最后事件、async action句柄；保持计划/状态分层 |
| `JobsSwiftTimer@Pods` | 5 / 1,164 | 深入/宿主测试核对 | 维持/P2参数边界 | 补config突变末端校验；generation/锁/单调真值/背压和4内核保留 |
| `JobsSwiftTimerMgr@Pods` | 2 / 734 | 深入/宿主测试核对 | 维持/P3负载回归 | 精准取消/替换/Scope成熟，未确认新高优先缺陷 |
| `JobsSwiftTools@Pods` | 7 / 2,214 | 核心深入 | P1/P2必要 | 相册并发/权限/proxy/无宿主、Flutter终态、signal安全；保留权限/引擎职责 |
| `JobsSwiftUILabelScrolling@Pods` | 5 / 837 | 深入 | 维持/P3回归 | 弱label/原文本恢复/静态停timer已有；动态字体/RTL/离屏回归 |
| `JobsSwiftWebSocket@Pods` | 1 / 348 | 完整client深入 | P3防误用/并发 | 显式disconnect有效；可加弱代理减少遗漏，保留串行队列与退避 |
| `JobsSwiftWorker@Pods` | 11 / 900 | 深入/释放实测 | P2必要 | 订阅所有权/once/调度事务；保留锁外通知与清理容器 |
| `JobsTextTools@Pods` | 2 / 330 | 核心深入 | 条件P2/P3 | 属性对象深度不可变/Sendable合同；UTF16 cursor正确，继续保留 |
| `JobsToast@Pods` | 1 / 217 | 深入 | P2必要 | 安全关联引用/旧completion身份，保留MainActor与按窗入口 |
| `JobsViewPush@Pods` | 2 / 1,046 | 核心抽查 | 维持/P3回归 | SideDrawer代际/中断续动画已有；快反向/键盘/旋转回归 |
| `JobsWalletCard@Pods` | 8 / 887 | 核心抽查 | P3空态 | 空卡片/重试slot；保留typed model/弱delegate/layout缓存 |
| `Jobsl10n@Pods` | 8 / 658 | 深入 | P2必要 | Bundle回退/系统模式、slot去重与同步；保留弱target刷新方向 |
| `MetalKit@Pods` | 1 / 8 | 8行桥接 | P3按需 | 真实Pod名JobsSwiftMetalKit，DSL迁移兼容；无需扩成重复渲染层 |

## 五、值得安排的工程升级 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、把异步操作的契约统一下来 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

网络、任务中心、事件流、计时回调、Picker 和 Flutter 会话共享同一组需要明确的行为：

- 明确回调队列及线程隔离；UI 状态归主线程，后台共享状态由锁、串行队列或 Actor 管理。
- 定义成功、失败、取消、超时是否完成一次；观察流与最终 completion 的语义分开。
- 取消时清理底层任务、等待者、回调和定时器；不能仅把公开状态改成 cancelled。
- 用 operation ID / generation 区分新旧会话；旧回调不得修改新操作，旧句柄不得撤销替代对象。
- 对缓存先读、网络再更新等多阶段行为，明确用户可见事件、最终返回值和取消后允许的事件。

优先抽取**共同测试场景与小型终态工具**。不要一开始造一个覆盖所有异步库的庞大统一框架。

### 5.2、渐进完善并发检查，保留可用的旧调用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前主工程 `SWIFT_VERSION = 5.0` 是语言模式设置；不能据此推断本机编译器陈旧。podspec 中也存在 `5.9` 及多个兼容版本声明。

**本轮独立实测**：Apple Swift 6.4 对真实 [JobsNetworking / JobsValue.swift L11](</Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsNetworking@Pods/Request/JobsValue.swift:11>) 执行 `swiftc -swift-version 6 -typecheck`，其 `Any?` 不满足 Sendable，退出码1；Swift 5 模式下为 warning。该文件只依赖 Foundation，无 stub，也未加载 Pods 集成工程。这是一个已确认的迁移门槛，不是整工程当前构建失败。

先在 Swift 5 语言模式下对选定模块打开完整并发检查，修复真实共享可变状态、`Any?` 的 Sendable 声明、闭包捕获和主线程契约，再逐模块评估 Swift 6 语言模式。`@unchecked Sendable` 只适用于已经有完整同步机制且可证明的类型；不能作为消除警告的通用开关。这种渐进路径符合 [Swift 官方增量迁移说明](https://www.swift.org/migration/documentation/swift-6-concurrency-migration-guide/incrementaladoption/)。

首批建议为 `JobsSwiftFoundation`、`JobsSwiftWorker`、`JobsNetworking` 的非 UI 核心，再推进 UI 封装。完整模式下发现的编译错误应写入迁移清单；本报告不将尚未切换模式的工程描述为当前无法编译。

### 5.3、收窄基础库的依赖和交付范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 入口 | 显式直接依赖去重数 | 去重可达依赖数 | 值得处理的边界 |
| --- | --- | --- | --- |
| `JobsByUIKit` | 22 | 29 | 常规创建/扩展同时带入多套图片、刷新、响应式和动画依赖 |
| `JobsSwiftDSL` | 10 | 12 | 系统 DSL 与播放器、网络等第三方 DSL 同模块 |
| `JobsSwiftTools` | 8 | 34 | 使用权限/相册工具也会引入 Flutter 相关依赖 |
| `JobsSwiftAppTools` | 12 | 47 | 应用通用能力通过工具与第三方聚合继续扩大依赖 |

统计从当前 podspec 的显式 `dependency` 字面量计算，含自建及外部模块；未计动态辅助逻辑，**不是二进制体积、启动时间或链接成本的实测结果**。

以 `Foundation / UIKit 基础 / 第三方适配 / Flutter / Unity / 媒体` 等真实职责切分按需模块或 subspec。选择 1–2 个消费面最小的入口试点；保留兼容导出并检查实际 `import`、公开签名、宿主 Demo 与跨 Pod 依赖，再逐步推广。已有布局方案 [**SnapKit**](https://github.com/SnapKit/SnapKit) 和 Jobs 链式语义继续使用。

40/65 份 podspec 使用 `**/*.{swift,h,m,mm}` 这种宽源码 glob。当前未发现测试因此被误编译；未来在 Pod 目录增加测试时，应先明确生产源路径和排除项，避免测试、示例及临时探针进入生产 target。

宿主 [Podfile](/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/Podfile:24) 已统一最低系统为 iOS 15，许多独立 podspec 仍声明 iOS 12。应明确每个库是否继续单独支持低系统，并在干净消费工程验证；不能仅因宿主能构建就宣称独立 Pod 的低版本承诺成立，也不应在未确认使用者需求时统一抬高最低版本。

### 5.4、将已有测试转化为持续有效的门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

宿主已有 [14 个 XCTest 方法](/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsSwiftBaseConfigDemoTests/JobsSwiftBaseConfigDemoTests.swift:57)，包括计时器归一化、四内核、单次结束、背压、时间真值、管理器替换及精准取消等。现有 [GitHub Actions 构建流程](/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/.github/workflows/build_simulator_app.yml:64) 运行 Block 独立回归，主工程阶段在第 118–130 行执行 `build`，未执行宿主 `test`。

建议保留构建与产物流程，增加明确模拟器目的地的核心 XCTest 门禁。针对网络/Worker/TaskCenter 使用注入时钟、假客户端和有限等待；避免测试依赖真实服务器、蓝牙设备或长时间 sleep。UI 测试集中到 Scene、取消、重入、页面销毁等真实风险，测试每个简单属性 setter 的收益较低。**验收标准是恢复旧缺陷时门禁会失败。**

### 5.5、独立发布前补齐资源和隐私声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

目前自建目录中只发现 `JobsBluetooth/Resource/PrivacyInfo.xcprivacy`，并通过 podspec 资源 bundle 声明。需要逐个核对**真实使用需要理由的 API 的模块**：例如 `JobsSwiftFoundation` 的 UserDefaults、`JobsSwiftTools` 的退出标记及文件时间、`JobsSwiftTimer` 的系统运行时间、`JobsSwiftDebugTools` 的持久开关。没有这些使用的薄桥接不因此自动需要一份清单。

按实际用途和宿主/SDK 分发形态选择被批准的 reason，把资源放入对应模块 `Resource` 并检查最终 bundle；不能复制一个空的 accessed API 数组来代替声明。Apple 的 [隐私清单说明](https://developer.apple.com/documentation/bundleresources/privacy-manifest-files) 与 [需要理由的 API 指南](https://developer.apple.com/documentation/bundleresources/describing-use-of-required-reason-api) 是核对依据。本报告没有执行上传和最终隐私报告，不能据此断言当前 App 已遭拒绝。

独立分发再检查实际资源 bundle、公开头、依赖版本、source glob、最低系统、Debug/Release、静态/动态集成和最小消费 App。`ruby -c` 的成功不代替 podspec 语义加载或实际链接。

## 六、实施顺序与验收路线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 波次 | 改造内容 | 可交付的验收结果 |
| --- | --- | --- |
| 第一波：正确性 | 公开 API 崩溃、缓存键/文件名、下载/上传/query、补丁范围、WebView 配置 | 每个缺陷有可重复回归；失败输入不崩，失败响应不覆盖好文件，配置确实生效 |
| 第二波：生命周期 | 网络取消、TaskCenter 等待、Worker 订阅、Picker、倒计时/刷新、Flutter | 取消和终态一次；无悬挂等待；重启后旧回调无效；释放后工作停止 |
| 第三波：真实设备/场景 | BLE、录音、通知、图片解码、截图保护、多窗口、日历模式 | 在明确设备/系统矩阵下验证，分别记录通过、失败和能力限制 |
| 第四波：可持续维护 | 并发迁移、按需依赖、独立消费 App、测试门禁、分发资源 | 小消费 App 可集成；新语言模式逐模块过检查；行为门禁进入持续运行 |

每波限制在相关模块与必要消费方内，先锁定行为再改实现。推荐统一回归集合：

- 正常成功、输入无效、依赖失败、超时、取消、重复调用、回调重入。
- 新操作替换旧操作、对象销毁、前后台切换、页面复用、多 Scene。
- 缓存/持久格式读写和跨版本兼容、异常数据、不可读文件、资源缺失。

底层公开 API 一旦变化，按既有规约同步核对实现、相关 Pod README、宿主 Demo、工程框架文档和公共 CodeSnippets；存在对应 OC 语义时核对两侧。每次升级报告验证范围及未跑项目，不能用文档同步替代运行验证。

## 七、报告的使用边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本报告反映审阅日期的工作区。文件位置和行号随后续编辑可能变化；已修复后应复核结论。第三章给出触发条件、证据等级、最小改法与验收建议，优先沿这些条件建立回归，再判断是否扩大设计调整。

“未发现优先缺陷”只表示本次覆盖范围未确认问题；“条件性加固”也不等于模块在现有 Demo 场景必然出错。报告不修改源实现、不生成提交、不推送远程仓库。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
