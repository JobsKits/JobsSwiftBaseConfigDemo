# `Swift Code Map`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

- 项目识别：`JobsSwiftTimer`。
- 本文档由 `SwiftCodeMap.command` 从 0 扫描生成。
- AI 可以读取本文档，但事实源以 `CODE_GRAPH.json` 为准。
- 面向新人阅读时，优先打开 `CODE_MAP.html`，那里有可点击零部件、可返回的详情页和流程图。

## 一、扫描摘要 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 扫描目录：

  ```text
  /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTimer@Pods
  ```

- 输出目录：

  ```text
  /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods/JobsSwiftTimer@Pods/JobsCodeMapReports/Swift/20260519_125200
  ```

- 核心统计：

  | 项目 | 数量 |
  | --- | ---: |
  | `source_files` | `6` |
  | `resource_files` | `0` |
  | `project_files` | `1` |
  | `nodes` | `85` |
  | `components` | `23` |
  | `edges` | `297` |
  | `component_edges` | `30` |
  | `imports` | `11` |

## 二、新人阅读路线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 这是一个 Swift 静态代码地图：它把 JobsSwiftTimer 的源码拆成可点击零部件，并把符号、属性、调用痕迹、协议/类型关系放到同一个上下文里。

- 先看「核心零部件」：理解这个工程由哪些类、协议、配置和管理器组成。
- 再点开某个零部件：看它有哪些公开动作、保存哪些状态、谁调用它、它又调用谁。
- 最后看「流程图」：用箭头把零部件之间的关系串起来，避免只盯着单个文件而丢失上下文。

## 三、核心零部件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

  | 零部件 | 类型 | 位置 | 方法 | 属性 | 说明 |
  | --- | --- | --- | ---: | ---: | --- |
  | `JobsTimer` | `class` | `JobsSwiftTimer.swift:37` | `23` | `32` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `JobsSwiftTimerCountdown` | `class` | `JobsSwiftTimerCountdown.swift:11` | `6` | `13` | 倒计时封装：把底层计时器包装成更贴近业务的倒计时 / 进度快照模型。 |
  | `JobsSwiftTimerManager` | `class` | `JobsSwiftTimerManager.swift:15` | `10` | `9` | 管理器：负责统一创建、保存、查找、去重和释放其它对象，是新人理解生命周期时最应该先看的入口。 |
  | `JobsTimer.DisplayLinkProxy` | `class` | `JobsSwiftTimer.swift:393` | `2` | `1` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `JobsAppStateManager` | `class` | `JobsSwiftTimer.swift:479` | `7` | `3` | 管理器：负责统一创建、保存、查找、去重和释放其它对象，是新人理解生命周期时最应该先看的入口。 |
  | `JobsSwiftTimerConfig` | `struct` | `JobsSwiftTimerConfig.swift:17` | `1` | `8` | 配置模型：集中保存外部可调参数，决定核心对象运行时采用什么策略。 |
  | `JobsSwiftTimerCountdown.Snapshot` | `struct` | `JobsSwiftTimerCountdown.swift:21` | `1` | `7` | 倒计时封装：把底层计时器包装成更贴近业务的倒计时 / 进度快照模型。 |
  | `JobsSwiftTimerProtocol` | `protocol` | `JobsSwiftTimerProtocol.swift:24` | `7` | `1` | 协议契约：定义外部能依赖的公共能力，让具体实现可以替换但调用方式保持稳定。 |
  | `JobsUnfairLock` | `class` | `JobsSwiftTimer.swift:18` | `1` | `1` | 并发保护：封装锁能力，用来保护共享状态，降低多线程读写风险。 |
  | `extension JobsSwiftTimerCountdown` | `extension` | `JobsSwiftTimerCountdown.swift:183` | `4` | `1` | 倒计时封装：把底层计时器包装成更贴近业务的倒计时 / 进度快照模型。 |
  | `JobsTimerKind` | `enum` | `JobsSwiftTimerDefs.swift:69` | `0` | `0` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `JobsTimer.State` | `enum` | `JobsSwiftTimer.swift:39` | `0` | `0` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `JobsAppStateAction` | `enum` | `JobsSwiftTimer.swift:473` | `0` | `0` | 状态模型：描述对象处于什么阶段，通常会影响 start / pause / resume / stop 这类动作能否执行。 |
  | `JobsSwiftTimerCountdown.Snapshot.Mode` | `enum` | `JobsSwiftTimerCountdown.swift:23` | `0` | `0` | 倒计时封装：把底层计时器包装成更贴近业务的倒计时 / 进度快照模型。 |
  | `JobsSwiftTimerCountdown.State` | `enum` | `JobsSwiftTimerCountdown.swift:65` | `0` | `0` | 倒计时封装：把底层计时器包装成更贴近业务的倒计时 / 进度快照模型。 |
  | `JobsTimerDedupPolicy` | `enum` | `JobsSwiftTimerDefs.swift:60` | `0` | `0` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `JobsOpenResult` | `enum` | `JobsSwiftTimerDefs.swift:9` | `0` | `0` | 代码组件：从源码中识别出的独立零部件；请结合方法、属性和调用关系判断它在工程中的位置。 |
  | `TimerState` | `enum` | `JobsSwiftTimerDefs.swift:15` | `0` | `0` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `_TimerMode` | `enum` | `JobsSwiftTimerDefs.swift:22` | `0` | `1` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `JobsSwiftTimerManagerError` | `enum` | `JobsSwiftTimerDefs.swift:32` | `0` | `1` | 管理器：负责统一创建、保存、查找、去重和释放其它对象，是新人理解生命周期时最应该先看的入口。 |
  | `JobsSwiftTimerManagerAction` | `enum` | `JobsSwiftTimerDefs.swift:51` | `0` | `0` | 管理器：负责统一创建、保存、查找、去重和释放其它对象，是新人理解生命周期时最应该先看的入口。 |
  | `extension JobsTimerKind` | `extension` | `JobsSwiftTimerDefs.swift:82` | `0` | `1` | 核心计时器：负责启动、暂停、恢复、停止以及 tick / finish 回调，是运行链路的核心零部件。 |
  | `JobsSwiftTimerIdentifiable` | `protocol` | `JobsSwiftTimerProtocol.swift:50` | `0` | `1` | 协议契约：定义外部能依赖的公共能力，让具体实现可以替换但调用方式保持稳定。 |

## 四、入口点 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- `JobsTimer.start(...)`
  - 位置：`JobsSwiftTimer.swift:112`
  - 类型：`lifecycle_or_public_action`
- `JobsSwiftTimerCountdown.start(...)`
  - 位置：`JobsSwiftTimerCountdown.swift:113`
  - 类型：`lifecycle_or_public_action`
- `JobsSwiftTimerProtocol.start(...)`
  - 位置：`JobsSwiftTimerProtocol.swift:29`
  - 类型：`lifecycle_or_public_action`

## 五、符号分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 节点类型统计：

  | 类型 | 数量 |
  | --- | ---: |
  | `function` | `53` |
  | `enum` | `11` |
  | `class` | `6` |
  | `initializer` | `6` |
  | `deinitializer` | `3` |
  | `struct` | `2` |
  | `extension` | `2` |
  | `protocol` | `2` |

- 方法数量最多的容器：

  | 容器 | 方法数 |
  | --- | ---: |
  | `JobsTimer` | `23` |
  | `JobsSwiftTimerManager` | `10` |
  | `JobsAppStateManager` | `7` |
  | `JobsSwiftTimerProtocol` | `7` |
  | `JobsSwiftTimerCountdown` | `6` |
  | `extension JobsSwiftTimerCountdown` | `4` |
  | `JobsTimer.DisplayLinkProxy` | `2` |
  | `JobsUnfairLock` | `1` |
  | `JobsSwiftTimerConfig` | `1` |
  | `JobsSwiftTimerCountdown.Snapshot` | `1` |

## 六、关系统计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 边类型统计：

  | 关系类型 | 数量 |
  | --- | ---: |
  | `call` | `144` |
  | `member_call` | `65` |
  | `property_type` | `33` |
  | `property_initialization` | `15` |
  | `import` | `11` |
  | `type_relation` | `9` |
  | `initializer_call` | `7` |
  | `nested_type` | `5` |
  | `selector_reference` | `3` |
  | `notification` | `3` |
  | `protocol_conformance` | `2` |

- 置信度统计：

  | 置信度 | 数量 |
  | --- | ---: |
  | `unknown` | `108` |
  | `structural` | `78` |
  | `direct` | `64` |
  | `ambiguous` | `41` |
  | `runtime` | `3` |
  | `convention` | `3` |

## 七、核心调用痕迹 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 以下只展示前 `140` 条，完整结果看 `CODE_GRAPH.json`。

- `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22` -> `os_unfair_lock_lock(...)`
  - 位置：`JobsSwiftTimer.swift:23`
  - 置信度：`unknown`
  - 证据：`os_unfair_lock_lock(&lock)`
