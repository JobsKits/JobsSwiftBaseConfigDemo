# `JobsSwiftDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsSwiftDSL` 用于集中管理 Swift 工程里的点语法 / 链式语法糖，例如 `byTitle(...)`、`byFrame(...)`、`dsl { ... }`。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 从 `JobsByPods` 内各个本地管理 Pod 抽出的系统 SDK / 第三方 SDK 二次封装。
- Jobs 自维护的 Swift 主工程和本地 Pods 显式 `import JobsSwiftDSL` 后使用点语法，不在调用方回退到已有 DSL 覆盖的系统 API。
- `JobsCor` 语义背景色、文字色经 `byBackgroundColor(...)`、`byTextColor(...)`、`byTitleColor(...)` 等 DSL 自动登记到 `JobsThemeCenter`；也可使用 `byThemeBackground(...)`、`byThemeTextColor(...)` 和 `byThemeImage(...)` 显式绑定主题 Key。
- `UIButton.byClearConfigurationBackground()` 会持续清除普通、选中、高亮等状态下的配置背景，并在旧系统同步移除背景图，适合只保留前景图标 / 文字的导航按钮。
- 发现封装缺口时先在本 Pod 的正确类型层补齐，再同步业务代码与 Xcode CodeSnippets。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 目录 | 内容 |
| ---- | ---- |
| `UIKit/` | `UIView`、`UIButton`、`UILabel`、`UITableView` 等 UIKit DSL |
| `QuartzCore/` | `CALayer`、`CAAnimation`、`CATransform3D` 等链式封装 |
| `WebKit/` | `WKWebView`、`WKWebViewConfiguration` 等链式封装 |
| `PDFKit/` | `PDFView`、`PDFThumbnailView` 链式封装 |
| `PhotosUI/` | `PHPickerConfiguration`、`PHPickerViewController` 链式封装 |
| `MetalKit/` | `MTKView`、`MTL*Descriptor` 链式封装 |
| `Foundation/` | `JSONDecoder`、`NSMutableAttributedString` 等 Foundation DSL |
| `CoreMotion/` | `CMMotionManager` 的传感器频率、启停、队列回调与参考坐标系 DSL |
| `ThirdParty/` | `SnapKit`、`BMPlayer`、`YTKNetwork`、`GKNavigationBarSwift` 等第三方 DSL |

## 三、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsSwiftBaseDefines
import JobsSwiftDSL

let label = UILabel()
  .byText("Jobs")
  .byThemeTextColor(.textPrimary)
  .byTextAlignment(.center)
  .byLabelShadowColor(.black)
  .byLabelShadowOffset(CGSize(width: 0, height: 1))
  .byTintColor(JobsCor.systemBlue)

func togglePassword(_ textField: UITextField) {
  textField.byToggleSecureTextEntry()
}

func configure(button: UIButton) {
  button
    .bySelected(false)
    .byToggleSelected()
    .bySemanticContentAttribute(.unspecified)
    .byTitleAdjustsFontSizeToFitWidth(true)
    .byTitleMinimumScaleFactor(0.72)
}

func configure(path: UIBezierPath) {
  path
    .byMove(to: .zero)
    .byAddLine(to: CGPoint(x: 20, y: 20))
    .byClose()
}

func show(view: UIView) {
  UIView.jobsAnimateWithOptions(
    0.25,
    options: [.curveEaseOut],
    animations: { view.byAlpha(1) }
  )
}

let motionManager = CMMotionManager.make()
    .byGyroUpdateInterval(1.0 / 30.0)
    .byStartGyroUpdates(to: .main) { data, error in
        print(data?.rotationRate as Any, error as Any)
    }
```

## 四、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本 Pod 是语法糖层，不应该承载业务状态。
- `CMMotionManager.byStopAllUpdates()` 只负责统一停止当前 manager 的四类更新；页面仍需持有 manager，并在离开或销毁时主动调用。
- 后续新增 DSL 时，优先放在这里，不再散落到各个功能 Pod。
- `UIView.tintColor` 这类父类公共属性只在 `UIView` DSL 中封装，子类不重复声明同名 API。
- `UILabel.byLabelShadowColor` / `byLabelShadowOffset` 配置文字阴影；`UIView.byShadowColor` / `byShadowOffset` 配置 CALayer 阴影，两套语义不得混用。
- 不带约束的视图装配统一使用 `UIView.byAddTo(_:)`；带 SnapKit 约束的重载由 `JobsByUIKit` 承接。
- Swift 侧布局统一使用 `SnapKit`；本 Pod 不提供创建或激活系统 `NSLayoutConstraint` 的桥接入口。
- `UIView` 动画 overload 由 `jobsAnimate...` / `jobsAnimateKeyframes(...)` / `jobsAddKeyframe(...)` / `jobsPerformWithoutAnimation(...)` / `jobsTransition(...)` / `jobsTransitionFromViewToView(...)` 类级终止动作屏蔽；`UIBezierPath` 实例编排使用 `byMove` / `byAddLine` / `byAddArc` / `byAppend` / `byClose` / `byFill`。
- `UIButton.jobsResetBtnImage` / `jobsResetBtnBgImage` 在 iOS 15+ 同步 `UIButton.Configuration` 后只请求下一帧刷新，不在异步图片回调中强制布局。
- `UIButton.byContentInsets` / `byContentEdgeInsets` 把 iOS 15+ `UIButton.Configuration.contentInsets` 与旧系统 `contentEdgeInsets` 回退收口到封装内部，上层不写版本分支，也不承接系统 deprecated 标记。
- `UIWindow.byScreen`、`WKWebViewConfiguration.byProcessPool` / `bySelectionGranularity` 同样不复制系统 deprecated 标记；scene 映射、旧系统赋值和新系统无效语义均由封装内部按版本处理。
- RGB、灰度和 HSB 颜色分别使用 `UIColor(r:g:b:a:)`、`UIColor(gray:alpha:)`、`UIColor(h:s:b:a:)`。
- `UITextField.byPlaceholder(_:)` 由本 Pod 唯一承接；`JobsByUIKit` 只补充占位颜色、字体等增强能力，不重复声明基础文字 API。
- 封装实现内部可以调用系统 API；上层调用方必须使用对应 `byXxx` / `onXxx` 入口。
- 原 Pod 暂时保留薄桥接文件，便于老代码平滑迁移。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
