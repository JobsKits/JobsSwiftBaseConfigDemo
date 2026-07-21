# `JobsScrollingLabel`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

## 一、定位

`JobsScrollingLabel` 是独立的 UILabel 长文本滚动 Pod，不依赖 `JobsByUIKit`。

- CoreText 负责完整单行文字排版。
- 自定义 `CALayer` 负责绘制，文字不会先被 UILabel 截断成省略号。
- `JobsSwiftTimer` 负责动画节拍，默认使用 `.displayLink` 内核。
- 每个动画帧只更新 Layer 位移，不重复创建 UILabel，也不重复排版文字。
- 文案未超出 UILabel 可视宽度时保持系统原始绘制，不创建常驻定时器。

## 二、两种模式

### 2.1、连续跑马灯

```swift
import JobsScrollingLabel

label
    .byTextScroll(.continuous(
        speed: 36,
        spacing: 40,
        startDelay: 0.8
    ))
    .byStartTextScroll()
```

### 2.2、左右往返

```swift
import JobsScrollingLabel

label
    .byTextScroll(.pingPong(
        speed: 28,
        startDelay: 0.8,
        edgePause: 0.8
    ))
    .byStartTextScroll()
```

## 三、生命周期

```swift
label.byPauseTextScroll()
label.byResumeTextScroll()
label.byStopTextScroll()
```

文案、富文本、字体、颜色或约束尺寸变化后，调用：

```swift
label
    .byText("新的长文案")
    .byReloadTextScroll()
```

## 四、行为边界

- 组件定位是“单行长文本完整展示”，多行 UILabel 不进入滚动管线。
- 支持纯文本和 `NSAttributedString`；CoreText 会保留富文本已有字体和颜色，并为缺失区间补 UILabel 默认字体与颜色。
- 默认尊重系统“减弱动态效果”。如业务必须滚动，可在配置中设置 `respectsReduceMotion: false`。
- 滚动期间 UILabel 仍保留原始文案语义；停止后会恢复原始文本、富文本、颜色和阴影。
