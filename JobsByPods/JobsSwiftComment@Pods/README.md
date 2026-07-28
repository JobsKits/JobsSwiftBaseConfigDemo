# JobsSwiftComment

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
