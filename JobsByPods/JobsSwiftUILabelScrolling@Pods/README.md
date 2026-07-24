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

滚动仅在单行内容真实溢出时运行；短文本、多行文本以及开启“减弱动态效果”的默认场景保持 UILabel 原生绘制。
