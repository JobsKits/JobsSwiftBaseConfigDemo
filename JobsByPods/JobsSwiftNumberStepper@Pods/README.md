# JobsSwiftNumberStepper

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 定位

`JobsSwiftNumberStepper` 是可复用的整数步进输入组件，组合“减号按钮 + 整数输入框 + 加号按钮”。上下限均为可选；设置边界后，到达对应边界的按钮会自动置灰并禁止点击。

## 目录

```text
JobsSwiftNumberStepper@Pods/
├── Core/
│   └── JobsSwiftNumberStepper/
│       └── JobsSwiftNumberStepper.swift
├── JobsSwiftNumberStepper.podspec
└── README.md
```

当前没有资源，不创建空 `Resource`。

## 公开能力

- `value`：当前整数值。
- `minimumValue` / `maximumValue`：只读的可选边界，通过 `configure` 或 `setBounds` 更新。
- `stepValue`：每次加减的步长，非正数自动按 `1` 处理。
- `decreaseButton` / `textField` / `increaseButton`：对外只读，允许按页面需要追加样式。
- `UIControl.Event.valueChanged`：按钮或输入框成功修改数值时发送。
- 手动输入仅接受合法整数；设置边界后，越界输入会被拒绝。
- 最小值大于最大值时按升序自动归一化，避免产生不可达区间。

```swift
import JobsSwiftNumberStepper

let stepper = JobsSwiftNumberStepper()
    .configure(value: 4, minimumValue: 4, maximumValue: 8)

stepper.onJobsChange { (stepper: JobsSwiftNumberStepper) in
    print(stepper.value)
}
```

## 依赖与边界

- 直接依赖 `JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL` 和 `SnapKit`。
- 未设置某一侧边界时，该方向只受 `Int` 可表示范围约束。
- 允许负数时使用整数标点键盘；下限为非负数时自动使用数字键盘。
- 组件负责边界和输入合法性，业务侧只消费最终 `value`。

## 验证

```shell
ruby -c JobsSwiftNumberStepper.podspec
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsSwiftNumberStepper -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

将减号、整数输入框与加号收口为 UIControl，以当前整数值、可选上下界与步长作为共同状态。按钮和键盘输入最终进入同一收敛、渲染和事件路径。

### 1.2、运行脉络

点击加减或输入 → 校验整数 → 约束到有效范围 → 更新文字与可用状态 → 按策略发送事件

### 1.3、关键设计与边界

- 上下界可分别为 nil，省略表示该侧没有业务边界，但仍受 Int 范围约束。
- 程序调用 setValue 默认不发送事件，需要通知时显式开启，避免双向回写造成循环。
- 允许负数时键盘与临时输入状态不同于非负整数，编辑中的负号不能直接当最终有效值。
- 到达边界后加减按钮状态必须同步，溢出不能以普通加减后再裁剪来掩盖。

### 1.4、阅读与重建顺序

先读 configure、setBounds 和 setValue，再看 bounded、输入校验与结束编辑收敛。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftNumberStepper/JobsSwiftNumberStepper.swift](<./Core/JobsSwiftNumberStepper/JobsSwiftNumberStepper.swift>)

依赖与编译入口：[JobsSwiftNumberStepper.podspec](<./JobsSwiftNumberStepper.podspec>)。其中显式依赖声明包括 `JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`SnapKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
