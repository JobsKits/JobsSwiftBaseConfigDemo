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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
