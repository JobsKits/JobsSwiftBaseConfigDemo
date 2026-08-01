JobsFont 提供系统字体静态工厂的 Jobs 等价入口；上层代码使用 JobsFont.systemFont(...)、JobsFont.boldSystemFont(...)、JobsFont.monospacedDigitSystemFont(...) 和 JobsFont.preferredFont(...)，底层统一承接 UIKit。

JobsCor 提供 UIKit 基础色、系统色和动态语义色的 Jobs 等价入口；上层代码使用 JobsCor.clear、JobsCor.white、JobsCor.systemBlue 等属性，底层统一承接 UIColor。

`JobsThemeCenter` 提供主题数据包解析、状态持久化、弱引用资源绑定和 `JobsThemeDidChange` 通知。App 在主工程资源目录维护 `JobsThemeResources.json`，框架只消费 `background.*`、`text.*` 等 Key，不包含具体业务色值。切换主题只重放已登记的背景色、文字色以及显式声明的主题图片，不遍历 Scene、Window 或控制器树，也不写入 `overrideUserInterfaceStyle`。
