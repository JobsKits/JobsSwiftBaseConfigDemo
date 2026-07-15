# JobsViewPush

同时提供 `JobsSideDrawerVC`：支持上、下、左、右、跟随或固定内容、`UIViewController` / `UIView` 载体、方向轴推出比例、边缘拖出以及沿原路拖回；交互式开关默认开启，可通过 `allowsInteractiveTransition` 配置。

UIView 级安全推入容器，支持上下左右方向、覆盖比例、拖拽退出和点击背景退出。

- 视图配置使用 `JobsSwiftDSL`。
- UIKit 基础色使用 `JobsSwiftBaseDefines.JobsCor`，例如 `JobsCor.black.withAlphaComponent(0.18)`。
