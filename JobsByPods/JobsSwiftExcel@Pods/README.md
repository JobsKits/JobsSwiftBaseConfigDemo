# <span id="前言">`JobsSwiftExcel`</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsSwiftExcel` 是通用 Excel 风格 UI 组件，不负责 `.xlsx` 文件解析。它可以放进普通 View、`UITableViewCell` 或 `UICollectionViewCell`。

- 所有单元格宽高固定。
- `freezeThroughColumn = N` 时冻结第 `0...N` 列；传 `nil` 不冻结。
- 未冻结列由内部 `UIScrollView` 横向滚动，外层列表继续负责纵向滚动。
- 每个表头和数据格都能独立使用 `JobsLabelTextDisplayMode` 的四种文字策略。

## 使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsSwiftExcel
import JobsSwiftUILabelScrolling

let columns = [
    JobsSwiftExcelColumn(title: "城市", width: 104),
    JobsSwiftExcelColumn(title: "说明", width: 180)
]
let rows = [
    JobsSwiftExcelRow(cells: [
        JobsSwiftExcelCell(text: "深圳"),
        JobsSwiftExcelCell(
            text: "固定格内完整滚动展示的长文案",
            textDisplayMode: .scrolling
        )
    ])
]

excelView.configure(
    columns: columns,
    rows: rows,
    freezeThroughColumn: 0
)
```

`requiredHeight` 和 intrinsic content size 由固定表头高、行高与行数共同决定。调用方可以读取或同步 `horizontalContentOffset`。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

以 Column、Row、Cell、Style 描述表格，ExcelView 生成表头、冻结区和横向滚动区，CellContext 把点击转换成明确的行列上下文，长文字策略交给 UILabelScrolling。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

提供列行模型 → 划分冻结与滚动区域 → 生成单元并计算高度 → 横向滚动 → 按坐标回调点击

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 冻结参数 nil 表示不冻结，N 表示冻结第 0 到 N 列，不能沿用 OC 的 NSNotFound 表达。
- 组件负责横向滚动，宿主列表继续负责纵向滚动，避免重复承担同一方向的滚动。
- requiredHeight 与固有高度由表头、行高和行数决定；无效列宽会采用样式默认值。
- 表头与每个数据格可分别设置文字显示方式，复建不能只给整张表一个统一裁剪规则。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 Column/Row/Cell，再看 ExcelView 的冻结分区、高度和偏移同步，最后看 CellContext。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftExcelView/JobsSwiftExcelView.swift](<./Core/JobsSwiftExcelView/JobsSwiftExcelView.swift>)
- [Core/JobsSwiftExcelCell/JobsSwiftExcelCell.swift](<./Core/JobsSwiftExcelCell/JobsSwiftExcelCell.swift>)
- [Core/JobsSwiftExcelCellContext/JobsSwiftExcelCellContext.swift](<./Core/JobsSwiftExcelCellContext/JobsSwiftExcelCellContext.swift>)
- [Core/JobsSwiftExcelColumn/JobsSwiftExcelColumn.swift](<./Core/JobsSwiftExcelColumn/JobsSwiftExcelColumn.swift>)
- [Core/JobsSwiftExcelRow/JobsSwiftExcelRow.swift](<./Core/JobsSwiftExcelRow/JobsSwiftExcelRow.swift>)

依赖与编译入口：[JobsSwiftExcel.podspec](<./JobsSwiftExcel.podspec>)。其中显式依赖声明包括 `JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsSwiftUILabelScrolling`、`SnapKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、使用合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- View 配置、重载、偏移读写与布局属于 MainActor；业务后台计算完成后在主线程提交模型快照。
- 负冻结索引表示不冻结；超过列数或 `Int.max` 先限到最后一列，再计算冻结数量，不发生整数加法溢出。
- 行高、表头高和默认宽度的有限值钳制到 `1...100000`，非有限值采用默认样式；列宽非有限或非正时采用默认宽度，过大时限制到 100000。网格线宽限制在 `0...100`，非有限偏移忽略。
- 当前使用完整单元格视图构建，适合嵌入式小表格。大行列数据应先测量首屏耗时、内存与滚动帧率，再选择宿主分页或独立虚拟化方案；本模块不承诺任意数据规模。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftExcel --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
