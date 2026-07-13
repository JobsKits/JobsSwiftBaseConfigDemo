JobsFont 提供系统字体静态工厂的 Jobs 等价入口；上层代码使用 JobsFont.systemFont(...)、JobsFont.boldSystemFont(...)、JobsFont.monospacedDigitSystemFont(...) 和 JobsFont.preferredFont(...)，底层统一承接 UIKit。

JobsCor 提供 UIKit 基础色、系统色和动态语义色的 Jobs 等价入口；上层代码使用 JobsCor.clear、JobsCor.white、JobsCor.systemBlue 等属性，底层统一承接 UIColor。
