# `JobsSwiftUILabelScrolling`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 定位

Pod 名是 `JobsSwiftUILabelScrolling`，公开能力是原生 `UILabel` 的 `UILabel+Scrolling` 扩展，不要求业务继承自定义 Label。

内部 UILabel 配置统一使用 `JobsSwiftDSL`。文字阴影使用 UILabel 专用的 `byLabelShadowColor`、`byLabelShadowOffset`，不会误用 UIView DSL 的 CALayer 阴影语义。

`JobsLabelTextDisplayMode` 统一提供四种固定尺寸文字策略：

- `.scaleToFit`：单行，必要时缩小字号。
- `.singleLineTailTruncation`：单行，尾部省略。
- `.multiLineTailTruncation`：多行，最后一行尾部省略。
- `.scrolling`：单行溢出时使用 CoreText 完整滚动展示。

## 使用

```swift
import JobsSwiftUILabelScrolling

label.byTextDisplayMode(.singleLineTailTruncation)

label.byTextDisplayMode(
    .multiLineTailTruncation,
    maximumNumberOfLines: 3
)

label.byTextDisplayMode(
    .scrolling,
    scrollConfiguration: .continuous(speed: 36)
)
```

也可以直接控制滚动生命周期：

```swift
label
    .byTextScroll(.pingPong())
    .byStartTextScroll()

label.byPauseTextScroll()
label.byResumeTextScroll()
label.byReloadTextScroll()
label.byStopTextScroll()
```

滚动仅在单行内容真实溢出时运行；短文本、多行文本以及开启“减弱动态效果”的默认场景保持 UILabel 原生绘制。溢出判断使用 CoreText 排版推进宽度，防止字形裁切的光学画布扩展只参与绘制，不会把本可完整显示的短文案误判成溢出。CoreText 绘制前会按 UILabel 当前 `traitCollection` 解析动态前景色和阴影色，因此深浅色切换后与同层普通 UILabel 保持一致。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

给 UILabel 加上可控制的长文本显示策略。Controller 保存原文本状态、判断溢出并管理滚动，CoreText Layer 负责排版绘制，JobsSwiftTimer 提供位移更新，扩展提供调用入口。

### 1.2、运行脉络

读取标签文本与宽度 → 判断是否需要滚动 → 建立 CoreText 绘制层 → 按时间更新位移 → 重载或停止并恢复原文

### 1.3、关键设计与边界

- 是否溢出使用 CoreText 的排版推进宽度，不能拿为防裁切而扩展的字形画布宽度判断。
- 连续循环与往返模式有不同停留和回转规则，速度以每秒位移点数表达。
- 富文本和普通文本需要保留来源，停止时恢复标签，不能丢失原始样式。
- 主题变化后重建前要解析动态颜色，CoreText 不会自动跟随 UILabel 更新颜色。
- 遵循减弱动态效果配置，短文本或不需滚动时保持静态并释放计时驱动。

### 1.4、阅读与重建顺序

先读 Mode/Configuration，再看 Controller 的 rebuild、tick 与文本恢复，最后看 CoreTextScrollLayer。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsLabelScrollConfiguration/JobsLabelScrollConfiguration.swift](<./Core/JobsLabelScrollConfiguration/JobsLabelScrollConfiguration.swift>)
- [Core/JobsLabelScrollController/JobsLabelScrollController.swift](<./Core/JobsLabelScrollController/JobsLabelScrollController.swift>)
- [Core/JobsCoreTextScrollLayer/JobsCoreTextScrollLayer.swift](<./Core/JobsCoreTextScrollLayer/JobsCoreTextScrollLayer.swift>)
- [Core/JobsLabelScrollMode/JobsLabelScrollMode.swift](<./Core/JobsLabelScrollMode/JobsLabelScrollMode.swift>)
- [Core/UILabel+Scrolling/UILabel+Scrolling.swift](<./Core/UILabel+Scrolling/UILabel+Scrolling.swift>)

依赖与编译入口：[JobsSwiftUILabelScrolling.podspec](<./JobsSwiftUILabelScrolling.podspec>)。其中显式依赖声明包括 `JobsSwiftDSL`、`JobsSwiftTimer`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
