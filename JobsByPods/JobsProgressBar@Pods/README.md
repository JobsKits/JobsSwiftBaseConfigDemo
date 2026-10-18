# `JobsProgressBar` 自定义进度条

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、快速接入](#jobs-toc-heading-2)
- [二、进度气泡](#jobs-toc-heading-3)
- [三、设置进度](#jobs-toc-heading-4)
- [Jobs DSL 调用约定](#jobs-toc-heading-5)
- [四、架构脉络与关键设计](#jobs-toc-heading-6)
  - [4.1、设计目的与职责划分](#jobs-toc-heading-7)
  - [4.2、运行脉络](#jobs-toc-heading-8)
  - [4.3、关键设计与边界](#jobs-toc-heading-9)
  - [4.4、阅读与重建顺序](#jobs-toc-heading-10)
- [五、运行合同与边界](#jobs-toc-heading-11)
- [六、生产交付与全量门禁](#jobs-toc-heading-12)

</details>
<!-- jobs-toc:end -->

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> `JobsProgressBar` 支持进度方向、正向 / 倒序数值、拖动、进度头旋转，以及跟随进度头移动的带箭头数值气泡。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、快速接入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

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

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、进度气泡 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 位置使用 `.byProgressBubblePlacement(.top)` 或 `.byProgressBubblePlacement(.bottom)`；不需要气泡时传 `.hidden`。
- 显示模式默认是 `.whileChanging`，进度停止变化 `0.8` 秒后自动隐藏；需要常显时传 `.always`。
- 气泡跟随足球等进度头移动，接近左右边界时会自动收进进度条宽度范围，小三角仍指向当前进度头。
- 气泡位于进度条边界外，外层布局需要为上方或下方预留足够空间。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、设置进度 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```swift
progressView.setDisplayPercent(text: "20", animated: true)
```

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">四、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### <span id="jobs-toc-heading-7" data-jobs-toc="v2">4.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

用标准进度驱动轨道、填充、滑块与气泡标签，支持方向、正倒计数显示、拖动及内置自动推进。数值解释与几何位置分开，拖动速度还影响滑块旋转表现。

### <span id="jobs-toc-heading-8" data-jobs-toc="v2">4.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

设置进度和显示规则 → 换算位置与显示值 → 拖动或自动推进 → 更新气泡和滑块 → 停止或外部接管

### <span id="jobs-toc-heading-9" data-jobs-toc="v2">4.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- progress 始终以 0 表示起点、1 表示终点；方向与显示倒数独立，不应反复翻转底层值。
- autoStopOnExternalChange 决定外部配置变化是否停止内部计时，避免两方争用进度。
- 没有实际拖动时不应继续按拖动速度旋转，松手后的减速是独立收尾。
- 气泡可能位于控件边界外，宿主需预留空间；真实任务完成状态仍由业务提供。

### <span id="jobs-toc-heading-10" data-jobs-toc="v2">4.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

先看标准进度与显示映射，再看四方向布局和手势处理，最后看自动计时与气泡生命周期。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsProgressBar.swift](<./JobsProgressBar.swift>)
- [JobsProgressBarByUIKit.swift](<./JobsProgressBarByUIKit.swift>)

依赖与编译入口：[JobsProgressBar.podspec](<./JobsProgressBar.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsByUIKit`、`JobsSwiftTimer`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## <span id="jobs-toc-heading-11" data-jobs-toc="v2">五、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

进度值由宿主任务状态提供，更新在主线程；有限范围之外输入按控件既有归一化处理。重用控件时明确设置当前值和动画策略，不能把到达 100% 当作真实任务成功。主题、bounds 变化和从 0 到 1 的过渡应一起回归。


## <span id="jobs-toc-heading-12" data-jobs-toc="v2">六、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsProgressBar --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
