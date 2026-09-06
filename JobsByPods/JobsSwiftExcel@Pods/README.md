# `JobsSwiftExcel`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 定位

`JobsSwiftExcel` 是通用 Excel 风格 UI 组件，不负责 `.xlsx` 文件解析。它可以放进普通 View、`UITableViewCell` 或 `UICollectionViewCell`。

- 所有单元格宽高固定。
- `freezeThroughColumn = N` 时冻结第 `0...N` 列；传 `nil` 不冻结。
- 未冻结列由内部 `UIScrollView` 横向滚动，外层列表继续负责纵向滚动。
- 每个表头和数据格都能独立使用 `JobsLabelTextDisplayMode` 的四种文字策略。

## 使用

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

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

以 Column、Row、Cell、Style 描述表格，ExcelView 生成表头、冻结区和横向滚动区，CellContext 把点击转换成明确的行列上下文，长文字策略交给 UILabelScrolling。

### 1.2、运行脉络

提供列行模型 → 划分冻结与滚动区域 → 生成单元并计算高度 → 横向滚动 → 按坐标回调点击

### 1.3、关键设计与边界

- 冻结参数 nil 表示不冻结，N 表示冻结第 0 到 N 列，不能沿用 OC 的 NSNotFound 表达。
- 组件负责横向滚动，宿主列表继续负责纵向滚动，避免重复承担同一方向的滚动。
- requiredHeight 与固有高度由表头、行高和行数决定；无效列宽会采用样式默认值。
- 表头与每个数据格可分别设置文字显示方式，复建不能只给整张表一个统一裁剪规则。

### 1.4、阅读与重建顺序

先读 Column/Row/Cell，再看 ExcelView 的冻结分区、高度和偏移同步，最后看 CellContext。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftExcelView/JobsSwiftExcelView.swift](<./Core/JobsSwiftExcelView/JobsSwiftExcelView.swift>)
- [Core/JobsSwiftExcelCell/JobsSwiftExcelCell.swift](<./Core/JobsSwiftExcelCell/JobsSwiftExcelCell.swift>)
- [Core/JobsSwiftExcelCellContext/JobsSwiftExcelCellContext.swift](<./Core/JobsSwiftExcelCellContext/JobsSwiftExcelCellContext.swift>)
- [Core/JobsSwiftExcelColumn/JobsSwiftExcelColumn.swift](<./Core/JobsSwiftExcelColumn/JobsSwiftExcelColumn.swift>)
- [Core/JobsSwiftExcelRow/JobsSwiftExcelRow.swift](<./Core/JobsSwiftExcelRow/JobsSwiftExcelRow.swift>)

依赖与编译入口：[JobsSwiftExcel.podspec](<./JobsSwiftExcel.podspec>)。其中显式依赖声明包括 `JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsSwiftUILabelScrolling`、`SnapKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
