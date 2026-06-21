# JobsSwiftTimerMgr

`JobsSwiftTimerMgr` 是 `JobsSwiftTimer` 之上的多定时器管理层，负责按 `identifier` 管理多个 timer，并提供去重、查找、动作派发和批量清理能力。

`JobsSwiftTimer` 只负责屏蔽系统 Timer API 的创建差异；页面内多个定时器的业务编排统一放在 `JobsSwiftTimerMgr`。
