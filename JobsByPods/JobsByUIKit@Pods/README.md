
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
