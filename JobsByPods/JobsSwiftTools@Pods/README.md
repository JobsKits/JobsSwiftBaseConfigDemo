> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

面向应用集成提供权限、媒体选择、崩溃记录和跨引擎桥接等服务。每个服务单独承接系统或外部运行时，JobsSwiftTools.swift 作为通用入口集合，不能按一个单纯工具类理解全部行为。

### 1.2、运行脉络

宿主选择服务并初始化 → 处理权限或外部运行时 → 执行动作 → 交付结果并释放或保存状态

### 1.3、关键设计与边界

- CrashLogCenter 持久化退出标记与日志，未到安全退出点只能表示疑似异常退出，不能精确证明崩溃原因。
- SIGKILL/Jetsam 无回调，signal handler 内使用 Swift/ObjC/IO 也有明确限制；不可宣称完整可靠捕获所有崩溃。
- 媒体选择与权限申请分层，选择结果还可能需要异步加载，不能把展示选择器当作取得文件。
- [**Flutter**](https://flutter.dev/) 和 Unity 桥接依赖外部引擎与宿主生命周期，重建某个小服务时应明确是否需要这些集成。

### 1.4、阅读与重建顺序

按任务先读 PermissionCenter、MediaPickerService 或 CrashLogCenter，再看 FlutterBridge/UnityManager 与应用生命周期接入点。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [FlutterBridge.swift](<./FlutterBridge.swift>)
- [JobsSwiftTools.swift](<./JobsSwiftTools.swift>)
- [UnityManager.swift](<./UnityManager.swift>)
- [CrashLogCenter.swift](<./CrashLogCenter.swift>)
- [MediaPickerService.swift](<./MediaPickerService.swift>)

依赖与编译入口：[JobsSwiftTools.podspec](<./JobsSwiftTools.podspec>)。其中显式依赖声明包括 `Flutter`、`FlutterPluginRegistrant`、`JobsSwiftBaseDefines`、`JobsSwiftBlock`、`JobsByPhotosUI`、`JobsByUIKit`、`JobsToast`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