- `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22` -> `os_unfair_lock_unlock(...)`
  - 位置：`JobsSwiftTimer.swift:24`
  - 置信度：`unknown`
  - 证据：`defer { os_unfair_lock_unlock(&lock) }`
- `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22` -> `block(...)`
  - 位置：`JobsSwiftTimer.swift:25`
  - 置信度：`unknown`
  - 证据：`return try block()`
- `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73` -> `thread(...)`
  - 位置：`JobsSwiftTimer.swift:76`
  - 置信度：`unknown`
  - 证据：`"JobsTimer: \(reason) must be called on main thread (RunLoop/DisplayLink are thread-affine)."`
- `swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81` -> `RunLoop.main(...)`
  - 位置：`JobsSwiftTimer.swift:84`
  - 置信度：`unknown`
  - 证据：`"JobsTimer: kind=\(kind) currently only supports RunLoop.main (RunLoop APIs are thread-affine)."`
- `swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81` -> `main(...)`
  - 位置：`JobsSwiftTimer.swift:84`
  - 置信度：`unknown`
  - 证据：`"JobsTimer: kind=\(kind) currently only supports RunLoop.main (RunLoop APIs are thread-affine)."`
- `swift:init:JobsTimer.init(...)@JobsSwiftTimer.swift:88` -> `swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81`
  - 位置：`JobsSwiftTimer.swift:98`
  - 置信度：`direct`
  - 证据：`requireMainRunLoopForNonGCD()`
- `swift:init:JobsTimer.init(...)@JobsSwiftTimer.swift:88` -> `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448`
  - 位置：`JobsSwiftTimer.swift:102`
  - 置信度：`direct`
  - 证据：`setupAppStateIfNeeded()`
- `swift:deinit:JobsTimer.deinit@JobsSwiftTimer.swift:105` -> `stop(...)`
  - 位置：`JobsSwiftTimer.swift:106`
  - 置信度：`ambiguous`
  - 证据：`stop()`
- `swift:deinit:JobsTimer.deinit@JobsSwiftTimer.swift:105` -> `swift:func:JobsTimer.teardownAppState(...)@JobsSwiftTimer.swift:466`
  - 位置：`JobsSwiftTimer.swift:107`
  - 置信度：`direct`
  - 证据：`teardownAppState()`
- `swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112` -> `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73`
  - 位置：`JobsSwiftTimer.swift:113`
  - 置信度：`direct`
  - 证据：`if kind != .gcd { requireMainThreadForRunLoopAPI("start") }`
- `swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:115`
  - 置信度：`direct`
  - 证据：`let token = stateLock.jobs_withLock { () -> UInt64? in`
- `swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112` -> `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318`
  - 位置：`JobsSwiftTimer.swift:131`
  - 置信度：`direct`
  - 证据：`startGCD(token: token)`
- `swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112` -> `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368`
  - 位置：`JobsSwiftTimer.swift:133`
  - 置信度：`direct`
  - 证据：`startFoundationTimer(token: token)`
- `swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112` -> `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380`
  - 位置：`JobsSwiftTimer.swift:135`
  - 置信度：`direct`
  - 证据：`startDisplayLink(token: token)`
- `swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112` -> `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401`
  - 位置：`JobsSwiftTimer.swift:137`
  - 置信度：`direct`
  - 证据：`startRunLoopTimer(token: token)`
- `swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142` -> `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73`
  - 位置：`JobsSwiftTimer.swift:143`
  - 置信度：`direct`
  - 证据：`if kind != .gcd { requireMainThreadForRunLoopAPI("pause") }`
- `swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:145`
  - 置信度：`direct`
  - 证据：`let shouldPause = stateLock.jobs_withLock { () -> Bool in`
- `swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142` -> `swift:func:JobsTimer.pauseGCD(...)@JobsSwiftTimer.swift:336`
  - 位置：`JobsSwiftTimer.swift:155`
  - 置信度：`direct`
  - 证据：`pauseGCD()`
- `swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142` -> `invalidate(...)`
  - 位置：`JobsSwiftTimer.swift:157`
  - 置信度：`unknown`
  - 证据：`foundationTimer?.invalidate()`
- `swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142` -> `invalidate(...)`
  - 位置：`JobsSwiftTimer.swift:160`
  - 置信度：`unknown`
  - 证据：`displayLink?.invalidate()`
- `swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142` -> `CFRunLoopTimerInvalidate(...)`
  - 位置：`JobsSwiftTimer.swift:164`
  - 置信度：`unknown`
  - 证据：`CFRunLoopTimerInvalidate(t)`
- `swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171` -> `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73`
  - 位置：`JobsSwiftTimer.swift:172`
  - 置信度：`direct`
  - 证据：`if kind != .gcd { requireMainThreadForRunLoopAPI("resume") }`
- `swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:174`
  - 置信度：`direct`
  - 证据：`let token = stateLock.jobs_withLock { () -> UInt64? in`
- `swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171` -> `swift:func:JobsTimer.resumeGCD(...)@JobsSwiftTimer.swift:345`
  - 位置：`JobsSwiftTimer.swift:184`
  - 置信度：`direct`
  - 证据：`resumeGCD()`
- `swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171` -> `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368`
  - 位置：`JobsSwiftTimer.swift:186`
  - 置信度：`direct`
  - 证据：`startFoundationTimer(token: token)`
- `swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171` -> `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380`
  - 位置：`JobsSwiftTimer.swift:188`
  - 置信度：`direct`
  - 证据：`startDisplayLink(token: token)`
- `swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171` -> `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401`
  - 位置：`JobsSwiftTimer.swift:190`
  - 置信度：`direct`
  - 证据：`startRunLoopTimer(token: token)`
- `swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195` -> `Thread.isMainThread(...)`
  - 位置：`JobsSwiftTimer.swift:197`
  - 置信度：`unknown`
  - 证据：`if kind != .gcd, !Thread.isMainThread {`
- `swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195` -> `fireOnce(...)`
  - 位置：`JobsSwiftTimer.swift:199`
  - 置信度：`ambiguous`
  - 证据：`_ = self?.fireOnce()`
- `swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:204`
  - 置信度：`direct`
  - 证据：`let (shouldStop, finish) = stateLock.jobs_withLock { () -> (Bool, JobsTimerCallback?) in`
- `swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195` -> `swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249`
  - 位置：`JobsSwiftTimer.swift:212`
  - 置信度：`direct`
  - 证据：`stopInternal()`
- `swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195` -> `finish(...)`
  - 位置：`JobsSwiftTimer.swift:215`
  - 置信度：`unknown`
  - 证据：`config.queue.async { finish() }`
- `swift:func:JobsTimer.stop(...)@JobsSwiftTimer.swift:220` -> `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73`
  - 位置：`JobsSwiftTimer.swift:223`
  - 置信度：`direct`
  - 证据：`requireMainThreadForRunLoopAPI("stop")`
