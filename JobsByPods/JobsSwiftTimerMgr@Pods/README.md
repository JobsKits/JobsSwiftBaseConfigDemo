# ⏱️ `JobsSwiftTimerMgr`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftTimerMgr` 负责 identifier 注册、受管生命周期句柄、去重和应用状态策略。

## 一、定位

`JobsSwiftTimerMgr` 是 `JobsSwiftTimer` 之上的 identifier 管理层，负责原子注册、去重、生命周期派发、批量清理和前后台策略。单个 timer 的内核行为留在 `JobsSwiftTimer`，页面或列表内多个 timer 的编排放在 Manager。

## 二、创建与控制

```swift
import JobsSwiftTimer
import JobsSwiftTimerMgr

let identifier = "home.countdown"
let config = JobsSwiftTimerConfig(
    interval: 1,
    repeats: true,
    queue: .main,
    runLoop: .main,
    runLoopMode: .common
)

let timer = try JobsSwiftTimerMgr.shared.create(
    kind: .foundation,
    identifier: identifier,
    config: config,
    dedupPolicy: .replace,
    backgroundPolicy: .pauseAndResume
) {
    // 更新倒计时 UI
}

timer.start()
try JobsSwiftTimerMgr.shared.act(.pause, identifier: identifier)
try JobsSwiftTimerMgr.shared.act(.resume, identifier: identifier)
try JobsSwiftTimerMgr.shared.act(.cancel, identifier: identifier)
```

`.cancel` 会停止并移除；`.stop` 只停止，注册项仍可查询。

`create` 返回的是受管句柄：直接调用它的 `start`、`pause`、`resume`、`stop`，Manager 仍会同步 Entry 的手动 / 自动暂停状态。旧句柄在同 identifier 被替换后只能作用于自己的旧内核，不会误控制新注册项。

## 三、治理策略

### 3.1、同 identifier 去重

| 策略 | 行为 |
| ---- | ---- |
| `.keepExisting` | 返回旧 timer，不覆盖旧配置和回调 |
| `.replace` | 原子替换注册项，再在锁外停止旧 timer |
| `.error` | 抛出 `duplicatedIdentifier` |

原子替换保证并发 `create` 时字典不会短暂缺失；停止旧 timer 不占用 Manager 锁，避免回调重入造成死锁。

### 3.2、前后台策略

| 策略 | 行为 |
| ---- | ---- |
| `.ignore` | 不干预 |
| `.pauseAndResume` | 失去活跃态即暂停，重新活跃只恢复自动暂停项 |
| `.cancel` | 后台停止并移除 |

Manager 接管应用状态治理后，会关闭具体 `JobsTimer` 自己的监听，避免双重暂停或恢复。每次 `start` / `resume` 后还会读取当前应用状态：即使 Timer 在应用已经 inactive / background 时才启动，策略也会立即生效；`.cancel` 仍只在真实 background 时停止并移除。

## 四、并发与线程保证

- `defaultDedupPolicy` 与注册字典均在锁内访问。
- `.cancel` 移除前会核对 Entry 身份，不会误删同 identifier 的并发替换项。
- 非 GCD timer 的生命周期动作由 Manager 路由到主线程；GCD timer 保持可跨线程调用。
- 生命周期线程要求来自 `JobsSwiftTimerProtocol`，不再通过 `JobsTimer` 具体类型强转判断。
- Manager、受管句柄和具体 Timer 都声明了受锁保护的并发边界，便于 Swift 6 严格并发检查继续收口。
- `removeAll(stopAll: true)` 先取快照并清空注册表，再在锁外逐个停止。

## 五、复用场景

```swift
let identifier = "cell.\(model.id)"

try? JobsSwiftTimerMgr.shared.create(
    kind: .foundation,
    identifier: identifier,
    config: JobsSwiftTimerConfig(interval: 1),
    dedupPolicy: .replace
) {
    // 刷新 cell
}.start()

// prepareForReuse / didEndDisplaying
JobsSwiftTimerMgr.shared.stopAndRemove(identifier: identifier)
```

iOS 13 以上也保留同名 `async` 入口；当前内部仍按同步生命周期语义执行。

## 六、验证

```shell
xcrun swiftc -frontend -parse JobsSwiftTimerMgr.swift JobsSwiftTimerMgrDefs.swift
```

```shell
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsSwiftTimerMgr -configuration Debug -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```

应用测试 target 还覆盖受管句柄的手动暂停保护和并发替换后的旧句柄隔离。
