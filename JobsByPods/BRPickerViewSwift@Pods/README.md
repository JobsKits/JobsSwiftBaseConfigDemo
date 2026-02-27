# BRPickerViewSwift

> 一个面向 iOS 12+ 的 **Picker** 弹层框架。

[toc]

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

## 八、特别鸣谢

* [**BRPickerView**](https://github.com/agiapp/BRPickerView)
