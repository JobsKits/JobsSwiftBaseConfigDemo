# `JobsSwiftSearcher`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [能力](#jobs-toc-heading-1)
- [依赖](#jobs-toc-heading-2)
- [目录](#jobs-toc-heading-3)
- [验证](#jobs-toc-heading-4)
- [Jobs DSL 调用约定](#jobs-toc-heading-5)
- [一、架构脉络与关键设计](#jobs-toc-heading-6)
  - [1.1、设计目的与职责划分](#jobs-toc-heading-7)
  - [1.2、运行脉络](#jobs-toc-heading-8)
  - [1.3、关键设计与边界](#jobs-toc-heading-9)
  - [1.4、阅读与重建顺序](#jobs-toc-heading-10)
- [二、运行合同与边界](#jobs-toc-heading-11)
  - [2.1、输入、结果与事件](#jobs-toc-heading-12)
  - [2.2、当前宿主接入](#jobs-toc-heading-13)
- [三、生产交付与全量门禁](#jobs-toc-heading-14)

</details>
<!-- jobs-toc:end -->

# <span id="前言">JobsSwiftSearcher</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

Swift 本地 Pod，用于在 Swift 侧承接 OC `JobsOCSearcher` 的搜索功能。

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `JobsSwiftSearcherConfig` 管理输入／提交／取消、推荐与历史文案、完整空态、结果区域、账号 scope 和持久化策略。
- `JobsSwiftSearcherView` 统一输入头、可选提交与取消、推荐词、历史列表、空态和宿主结果 View；输入区独用时配置 `inputOnly`。
- 历史记录使用 `UserDefaults` 持久化，同关键词会自动去重并置顶。
- 搜索输入变化、提交、推荐词点击、历史变化都通过闭包回调给业务层。
- 按钮创建、配置和事件统一使用 `JobsByUIKit` / `JobsSwiftDSL`。
- 搜索框、按钮、推荐区和列表的约束统一由 `SnapKit` 管理。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `SnapKit`（组件布局和动态约束更新）。
- `JobsByUIKit`（按钮工厂和 UIKit 扩展）。
- `JobsSwiftDSL`（视图、控件和按钮链式 API）。
- `JobsSwiftBaseDefines`（使用 `JobsCor`、`JobsFont` 和 `UIColor(r:g:b:a:)`）。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Core/JobsSwiftSearcherConfig`：搜索组件配置。
- `Core/JobsSwiftSearcherView`：公开搜索视图。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```shell
pod lib lint JobsSwiftSearcher.podspec --allow-warnings --verbose
```

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### <span id="jobs-toc-heading-7" data-jobs-toc="v2">1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

把首页搜索与独立搜索 Demo 的能力合并进同一个可配置视图。Config 定义文案、显示开关、历史上下文和事件；View 管理输入、推荐、历史／结果切换及 JobsEmptyAuto 空态。真正的过滤、请求、结果跳转和页面生命周期由宿主执行，组件不依赖首页菜单或 Debug 工具。

### <span id="jobs-toc-heading-8" data-jobs-toc="v2">1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

输入／程序赋值 → 规范化关键词变化一次 → 宿主过滤并回传结果数 → 非空显示结果／无结果，清空返回推荐与历史；提交／选词沿用原历史记录与确认管线。

### <span id="jobs-toc-heading-9" data-jobs-toc="v2">1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 输入变化、确认搜索和点选推荐词是不同事件，应避免业务同时监听后重复发请求。
- 历史存储键决定不同页面是否共享记录，容量和去重策略影响保留结果。
- 删除单项、清空历史与取消输入的键盘行为分别配置，不能都简化成清空数组。
- 推荐词与历史词属于不同来源，重载推荐不能误覆盖本地历史。

### <span id="jobs-toc-heading-10" data-jobs-toc="v2">1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

先读 Config，再读 saveHistory、deleteHistory、clearHistory 和输入代理，最后看宿主搜索回调。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftSearcherConfig/JobsSwiftSearcherConfig.swift](<./Core/JobsSwiftSearcherConfig/JobsSwiftSearcherConfig.swift>)
- [Core/JobsSwiftSearcherView/JobsSwiftSearcherView.swift](<./Core/JobsSwiftSearcherView/JobsSwiftSearcherView.swift>)

依赖与编译入口：[JobsSwiftSearcher.podspec](<./JobsSwiftSearcher.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`Jobsl10n`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## <span id="jobs-toc-heading-11" data-jobs-toc="v2">二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

`historyScope` 可使用稳定账户标识，不要使用用户名或电话号码等敏感信息；实际键由 storageKey 与 scope 隔离。nil scope 保持旧全局存储兼容。`persistsHistory = false` 只保存在当前 View 的内存字典，各 storageKey／scope 分开；切走再切回可恢复当前页面的内存记录，释放页面后丢弃。持久与内存模式互不覆盖。注销时可调用 `clearHistory()` 清除当前 scope；其它账户历史不会被误删。

历史容量归一化到 1～1000，去重并按最近使用排序。空历史显示 JobsEmptyAuto，点击重新读取当前 scope；推荐词和搜索请求仍由宿主负责。修改同一个 Config 对象的 scope 后调用 reloadWithConfig / reloadHistorySearches，组件每次按当前实际 key 和策略读取对应上下文，即使原 Config 对象被原地修改也不会串账号；scope 的 Base64 仅用于键名，不是加密。可用 `historyUserDefaults` 注入独立 suite 验证，不影响默认标准存储。


### <span id="jobs-toc-heading-12" data-jobs-toc="v2">2.1、输入、结果与事件</span><!-- jobs-toc:heading-end -->

- `normalizedQuery` 为去首尾空白后的只读关键词。`byQuery(_:recordHistory:)` 同时服务程序赋值、输入清空和点选；只有规范化值真实变化才发一次 `searchTextChangedBlock`，中文组合文本提交前暂缓过滤。
- `byResultContentView(_:)` 由宿主注入结果视图，`byResultCount(_:)` 只更新展示，不触发输入回调。空词仅显示可选推荐和历史／空历史；非空仅显示注入的结果或无结果空态。清空关键词回到历史并聚焦输入。
- `reloadWithConfig` 保留输入原文、规范化关键词和同一个输入控件的焦点；语言刷新只重绘文案。只给当前输入字段配置零高键盘附件，不更改全局 IQ 设置。iOS 15+ 内容区跟随 `keyboardLayoutGuide`，较早系统继续原容器布局与收键盘操作。
- `showsSearchButton` 默认 `true`，`showsCancelButton` 默认 `false`，兼容旧配置。`inputOnly = true` 仅显示同一个输入头，建议按 64pt 固有高度装配，不另外维护输入实现。
- Swift 原推荐／历史选择仍走提交并记录历史；推荐先调用旧 `recommendSelectedBlock`，通用 `itemSelectedBlock` 只通知本次选词。业务选择一个事件执行搜索，避免又在提交／选词回调重复请求。提交相同值不会再次发输入变化。
- 可见按钮保留至少 44pt 触点，隐藏的 arrangedSubview 宽度约束采用可让位优先级，避免 UIStackView 折叠冲突。长推荐词换行，所有 UI 跟随 App 全局语言与主题；原生搜索图标、清除按钮和键盘也从有效主题派生 UIKit 外观。

```swift
import JobsSwiftSearcher

private lazy var searchView: JobsSwiftSearcherView = {
    JobsSwiftSearcherView(config: JobsSwiftSearcherConfig.defaultConfig
        .byPlaceholder("输入关键词开始搜索。")
        .byShowsCancelButton(true)
        .byHistoryStorageKey("ProductSearchHistory")
        .byHistoryScope("account-A")
        .byPersistsHistory(true)
        .byMaxHistoryCount(20)
        .bySearchTextChangedBlock { [weak self] query in
            self?.filterResults(query)
        }
        .byCancelBlock { [weak self] in
            self?.closeSearch()
        })
        .byRecommendSearches(["Swift", "UIKit"])
        .byResultContentView(resultsTable)
        .byAddTo(view) { make in
            make.edges.equalToSuperview()
        }
}()

// 宿主完成过滤后只回传数量，不反向重设 query。
searchView.byResultCount(filteredItems.count)
```

### <span id="jobs-toc-heading-13" data-jobs-toc="v2">2.2、当前宿主接入</span><!-- jobs-toc:heading-end -->

- 首页 `RootListVC` 实际创建本 View，沿用旧历史 key `com.BSports.JobsSwiftDemoSearchHistoryUserDefaultsKey` 和容量 20；原自建搜索框、历史 UI／数组与 UserDefaults 写入已移除。首页不传推荐词，以保留空关键词只看历史的独占规则。
- 首页只负责 Demo 过滤／跳转和进入前状态：原 table 在搜索时借给结果容器，取消后还原父视图、导航下方约束、滚动位置、展开组、刷新器与浮控／抽屉手势。搜索期间收键盘、前后台、主题／语言和摇动均不能解除临时门禁；Debug 门禁留在宿主，组件不耦合它们。
- 独立 `JobsSwiftSearcherDemoVC` 使用同一 View，保留原八个推荐词，实际过滤技术词及释义，点击结果展示详情；账号 A／B 与仅内存按钮演示历史隔离。A 使用原 Demo 无 scope 历史键，保留旧数据；B 使用独立 scope，临时模式不写本地存储。


## <span id="jobs-toc-heading-14" data-jobs-toc="v2">三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单通过独立资源 bundle 交付。当前所需理由 API：`UserDefaults`（CA92.1）。理由对应本库实际用途；宿主仍需核对业务数据收集、App Group / 用户授权文件等实际使用场景，资源声明与最终 App 内 bundle 都应验收。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftSearcher --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主项目相关报告目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
