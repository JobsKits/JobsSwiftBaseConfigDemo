> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。



## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

收口应用层的常用组合操作，包括启动分类、通用提示、URL 判断及列表注册等。与单纯类型扩展不同，这一层把基础工具和 UI 组件组合成接近业务入口的动作。

### 1.2、运行脉络

应用或页面调用工具入口 → 读取必要状态并选择分支 → 调用基础库或 UI 组件 → 回调业务或保存标记

### 1.3、关键设计与边界

- LaunchChecker 的 markAndClassifyThisLaunch 会写入启动标记；只查询是否首次启动的入口不应产生同样副作用。
- 首次安装、当天首次启动和普通启动是互斥分类，调用顺序会影响观察到的结果。
- 按日期判断当天需要遵循实现使用的日历与年月日口径，调试 reset 会清除持久化标记。
- 通用弹窗与列表注册仍依赖项目采用的具体组件，不应将它们描述成 Foundation 级无 UI 依赖工具。

### 1.4、阅读与重建顺序

先按业务目的定位 JobsSwiftAppTools.swift 的分区，启动逻辑从 LaunchChecker 读到 AppLaunchManager，再追依赖。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftAppTools.swift](<./JobsSwiftAppTools.swift>)

依赖与编译入口：[JobsSwiftAppTools.podspec](<./JobsSwiftAppTools.podspec>)。其中显式依赖声明包括 `SwiftEntryKit`、`SnapKit`、`JobsInheritance`、`JobsByUIKit`、`JobsSwiftBlock`、`JobsSwiftBaseDefines`、`JobsTextTools`、`JobsSwiftBaseTools`、`JobsScale`、`JobsSwiftTools`、`JobsBy3rdTools`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
