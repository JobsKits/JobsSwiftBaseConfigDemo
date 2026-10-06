# `JobsSwiftSearcher`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">JobsSwiftSearcher</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

Swift 本地 Pod，用于在 Swift 侧承接 OC `JobsOCSearcher` 的搜索功能。

## 能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsSwiftSearcherConfig` 管理占位文案、按钮文案、推荐标题、历史标题和存储 key。
- `JobsSwiftSearcherView` 提供搜索框、搜索按钮、推荐词标签、历史列表、删除和清空历史。
- 历史记录使用 `UserDefaults` 持久化，同关键词会自动去重并置顶。
- 搜索输入变化、提交、推荐词点击、历史变化都通过闭包回调给业务层。
- 按钮创建、配置和事件统一使用 `JobsByUIKit` / `JobsSwiftDSL`。
- 搜索框、按钮、推荐区和列表的约束统一由 `SnapKit` 管理。

## 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `SnapKit`（组件布局和动态约束更新）。
- `JobsByUIKit`（按钮工厂和 UIKit 扩展）。
- `JobsSwiftDSL`（视图、控件和按钮链式 API）。
- `JobsSwiftBaseDefines`（使用 `JobsCor`、`JobsFont` 和 `UIColor(r:g:b:a:)`）。

## 目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core/JobsSwiftSearcherConfig`：搜索组件配置。
- `Core/JobsSwiftSearcherView`：公开搜索视图。

## 验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
pod lib lint JobsSwiftSearcher.podspec --allow-warnings --verbose
```

## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

把搜索输入、推荐词和本地历史收口为可配置视图。Config 定义文案、历史存储键、容量与事件，View 管理输入和列表，真正的搜索请求由宿主执行。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

输入或点选词条 → 分发变化与确认事件 → 保存或调整历史 → 宿主搜索 → 按需刷新推荐和历史

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 输入变化、确认搜索和点选推荐词是不同事件，应避免业务同时监听后重复发请求。
- 历史存储键决定不同页面是否共享记录，容量和去重策略影响保留结果。
- 删除单项、清空历史与取消输入的键盘行为分别配置，不能都简化成清空数组。
- 推荐词与历史词属于不同来源，重载推荐不能误覆盖本地历史。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 Config，再读 saveHistory、deleteHistory、clearHistory 和输入代理，最后看宿主搜索回调。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftSearcherConfig/JobsSwiftSearcherConfig.swift](<./Core/JobsSwiftSearcherConfig/JobsSwiftSearcherConfig.swift>)
- [Core/JobsSwiftSearcherView/JobsSwiftSearcherView.swift](<./Core/JobsSwiftSearcherView/JobsSwiftSearcherView.swift>)

依赖与编译入口：[JobsSwiftSearcher.podspec](<./JobsSwiftSearcher.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`Jobsl10n`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`historyScope` 可使用稳定账户标识，不要使用用户名或电话号码等敏感信息；实际键由 storageKey 与 scope 隔离。nil scope 保持旧全局存储兼容。`persistsHistory = false` 只保存当前实例内存，切换 scope 或持久化策略时清空旧实例历史。注销时可调用 `clearHistory()` 清除当前 scope；其它账户历史不会被误删。

历史容量归一化到 1～1000，去重并按最近使用排序。空历史显示 JobsEmptyAuto，点击重新读取当前 scope；推荐词和搜索请求仍由宿主负责。修改同一个 Config 对象的 scope 后调用 reloadWithConfig / reloadHistorySearches，组件会按保存的上次历史上下文隔离内存记录；scope 的 Base64 仅用于键名，不是加密。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单通过独立资源 bundle 交付。当前所需理由 API：`UserDefaults`（CA92.1）。理由对应本库实际用途；宿主仍需核对业务数据收集、App Group / 用户授权文件等实际使用场景，资源声明与最终 App 内 bundle 都应验收。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftSearcher --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
