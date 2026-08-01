
## DSL 迁移说明

- 本 Pod 原有的链式 DSL / 点语法封装已经抽离到 `JobsSwiftDSL`。
- 本 Pod 提供 UIKit 创建工厂、事件和功能封装；`JobsByUIKitDSLBridge` 使用 `@_exported import JobsSwiftDSL`，因此引入 `JobsByUIKit` 后可直接使用 `byXxx(...)`。
- 仅使用 DSL、未引入 `JobsByUIKit` 的消费方，要显式 `import JobsSwiftDSL`。
- `JobsByUIKit` / `JobsSwiftDSL` 实现是权威源；Xcode CodeSnippets 与实现冲突时，以实现为准并反哺更新代码块。
- `UIView.tintColor` 这类公共属性在父类 DSL 统一封装，子类不重复声明同名 API。
- `UIView.byAddTo(_:)` 的基础装配位于 `JobsSwiftDSL`；传入 SnapKit 约束闭包的重载由本 Pod 提供。
- `UITextField.byPlaceholder(_:)` 的基础文字设置位于 `JobsSwiftDSL`；占位颜色、字体增强由本 Pod 提供，避免跨模块重复声明造成重载歧义。
- `UIBezierPath` 创建统一使用 `make()` / `make(rect:)` / `make(ovalIn:)` / `make(roundedRect:cornerRadius:)` / `make(arcCenter:...)`。
- `UIAction` / `UIMenu` 创建统一使用 `make(...)`；`UIBarButtonItem` 的标题、图片、系统项和自定义视图均使用对应 `make(...)` 工厂。
- 空 `UIImage` 使用 `UIImage.make()`，调用侧不直接写 `UIImage()`。
- SDWebImage / Kingfisher 的按钮图片回调会避开 `UIButton.Configuration` 内部视图替换期间的过渡动画，不在回调中强制布局；前景 shimmer 直接作用于当前 `imageView.layer`，不再向 `UIButton` 插入 overlay 或启用 UIButton overlay 的 `layoutSubviews` swizzle。
- `UIViewController.jobsSetupGKNav(...)` 在写入标题和左右按钮后，会强制显示并置顶 GK 导航栏、恢复真实透明度，同时隐藏系统导航栏，避免导航容器残留状态导致 Demo 子页面无导航栏。
- 从 `RootListVC` Demo 根列表进入的每个导航 / 模态子页面，以及类名以 `DemoVC` 结尾的独立演示页，右上角最多只显示一个透明背景的主题入口；没有页面业务动作时直接切换主题，月亮 / 太阳图标与无障碍文案表达下一次点击会切换到的主题；存在业务动作时使用 Demo 总入口同款 `ellipsis.circle` 展开下拉列表，展开后切换为填充图标与“收起”语义，把主题切换与全部页面动作统一收纳。`JobsNavigationDemoVC` 使用同一规则写入系统导航栏。
- 主题入口调用 `JobsThemeCenter.shared.toggle()`；主题状态、JSON 数据包和弱引用资源绑定由 `JobsSwiftBaseDefines` 承担。切换时只重放已标记的背景色、文字色和显式主题图片，并发布 `.JobsThemeDidChange`，不遍历 Scene / Window / 控制器树。
- `UIViewController.jobsEnsureNavigationDefaults()` 统一为导航栈子页面和模态子页面补齐 Jobs/GK 导航栏、标题与 Jobs 返回按钮，但不覆盖页面在 `viewDidLoad` 中声明的背景色；已有系统 `navigationItem.titleView` / 右侧业务按钮会迁移到 GK 导航栏，不再沿用系统导航容器。仅专门演示系统导航栏能力的 `JobsNavigationDemoVC` 保持原样。
- `UIViewController.jobsEnsureNavigationBackButton()` 保留单独补齐 GK 返回按钮的入口；默认箭头使用 template 渲染和 `JobsCor.label`，随明暗主题自动变色。
- `UIKitAttributes` 的 TextKit 属性封装只声明真实可用系统版本，不复制系统的未来 deprecated 标记；调用方只看到 Jobs API 的实际 availability 边界。
- `UIWindowScene.keyWindowCompat` 统一处理新旧系统取窗逻辑；历史 `legacyKeyWindowPreiOS13()` 的弃用提示只指向 Jobs 替代入口，不向上层复制 Apple API 提示。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要显式绑定主题 Key，或监听 `.JobsThemeDidChange` 后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。
