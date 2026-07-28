
## DSL 迁移说明

- 本 Pod 原有的链式 DSL / 点语法封装已经抽离到 `JobsSwiftDSL`。
- 继续使用 `byXxx(...)`、`dsl { ... }` 这类语法时，请在调用文件显式 `import JobsSwiftDSL`。
- 本 Pod 保留薄桥接文件和 `JobsSwiftDSL` 依赖，用于兼容旧代码的过渡期。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。
