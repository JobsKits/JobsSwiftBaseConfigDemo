# JobsGetWindow

- `UIWindowScene.keyWindowCompat` 统一处理 iOS 15+ `keyWindow` 与旧系统 `windows` 回退。
- `legacyKeyWindowPreiOS13()` 仅作为已退役的 Jobs 兼容入口保留，其 deprecated message 指向 Jobs 替代 API；底层系统版本差异由实现内部处理。
