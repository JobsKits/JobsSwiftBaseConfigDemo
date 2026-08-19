# JobsSwiftLinkageMenuView

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
