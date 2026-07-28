# `JobsViewPush`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsViewPush` 提供 UIView 级安全推入容器和控制器级侧滑抽屉，统一处理上下左右方向、推出比例、背景遮罩、点击关闭与交互式拖动。

## 一、能力范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsViewPushPresentation`：把任意 `UIView` 从上、下、左、右方向推入指定容器，并支持沿原路拖回。
- `JobsSideDrawerVC`：支持 `UIViewController` / `UIView` 两种载体、跟随或固定主内容、边缘拖出以及点击遮罩关闭。
- 模块内部使用 `JobsSwiftDSL` 组织视图与动画，基础色使用 `JobsSwiftBaseDefines.JobsCor`。

## 二、侧滑抽屉交互

- 打开：从配置方向对应的屏幕边缘拖动，抽屉、主内容和遮罩实时跟随手指进度。
- 关闭：抽屉打开后可从整个容器开始反向拖动，不限于抽屉内容区域；松手前可反向回拉取消。
- 松手判定：同时参考当前位移、甩动速度和短时速度投影，完成动画只覆盖剩余距离。
- 动画接管：按钮动画尚未结束时可以直接用手势接管，不需要等待程序动画完成。
- 滚动仲裁：与抽屉同轴的 `UIScrollView` 能继续滚动时优先滚动，到达边界后再交给抽屉；垂直轴列表可与横向抽屉手势协同识别。
- 无障碍：开启“减弱动态效果”后，松手收口时间会进一步缩短。

## 三、交互参数

`JobsSideDrawerConfiguration` 提供以下可调参数：

| 参数 | 默认值 | 作用 |
| --- | ---: | --- |
| `allowsInteractiveTransition` | `true` | 是否启用边缘打开与拖动关闭 |
| `shouldBeginOpeningGesture` | `nil` | 每次边缘打开前校验当前页面；返回 `false` 时禁止打开，不影响关闭手势 |
| `interactiveCompletionThreshold` | `0.28` | 低速拖动完成开关所需的位移比例 |
| `interactiveVelocityThreshold` | `360` | 超过该速度后按甩动方向直接决定结果 |
| `interactiveProjectionTime` | `0.18` | 松手速度参与进度预测的时间窗口 |
| `interactiveAxisDominanceRatio` | `0.8` | 主轴相对副轴达到多少比例后接管手势 |
| `onDidClose` | `nil` | 抽屉完成关闭后回调；全屏模态预览可在此退出承载页面 |

```swift
let configuration = JobsSideDrawerConfiguration(
    direction: .left,
    contentMode: .following,
    presentedRatio: 0.5,
    interactiveCompletionThreshold: 0.28,
    interactiveVelocityThreshold: 360
)

let drawer = JobsSideDrawerVC(
    drawerViewController: menuViewController,
    mainViewController: mainViewController,
    configuration: configuration
)
```

运行期间修改配置后，调用 `applyConfiguration(animated:)` 使方向、比例、颜色和交互阈值生效。

## 四、模块边界

- [**Swift**](https://www.swift.org/) 源码位于 `./JobsViewPush.swift` 与 `./Core/`。
- `./JobsViewPush.podspec` 负责声明源码、`UIKit` 以及 Jobs 本地依赖。
- 模块修改后应扫描主工程中的 `import JobsViewPush`、`JobsSideDrawerVC`、`JobsSideDrawerConfiguration` 和 `jobsPush` 调用，避免公开配置与调用示例漂移。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
