# JobsSwiftSearcher

Swift 本地 Pod，用于在 Swift 侧承接 OC `JobsOCSearcher` 的搜索功能。

## 能力

- `JobsSwiftSearcherConfig` 管理占位文案、按钮文案、推荐标题、历史标题和存储 key。
- `JobsSwiftSearcherView` 提供搜索框、搜索按钮、推荐词标签、历史列表、删除和清空历史。
- 历史记录使用 `UserDefaults` 持久化，同关键词会自动去重并置顶。
- 搜索输入变化、提交、推荐词点击、历史变化都通过闭包回调给业务层。

## 目录

- `Core/JobsSwiftSearcherConfig`：搜索组件配置。
- `Core/JobsSwiftSearcherView`：公开搜索视图。

## 验证

```shell
pod lib lint JobsSwiftSearcher.podspec --allow-warnings --verbose
```

