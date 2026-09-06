# `JobsSwiftCalendar`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

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
| `JobsSwiftCalendarDayCell.byDate(_:)` / `byMonthPosition(_:)` | 在同一 Cell 链中配置日期与月份位置 |
| `JobsSwiftCalendarDayCell.jobsConfigure(...) -> Self` | 完成日期 Cell 配置后继续返回当前具体对象 |

## 四、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsSwiftBaseConfigDemo -configuration Debug -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前主打月历稳定渲染、翻页、选择、范围限制和基础外观；复杂农历、跨时区业务规则、深度自定义 cell 可继续沿 Jobs API 扩展。
- 如果业务页设置超过父视图宽度的固定约束，控件会尽量稳定内部布局，但正确做法仍是限制在 safe area / 父视图宽度内。

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分

把日历日期组织、日期 Cell、样式和公共定义分开。容器根据 Calendar、当前页和显示范围生成日期，样式对象统一外观，数据与事件入口连接宿主。

### 6.2、运行脉络

确定当前月份或周 → 生成日期单元 → 应用选择与样式 → 用户切页或选择 → 更新日期与布局

### 6.3、关键设计与边界

- 当前页、今天与选中日期是不同状态，切换月份不应自动把页首当作用户选择。
- 日期比较需按日历与日粒度处理，不能单纯比较时间戳是否相等。
- 占位日期、可选范围和多选策略分别影响显示和交互，重建先确定这些规则。
- bounds 变化会触发布局失效与安全重载，宿主仍应将控件限制在实际可用宽度内。

### 6.4、阅读与重建顺序

先读 Defines 与容器公开接口，再看日期生成、选择判定和高度通知，最后看 Appearance/DayCell。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftCalendar/JobsSwiftCalendar.swift](<./Core/JobsSwiftCalendar/JobsSwiftCalendar.swift>)
- [Core/JobsSwiftCalendarAppearance/JobsSwiftCalendarAppearance.swift](<./Core/JobsSwiftCalendarAppearance/JobsSwiftCalendarAppearance.swift>)
- [Core/JobsSwiftCalendarDayCell/JobsSwiftCalendarDayCell.swift](<./Core/JobsSwiftCalendarDayCell/JobsSwiftCalendarDayCell.swift>)
- [Core/JobsSwiftCalendarDefines/JobsSwiftCalendarDefines.swift](<./Core/JobsSwiftCalendarDefines/JobsSwiftCalendarDefines.swift>)

依赖与编译入口：[JobsSwiftCalendar.podspec](<./JobsSwiftCalendar.podspec>)。其中显式依赖声明包括 `JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
