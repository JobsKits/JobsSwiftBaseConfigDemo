# `JobsSwiftAppTools`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## <span id="前言">Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

收口应用层的常用组合操作，包括启动分类、通用提示、URL 判断及列表注册等。与单纯类型扩展不同，这一层把基础工具和 UI 组件组合成接近业务入口的动作。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

应用或页面调用工具入口 → 读取必要状态并选择分支 → 调用基础库或 UI 组件 → 回调业务或保存标记

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- LaunchChecker 的 markAndClassifyThisLaunch 会写入启动标记；只查询是否首次启动的入口不应产生同样副作用。
- 首次安装、当天首次启动和普通启动是互斥分类，调用顺序会影响观察到的结果。
- 按日期判断当天需要遵循实现使用的日历与年月日口径，调试 reset 会清除持久化标记。
- 通用弹窗与列表注册仍依赖项目采用的具体组件，不应将它们描述成 Foundation 级无 UI 依赖工具。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先按业务目的定位 JobsSwiftAppTools.swift 的分区，启动逻辑从 LaunchChecker 读到 AppLaunchManager，再追依赖。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftAppTools.swift](<./JobsSwiftAppTools.swift>)

依赖与编译入口：[JobsSwiftAppTools.podspec](<./JobsSwiftAppTools.podspec>)。其中显式依赖声明包括 `SwiftEntryKit`、`SnapKit`、`JobsInheritance`、`JobsByUIKit`、`JobsSwiftBlock`、`JobsSwiftBaseDefines`、`JobsTextTools`、`JobsSwiftBaseTools`、`JobsScale`、`JobsSwiftTools`、`JobsBy3rdTools`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。


## 二、稳定性与编译验收 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

启动分类的检查、写入与 reset 统一使用锁，避免并发启动重复分类。UInt8 年份仍采用既有 2000...2255 偏移格式。网络监听回调弱持有目标 view，页面离开后不被全局监控器留住；采样状态和参数验证由 JobsSwiftBaseTools 管理。`projectDistance` 对非有限速度、非法减速率及溢出结果返回 0。

UserDefaults 原因清单通过 `JobsSwiftAppToolsPrivacy.bundle` 交付。业务页面应在主线程使用 UI 辅助入口。

从宿主工程根目录执行单模块编译：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftAppTools --skip-host
```

完整入口按 Pod → 宿主顺序构建，日志和 DerivedData 位于临时目录，不能把 Parse 成功视为模块编译成功。最低系统与集成形式以 Podspec / 消费工程为准；当前宿主按 iOS 15.6 构建。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单通过独立资源 bundle 交付。当前所需理由 API：`UserDefaults`（CA92.1）。理由对应本库实际用途；宿主仍需核对业务数据收集、App Group / 用户授权文件等实际使用场景，资源声明与最终 App 内 bundle 都应验收。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftAppTools --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
