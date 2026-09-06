> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

聚合可复用的基础行为工具，包括窗口与手势便利入口、导航防重、键盘观察、容错解码、输入策略、弱引用及雪花标识等。各文件围绕自己的状态和职责工作，并非一个统一服务对象。

### 1.2、运行脉络

选择对应工具 → 配置输入或安装观察 → 完成转换或事件处理 → 由调用方管理结果与释放

### 1.3、关键设计与边界

- 导航防重通过一次性安装的运行时交换与转场闸门工作，具有全局影响，不能在每次 push 前重复安装。
- SafeCodable 的兜底策略可能隐藏后端字段异常，阅读时应区分容错默认值和真正合法的业务值。
- 键盘与输入策略处理的是 UI 事件，不应与网络流量统计或 ID 生成混成同一生命周期。
- Snowflake 的时间、节点和序列规则需要保持一致，不能仅凭类名保证跨机器唯一。

### 1.4、阅读与重建顺序

先按需要选择文件，优先读公开配置与状态变量，再看安装、观察、销毁和错误处理。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Inlines.swift](<./Inlines.swift>)
- [JobsSafeTransitions.swift](<./JobsSafeTransitions.swift>)
- [JobsStructTools.swift](<./JobsStructTools.swift>)
- [KeyboardObserver.swift](<./KeyboardObserver.swift>)
- [SafeCodable.swift](<./SafeCodable.swift>)

依赖与编译入口：[JobsSwiftBaseTools.podspec](<./JobsSwiftBaseTools.podspec>)。其中显式依赖声明包括 `RxSwift`、`RxCocoa`、`NSObject+Rx`、`SnapKit`、`Alamofire`、`JobsSwiftBaseDefines`、`JobsSwiftBlock`、`JobsByUIKit`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
