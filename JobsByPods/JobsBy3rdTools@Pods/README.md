> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。


## DSL 迁移说明

- 本 Pod 原有的链式 DSL / 点语法封装已经抽离到 `JobsSwiftDSL`。
- 继续使用 `byXxx(...)`、`dsl { ... }` 这类语法时，请在调用文件显式 `import JobsSwiftDSL`。
- 本 Pod 保留薄桥接文件和 `JobsSwiftDSL` 依赖，用于兼容旧代码的过渡期。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

集中放置 Jobs 为第三方库编写的配置与调用适配，使业务代码可以沿用统一链式表达。按上游库划分目录，包括弹层、播放器、图片加载、刷新、分段控件及网络等，功能执行仍交给对应第三方库。

### 1.2、运行脉络

创建第三方对象或配置值 → 使用 Jobs 扩展配置 → 交给上游组件展示或执行

### 1.3、关键设计与边界

- 不要把这些扩展当作第三方库的完整替代实现；重建时应先确认上游依赖与版本接口。
- EKAttributes 等结构体采用复制、修改、返回新值的方式；引用类型扩展通常返回当前对象，两者不能混用。
- 配置 DSL、事件回调和便利助手各有作用，不能把 HUDHelper 等行为入口误写成纯属性赋值。
- 不同目录的依赖和可用系统版本不同，不应为了重建一个小扩展把所有第三方功能绑成一个必选大模块。

### 1.4、阅读与重建顺序

从目标第三方库对应目录进入，先看扩展接收类型与返回类型，再看事件、生命周期及上游依赖。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsBy3rdToolsDSLBridge.swift](<./JobsBy3rdToolsDSLBridge.swift>)
- [JobsInstrumentPanelView.swift](<./JobsInstrumentPanelView.swift>)
- [SphereTagCloudView.swift](<./SphereTagCloudView.swift>)
- [JXSegmentedView/JXSegmentedListContainerView.swift](<./JXSegmentedView/JXSegmentedListContainerView.swift>)
- [JXSegmentedView/JXSegmentedView.swift](<./JXSegmentedView/JXSegmentedView.swift>)

依赖与编译入口：[JobsBy3rdTools.podspec](<./JobsBy3rdTools.podspec>)。其中显式依赖声明包括 `BMPlayer`、`SwiftEntryKit`、`YTKNetwork`、`Kingfisher`、`SDWebImage`、`MJRefresh`、`JXSegmentedView`、`GKNavigationBarSwift`、`SnapKit`、`JobsInheritance`、`JobsTextTools`、`JobsSwiftBaseTools`、`JobsByUIKit`、`JobsScale`、`JobsSwiftTools`、`JobsSwiftBaseDefines`、`JobsSwiftStandardLibrary`、`JobsSwiftMetalKit`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
