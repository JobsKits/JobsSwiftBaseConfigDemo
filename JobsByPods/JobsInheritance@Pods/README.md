# `JobsInheritance`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsInheritance` 集中维护 Jobs [**Swift**](https://www.swift.org/) 工程的公共基类。

## 一、控制器基类 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 业务控制器统一继承 `BaseVC`，避免直接继承 `UIViewController` 后重复配置公共行为。
- `BaseVC` 在 `viewWillAppear(_:)` 和 `viewDidAppear(_:)` 调用 `jobsEnsureNavigationDefaults()`，统一兜底 Jobs/GK 导航栏、Jobs 返回按钮和标题；标题优先沿用跳转入口传入值，根页面不处理，专门演示系统导航栏的 `JobsNavigationDemoVC` 保持原样。
- `BaseVC` 在 `viewDidAppear(_:)` 按导航栈深度恢复系统侧滑返回能力。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
