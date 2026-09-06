> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

提供可点击重试的最小空态视图：一个居中的提示标签和一个点击手势，通过 Jobs 回调扩展把重试意图交给宿主。

### 1.2、运行脉络

宿主决定展示空态 → 用户点击视图 → 回调宿主重试 → 宿主根据结果移除或保留空态

### 1.3、关键设计与边界

- 当前实现重点是文字提示与点击重试，没有独立的网络请求、图片配置或多状态管理引擎。
- byOnTapRetry 绑定的是动作回调，是否发请求、节流及加载过程展示由宿主决定。
- 标签与背景使用主题颜色，提示文案经过本地化入口；重建时应保留这些接入点。

### 1.4、阅读与重建顺序

直接读 JobsEmptyView.swift 的标签、手势与 byOnTapRetry，再看宿主何时添加和移除视图。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsEmptyView.swift](<./JobsEmptyView.swift>)

依赖与编译入口：[JobsEmptyView.podspec](<./JobsEmptyView.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftBlock`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
