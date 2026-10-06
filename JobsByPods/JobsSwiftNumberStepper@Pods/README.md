# `JobsSwiftNumberStepper`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">JobsSwiftNumberStepper</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsSwiftNumberStepper` 是可复用的整数步进输入组件，组合“减号按钮 + 整数输入框 + 加号按钮”。上下限均为可选；设置边界后，到达对应边界的按钮会自动置灰并禁止点击。

## 目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsSwiftNumberStepper@Pods/
├── Core/
│   └── JobsSwiftNumberStepper/
│       └── JobsSwiftNumberStepper.swift
├── JobsSwiftNumberStepper.podspec
└── README.md
```

当前没有资源，不创建空 `Resource`。

## 公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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

## 依赖与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 直接依赖 `JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL` 和 `SnapKit`。
- 未设置某一侧边界时，该方向只受 `Int` 可表示范围约束。
- 允许负数时使用整数标点键盘；下限为非负数时自动使用数字键盘。
- 组件负责边界和输入合法性，业务侧只消费最终 `value`。

## 验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsSwiftNumberStepper.podspec
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsSwiftNumberStepper -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

将减号、整数输入框与加号收口为 UIControl，以当前整数值、可选上下界与步长作为共同状态。按钮和键盘输入最终进入同一收敛、渲染和事件路径。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

点击加减或输入 → 校验整数 → 约束到有效范围 → 更新文字与可用状态 → 按策略发送事件

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 上下界可分别为 nil，省略表示该侧没有业务边界，但仍受 Int 范围约束。
- 程序调用 setValue 默认不发送事件，需要通知时显式开启，避免双向回写造成循环。
- 允许负数时键盘与临时输入状态不同于非负整数，编辑中的负号不能直接当最终有效值。
- 到达边界后加减按钮状态必须同步，溢出不能以普通加减后再裁剪来掩盖。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 configure、setBounds 和 setValue，再看 bounded、输入校验与结束编辑收敛。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftNumberStepper/JobsSwiftNumberStepper.swift](<./Core/JobsSwiftNumberStepper/JobsSwiftNumberStepper.swift>)

依赖与编译入口：[JobsSwiftNumberStepper.podspec](<./JobsSwiftNumberStepper.podspec>)。其中显式依赖声明包括 `JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`SnapKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

保留 optional 上下界和显式事件策略，业务在主线程配置。回归 Int.min/Int.max、反向上下界、仅负号的编辑中状态、粘贴非法字符和发送/不发送事件。程序回填默认不发事件，双向绑定调用方不要再次形成输入循环。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftNumberStepper --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