- `swift:func:JobsTimer.stop(...)@JobsSwiftTimer.swift:220` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:226`
  - 置信度：`direct`
  - 证据：`let shouldStop = stateLock.jobs_withLock { () -> Bool in`
- `swift:func:JobsTimer.stop(...)@JobsSwiftTimer.swift:220` -> `swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249`
  - 位置：`JobsSwiftTimer.swift:233`
  - 置信度：`direct`
  - 证据：`stopInternal()`
- `swift:func:JobsTimer.onTick(...)@JobsSwiftTimer.swift:238` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:239`
  - 置信度：`direct`
  - 证据：`stateLock.jobs_withLock { tickBlock = block }`
- `swift:func:JobsTimer.onFinish(...)@JobsSwiftTimer.swift:244` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:245`
  - 置信度：`direct`
  - 证据：`stateLock.jobs_withLock { finishBlock = block }`
- `swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249` -> `swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353`
  - 位置：`JobsSwiftTimer.swift:252`
  - 置信度：`direct`
  - 证据：`stopGCDSafely()`
- `swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249` -> `invalidate(...)`
  - 位置：`JobsSwiftTimer.swift:254`
  - 置信度：`unknown`
  - 证据：`foundationTimer?.invalidate()`
- `swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249` -> `invalidate(...)`
  - 位置：`JobsSwiftTimer.swift:257`
  - 置信度：`unknown`
  - 证据：`displayLink?.invalidate()`
- `swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249` -> `CFRunLoopTimerInvalidate(...)`
  - 位置：`JobsSwiftTimer.swift:261`
  - 置信度：`unknown`
  - 证据：`CFRunLoopTimerInvalidate(t)`
- `swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:271`
  - 置信度：`direct`
  - 证据：`stateLock.jobs_withLock {`
- `swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267` -> `swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249`
  - 位置：`JobsSwiftTimer.swift:277`
  - 置信度：`direct`
  - 证据：`stopInternal()`
- `swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267` -> `Thread.isMainThread(...)`
  - 位置：`JobsSwiftTimer.swift:281`
  - 置信度：`unknown`
  - 证据：`if Thread.isMainThread {`
- `swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267` -> `stop(...)`
  - 位置：`JobsSwiftTimer.swift:282`
  - 置信度：`ambiguous`
  - 证据：`stop()`
- `swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267` -> `stop(...)`
  - 位置：`JobsSwiftTimer.swift:285`
  - 置信度：`ambiguous`
  - 证据：`self?.stop()`
- `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:291`
  - 置信度：`direct`
  - 证据：`let snapshot = stateLock.jobs_withLock { () -> (shouldFire: Bool,`
- `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290` -> `swift:func:JobsTimer.DisplayLinkProxy.tick(...)@JobsSwiftTimer.swift:398`
  - 位置：`JobsSwiftTimer.swift:305`
  - 置信度：`direct`
  - 证据：`snapshot.tick()`
- `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290` -> `swift:func:JobsTimer.DisplayLinkProxy.tick(...)@JobsSwiftTimer.swift:398`
  - 位置：`JobsSwiftTimer.swift:305`
  - 置信度：`direct`
  - 证据：`snapshot.tick()`
- `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290` -> `snapshot.repeats(...)`
  - 位置：`JobsSwiftTimer.swift:308`
  - 置信度：`unknown`
  - 证据：`if !snapshot.repeats {`
- `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290` -> `swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267`
  - 位置：`JobsSwiftTimer.swift:310`
  - 置信度：`direct`
  - 证据：`routeStopIfNeededFromCallback()`
- `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290` -> `snapshot.finish(...)`
  - 位置：`JobsSwiftTimer.swift:312`
  - 置信度：`unknown`
  - 证据：`if let finish = snapshot.finish {`
- `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290` -> `finish(...)`
  - 位置：`JobsSwiftTimer.swift:313`
  - 置信度：`unknown`
  - 证据：`config.queue.async { finish() }`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353`
  - 位置：`JobsSwiftTimer.swift:320`
  - 置信度：`direct`
  - 证据：`stopGCDSafely()`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `DispatchSource.makeTimerSource(...)`
  - 位置：`JobsSwiftTimer.swift:322`
  - 置信度：`unknown`
  - 证据：`let t = DispatchSource.makeTimerSource(queue: config.queue)`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `makeTimerSource(...)`
  - 位置：`JobsSwiftTimer.swift:322`
  - 置信度：`unknown`
  - 证据：`let t = DispatchSource.makeTimerSource(queue: config.queue)`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `t.schedule(...)`
  - 位置：`JobsSwiftTimer.swift:323`
  - 置信度：`unknown`
  - 证据：`t.schedule(`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `schedule(...)`
  - 位置：`JobsSwiftTimer.swift:323`
  - 置信度：`unknown`
  - 证据：`t.schedule(`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `now(...)`
  - 位置：`JobsSwiftTimer.swift:324`
  - 置信度：`unknown`
  - 证据：`deadline: .now() + config.interval,`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `milliseconds(...)`
  - 位置：`JobsSwiftTimer.swift:326`
  - 置信度：`unknown`
  - 证据：`leeway: .milliseconds(Int(config.tolerance * 1000.0))`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `Int(...)`
  - 位置：`JobsSwiftTimer.swift:326`
  - 置信度：`unknown`
  - 证据：`leeway: .milliseconds(Int(config.tolerance * 1000.0))`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `t.setEventHandler(...)`
  - 位置：`JobsSwiftTimer.swift:328`
  - 置信度：`unknown`
  - 证据：`t.setEventHandler { [weak self] in`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290`
  - 位置：`JobsSwiftTimer.swift:329`
  - 置信度：`direct`
  - 证据：`self?.fireTickIfValid(token: token)`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `t.resume(...)`
  - 位置：`JobsSwiftTimer.swift:333`
  - 置信度：`ambiguous`
  - 证据：`t.resume()`
- `swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318` -> `resume(...)`
  - 位置：`JobsSwiftTimer.swift:333`
  - 置信度：`ambiguous`
  - 证据：`t.resume()`
- `swift:func:JobsTimer.pauseGCD(...)@JobsSwiftTimer.swift:336` -> `t.suspend(...)`
  - 位置：`JobsSwiftTimer.swift:341`
  - 置信度：`unknown`
  - 证据：`t.suspend()`
- `swift:func:JobsTimer.pauseGCD(...)@JobsSwiftTimer.swift:336` -> `suspend(...)`
  - 位置：`JobsSwiftTimer.swift:341`
  - 置信度：`unknown`
  - 证据：`t.suspend()`
- `swift:func:JobsTimer.resumeGCD(...)@JobsSwiftTimer.swift:345` -> `t.resume(...)`
  - 位置：`JobsSwiftTimer.swift:349`
  - 置信度：`ambiguous`
  - 证据：`t.resume()`
- `swift:func:JobsTimer.resumeGCD(...)@JobsSwiftTimer.swift:345` -> `resume(...)`
  - 位置：`JobsSwiftTimer.swift:349`
  - 置信度：`ambiguous`
  - 证据：`t.resume()`
- `swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353` -> `t.resume(...)`
  - 位置：`JobsSwiftTimer.swift:359`
  - 置信度：`ambiguous`
  - 证据：`t.resume()`
- `swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353` -> `resume(...)`
  - 位置：`JobsSwiftTimer.swift:359`
  - 置信度：`ambiguous`
  - 证据：`t.resume()`
- `swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353` -> `t.setEventHandler(...)`
  - 位置：`JobsSwiftTimer.swift:362`
  - 置信度：`unknown`
  - 证据：`t.setEventHandler {}`
- `swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353` -> `swift:func:JobsSwiftTimerCountdown.cancel(...)@JobsSwiftTimerCountdown.swift:163`
  - 位置：`JobsSwiftTimer.swift:363`
  - 置信度：`direct`
  - 证据：`t.cancel()`
- `swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353` -> `swift:func:JobsSwiftTimerCountdown.cancel(...)@JobsSwiftTimerCountdown.swift:163`
  - 位置：`JobsSwiftTimer.swift:363`
  - 置信度：`direct`
  - 证据：`t.cancel()`
- `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368` -> `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73`
  - 位置：`JobsSwiftTimer.swift:369`
  - 置信度：`direct`
  - 证据：`requireMainThreadForRunLoopAPI("startFoundationTimer")`
- `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368` -> `swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81`
  - 位置：`JobsSwiftTimer.swift:370`
  - 置信度：`direct`
  - 证据：`requireMainRunLoopForNonGCD()`
- `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368` -> `Timer(...)`
  - 位置：`JobsSwiftTimer.swift:372`
  - 置信度：`unknown`
  - 证据：`let t = Timer(timeInterval: config.interval, repeats: config.repeats) { [weak self] _ in`
- `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368` -> `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290`
  - 位置：`JobsSwiftTimer.swift:373`
  - 置信度：`direct`
  - 证据：`self?.fireTickIfValid(token: token)`
- `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368` -> `runLoop.add(...)`
  - 位置：`JobsSwiftTimer.swift:376`
  - 置信度：`unknown`
  - 证据：`config.runLoop.add(t, forMode: config.runLoopMode)`
- `swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368` -> `add(...)`
  - 位置：`JobsSwiftTimer.swift:376`
  - 置信度：`unknown`
  - 证据：`config.runLoop.add(t, forMode: config.runLoopMode)`
- `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73`
  - 位置：`JobsSwiftTimer.swift:381`
  - 置信度：`direct`
  - 证据：`requireMainThreadForRunLoopAPI("startDisplayLink")`
- `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81`
  - 位置：`JobsSwiftTimer.swift:382`
  - 置信度：`direct`
  - 证据：`requireMainRunLoopForNonGCD()`
- `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290`
  - 位置：`JobsSwiftTimer.swift:385`
  - 置信度：`direct`
  - 证据：`self?.fireTickIfValid(token: token)`
- `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `CADisplayLink(...)`
  - 位置：`JobsSwiftTimer.swift:388`
  - 置信度：`unknown`
  - 证据：`let link = CADisplayLink(target: proxy, selector: #selector(DisplayLinkProxy.tick))`
- `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `selector(...)`
  - 位置：`JobsSwiftTimer.swift:388`
  - 置信度：`unknown`
  - 证据：`let link = CADisplayLink(target: proxy, selector: #selector(DisplayLinkProxy.tick))`
- `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `link.add(...)`
  - 位置：`JobsSwiftTimer.swift:389`
  - 置信度：`unknown`
  - 证据：`link.add(to: config.runLoop, forMode: config.runLoopMode)`
- `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `add(...)`
  - 位置：`JobsSwiftTimer.swift:389`
  - 置信度：`unknown`
  - 证据：`link.add(to: config.runLoop, forMode: config.runLoopMode)`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73`
  - 位置：`JobsSwiftTimer.swift:402`
  - 置信度：`direct`
  - 证据：`requireMainThreadForRunLoopAPI("startRunLoopTimer")`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81`
  - 位置：`JobsSwiftTimer.swift:403`
  - 置信度：`direct`
  - 证据：`requireMainRunLoopForNonGCD()`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `Unmanaged.passUnretained(...)`
  - 位置：`JobsSwiftTimer.swift:405`
  - 置信度：`unknown`
  - 证据：`let context = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `UnsafeMutableRawPointer(...)`
  - 位置：`JobsSwiftTimer.swift:405`
  - 置信度：`unknown`
  - 证据：`let context = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `passUnretained(...)`
  - 位置：`JobsSwiftTimer.swift:405`
  - 置信度：`unknown`
  - 证据：`let context = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `toOpaque(...)`
  - 位置：`JobsSwiftTimer.swift:405`
  - 置信度：`unknown`
  - 证据：`let context = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `CFRunLoopTimerContext(...)`
  - 位置：`JobsSwiftTimer.swift:406`
  - 置信度：`unknown`
  - 证据：`var ctx = CFRunLoopTimerContext(`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `CFAbsoluteTimeGetCurrent(...)`
  - 位置：`JobsSwiftTimer.swift:414`
  - 置信度：`unknown`
  - 证据：`let nextFire = CFAbsoluteTimeGetCurrent() + config.interval`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `CFRunLoopTimerCreate(...)`
  - 位置：`JobsSwiftTimer.swift:417`
  - 置信度：`unknown`
  - 证据：`let timer = CFRunLoopTimerCreate(`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `fromOpaque(...)`
  - 位置：`JobsSwiftTimer.swift:425`
  - 置信度：`unknown`
  - 证据：`let timerObj = Unmanaged<JobsTimer>.fromOpaque(info).takeUnretainedValue()`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `takeUnretainedValue(...)`
  - 位置：`JobsSwiftTimer.swift:425`
  - 置信度：`unknown`
  - 证据：`let timerObj = Unmanaged<JobsTimer>.fromOpaque(info).takeUnretainedValue()`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:426`
  - 置信度：`direct`
  - 证据：`let token = timerObj.stateLock.jobs_withLock { timerObj.generation }`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290`
  - 位置：`JobsSwiftTimer.swift:427`
  - 置信度：`direct`
  - 证据：`timerObj.fireTickIfValid(token: token)`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290`
  - 位置：`JobsSwiftTimer.swift:427`
  - 置信度：`direct`
  - 证据：`timerObj.fireTickIfValid(token: token)`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `runLoop.getCFRunLoop(...)`
  - 位置：`JobsSwiftTimer.swift:432`
  - 置信度：`unknown`
  - 证据：`let cfRunLoop = config.runLoop.getCFRunLoop()`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `getCFRunLoop(...)`
  - 位置：`JobsSwiftTimer.swift:432`
  - 置信度：`unknown`
  - 证据：`let cfRunLoop = config.runLoop.getCFRunLoop()`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `CFRunLoopMode(...)`
  - 位置：`JobsSwiftTimer.swift:435`
  - 置信度：`unknown`
  - 证据：`: CFRunLoopMode(config.runLoopMode.rawValue as CFString)`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `CFRunLoopAddTimer(...)`
  - 位置：`JobsSwiftTimer.swift:437`
  - 置信度：`unknown`
  - 证据：`CFRunLoopAddTimer(cfRunLoop, timer, cfMode)`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22`
  - 位置：`JobsSwiftTimer.swift:439`
  - 置信度：`direct`
  - 证据：`stateLock.jobs_withLock { rlTimer = timer }`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `canImport(...)`
  - 位置：`JobsSwiftTimer.swift:441`
  - 置信度：`unknown`
  - 证据：`#if canImport(UIKit)`
- `swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401` -> `swift:func:JobsAppStateManager.syncWithCurrentAppStateIfNeeded(...)@JobsSwiftTimer.swift:494`
  - 位置：`JobsSwiftTimer.swift:442`
  - 置信度：`direct`
  - 证据：`appState?.syncWithCurrentAppStateIfNeeded()`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `canImport(...)`
  - 位置：`JobsSwiftTimer.swift:449`
  - 置信度：`unknown`
  - 证据：`#if canImport(UIKit)`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `JobsAppStateManager(...)`
  - 位置：`JobsSwiftTimer.swift:452`
  - 置信度：`unknown`
  - 证据：`appState = JobsAppStateManager(`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `self.pause(...)`
  - 位置：`JobsSwiftTimer.swift:457`
  - 置信度：`ambiguous`
  - 证据：`case .pause: self.pause()`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `pause(...)`
  - 位置：`JobsSwiftTimer.swift:457`
  - 置信度：`ambiguous`
  - 证据：`case .pause: self.pause()`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `self.resume(...)`
  - 位置：`JobsSwiftTimer.swift:458`
  - 置信度：`ambiguous`
  - 证据：`case .resume: self.resume()`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `resume(...)`
  - 位置：`JobsSwiftTimer.swift:458`
  - 置信度：`ambiguous`
  - 证据：`case .resume: self.resume()`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `self.stop(...)`
  - 位置：`JobsSwiftTimer.swift:459`
  - 置信度：`ambiguous`
  - 证据：`case .stop: self.stop()`
- `swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448` -> `stop(...)`
  - 位置：`JobsSwiftTimer.swift:459`
  - 置信度：`ambiguous`
  - 证据：`case .stop: self.stop()`
- `swift:func:JobsTimer.teardownAppState(...)@JobsSwiftTimer.swift:466` -> `canImport(...)`
  - 位置：`JobsSwiftTimer.swift:467`
  - 置信度：`unknown`
  - 证据：`#if canImport(UIKit)`
- `swift:init:JobsAppStateManager.init(...)@JobsSwiftTimer.swift:483` -> `Sendable(...)`
  - 位置：`JobsSwiftTimer.swift:485`
  - 置信度：`unknown`
  - 证据：`action: @escaping @Sendable (JobsAppStateAction) -> Void`
- `swift:init:JobsAppStateManager.init(...)@JobsSwiftTimer.swift:483` -> `register(...)`
  - 位置：`JobsSwiftTimer.swift:489`
  - 置信度：`ambiguous`
  - 证据：`register()`
- `swift:func:JobsAppStateManager.syncWithCurrentAppStateIfNeeded(...)@JobsSwiftTimer.swift:494` -> `canImport(...)`
  - 位置：`JobsSwiftTimer.swift:495`
  - 置信度：`unknown`
  - 证据：`#if canImport(UIKit)`
- `swift:func:JobsAppStateManager.syncWithCurrentAppStateIfNeeded(...)@JobsSwiftTimer.swift:494` -> `action(...)`
  - 位置：`JobsSwiftTimer.swift:498`
  - 置信度：`unknown`
  - 证据：`if pauseInBackground { action(.pause) }`
- `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `canImport(...)`
  - 位置：`JobsSwiftTimer.swift:504`
  - 置信度：`unknown`
  - 证据：`#if canImport(UIKit)`
- `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `default.addObserver(...)`
  - 位置：`JobsSwiftTimer.swift:505`
  - 置信度：`unknown`
  - 证据：`NotificationCenter.default.addObserver(`
- `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `addObserver(...)`
  - 位置：`JobsSwiftTimer.swift:505`
  - 置信度：`unknown`
  - 证据：`NotificationCenter.default.addObserver(`
- `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `selector(...)`
  - 位置：`JobsSwiftTimer.swift:507`
  - 置信度：`unknown`
  - 证据：`selector: #selector(onDidEnterBackground),`
- `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `default.addObserver(...)`
  - 位置：`JobsSwiftTimer.swift:511`
  - 置信度：`unknown`
  - 证据：`NotificationCenter.default.addObserver(`
- `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `addObserver(...)`
  - 位置：`JobsSwiftTimer.swift:511`
  - 置信度：`unknown`
  - 证据：`NotificationCenter.default.addObserver(`
- `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `selector(...)`
  - 位置：`JobsSwiftTimer.swift:513`
  - 置信度：`unknown`
  - 证据：`selector: #selector(onWillEnterForeground),`
- `swift:func:JobsAppStateManager.unregister(...)@JobsSwiftTimer.swift:520` -> `canImport(...)`
  - 位置：`JobsSwiftTimer.swift:521`
  - 置信度：`unknown`
  - 证据：`#if canImport(UIKit)`
- `swift:func:JobsAppStateManager.unregister(...)@JobsSwiftTimer.swift:520` -> `default.removeObserver(...)`
  - 位置：`JobsSwiftTimer.swift:522`
  - 置信度：`unknown`
  - 证据：`NotificationCenter.default.removeObserver(self)`
- `swift:func:JobsAppStateManager.unregister(...)@JobsSwiftTimer.swift:520` -> `removeObserver(...)`
  - 位置：`JobsSwiftTimer.swift:522`
  - 置信度：`unknown`
  - 证据：`NotificationCenter.default.removeObserver(self)`
- `swift:func:JobsAppStateManager.onDidEnterBackground(...)@JobsSwiftTimer.swift:526` -> `action(...)`
  - 位置：`JobsSwiftTimer.swift:527`
  - 置信度：`unknown`
  - 证据：`if pauseInBackground { action(.pause) }`
- `swift:func:JobsAppStateManager.onWillEnterForeground(...)@JobsSwiftTimer.swift:530` -> `action(...)`
  - 位置：`JobsSwiftTimer.swift:531`
  - 置信度：`unknown`
  - 证据：`if pauseInBackground { action(.resume) }`
- `swift:deinit:JobsSwiftTimerCountdown.deinit@JobsSwiftTimerCountdown.swift:12` -> `swift:func:JobsSwiftTimerCountdown.cancel(...)@JobsSwiftTimerCountdown.swift:163`
  - 位置：`JobsSwiftTimerCountdown.swift:13`
  - 置信度：`direct`
  - 证据：`cancel()`
- `swift:init:JobsSwiftTimerCountdown.init(...)@JobsSwiftTimerCountdown.swift:98` -> `swift:struct:JobsSwiftTimerCountdown.Snapshot@JobsSwiftTimerCountdown.swift:21`
  - 位置：`JobsSwiftTimerCountdown.swift:104`
  - 置信度：`structural`
  - 证据：`self.snapshot = Snapshot(total: total, elapsed: 0)`
- `swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113` -> `swift:func:JobsSwiftTimerCountdown.resetInternal(...)@JobsSwiftTimerCountdown.swift:176`
  - 位置：`JobsSwiftTimerCountdown.swift:116`
  - 置信度：`direct`
  - 证据：`resetInternal()`
- `swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113` -> `Date(...)`
  - 位置：`JobsSwiftTimerCountdown.swift:125`
  - 置信度：`unknown`
  - 证据：`startDate = Date()`
- `swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113` -> `swift:init:JobsSwiftTimerConfig.init(...)@JobsSwiftTimerConfig.swift:29`
  - 位置：`JobsSwiftTimerCountdown.swift:128`
  - 置信度：`direct`
  - 证据：`let config = JobsSwiftTimerConfig(`
- `swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113` -> `swift:init:JobsTimer.init(...)@JobsSwiftTimer.swift:88`
  - 位置：`JobsSwiftTimerCountdown.swift:135`
  - 置信度：`direct`
  - 证据：`let t = JobsTimer(kind: kind, config: config) { [weak self] in`

## 八、工程依赖痕迹 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- `JobsSwiftTimer.podspec`
  - 类型：`podspec`
  - Pod 名：`JobsSwiftTimer`
  - Swift：`5.0`

## 九、Mermaid 图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 零部件流程图：

  ```mermaid
  graph LR
    component_JobsTimer["JobsTimer"] -->|protocol_conformance| component_JobsSwiftTimerProtocol["JobsSwiftTimerProtocol"]
    component_JobsTimer_State["JobsTimer.State"] -->|nested_type| component_JobsTimer["JobsTimer"]
    component_JobsTimer["JobsTimer"] -->|property_type| component_JobsTimerKind["JobsTimerKind"]
    component_JobsTimer["JobsTimer"] -->|property_type| component_JobsSwiftTimerConfig["JobsSwiftTimerConfig"]
    component_JobsTimer["JobsTimer"] -->|property_initialization| component_JobsUnfairLock["JobsUnfairLock"]
    component_JobsTimer["JobsTimer"] -->|property_type| component_JobsAppStateManager["JobsAppStateManager"]
    component_JobsTimer_DisplayLinkProxy["JobsTimer.DisplayLinkProxy"] -->|nested_type| component_JobsTimer["JobsTimer"]
    component_JobsAppStateManager["JobsAppStateManager"] -->|property_type| component_JobsAppStateAction["JobsAppStateAction"]
    component_JobsSwiftTimerCountdown_Snapshot["JobsSwiftTimerCountdown.Snapshot"] -->|nested_type| component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    component_JobsSwiftTimerCountdown_Snapshot_Mode["JobsSwiftTimerCountdown.Snapshot.Mode"] -->|nested_type| component_JobsSwiftTimerCountdown_Snapshot["JobsSwiftTimerCountdown.Snapshot"]
    component_JobsSwiftTimerCountdown_State["JobsSwiftTimerCountdown.State"] -->|nested_type| component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] -->|property_type| component_JobsTimerKind["JobsTimerKind"]
    component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] -->|property_type| component_JobsSwiftTimerProtocol["JobsSwiftTimerProtocol"]
    component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] -->|property_initialization| component_JobsSwiftTimerConfig["JobsSwiftTimerConfig"]
    component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] -->|property_initialization| component_JobsTimer["JobsTimer"]
    component_extension_JobsSwiftTimerCountdown["extension JobsSwiftTimerCountdown"] -->|property_initialization| component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    component_JobsSwiftTimerManager["JobsSwiftTimerManager"] -->|property_type| component_JobsSwiftTimerProtocol["JobsSwiftTimerProtocol"]
    component_JobsSwiftTimerManager["JobsSwiftTimerManager"] -->|property_type| component_JobsTimerDedupPolicy["JobsTimerDedupPolicy"]
    component_JobsSwiftTimerManager["JobsSwiftTimerManager"] -->|property_initialization| component_JobsTimer["JobsTimer"]
    component_JobsTimer["JobsTimer"] -->|member_call| component_JobsUnfairLock["JobsUnfairLock"]
    component_JobsTimer["JobsTimer"] -->|member_call| component_JobsTimer_DisplayLinkProxy["JobsTimer.DisplayLinkProxy"]
    component_JobsTimer["JobsTimer"] -->|call| component_JobsTimer_DisplayLinkProxy["JobsTimer.DisplayLinkProxy"]
    component_JobsTimer["JobsTimer"] -->|member_call| component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    component_JobsTimer["JobsTimer"] -->|call| component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    component_JobsTimer["JobsTimer"] -->|call| component_JobsAppStateManager["JobsAppStateManager"]
    component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] -->|initializer_call| component_JobsSwiftTimerCountdown_Snapshot["JobsSwiftTimerCountdown.Snapshot"]
    component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] -->|initializer_call| component_JobsSwiftTimerConfig["JobsSwiftTimerConfig"]
    component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] -->|initializer_call| component_JobsTimer["JobsTimer"]
    component_extension_JobsSwiftTimerCountdown["extension JobsSwiftTimerCountdown"] -->|initializer_call| component_JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    component_JobsSwiftTimerManager["JobsSwiftTimerManager"] -->|initializer_call| component_JobsTimer["JobsTimer"]
  ```

- 模块结构图：

  ```mermaid
  graph TD
    JobsSwiftTimer_swift["JobsSwiftTimer.swift"] --> AppKit["AppKit"]
    JobsSwiftTimer_swift["JobsSwiftTimer.swift"] --> UIKit["UIKit"]
    JobsSwiftTimer_swift["JobsSwiftTimer.swift"] --> QuartzCore["QuartzCore"]
    JobsSwiftTimer_swift["JobsSwiftTimer.swift"] --> os_lock["os.lock"]
    JobsTimer["JobsTimer"] --> JobsSwiftTimerProtocol["JobsSwiftTimerProtocol"]
    JobsTimer_State["JobsTimer.State"] --> JobsTimer["JobsTimer"]
    JobsTimer_State["JobsTimer.State"] --> Equatable["Equatable"]
    JobsTimer["JobsTimer"] --> JobsTimerKind["JobsTimerKind"]
    JobsTimer["JobsTimer"] --> JobsSwiftTimerConfig["JobsSwiftTimerConfig"]
    JobsTimer["JobsTimer"] --> JobsUnfairLock["JobsUnfairLock"]
    JobsTimer["JobsTimer"] --> State["State"]
    JobsTimer["JobsTimer"] --> JobsTimerCallback["JobsTimerCallback"]
    JobsTimer["JobsTimer"] --> DispatchSourceTimer["DispatchSourceTimer"]
    JobsTimer["JobsTimer"] --> Timer["Timer"]
    JobsTimer["JobsTimer"] --> CADisplayLink["CADisplayLink"]
    JobsTimer["JobsTimer"] --> CFRunLoopTimer["CFRunLoopTimer"]
    JobsTimer["JobsTimer"] --> JobsAppStateManager["JobsAppStateManager"]
    JobsTimer_DisplayLinkProxy["JobsTimer.DisplayLinkProxy"] --> JobsTimer["JobsTimer"]
    JobsTimer_DisplayLinkProxy["JobsTimer.DisplayLinkProxy"] --> NSObject["NSObject"]
    JobsTimer_DisplayLinkProxy["JobsTimer.DisplayLinkProxy"] --> JobsTimerCallback["JobsTimerCallback"]
    JobsTimer["JobsTimer"] --> UnsafeMutableRawPointer["UnsafeMutableRawPointer"]
    JobsTimer["JobsTimer"] --> CFRunLoopTimerContext["CFRunLoopTimerContext"]
    JobsTimer["JobsTimer"] --> CFAbsoluteTimeGetCurrent["CFAbsoluteTimeGetCurrent"]
    JobsTimer["JobsTimer"] --> CFRunLoopTimerCreate["CFRunLoopTimerCreate"]
    JobsTimer["JobsTimer"] --> CFRunLoopMode["CFRunLoopMode"]
    JobsAppStateManager["JobsAppStateManager"] --> Sendable["Sendable"]
    JobsAppStateManager["JobsAppStateManager"] --> JobsAppStateAction["JobsAppStateAction"]
    JobsSwiftTimerConfig_swift["JobsSwiftTimerConfig.swift"] --> AppKit["AppKit"]
    JobsSwiftTimerConfig_swift["JobsSwiftTimerConfig.swift"] --> UIKit["UIKit"]
    JobsSwiftTimerConfig_swift["JobsSwiftTimerConfig.swift"] --> ObjectiveC["ObjectiveC"]
    JobsSwiftTimerConfig["JobsSwiftTimerConfig"] --> Timer["Timer"]
    JobsSwiftTimerConfig["JobsSwiftTimerConfig"] --> GCD["GCD"]
    JobsSwiftTimerConfig["JobsSwiftTimerConfig"] --> DispatchQueue["DispatchQueue"]
    JobsSwiftTimerConfig["JobsSwiftTimerConfig"] --> RunLoop["RunLoop"]
    JobsSwiftTimerConfig["JobsSwiftTimerConfig"] --> Mode["Mode"]
    JobsSwiftTimerConfig["JobsSwiftTimerConfig"] --> UIKit["UIKit"]
    JobsSwiftTimerCountdown_swift["JobsSwiftTimerCountdown.swift"] --> Foundation["Foundation"]
    JobsSwiftTimerCountdown_Snapshot["JobsSwiftTimerCountdown.Snapshot"] --> JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    JobsSwiftTimerCountdown_Snapshot_Mode["JobsSwiftTimerCountdown.Snapshot.Mode"] --> JobsSwiftTimerCountdown_Snapshot["JobsSwiftTimerCountdown.Snapshot"]
    JobsSwiftTimerCountdown_State["JobsSwiftTimerCountdown.State"] --> JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] --> Snapshot["Snapshot"]
    JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] --> JobsTimerKind["JobsTimerKind"]
    JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] --> DispatchQueue["DispatchQueue"]
    JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] --> JobsSwiftTimerProtocol["JobsSwiftTimerProtocol"]
    JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] --> Date["Date"]
    JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] --> JobsSwiftTimerConfig["JobsSwiftTimerConfig"]
    JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"] --> JobsTimer["JobsTimer"]
    extension_JobsSwiftTimerCountdown["extension JobsSwiftTimerCountdown"] --> JobsSwiftTimerCountdown["JobsSwiftTimerCountdown"]
    TimerState["TimerState"] --> Int["Int"]
    TimerState["TimerState"] --> Sendable["Sendable"]
    _TimerMode["_TimerMode"] --> Sendable["Sendable"]
    JobsSwiftTimerManagerError["JobsSwiftTimerManagerError"] --> Error["Error"]
    JobsSwiftTimerManagerAction["JobsSwiftTimerManagerAction"] --> Sendable["Sendable"]
    JobsTimerDedupPolicy["JobsTimerDedupPolicy"] --> Sendable["Sendable"]
    JobsTimerKind["JobsTimerKind"] --> Sendable["Sendable"]
    JobsSwiftTimerManager_swift["JobsSwiftTimerManager.swift"] --> AppKit["AppKit"]
    JobsSwiftTimerManager_swift["JobsSwiftTimerManager.swift"] --> UIKit["UIKit"]
    JobsSwiftTimerManager["JobsSwiftTimerManager"] --> JobsSwiftTimerManager["JobsSwiftTimerManager"]
    JobsSwiftTimerManager["JobsSwiftTimerManager"] --> NSLock["NSLock"]
    JobsSwiftTimerManager["JobsSwiftTimerManager"] --> JobsSwiftTimerProtocol["JobsSwiftTimerProtocol"]
    JobsSwiftTimerManager["JobsSwiftTimerManager"] --> JobsTimerDedupPolicy["JobsTimerDedupPolicy"]
    JobsSwiftTimerManager["JobsSwiftTimerManager"] --> JobsTimer["JobsTimer"]
    JobsSwiftTimerProtocol_swift["JobsSwiftTimerProtocol.swift"] --> Foundation["Foundation"]
    _file_scope_["(file-scope)"] --> JobsTimer["JobsTimer"]
    JobsSwiftTimerProtocol["JobsSwiftTimerProtocol"] --> AnyObject["AnyObject"]
  ```

- 调用痕迹图：

  ```mermaid
  graph TD
    swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"] --> os_unfair_lock_lock_____["os_unfair_lock_lock(...)"]
    swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"] --> os_unfair_lock_unlock_____["os_unfair_lock_unlock(...)"]
    swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"] --> block_____["block(...)"]
    swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"] --> thread_____["thread(...)"]
    swift_func_JobsTimer_requireMainRunLoopForNonGCD______JobsSwiftTimer_swift_81["swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81"] --> RunLoop_main_____["RunLoop.main(...)"]
    swift_func_JobsTimer_requireMainRunLoopForNonGCD______JobsSwiftTimer_swift_81["swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81"] --> main_____["main(...)"]
    swift_init_JobsTimer_init______JobsSwiftTimer_swift_88["swift:init:JobsTimer.init(...)@JobsSwiftTimer.swift:88"] --> swift_func_JobsTimer_requireMainRunLoopForNonGCD______JobsSwiftTimer_swift_81["swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81"]
    swift_init_JobsTimer_init______JobsSwiftTimer_swift_88["swift:init:JobsTimer.init(...)@JobsSwiftTimer.swift:88"] --> swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"]
    swift_deinit_JobsTimer_deinit_JobsSwiftTimer_swift_105["swift:deinit:JobsTimer.deinit@JobsSwiftTimer.swift:105"] --> stop_____["stop(...)"]
    swift_deinit_JobsTimer_deinit_JobsSwiftTimer_swift_105["swift:deinit:JobsTimer.deinit@JobsSwiftTimer.swift:105"] --> swift_func_JobsTimer_teardownAppState______JobsSwiftTimer_swift_466["swift:func:JobsTimer.teardownAppState(...)@JobsSwiftTimer.swift:466"]
    swift_func_JobsTimer_start______JobsSwiftTimer_swift_112["swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112"] --> swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"]
    swift_func_JobsTimer_start______JobsSwiftTimer_swift_112["swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_start______JobsSwiftTimer_swift_112["swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112"] --> swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"]
    swift_func_JobsTimer_start______JobsSwiftTimer_swift_112["swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112"] --> swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"]
    swift_func_JobsTimer_start______JobsSwiftTimer_swift_112["swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112"] --> swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"]
    swift_func_JobsTimer_start______JobsSwiftTimer_swift_112["swift:func:JobsTimer.start(...)@JobsSwiftTimer.swift:112"] --> swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"]
    swift_func_JobsTimer_pause______JobsSwiftTimer_swift_142["swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142"] --> swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"]
    swift_func_JobsTimer_pause______JobsSwiftTimer_swift_142["swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_pause______JobsSwiftTimer_swift_142["swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142"] --> swift_func_JobsTimer_pauseGCD______JobsSwiftTimer_swift_336["swift:func:JobsTimer.pauseGCD(...)@JobsSwiftTimer.swift:336"]
    swift_func_JobsTimer_pause______JobsSwiftTimer_swift_142["swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142"] --> invalidate_____["invalidate(...)"]
    swift_func_JobsTimer_pause______JobsSwiftTimer_swift_142["swift:func:JobsTimer.pause(...)@JobsSwiftTimer.swift:142"] --> CFRunLoopTimerInvalidate_____["CFRunLoopTimerInvalidate(...)"]
    swift_func_JobsTimer_resume______JobsSwiftTimer_swift_171["swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171"] --> swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"]
    swift_func_JobsTimer_resume______JobsSwiftTimer_swift_171["swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_resume______JobsSwiftTimer_swift_171["swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171"] --> swift_func_JobsTimer_resumeGCD______JobsSwiftTimer_swift_345["swift:func:JobsTimer.resumeGCD(...)@JobsSwiftTimer.swift:345"]
    swift_func_JobsTimer_resume______JobsSwiftTimer_swift_171["swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171"] --> swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"]
    swift_func_JobsTimer_resume______JobsSwiftTimer_swift_171["swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171"] --> swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"]
    swift_func_JobsTimer_resume______JobsSwiftTimer_swift_171["swift:func:JobsTimer.resume(...)@JobsSwiftTimer.swift:171"] --> swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"]
    swift_func_JobsTimer_fireOnce______JobsSwiftTimer_swift_195["swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195"] --> Thread_isMainThread_____["Thread.isMainThread(...)"]
    swift_func_JobsTimer_fireOnce______JobsSwiftTimer_swift_195["swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195"] --> fireOnce_____["fireOnce(...)"]
    swift_func_JobsTimer_fireOnce______JobsSwiftTimer_swift_195["swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_fireOnce______JobsSwiftTimer_swift_195["swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195"] --> swift_func_JobsTimer_stopInternal______JobsSwiftTimer_swift_249["swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249"]
    swift_func_JobsTimer_fireOnce______JobsSwiftTimer_swift_195["swift:func:JobsTimer.fireOnce(...)@JobsSwiftTimer.swift:195"] --> finish_____["finish(...)"]
    swift_func_JobsTimer_stop______JobsSwiftTimer_swift_220["swift:func:JobsTimer.stop(...)@JobsSwiftTimer.swift:220"] --> swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"]
    swift_func_JobsTimer_stop______JobsSwiftTimer_swift_220["swift:func:JobsTimer.stop(...)@JobsSwiftTimer.swift:220"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_stop______JobsSwiftTimer_swift_220["swift:func:JobsTimer.stop(...)@JobsSwiftTimer.swift:220"] --> swift_func_JobsTimer_stopInternal______JobsSwiftTimer_swift_249["swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249"]
    swift_func_JobsTimer_onTick______JobsSwiftTimer_swift_238["swift:func:JobsTimer.onTick(...)@JobsSwiftTimer.swift:238"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_onFinish______JobsSwiftTimer_swift_244["swift:func:JobsTimer.onFinish(...)@JobsSwiftTimer.swift:244"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_stopInternal______JobsSwiftTimer_swift_249["swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249"] --> swift_func_JobsTimer_stopGCDSafely______JobsSwiftTimer_swift_353["swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353"]
    swift_func_JobsTimer_stopInternal______JobsSwiftTimer_swift_249["swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249"] --> invalidate_____["invalidate(...)"]
    swift_func_JobsTimer_stopInternal______JobsSwiftTimer_swift_249["swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249"] --> CFRunLoopTimerInvalidate_____["CFRunLoopTimerInvalidate(...)"]
    swift_func_JobsTimer_routeStopIfNeededFromCallback______JobsSwiftTimer_swift_267["swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_routeStopIfNeededFromCallback______JobsSwiftTimer_swift_267["swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267"] --> swift_func_JobsTimer_stopInternal______JobsSwiftTimer_swift_249["swift:func:JobsTimer.stopInternal(...)@JobsSwiftTimer.swift:249"]
    swift_func_JobsTimer_routeStopIfNeededFromCallback______JobsSwiftTimer_swift_267["swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267"] --> Thread_isMainThread_____["Thread.isMainThread(...)"]
    swift_func_JobsTimer_routeStopIfNeededFromCallback______JobsSwiftTimer_swift_267["swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267"] --> stop_____["stop(...)"]
    swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"] --> swift_func_JobsTimer_DisplayLinkProxy_tick______JobsSwiftTimer_swift_398["swift:func:JobsTimer.DisplayLinkProxy.tick(...)@JobsSwiftTimer.swift:398"]
    swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"] --> snapshot_repeats_____["snapshot.repeats(...)"]
    swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"] --> swift_func_JobsTimer_routeStopIfNeededFromCallback______JobsSwiftTimer_swift_267["swift:func:JobsTimer.routeStopIfNeededFromCallback(...)@JobsSwiftTimer.swift:267"]
    swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"] --> snapshot_finish_____["snapshot.finish(...)"]
    swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"] --> finish_____["finish(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> swift_func_JobsTimer_stopGCDSafely______JobsSwiftTimer_swift_353["swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> DispatchSource_makeTimerSource_____["DispatchSource.makeTimerSource(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> makeTimerSource_____["makeTimerSource(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> t_schedule_____["t.schedule(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> schedule_____["schedule(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> now_____["now(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> milliseconds_____["milliseconds(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> Int_____["Int(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> t_setEventHandler_____["t.setEventHandler(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> t_resume_____["t.resume(...)"]
    swift_func_JobsTimer_startGCD______JobsSwiftTimer_swift_318["swift:func:JobsTimer.startGCD(...)@JobsSwiftTimer.swift:318"] --> resume_____["resume(...)"]
    swift_func_JobsTimer_pauseGCD______JobsSwiftTimer_swift_336["swift:func:JobsTimer.pauseGCD(...)@JobsSwiftTimer.swift:336"] --> t_suspend_____["t.suspend(...)"]
    swift_func_JobsTimer_pauseGCD______JobsSwiftTimer_swift_336["swift:func:JobsTimer.pauseGCD(...)@JobsSwiftTimer.swift:336"] --> suspend_____["suspend(...)"]
    swift_func_JobsTimer_resumeGCD______JobsSwiftTimer_swift_345["swift:func:JobsTimer.resumeGCD(...)@JobsSwiftTimer.swift:345"] --> t_resume_____["t.resume(...)"]
    swift_func_JobsTimer_resumeGCD______JobsSwiftTimer_swift_345["swift:func:JobsTimer.resumeGCD(...)@JobsSwiftTimer.swift:345"] --> resume_____["resume(...)"]
    swift_func_JobsTimer_stopGCDSafely______JobsSwiftTimer_swift_353["swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353"] --> t_resume_____["t.resume(...)"]
    swift_func_JobsTimer_stopGCDSafely______JobsSwiftTimer_swift_353["swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353"] --> resume_____["resume(...)"]
    swift_func_JobsTimer_stopGCDSafely______JobsSwiftTimer_swift_353["swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353"] --> t_setEventHandler_____["t.setEventHandler(...)"]
    swift_func_JobsTimer_stopGCDSafely______JobsSwiftTimer_swift_353["swift:func:JobsTimer.stopGCDSafely(...)@JobsSwiftTimer.swift:353"] --> swift_func_JobsSwiftTimerCountdown_cancel______JobsSwiftTimerCountdown_swift_163["swift:func:JobsSwiftTimerCountdown.cancel(...)@JobsSwiftTimerCountdown.swift:163"]
    swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"] --> swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"]
    swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"] --> swift_func_JobsTimer_requireMainRunLoopForNonGCD______JobsSwiftTimer_swift_81["swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81"]
    swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"] --> Timer_____["Timer(...)"]
    swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"] --> swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"]
    swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"] --> runLoop_add_____["runLoop.add(...)"]
    swift_func_JobsTimer_startFoundationTimer______JobsSwiftTimer_swift_368["swift:func:JobsTimer.startFoundationTimer(...)@JobsSwiftTimer.swift:368"] --> add_____["add(...)"]
    swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"] --> swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"]
    swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"] --> swift_func_JobsTimer_requireMainRunLoopForNonGCD______JobsSwiftTimer_swift_81["swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81"]
    swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"] --> swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"]
    swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"] --> CADisplayLink_____["CADisplayLink(...)"]
    swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"] --> selector_____["selector(...)"]
    swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"] --> link_add_____["link.add(...)"]
    swift_func_JobsTimer_startDisplayLink______JobsSwiftTimer_swift_380["swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380"] --> add_____["add(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> swift_func_JobsTimer_requireMainThreadForRunLoopAPI______JobsSwiftTimer_swift_73["swift:func:JobsTimer.requireMainThreadForRunLoopAPI(...)@JobsSwiftTimer.swift:73"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> swift_func_JobsTimer_requireMainRunLoopForNonGCD______JobsSwiftTimer_swift_81["swift:func:JobsTimer.requireMainRunLoopForNonGCD(...)@JobsSwiftTimer.swift:81"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> Unmanaged_passUnretained_____["Unmanaged.passUnretained(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> UnsafeMutableRawPointer_____["UnsafeMutableRawPointer(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> passUnretained_____["passUnretained(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> toOpaque_____["toOpaque(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> CFRunLoopTimerContext_____["CFRunLoopTimerContext(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> CFAbsoluteTimeGetCurrent_____["CFAbsoluteTimeGetCurrent(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> CFRunLoopTimerCreate_____["CFRunLoopTimerCreate(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> fromOpaque_____["fromOpaque(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> takeUnretainedValue_____["takeUnretainedValue(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> swift_func_JobsUnfairLock_jobs_withLock______JobsSwiftTimer_swift_22["swift:func:JobsUnfairLock.jobs_withLock(...)@JobsSwiftTimer.swift:22"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> swift_func_JobsTimer_fireTickIfValid______JobsSwiftTimer_swift_290["swift:func:JobsTimer.fireTickIfValid(...)@JobsSwiftTimer.swift:290"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> runLoop_getCFRunLoop_____["runLoop.getCFRunLoop(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> getCFRunLoop_____["getCFRunLoop(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> CFRunLoopMode_____["CFRunLoopMode(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> CFRunLoopAddTimer_____["CFRunLoopAddTimer(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> canImport_____["canImport(...)"]
    swift_func_JobsTimer_startRunLoopTimer______JobsSwiftTimer_swift_401["swift:func:JobsTimer.startRunLoopTimer(...)@JobsSwiftTimer.swift:401"] --> swift_func_JobsAppStateManager_syncWithCurrentAppStateIfNeeded______JobsSwiftTim["swift:func:JobsAppStateManager.syncWithCurrentAppStateIfNeeded(...)@JobsSwiftTimer.swift"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> canImport_____["canImport(...)"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> JobsAppStateManager_____["JobsAppStateManager(...)"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> self_pause_____["self.pause(...)"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> pause_____["pause(...)"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> self_resume_____["self.resume(...)"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> resume_____["resume(...)"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> self_stop_____["self.stop(...)"]
    swift_func_JobsTimer_setupAppStateIfNeeded______JobsSwiftTimer_swift_448["swift:func:JobsTimer.setupAppStateIfNeeded(...)@JobsSwiftTimer.swift:448"] --> stop_____["stop(...)"]
    swift_func_JobsTimer_teardownAppState______JobsSwiftTimer_swift_466["swift:func:JobsTimer.teardownAppState(...)@JobsSwiftTimer.swift:466"] --> canImport_____["canImport(...)"]
    swift_init_JobsAppStateManager_init______JobsSwiftTimer_swift_483["swift:init:JobsAppStateManager.init(...)@JobsSwiftTimer.swift:483"] --> Sendable_____["Sendable(...)"]
    swift_init_JobsAppStateManager_init______JobsSwiftTimer_swift_483["swift:init:JobsAppStateManager.init(...)@JobsSwiftTimer.swift:483"] --> register_____["register(...)"]
    swift_func_JobsAppStateManager_syncWithCurrentAppStateIfNeeded______JobsSwiftTim["swift:func:JobsAppStateManager.syncWithCurrentAppStateIfNeeded(...)@JobsSwiftTimer.swift"] --> canImport_____["canImport(...)"]
    swift_func_JobsAppStateManager_syncWithCurrentAppStateIfNeeded______JobsSwiftTim["swift:func:JobsAppStateManager.syncWithCurrentAppStateIfNeeded(...)@JobsSwiftTimer.swift"] --> action_____["action(...)"]
    swift_func_JobsAppStateManager_register______JobsSwiftTimer_swift_503["swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503"] --> canImport_____["canImport(...)"]
    swift_func_JobsAppStateManager_register______JobsSwiftTimer_swift_503["swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503"] --> default_addObserver_____["default.addObserver(...)"]
    swift_func_JobsAppStateManager_register______JobsSwiftTimer_swift_503["swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503"] --> addObserver_____["addObserver(...)"]
    swift_func_JobsAppStateManager_register______JobsSwiftTimer_swift_503["swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503"] --> selector_____["selector(...)"]
    swift_func_JobsAppStateManager_unregister______JobsSwiftTimer_swift_520["swift:func:JobsAppStateManager.unregister(...)@JobsSwiftTimer.swift:520"] --> canImport_____["canImport(...)"]
    swift_func_JobsAppStateManager_unregister______JobsSwiftTimer_swift_520["swift:func:JobsAppStateManager.unregister(...)@JobsSwiftTimer.swift:520"] --> default_removeObserver_____["default.removeObserver(...)"]
    swift_func_JobsAppStateManager_unregister______JobsSwiftTimer_swift_520["swift:func:JobsAppStateManager.unregister(...)@JobsSwiftTimer.swift:520"] --> removeObserver_____["removeObserver(...)"]
    swift_func_JobsAppStateManager_onDidEnterBackground______JobsSwiftTimer_swift_52["swift:func:JobsAppStateManager.onDidEnterBackground(...)@JobsSwiftTimer.swift:526"] --> action_____["action(...)"]
    swift_func_JobsAppStateManager_onWillEnterForeground______JobsSwiftTimer_swift_5["swift:func:JobsAppStateManager.onWillEnterForeground(...)@JobsSwiftTimer.swift:530"] --> action_____["action(...)"]
    swift_deinit_JobsSwiftTimerCountdown_deinit_JobsSwiftTimerCountdown_swift_12["swift:deinit:JobsSwiftTimerCountdown.deinit@JobsSwiftTimerCountdown.swift:12"] --> swift_func_JobsSwiftTimerCountdown_cancel______JobsSwiftTimerCountdown_swift_163["swift:func:JobsSwiftTimerCountdown.cancel(...)@JobsSwiftTimerCountdown.swift:163"]
    swift_init_JobsSwiftTimerCountdown_init______JobsSwiftTimerCountdown_swift_98["swift:init:JobsSwiftTimerCountdown.init(...)@JobsSwiftTimerCountdown.swift:98"] --> swift_struct_JobsSwiftTimerCountdown_Snapshot_JobsSwiftTimerCountdown_swift_21["swift:struct:JobsSwiftTimerCountdown.Snapshot@JobsSwiftTimerCountdown.swift:21"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> swift_func_JobsSwiftTimerCountdown_resetInternal______JobsSwiftTimerCountdown_sw["swift:func:JobsSwiftTimerCountdown.resetInternal(...)@JobsSwiftTimerCountdown.swift:176"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> Date_____["Date(...)"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> swift_init_JobsSwiftTimerConfig_init______JobsSwiftTimerConfig_swift_29["swift:init:JobsSwiftTimerConfig.init(...)@JobsSwiftTimerConfig.swift:29"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> swift_init_JobsTimer_init______JobsSwiftTimer_swift_88["swift:init:JobsTimer.init(...)@JobsSwiftTimer.swift:88"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> timeIntervalSince_____["timeIntervalSince(...)"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> swift_struct_JobsSwiftTimerCountdown_Snapshot_JobsSwiftTimerCountdown_swift_21["swift:struct:JobsSwiftTimerCountdown.Snapshot@JobsSwiftTimerCountdown.swift:21"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> snapshot_total_____["snapshot.total(...)"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> stop_____["stop(...)"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> t_start_____["t.start(...)"]
    swift_func_JobsSwiftTimerCountdown_start______JobsSwiftTimerCountdown_swift_113["swift:func:JobsSwiftTimerCountdown.start(...)@JobsSwiftTimerCountdown.swift:113"] --> start_____["start(...)"]
    swift_func_JobsSwiftTimerCountdown_cancel______JobsSwiftTimerCountdown_swift_163["swift:func:JobsSwiftTimerCountdown.cancel(...)@JobsSwiftTimerCountdown.swift:163"] --> stop_____["stop(...)"]
    swift_func_JobsSwiftTimerCountdown_reset______JobsSwiftTimerCountdown_swift_171["swift:func:JobsSwiftTimerCountdown.reset(...)@JobsSwiftTimerCountdown.swift:171"] --> swift_func_JobsSwiftTimerCountdown_cancel______JobsSwiftTimerCountdown_swift_163["swift:func:JobsSwiftTimerCountdown.cancel(...)@JobsSwiftTimerCountdown.swift:163"]
    swift_func_JobsSwiftTimerCountdown_reset______JobsSwiftTimerCountdown_swift_171["swift:func:JobsSwiftTimerCountdown.reset(...)@JobsSwiftTimerCountdown.swift:171"] --> swift_func_JobsSwiftTimerCountdown_resetInternal______JobsSwiftTimerCountdown_sw["swift:func:JobsSwiftTimerCountdown.resetInternal(...)@JobsSwiftTimerCountdown.swift:176"]
    swift_func_JobsSwiftTimerCountdown_resetInternal______JobsSwiftTimerCountdown_sw["swift:func:JobsSwiftTimerCountdown.resetInternal(...)@JobsSwiftTimerCountdown.swift:176"] --> swift_struct_JobsSwiftTimerCountdown_Snapshot_JobsSwiftTimerCountdown_swift_21["swift:struct:JobsSwiftTimerCountdown.Snapshot@JobsSwiftTimerCountdown.swift:21"]
  ```

## 十、静态扫描边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

- 这是静态扫描结果。Swift 的协议动态派发、闭包回调、泛型约束、@objc、#selector、RunLoop、异步任务等关系可能需要运行时验证。
- 本脚本会记录这些痕迹，但不会把它们伪装成确定调用。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
