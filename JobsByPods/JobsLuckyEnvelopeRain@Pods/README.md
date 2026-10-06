# `JobsLuckyEnvelopeRain`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">红包雨</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

Jobs 自维护的 UIKit 配置统一使用 `JobsByUIKit` / `JobsSwiftDSL`；使用 `YES` 的源码显式依赖并导入 `JobsSwiftBaseDefines`。
红包绘制路径使用 `UIBezierPath.make(...)` 创建，实例操作使用 `JobsSwiftDSL` 链式 API。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

RedPacketRainConfig 提供生成与运动参数，RedPacketRainView 维护在场红包按钮、各自运动数据和累计点击数，通过计时器推进生成及下落。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置并开始 → 在数量限制内生成红包 → tick 更新运动 → 点击或离场后移除 → 停止或重置

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- start、pause、resume、stop(clear:) 和 reset 的语义不同；reset 还要清空累计点击数。
- 生成节拍与下落速度共同决定在场数量，必须考虑并发上限和离场清理。
- 点击回调交付视图与累计数量，不代表奖励计算、中奖判断或发放已经完成。
- 暂停应同时考虑生成与既有红包运动，恢复不能额外创建重复驱动器。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读配置，再跟踪 spawnPacketIfNeeded、updatePackets 和 removePacket，最后看停止与重置。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [红包雨视图.swift](<./红包雨视图.swift>)
- [红包雨配置.swift](<./红包雨配置.swift>)

依赖与编译入口：[JobsLuckyEnvelopeRain.podspec](<./JobsLuckyEnvelopeRain.podspec>)。其中显式依赖声明包括 `SnapKit`、`JobsSwiftTimer`、`JobsByUIKit`、`JobsSwiftDSL`、`JobsSwiftBaseDefines`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置会归一化为有限正数：生成间隔 0.05～60 秒、下落时间 0.05～120 秒、单红包最大 1024 点、在场最多 500 个；并发上限为零表示不生成。运行中重新配置会更新生成定时器，已有红包保留生成时的运动参数。

手动 pause 暂停生成与运动；resume 修正各红包的起始时间，不会把暂停时长变成跳跃下落。resume 在尚未建立定时器时按 start 处理。stop(clear: false) 停止生成并允许现有红包落完；reset 清空运动和累计计数。页面结束时由宿主 stop/reset，奖励校验和发放仍由服务端负责。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单通过独立资源 bundle 交付。单调运动计时使用 `SystemBootTime`（35F9.1）；该理由只用于库内时间间隔计算，宿主仍需核对业务采集与实际用途。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsLuckyEnvelopeRain --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
