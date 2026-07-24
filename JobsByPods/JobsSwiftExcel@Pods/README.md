# `JobsSwiftExcel`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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
