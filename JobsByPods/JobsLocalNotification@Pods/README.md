# 本地通知

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

用通知模型收集标识、标题、正文、延迟、重复与声音，再由 JobsMakeLocalNotification 组装系统内容、时间触发器和请求，提交给系统通知中心。

### 1.2、运行脉络

创建通知模型 → 生成内容与时间触发器 → 提交通知请求 → 记录提交成功或错误

### 1.3、关键设计与边界

- 当前方法把时间间隔至少设为 1 秒，但没有完整校验所有重复通知约束，不能把这个兜底理解为任意参数都有效。
- 提交成功只代表请求被接受，不等于通知已经展示；授权、前台展示策略和业务后续处理不在这个方法中完成。
- 模型类虽然公开，当前属性声明未显式标为 public；跨模块配置能力需要按实际访问级别核对。
- 标识会影响系统中通知请求的对应关系，业务应规划标识，不能所有通知都沿用示例默认值。

### 1.4、阅读与重建顺序

先读 JobsLocalNotificationModel 的字段和访问级别，再看 triggerLocalNotification 的组装与错误处理。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsLocalNotificationModel.swift](<./JobsLocalNotificationModel.swift>)
- [JobsMakeLocalNotification.swift](<./JobsMakeLocalNotification.swift>)

依赖与编译入口：[JobsLocalNotification.podspec](<./JobsLocalNotification.podspec>)。其中显式依赖声明包括 `JobsSwiftTools`、`JobsByUIKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
