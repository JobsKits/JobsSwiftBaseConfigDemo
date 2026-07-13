# `JobsSwiftCalendar`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsSwiftCalendar` 是 Swift 侧对齐 `JobsOCCalendar` 的独立日历控件。它不包裹第三方日历视图，内部负责年月标题、星期栏、日期格、选中态、翻页、日期范围、节假日副标题和安全刷新。

本 Pod 直接依赖 `JobsSwiftBaseDefines` 和 `JobsSwiftDSL`；系统字体统一走 `JobsFont`，Jobs 自维护的 UIKit 属性和装配统一走 `byXxx` 链式入口。

## 一、用途 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Demo、业务页、组件页需要稳定月历视图，并希望规避约束变化或异步刷新导致的错位。
- 业务层通过 `JobsSwiftCalendarDataSource`、`JobsSwiftCalendarDelegate` 和 `JobsSwiftCalendarAppearance` 配置标题、副标题、日期范围、选中态和外观。
- Swift 侧需要和 OC 侧 `JobsOCCalendar` 保持同一套 Jobs 自研日历能力。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsSwiftCalendar@Pods
├── JobsSwiftCalendar.podspec
├── LICENSE
├── README.md
└── Core
    ├── JobsSwiftCalendar
    │   └── JobsSwiftCalendar.swift
    ├── JobsSwiftCalendarDefines
    │   └── JobsSwiftCalendarDefines.swift
    ├── JobsSwiftCalendarAppearance
    │   └── JobsSwiftCalendarAppearance.swift
    └── JobsSwiftCalendarDayCell
        └── JobsSwiftCalendarDayCell.swift
```

`Core` 只放公开 Swift 代码；当前暂无资源。后续图片、bundle、声音、json、`*.xcprivacy` 等非代码资源统一放到根级 `Resource`。

## 三、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、引用方式

```swift
import JobsSwiftCalendar
```

### 3.2、创建入口

```swift
let calendar = JobsSwiftCalendar()
calendar.dataSource = self
calendar.delegate = self
calendar.allowsMultipleSelection = true
```

### 3.3、稳定性 API

| API | 说明 |
| --- | --- |
| `jobsAutomaticallyInvalidateLayoutOnBoundsChange` | bounds 变化时自动刷新内部布局 |
| `jobsReloadDataAfterBoundsChange` | bounds 变化后在下一轮主线程防抖 reload |
| `jobsInvalidateCalendarLayout()` | 手动触发内部布局刷新 |
| `jobsReloadDataSafely()` | 主线程安全刷新日历 |
| `setCurrentPage(_:animated:)` | 切换当前月份 |
| `selectDate(_:)` / `deselectDate(_:)` | 主动选中或取消日期 |

## 四、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsSwiftBaseConfigDemo -configuration Debug -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前主打月历稳定渲染、翻页、选择、范围限制和基础外观；复杂农历、跨时区业务规则、深度自定义 cell 可继续沿 Jobs API 扩展。
- 如果业务页设置超过父视图宽度的固定约束，控件会尽量稳定内部布局，但正确做法仍是限制在 safe area / 父视图宽度内。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
