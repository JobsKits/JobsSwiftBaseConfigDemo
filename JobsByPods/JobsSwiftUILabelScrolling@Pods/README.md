# `JobsSwiftUILabelScrolling`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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
