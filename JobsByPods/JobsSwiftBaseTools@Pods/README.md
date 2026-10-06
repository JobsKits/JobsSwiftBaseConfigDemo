# <span id="前言">JobsSwiftBaseTools</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

聚合可复用的基础行为工具，包括窗口与手势便利入口、导航防重、键盘观察、容错解码、输入策略、弱引用及雪花标识等。各文件围绕自己的状态和职责工作，并非一个统一服务对象。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

选择对应工具 → 配置输入或安装观察 → 完成转换或事件处理 → 由调用方管理结果与释放

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 导航防重通过一次性安装的运行时交换与转场闸门工作，具有全局影响，不能在每次 push 前重复安装。
- SafeCodable 的兜底策略可能隐藏后端字段异常，阅读时应区分容错默认值和真正合法的业务值。
- 键盘与输入策略处理的是 UI 事件，不应与网络流量统计或 ID 生成混成同一生命周期。
- Snowflake 的时间、节点和序列规则需要保持一致，不能仅凭类名保证跨机器唯一。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先按需要选择文件，优先读公开配置与状态变量，再看安装、观察、销毁和错误处理。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Inlines.swift](<./Inlines.swift>)
- [JobsSafeTransitions.swift](<./JobsSafeTransitions.swift>)
- [JobsStructTools.swift](<./JobsStructTools.swift>)
- [KeyboardObserver.swift](<./KeyboardObserver.swift>)
- [SafeCodable.swift](<./SafeCodable.swift>)

依赖与编译入口：[JobsSwiftBaseTools.podspec](<./JobsSwiftBaseTools.podspec>)。其中显式依赖声明包括 `RxSwift`、`RxCocoa`、`NSObject+Rx`、`SnapKit`、`Alamofire`、`JobsSwiftBaseDefines`、`JobsSwiftBlock`、`JobsByUIKit`、`JobsSwiftDSL`、`JobsGetWindow`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、使用合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 全局 `jobsGetMainWindow`、`jobsGetMainWindowBefore13`、`jobsGetMainWindowAfter13` 统一定义于 [JobsGetWindow](<../JobsGetWindow@Pods/README.md>)，本模块直接依赖并再导出，手势创建函数继续由本模块承接。重编后的源码调用保持；符号定义模块迁移不承诺预编译 ABI，使用窗口函数的二进制客户端需要重新编译。
- `SafeCodable` 的数值回退拒绝非有限值和越界窄化；合法小数转整数按向零截断处理，非法值走既有默认值与报告出口。
- Date 默认 `.decoderStrategy` 保留 `JSONDecoder.dateDecodingStrategy` 原生快速路径；只有回退时采用自动秒/毫秒判断。需要确定单位时，在 decoder 的 `userInfo[.safeCodableConfig]` 指定配置，或使用 `userInfo[.safeCodableTimestampUnits] = ["user.createdAt": .milliseconds]` 按点分字段路径覆盖；根值路径为 `""`。显式单位对数字和数字字符串一致生效，绕过原生 Date 快速路径。
- 自动单位以绝对值 `1e12` 为秒/毫秒分界，是宽松兼容规则。业务字段应选择 `.seconds` 或 `.milliseconds`；非有限时间和超出支持日历范围的时间拒绝回退。
- 全局配置和 reporter 的读写受锁保护，替换旧注入对象时在锁外释放；建议启动时一次设置，或为独立 decoder 提供配置快照。调用方注入的 `DateFormatter` 和 reporter 不得在解码期间并发修改内部状态。
- Snowflake 节点 `IDCID` / `machineID` 均为 `0...31`。旧构造保留签名，非法配置的 `nextID()` 返回 `nil`；新调用可用 `init?(validatingPublishMillisecond:IDCID:machineID:clock:)` 在创建处处理错误。
- Snowflake 同实例串行提交生成状态，回拨、每毫秒 4096 个额度耗尽、时钟无值或超出 41 位时间范围时立即返回 `nil`，调用方稍后重试。所有节点必须共享固定 epoch 且节点组合唯一；注入 clock 在锁外求值，必须支持并发读取。并发时较早采样若较晚取得状态锁，会按旧时间拒绝，保持唯一性，不忙等。
- 网络流量监听允许并发启动、停止和替换回调；串行采样、锁与代次共同保护状态，回调始终投递主队列，旧回调捕获对象在锁外释放。停止或替换会撤销尚未开始的旧代次回调，已进入的业务回调可能继续。
- 网络计数器回退时该次增量按零处理，速度使用真实单调时间间隔计算。无效采样间隔回退默认值，合法间隔限制在 `0.05...86_400` 秒。网卡统计包含其它 App 的流量，只能作为设备层观察信号。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

每个显式 subspec 同步继承生产排除集合，避免只消费子模块时带入测试/示例源码。

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftBaseTools --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
