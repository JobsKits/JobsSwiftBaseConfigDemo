# `JobsProgressBar` 自定义进度条

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsProgressBar` 支持进度方向、正向 / 倒序数值、拖动、进度头旋转，以及跟随进度头移动的带箭头数值气泡。

## 一、快速接入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsProgressBar
import JobsSwiftBaseDefines

private lazy var progressView: JobsProgressBar = {
    JobsProgressBar()
        .byDirection(.leftToRight)
        .byValueMode(.countDown)
        .byTrackColor(JobsCor.systemGray5)
        .byTrackHorizontalInset(0)
        .byTrackVerticalInset(0)
        .byTrackThickness(nil)
        .byProgressBubblePlacement(.top)
        .byProgressBubbleDisplayMode(.whileChanging)
        .byProgressBubbleHideDelay(0.8)
        .byAutoHideLabel(false)
        .byLabelBackgroundColor(JobsCor.secondarySystemBackground)
        .byLabelFont(JobsFont.monospacedDigitSystemFont(ofSize: 12, weight: .medium))
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(modeToggleButton.snp.bottom).offset(48)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(20)
        }
}()
```

## 二、进度气泡 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 位置使用 `.byProgressBubblePlacement(.top)` 或 `.byProgressBubblePlacement(.bottom)`；不需要气泡时传 `.hidden`。
- 显示模式默认是 `.whileChanging`，进度停止变化 `0.8` 秒后自动隐藏；需要常显时传 `.always`。
- 气泡跟随足球等进度头移动，接近左右边界时会自动收进进度条宽度范围，小三角仍指向当前进度头。
- 气泡位于进度条边界外，外层布局需要为上方或下方预留足够空间。

## 三、设置进度 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
progressView.setDisplayPercent(text: "20", animated: true)
```

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
