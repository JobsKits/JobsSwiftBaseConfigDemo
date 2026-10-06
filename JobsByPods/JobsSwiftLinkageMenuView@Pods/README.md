# `JobsSwiftLinkageMenuView`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">JobsSwiftLinkageMenuView</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

Swift 本地 Pod，用于把左侧纵向滚动菜单和右侧 UIView 内容区联动起来。

本 Pod 直接依赖 `JobsSwiftBaseDefines`、`JobsSwiftDSL`；内部动态/基础/system 色统一使用 `JobsCor`，自定义 RGB 使用 `UIColor(r:g:b:a:)`，UIKit 配置和视图装配统一使用 Jobs 链式 API。

## 能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 左侧菜单由 `JobsSwiftLinkageMenuItem` 数组配置。
- 右侧内容由 `[UIView?]` 数组配置，选中菜单后自动加入内容区。
- 菜单没有对应内容时，触发 `noContentClickBlock`，不会强行复用最后一个内容。
- 支持固定菜单宽度、固定内容宽度、菜单比例宽度三种布局。
- 支持统一菜单高度，也支持数组或字典按下标覆盖单项高度。

## 验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
pod lib lint JobsSwiftLinkageMenuView.podspec --allow-warnings --verbose
```

## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

将菜单项、菜单对应内容及布局配置组合成联动菜单。控件管理菜单按钮、选中指示器和内容容器，根据下标切换对应内容视图。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

提供菜单和内容 → 按宽度策略布局 → 选择菜单 → 移动指示器 → 切换对应内容并回调

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 菜单和内容的对应关系必须稳定，下标越界或数量不匹配不能直接强制取值。
- 固定菜单宽度、固定内容宽度、比例宽度是不同布局策略，不能同时互相覆盖。
- 单项高度可由数组或字典覆盖统一高度，布局时要逐项累计，不能假设所有行等高。
- 控件切换的是宿主提供的内容视图，业务数据请求不自动由菜单代办。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 Item、Payload 和 Config，再看 reload、selectMenu、指示器定位与内容挂载。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftLinkageMenuView.swift](<./JobsSwiftLinkageMenuView.swift>)

依赖与编译入口：[JobsSwiftLinkageMenuView.podspec](<./JobsSwiftLinkageMenuView.podspec>)。其中显式依赖声明包括 `JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

菜单为空时清除旧内容与指示器并显示 JobsEmptyAuto；缺失内容且 `clearsContentWhenMissing = true` 时同样显示空态。点击空态触发 `config.reloadBlock`，宿主据此重试请求并 reload 新数据。关闭清除策略时保留当前内容，由业务自定义缺失内容反馈。

单项高度必须为有限正数，非法值回退到默认高度，最大 10000 点。菜单与内容数组可以数量不同，缺失项以 nil 内容处理，不能越界读取。加载、数据替换和选中动作在主线程执行。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftLinkageMenuView --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
