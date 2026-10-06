# `JobsLocalNotification`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

## 🔥 <span id="前言">前言</span>

基于 [**UserNotifications**](https://developer.apple.com/documentation/usernotifications) 将模型提交为本地通知。授权申请、前台展示和业务路由由宿主实现。

## 一、配置与提交 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsLocalNotificationModel` 字段公开，支持直接赋值及 `byIdentifier`、`byTitle`、`byBody`、`byTriggerWithTimeInterval`、`byRepeats`、`bySound` 链式配置。默认标识 `DemoNotification`、一次通知、间隔 1 秒、默认声音；同标识会替换系统已有请求，应按业务规划唯一标识。

```swift
let model = JobsLocalNotificationModel()
    .byIdentifier("reminder.order.123")
    .byTitle("订单提醒")
    .byTriggerWithTimeInterval(60)
    .byRepeats(true)
JobsMakeLocalNotification().triggerLocalNotification(model) { result in
    // 主队列，提交结果恰好一次；业务自行展示或记录错误。
    print(result)
}
```

原来的无 completion 调用保留并记录结果。

## 二、参数与生命周期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

提交前校验：标识去掉首尾空白后不能为空；间隔必须是有限正数；重复通知至少 60 秒。不合法参数通过 `JobsLocalNotificationError` 返回，绝不创建非法系统触发器。一次通知允许小于 60 秒。提交时快照模型，配置和提交须在同一执行上下文，提交后修改模型不修改已经组装的请求。模型不宣称 Sendable；跨线程使用时由宿主串行配置。

所有完成回调异步回到主队列。成功表示系统接受请求，实际展示仍取决于通知授权、系统策略和宿主 delegate。移除待发/已展示通知使用系统通知中心的标识管理；本组件不自动请求权限或批量清除通知。tvOS 不开放 sound 配置。

## 三、源码与回归 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[模型](./JobsLocalNotificationModel.swift)、[提交入口](./JobsMakeLocalNotification.swift)、[错误类型](./JobsLocalNotificationError.swift)。回归应覆盖一次 1 秒、重复 60 秒、重复 1 秒、0/负数/NaN/无穷以及空标识；非法值必须返回失败，完成回调在主队列且一次。无需安排真实通知即可检查参数拒绝。权限拒绝与前台展示需在设备宿主验证。


## 四、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsLocalNotification --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
