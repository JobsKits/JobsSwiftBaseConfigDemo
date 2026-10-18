# `BRPickerViewSwift`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [一、核心目标](#jobs-toc-heading-1)
- [二、架构分层](#jobs-toc-heading-2)
- [三、目录结构](#jobs-toc-heading-3)
- [四、生命周期说明](#jobs-toc-heading-4)
- [五、iOS 12 兼容说明](#jobs-toc-heading-5)
- [六、统一调用示例](#jobs-toc-heading-6)
  - [1、文本选择](#jobs-toc-heading-7)
  - [2、系统日期](#jobs-toc-heading-8)
  - [3、自定义 YMD](#jobs-toc-heading-9)
  - [4、async 使用（iOS 13+）](#jobs-toc-heading-10)
- [七、设计理念](#jobs-toc-heading-11)
- [八、特别鸣谢](#jobs-toc-heading-12)
- [Jobs DSL 调用约定](#jobs-toc-heading-13)
- [九、架构脉络与关键设计](#jobs-toc-heading-14)
  - [9.1、设计目的与职责划分](#jobs-toc-heading-15)
  - [9.2、运行脉络](#jobs-toc-heading-16)
  - [9.3、关键设计与边界](#jobs-toc-heading-17)
  - [9.4、阅读与重建顺序](#jobs-toc-heading-18)
- [十、运行合同与边界](#jobs-toc-heading-19)
- [十一、生产交付与全量门禁](#jobs-toc-heading-20)

</details>
<!-- jobs-toc:end -->

# <span id="前言">BRPickerViewSwift</span>

> 一个面向 iOS 12+ 的 **Picker** 弹层框架。

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [一、核心目标](#jobs-toc-heading-1)
- [二、架构分层](#jobs-toc-heading-2)
- [三、目录结构](#jobs-toc-heading-3)
- [四、生命周期说明](#jobs-toc-heading-4)
- [五、iOS 12 兼容说明](#jobs-toc-heading-5)
- [六、统一调用示例](#jobs-toc-heading-6)
  - [1、文本选择](#jobs-toc-heading-7)
  - [2、系统日期](#jobs-toc-heading-8)
  - [3、自定义 YMD](#jobs-toc-heading-9)
  - [4、async 使用（iOS 13+）](#jobs-toc-heading-10)
- [七、设计理念](#jobs-toc-heading-11)
- [八、特别鸣谢](#jobs-toc-heading-12)
- [Jobs DSL 调用约定](#jobs-toc-heading-13)
- [九、架构脉络与关键设计](#jobs-toc-heading-14)
  - [9.1、设计目的与职责划分](#jobs-toc-heading-15)
  - [9.2、运行脉络](#jobs-toc-heading-16)
  - [9.3、关键设计与边界](#jobs-toc-heading-17)
  - [9.4、阅读与重建顺序](#jobs-toc-heading-18)
- [十、运行合同与边界](#jobs-toc-heading-19)
- [十一、生产交付与全量门禁](#jobs-toc-heading-20)

</details>
<!-- jobs-toc:end -->

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">一、核心目标 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 统一链式 API（`byTheme` / `byToolbar` / `byAnimation` / `byResult` / `byPresent`）
- 内核生命周期安全（**Panel** 强引用 **Picker**，避免滑动过程中释放）
- iOS 12 完整兼容
- iOS 13+ 支持 <font color=red>**`async`**</font>/<font color=red>**`await`**</font>
- 模块化分层设计

---

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">二、架构分层 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

* **Core** —— 基类 / 生命周期 / 回调
* **UI** —— 面板 / **Toolbar**
* **Theme** —— 主题配置
* **Animation** —— 动画策略
* **Picker** —— 各类具体 **Picker** 实现
* **Models** —— 联动数据模型
* **Extensions** —— 工具扩展 / iOS12 兼容

---

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```
BRPickerViewSwift/
├─ Core/
├─ UI/
├─ Theme/
├─ Animation/
├─ Picker/
├─ Models/
└─ Extensions/
```

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">四、生命周期说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

`BRBasePicker` 在 `byPresent` 时创建 `BRPickerPanel`。

Panel 会：
- 强引用 **Picker**（strongOwner）
- 承载动画与内容视图
- 负责 **dismiss**

因此无需外部持有 Picker，也不会出现滑动中被释放问题。

---

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">五、iOS 12 兼容说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 自定义 `UIPickerView` 实现
- 安全 **reload** 处理
- <font color=red>**`async`**</font> API 仅在 iOS 13+ 可用

---

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">六、统一调用示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-7" data-jobs-toc="v2">1、文本选择 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```swift
BRStringPicker()
    .byDataSource(["A","B","C"])
    .bySelectedIndex(0)
    .byResult { value in print(value) }
    .byPresent(in: self.view)
```

### <span id="jobs-toc-heading-8" data-jobs-toc="v2">2、系统日期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```swift
BRSystemDatePicker()
    .bySelectDate(Date())
    .byResult { date in print(date) }
    .byPresent(in: self.view)
```

### <span id="jobs-toc-heading-9" data-jobs-toc="v2">3、自定义 YMD <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```swift
BRDatePicker()
    .byMode(.ymd)
    .bySelectDate(Date())
    .byResult { date in print(date) }
    .byPresent(in: self.view)
```

### <span id="jobs-toc-heading-10" data-jobs-toc="v2">4、async 使用（iOS 13+） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```swift
@available(iOS 13.0, *)
@MainActor
func pick() async throws {
    let result = try await BRSystemDatePicker()
        .bySelectDate(Date())
        .byPresent(in: self.view)
        .awaitResult()
    print(result)
}
```

## <span id="jobs-toc-heading-11" data-jobs-toc="v2">七、设计理念 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 外部优雅
- 内核稳定
- 结构清晰
- 可长期维护
- 面板内容区的 Auto Layout 统一使用 `SnapKit`，不直接创建系统 `NSLayoutConstraint`

## <span id="jobs-toc-heading-12" data-jobs-toc="v2">八、特别鸣谢 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

* [**BRPickerView**](https://github.com/agiapp/BRPickerView)

## <span id="jobs-toc-heading-13" data-jobs-toc="v2">Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## <span id="jobs-toc-heading-14" data-jobs-toc="v2">九、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### <span id="jobs-toc-heading-15" data-jobs-toc="v2">9.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

以泛型选择器基类组织不同数据类型的弹出选择体验。BRBasePicker<Result> 管理公共配置与结果交付，面板、工具栏、主题和动画策略负责展示，字符串、日期、时间、多列和地区选择器各自实现选项与联动规则。

### <span id="jobs-toc-heading-16" data-jobs-toc="v2">9.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

配置主题和数据 → 创建具体选择器 → 展示面板并操作选项 → 确认交付结果或取消关闭

### <span id="jobs-toc-heading-17" data-jobs-toc="v2">9.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 这是 [**Swift**](https://www.swift.org/) 选择器实现，不能把它理解为只给 OC 的 BRPickerView 加几条链式方法；上游名称与参考来源仍按原说明保留。
- 选择过程的临时值与确认后的结果需要分开；取消不应被重建为一次成功选择。
- 日期、地区和多列联动需要先更新依赖列的数据，再校正选择下标；还要保留旧系统安全刷新、日历和触觉辅助层。
- 动画通过 BRPanelAnimatable 抽象替换，业务选择规则不应写进滑入、弹簧或淡入动画。

### <span id="jobs-toc-heading-18" data-jobs-toc="v2">9.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

先读 BRBasePicker 的泛型结果与公共入口，再看 BRPickerPanel/Toolbar、Theme/Animation，最后逐个补齐具体选择器。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/BRBasePicker.swift](<./Core/BRBasePicker.swift>)
- [UI/BRPickerPanel.swift](<./UI/BRPickerPanel.swift>)
- [Models/BRAreaModels.swift](<./Models/BRAreaModels.swift>)
- [Animation/BRPanelAnimation.swift](<./Animation/BRPanelAnimation.swift>)
- [Core/BRPickerHaptics.swift](<./Core/BRPickerHaptics.swift>)

依赖与编译入口：[BRPickerViewSwift.podspec](<./BRPickerViewSwift.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## <span id="jobs-toc-heading-19" data-jobs-toc="v2">十、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

`BRDatePicker` 返回实际日历日期，范围由 `byMinDate` / `byMaxDate` 限定；未实现的“至今”选项已移除。`BRSystemCountDownPicker` 用 `byCountDownDuration(_:)` 设置秒数，或用 `byCountDown(hours:minutes:)` 设置时分，默认时长为 0 秒；不再接受无效果的 `bySelectDate(_:)`。其它日期选择器保留真实的 `bySelectDate(_:)`。

同步 `byResult` 保留。异步入口 `awaitResult()` 为 `async throws`：确认返回选择值，用户取消、遮罩关闭、panel 从宿主移除，或曾入窗的 panel 在下一轮主线程检查时仍已离窗，均抛 `BRPickerAwaitError.cancelled`，任务取消抛 CancellationError；同时等待同一 picker 抛 alreadyAwaiting。`awaitResultOrNil()` 也是 async throws，仅用户或任务取消返回 nil，其它错误继续抛出。旧异步调用需在 await 前加入 try，并处理取消和错误。

呈现失败或已关闭的 panel 不会留下无终态的等待；展示先于 await，或使用并发任务先等待再展示。首次尚未入窗不触发离窗取消，同一轮同步移窗也不会误取消；宿主页面结束时仍应显式取消它持有的 await Task。一次确认仍可同时通知既有 byResult。不要对同一实例同时创建多个 await 任务，也不要把取消视为成功选中。


## <span id="jobs-toc-heading-20" data-jobs-toc="v2">十一、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods BRPickerViewSwift --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
