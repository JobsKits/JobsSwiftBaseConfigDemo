# JobsSwiftLinkageMenuView

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

Swift 本地 Pod，用于把左侧纵向滚动菜单和右侧 UIView 内容区联动起来。

本 Pod 直接依赖 `JobsSwiftBaseDefines`、`JobsSwiftDSL`；内部动态/基础/system 色统一使用 `JobsCor`，自定义 RGB 使用 `UIColor(r:g:b:a:)`，UIKit 配置和视图装配统一使用 Jobs 链式 API。

## 能力

- 左侧菜单由 `JobsSwiftLinkageMenuItem` 数组配置。
- 右侧内容由 `[UIView?]` 数组配置，选中菜单后自动加入内容区。
- 菜单没有对应内容时，触发 `noContentClickBlock`，不会强行复用最后一个内容。
- 支持固定菜单宽度、固定内容宽度、菜单比例宽度三种布局。
- 支持统一菜单高度，也支持数组或字典按下标覆盖单项高度。

## 验证

```shell
pod lib lint JobsSwiftLinkageMenuView.podspec --allow-warnings --verbose
```

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

将菜单项、菜单对应内容及布局配置组合成联动菜单。控件管理菜单按钮、选中指示器和内容容器，根据下标切换对应内容视图。

### 1.2、运行脉络

提供菜单和内容 → 按宽度策略布局 → 选择菜单 → 移动指示器 → 切换对应内容并回调

### 1.3、关键设计与边界

- 菜单和内容的对应关系必须稳定，下标越界或数量不匹配不能直接强制取值。
- 固定菜单宽度、固定内容宽度、比例宽度是不同布局策略，不能同时互相覆盖。
- 单项高度可由数组或字典覆盖统一高度，布局时要逐项累计，不能假设所有行等高。
- 控件切换的是宿主提供的内容视图，业务数据请求不自动由菜单代办。

### 1.4、阅读与重建顺序

先读 Item、Payload 和 Config，再看 reload、selectMenu、指示器定位与内容挂载。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftLinkageMenuView.swift](<./JobsSwiftLinkageMenuView.swift>)

依赖与编译入口：[JobsSwiftLinkageMenuView.podspec](<./JobsSwiftLinkageMenuView.podspec>)。其中显式依赖声明包括 `JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
