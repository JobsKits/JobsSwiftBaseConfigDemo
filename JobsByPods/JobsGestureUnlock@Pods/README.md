> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



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

包含滑动解锁与九宫格手势两类交互。滑动视图按方向计算进度及终点判定；手势视图通过节点、图案模型和配置组织选择轨迹，再把结果交给宿主。

### 1.2、运行脉络

配置交互形态 → 跟踪触摸并更新进度或节点序列 → 判断是否完成 → 回调宿主 → 重置或展示结果

### 1.3、关键设计与边界

- 滑动支持双向，0 到 1 表示从指定起点到终点的完成度，不能仅以屏幕 x 坐标判断。
- 轨道闪动和遮罩属于视觉层，不能影响真正的解锁完成条件。
- 九宫格图案与账号鉴权是不同层次；本组件不自动安全保存密码或决定登录授权。
- 取消、失败和未到终点都需要正确复位，成功回调不能在连续触摸中重复触发。

### 1.4、阅读与重建顺序

分别读 SlideToUnlockView 的方向与手势处理、GesturePattern 与 GestureUnlockView 的节点规则，再接业务验证。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [高仿Android手势开锁🔒/GestureUnlockView.swift](<./高仿Android手势开锁🔒/GestureUnlockView.swift>)
- [高仿Android手势开锁🔒/GesturePattern.swift](<./高仿Android手势开锁🔒/GesturePattern.swift>)
- [高仿Android手势开锁🔒/GestureNodeView.swift](<./高仿Android手势开锁🔒/GestureNodeView.swift>)
- [高仿Android手势开锁🔒/GestureUnlockConfiguration.swift](<./高仿Android手势开锁🔒/GestureUnlockConfiguration.swift>)
- [Apple滑动开锁🔒.swift](<./Apple滑动开锁🔒.swift>)

依赖与编译入口：[JobsGestureUnlock.podspec](<./JobsGestureUnlock.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftBlock`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
