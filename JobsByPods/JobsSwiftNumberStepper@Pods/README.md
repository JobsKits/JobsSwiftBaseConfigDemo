# JobsSwiftNumberStepper

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
