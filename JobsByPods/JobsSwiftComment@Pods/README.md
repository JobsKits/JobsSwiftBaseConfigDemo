# JobsSwiftComment

Swift 本地 Pod，用于在 Swift 侧承接 OC `JobsOCComment` 的评论列表能力。

## 能力

- `JobsSwiftCommentMode` 提供网易、今日头条、自定义三种回复展示模式。
- `JobsSwiftCommentModel` 承载一级评论、多级回复、设备和位置等展示数据。
- `JobsSwiftCommentConfig` 管理展示模式、回复入口、刷新加载和点击回调。
- `JobsSwiftCommentView` 内置评论渲染、更多回复展开、下拉刷新和上拉加载更多。
- 按钮创建、配置和事件统一使用 `JobsByUIKit` / `JobsSwiftDSL`。

## 依赖

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
