# `JobsGestureUnlock`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## <span id="前言">明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span>

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

包含滑动解锁与九宫格手势两类交互。滑动视图按方向计算进度及终点判定；手势视图通过节点、图案模型和配置组织选择轨迹，再把结果交给宿主。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置交互形态 → 跟踪触摸并更新进度或节点序列 → 判断是否完成 → 回调宿主 → 重置或展示结果

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 滑动支持双向，0 到 1 表示从指定起点到终点的完成度，不能仅以屏幕 x 坐标判断。
- 轨道闪动和遮罩属于视觉层，不能影响真正的解锁完成条件。
- 九宫格图案与账号鉴权是不同层次；本组件不自动安全保存密码或决定登录授权。
- 取消、失败和未到终点都需要正确复位，成功回调不能在连续触摸中重复触发。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

分别读 SlideToUnlockView 的方向与手势处理、GesturePattern 与 GestureUnlockView 的节点规则，再接业务验证。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [高仿Android手势开锁🔒/GestureUnlockView.swift](<./高仿Android手势开锁🔒/GestureUnlockView.swift>)
- [高仿Android手势开锁🔒/GesturePattern.swift](<./高仿Android手势开锁🔒/GesturePattern.swift>)
- [高仿Android手势开锁🔒/GestureNodeView.swift](<./高仿Android手势开锁🔒/GestureNodeView.swift>)
- [高仿Android手势开锁🔒/GestureUnlockConfiguration.swift](<./高仿Android手势开锁🔒/GestureUnlockConfiguration.swift>)
- [Apple滑动开锁🔒.swift](<./Apple滑动开锁🔒.swift>)

依赖与编译入口：[JobsGestureUnlock.podspec](<./JobsGestureUnlock.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftBlock`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、输入与配置合同 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

两种 UIKit 视图在主线程配置和使用。滑动只有 `.ended` 且进度 >0.85 才调用 onUnlock；取消/失败复位。成功到自动复位的 0.6 秒内不再接受第二次成功，延迟任务弱捕获视图。`reset(animated:)` 为公开复用入口，调用会撤销旧的延迟复位。

手势配置 `gridDimension` 收口到 2...10；节点直径必须为有限正数，边框/连线宽必须为有限非负数，非法值使用默认值。minimumPatternLength 收口到 1...节点总数。配置变化先清除旧图案与活动输入再重建，禁止输入与触摸取消也清状态。重建后旧触摸的 move/end 不提交图案。

`onComplete` 和 delegate 保留全部正常结束图案（包括短图案）的旧合同。`isValidPattern` 按当前配置检查最短长度、节点索引和重复节点；`onInvalidPattern` 在正常触摸结束但结构无效时另行通知，组件自身产生的图案通常只有最短长度不达标这一类。结束时在业务回调前快照有效性和 invalid handler，随后保持 delegate → onComplete → invalid 的顺序；前两个回调中切换配置不会改变旧输入的判定。结构判断不替代账号认证。

设备回归应覆盖选中旧九宫格末节点后切为 2×2 并 showError/layout、越界网格配置、取消超过阈值滑动、短图案、完成回调中重配、重复成功及视图释放；这些 UIKit 行为尚未实跑，原生 Parse 或模块编译不能替代运行验收。密码持久化需业务实现受保护存储、尝试限制和身份验证策略。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsGestureUnlock --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
