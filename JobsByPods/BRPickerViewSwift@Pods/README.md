# BRPickerViewSwift

> 一个面向 iOS 12+ 的 **Picker** 弹层框架。

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 一、核心目标

- 统一链式 API（`byTheme` / `byToolbar` / `byAnimation` / `byResult` / `byPresent`）
- 内核生命周期安全（**Panel** 强引用 **Picker**，避免滑动过程中释放）
- iOS 12 完整兼容
- iOS 13+ 支持 <font color=red>**`async`**</font>/<font color=red>**`await`**</font>
- 模块化分层设计

---

## 二、架构分层

* **Core** —— 基类 / 生命周期 / 回调
* **UI** —— 面板 / **Toolbar**
* **Theme** —— 主题配置
* **Animation** —— 动画策略
* **Picker** —— 各类具体 **Picker** 实现
* **Models** —— 联动数据模型
* **Extensions** —— 工具扩展 / iOS12 兼容

---

## 三、目录结构

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

## 四、生命周期说明

`BRBasePicker` 在 `byPresent` 时创建 `BRPickerPanel`。

Panel 会：
- 强引用 **Picker**（strongOwner）
- 承载动画与内容视图
- 负责 **dismiss**

因此无需外部持有 Picker，也不会出现滑动中被释放问题。

---

## 五、iOS 12 兼容说明

- 自定义 `UIPickerView` 实现
- 安全 **reload** 处理
- <font color=red>**`async`**</font> API 仅在 iOS 13+ 可用

---

## 六、统一调用示例

### 1、文本选择

```swift
BRStringPicker()
    .byDataSource(["A","B","C"])
    .bySelectedIndex(0)
    .byResult { value in print(value) }
    .byPresent(in: self.view)
```

### 2、系统日期

```swift
BRSystemDatePicker()
    .bySelectDate(Date())
    .byResult { date in print(date) }
    .byPresent(in: self.view)
```

### 3、自定义 YMD

```swift
BRDatePicker()
    .byMode(.ymd)
    .bySelectDate(Date())
    .byResult { date in print(date) }
    .byPresent(in: self.view)
```

### 4、async 使用（iOS 13+）

```swift
@available(iOS 13.0, *)
func pick() async {
    let result = await BRSystemDatePicker()
        .bySelectDate(Date())
        .byPresent(in: self.view)
        .awaitResult()
    print(result)
}
```

## 七、设计理念

- 外部优雅
- 内核稳定
- 结构清晰
- 可长期维护
- 面板内容区的 Auto Layout 统一使用 `SnapKit`，不直接创建系统 `NSLayoutConstraint`

## 八、特别鸣谢

* [**BRPickerView**](https://github.com/agiapp/BRPickerView)

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 九、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 9.1、设计目的与职责划分

以泛型选择器基类组织不同数据类型的弹出选择体验。BRBasePicker<Result> 管理公共配置与结果交付，面板、工具栏、主题和动画策略负责展示，字符串、日期、时间、多列和地区选择器各自实现选项与联动规则。

### 9.2、运行脉络

配置主题和数据 → 创建具体选择器 → 展示面板并操作选项 → 确认交付结果或取消关闭

### 9.3、关键设计与边界

- 这是 [**Swift**](https://www.swift.org/) 选择器实现，不能把它理解为只给 OC 的 BRPickerView 加几条链式方法；上游名称与参考来源仍按原说明保留。
- 选择过程的临时值与确认后的结果需要分开；取消不应被重建为一次成功选择。
- 日期、地区和多列联动需要先更新依赖列的数据，再校正选择下标；还要保留旧系统安全刷新、日历和触觉辅助层。
- 动画通过 BRPanelAnimatable 抽象替换，业务选择规则不应写进滑入、弹簧或淡入动画。

### 9.4、阅读与重建顺序

先读 BRBasePicker 的泛型结果与公共入口，再看 BRPickerPanel/Toolbar、Theme/Animation，最后逐个补齐具体选择器。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/BRBasePicker.swift](<./Core/BRBasePicker.swift>)
- [UI/BRPickerPanel.swift](<./UI/BRPickerPanel.swift>)
- [Models/BRAreaModels.swift](<./Models/BRAreaModels.swift>)
- [Animation/BRPanelAnimation.swift](<./Animation/BRPanelAnimation.swift>)
- [Core/BRPickerHaptics.swift](<./Core/BRPickerHaptics.swift>)

依赖与编译入口：[BRPickerViewSwift.podspec](<./BRPickerViewSwift.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
