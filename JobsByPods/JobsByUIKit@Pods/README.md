
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
- `UIViewController.jobsEnsureNavigationDefaults()` 统一为导航栈子页面和模态子页面补齐 Jobs/GK 导航栏、标题与 Jobs 返回按钮；已有系统 `navigationItem.titleView` / 右侧业务按钮会迁移到 GK 导航栏，不再沿用系统导航容器。仅专门演示系统导航栏能力的 `JobsNavigationDemoVC` 保持原样。
- `UIViewController.jobsEnsureNavigationBackButton()` 保留单独补齐 GK 返回按钮的入口；默认箭头使用 template 渲染和 `JobsCor.label`，随明暗主题自动变色。
- `UIKitAttributes` 的 TextKit 属性封装只声明真实可用系统版本，不复制系统的未来 deprecated 标记；调用方只看到 Jobs API 的实际 availability 边界。
- `UIWindowScene.keyWindowCompat` 统一处理新旧系统取窗逻辑；历史 `legacyKeyWindowPreiOS13()` 的弃用提示只指向 Jobs 替代入口，不向上层复制 Apple API 提示。
