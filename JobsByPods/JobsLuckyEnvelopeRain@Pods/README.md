# 红包雨

Jobs 自维护的 UIKit 配置统一使用 `JobsByUIKit` / `JobsSwiftDSL`；使用 `YES` 的源码显式依赖并导入 `JobsSwiftBaseDefines`。
红包绘制路径使用 `UIBezierPath.make(...)` 创建，实例操作使用 `JobsSwiftDSL` 链式 API。
