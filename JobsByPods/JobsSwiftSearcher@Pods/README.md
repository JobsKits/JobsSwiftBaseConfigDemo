# JobsSwiftSearcher

Swift 本地 Pod，用于在 Swift 侧承接 OC `JobsOCSearcher` 的搜索功能。

## 能力

- `JobsSwiftSearcherConfig` 管理占位文案、按钮文案、推荐标题、历史标题和存储 key。
- `JobsSwiftSearcherView` 提供搜索框、搜索按钮、推荐词标签、历史列表、删除和清空历史。
- 历史记录使用 `UserDefaults` 持久化，同关键词会自动去重并置顶。
- 搜索输入变化、提交、推荐词点击、历史变化都通过闭包回调给业务层。
- 按钮创建、配置和事件统一使用 `JobsByUIKit` / `JobsSwiftDSL`。
- 搜索框、按钮、推荐区和列表的约束统一由 `SnapKit` 管理。

## 依赖

- `SnapKit`（组件布局和动态约束更新）。
- `JobsByUIKit`（按钮工厂和 UIKit 扩展）。
- `JobsSwiftDSL`（视图、控件和按钮链式 API）。
- `JobsSwiftBaseDefines`（使用 `JobsCor`、`JobsFont` 和 `UIColor(r:g:b:a:)`）。

## 目录

- `Core/JobsSwiftSearcherConfig`：搜索组件配置。
- `Core/JobsSwiftSearcherView`：公开搜索视图。

## 验证

```shell
pod lib lint JobsSwiftSearcher.podspec --allow-warnings --verbose
```

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。
