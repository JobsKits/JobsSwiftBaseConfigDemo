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

let label = UILabel.jobsMake { label in
  label
    .byText("Jobs")
    .byThemeTextColor(.textPrimary)
    .byTextAlignment(.center)
    .byLabelShadowColor(.black)
    .byLabelShadowOffset(CGSize(width: 0, height: 1))
    .byTintColor(JobsCor.systemBlue)
}

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

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

- `NSObject` 子类的无参创建使用 `Type.jobsMake { object in ... }`；通用创建 Block 的底层实现位于 `JobsSwiftBlock`，由本 Pod 公开转出。
- 带参系统初始化由真实类型提供 `make(arguments, configure:)`，例如 `NSUserActivity.make(activityType:configure:)`；系统构造器只留在工厂实现内。
- 实例创建后，属性、无参实例方法和单参实例方法统一使用返回 `Self` 的 `byXxx(...)`；查询与明确终止动作除外。

`UITableViewCell` 的标题、副标题、图片、`contentView` 与选择状态都从 `cell` 继续点出，不重新起 `cell.textLabel` / `cell.detailTextLabel` / `cell.imageView`：

```swift
return cell
    .byText("关闭".tr)
    .byTitleCor(JobsCor.systemBlue)
    .byTitleTextAlignment(.center)
    .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
    .byDetailText(nil)
    .bySelectionStyle(.default)
    .byContentView { $0.byBackgroundColor(JobsCor.systemBackground) }
```

- `UITableViewCell` 子对象闭包：`byTextLabel`、`byDetailTextLabel`、`byImageView`、`byContentView`。
- `UITableViewCell` 文本收口：`byTitleTextAlignment`、`byTitleNumberOfLines`、`byDetailTitleTextAlignment`、`byDetailTitleNumberOfLines`。
- `UIDatePicker` / `UIPickerView` 的模式、日期范围、代理和数据源配置统一由本 Pod 承接；需要兼容旧系统的滚轮样式使用 `byWheelsStyleIfAvailable()` 保持主链不断开，`JobsByUIKit` 通过公开桥接继续兼容原 import。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
