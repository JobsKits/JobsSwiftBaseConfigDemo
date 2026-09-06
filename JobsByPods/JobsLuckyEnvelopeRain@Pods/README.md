# 红包雨

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

Jobs 自维护的 UIKit 配置统一使用 `JobsByUIKit` / `JobsSwiftDSL`；使用 `YES` 的源码显式依赖并导入 `JobsSwiftBaseDefines`。
红包绘制路径使用 `UIBezierPath.make(...)` 创建，实例操作使用 `JobsSwiftDSL` 链式 API。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

RedPacketRainConfig 提供生成与运动参数，RedPacketRainView 维护在场红包按钮、各自运动数据和累计点击数，通过计时器推进生成及下落。

### 1.2、运行脉络

配置并开始 → 在数量限制内生成红包 → tick 更新运动 → 点击或离场后移除 → 停止或重置

### 1.3、关键设计与边界

- start、pause、resume、stop(clear:) 和 reset 的语义不同；reset 还要清空累计点击数。
- 生成节拍与下落速度共同决定在场数量，必须考虑并发上限和离场清理。
- 点击回调交付视图与累计数量，不代表奖励计算、中奖判断或发放已经完成。
- 暂停应同时考虑生成与既有红包运动，恢复不能额外创建重复驱动器。

### 1.4、阅读与重建顺序

先读配置，再跟踪 spawnPacketIfNeeded、updatePackets 和 removePacket，最后看停止与重置。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [红包雨视图.swift](<./红包雨视图.swift>)
- [红包雨配置.swift](<./红包雨配置.swift>)

依赖与编译入口：[JobsLuckyEnvelopeRain.podspec](<./JobsLuckyEnvelopeRain.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsSwiftTimer`、`JobsByUIKit`、`JobsSwiftDSL`、`JobsSwiftBaseDefines`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
