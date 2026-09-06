# JobsSwiftComment

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

Swift 本地 Pod，用于在 Swift 侧承接 OC `JobsOCComment` 的评论列表能力。

## 能力

- `JobsSwiftCommentMode` 提供网易、今日头条、自定义三种回复展示模式。
- `JobsSwiftCommentModel` 承载一级评论、多级回复、设备和位置等展示数据。
- `JobsSwiftCommentConfig` 管理展示模式、回复入口、刷新加载和点击回调。
- `JobsSwiftCommentView` 内置评论渲染、更多回复展开、下拉刷新和上拉加载更多。
- 按钮创建、配置和事件统一使用 `JobsByUIKit` / `JobsSwiftDSL`。
- 视图布局和动态缩进约束统一由 `SnapKit` 管理。

## 依赖

- `SnapKit`（组件布局和动态约束更新）。
- `JobsByUIKit`（按钮工厂和 UIKit 扩展）。
- `JobsSwiftDSL`（视图、控件和按钮链式 API）。
- `JobsSwiftBaseDefines`（使用 `JobsCor`、`JobsFont` 和 `UIColor(r:g:b:a:)`）。

## 目录

- `Core/JobsSwiftCommentMode`：评论展示模式。
- `Core/JobsSwiftCommentModel`：评论数据模型。
- `Core/JobsSwiftCommentConfig`：组件配置和回调。
- `Core/JobsSwiftCommentCell`：内部评论 Cell。
- `Core/JobsSwiftCommentView`：公开评论列表视图。

## 验证

```shell
pod lib lint JobsSwiftComment.podspec --allow-warnings --verbose
```

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

由评论模型、模式配置、Cell 和外层视图组成评论展示组件。模型表达主评论及回复关系，配置决定不同平台风格与可见信息，视图组织展示并回调用户动作。

### 1.2、运行脉络

提供评论数据和模式 → 展示主评论及可见回复 → 用户选择、回复或刷新 → 宿主处理业务 → 更新数据

### 1.3、关键设计与边界

- 数据层级和屏幕上展开的回复数量是不同概念，“更多回复”不等于模型中没有其余内容。
- 选择评论、请求回复、刷新与加载更多需要区分，避免一次点击触发多次业务动作。
- 组件不包含真实评论提交接口或分页后端，网络结果由宿主更新。
- Model 是值类型，业务修改数据后需按视图接口重载，不能假设已展示 Cell 自动观察所有结构体变化。

### 1.4、阅读与重建顺序

先读 Model、Mode 和 Config，再看 View 的层级展开、回调与 Cell 的内容渲染。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftCommentConfig/JobsSwiftCommentConfig.swift](<./Core/JobsSwiftCommentConfig/JobsSwiftCommentConfig.swift>)
- [Core/JobsSwiftCommentModel/JobsSwiftCommentModel.swift](<./Core/JobsSwiftCommentModel/JobsSwiftCommentModel.swift>)
- [Core/JobsSwiftCommentView/JobsSwiftCommentView.swift](<./Core/JobsSwiftCommentView/JobsSwiftCommentView.swift>)
- [Core/JobsSwiftCommentCell/JobsSwiftCommentCell.swift](<./Core/JobsSwiftCommentCell/JobsSwiftCommentCell.swift>)
- [Core/JobsSwiftCommentMode/JobsSwiftCommentMode.swift](<./Core/JobsSwiftCommentMode/JobsSwiftCommentMode.swift>)

依赖与编译入口：[JobsSwiftComment.podspec](<./JobsSwiftComment.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
