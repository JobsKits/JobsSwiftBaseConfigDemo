# ⏰ `JobsSwiftTimer`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftTimer` 统一四种定时器内核，并负责线程亲和、回调防穿透和应用活跃态治理。

## 一、定位

`JobsSwiftTimer` 用 `JobsSwiftTimerProtocol` 统一四种定时器内核，并把回调队列、前后台策略与生命周期语义收口到 `JobsTimer`。

| 内核 | `JobsTimerKind` | 线程要求 | 典型场景 |
| ---- | ---- | ---- | ---- |
| GCD | `.gcd` | 生命周期可在任意线程调用 | 后台轮询、非 UI 调度 |
| Foundation | `.foundation` | 创建及生命周期操作必须在主线程 | 常规 UI 定时 |
| DisplayLink | `.displayLink` | 创建及生命周期操作必须在主线程 | 与屏幕刷新同步的视觉更新 |
| CFRunLoopTimer | `.runLoop` | 创建及生命周期操作必须在主线程 | 明确依赖 RunLoop 的场景 |

非 GCD 内核当前只支持 `RunLoop.main`；`runLoopMode` 推荐使用 `.common`。

## 二、基础用法

```swift
import JobsSwiftTimer

private var timer: JobsTimer?

func startTimer() {
    let config = JobsSwiftTimerConfig(
        interval: 1,
        repeats: true,
        tolerance: 0.1,
        queue: .main,
        runLoop: .main,
        runLoopMode: .common,
        pauseInBackground: true,
        autoManageAppState: true
    )

    timer?.stop()
    timer = JobsTimer(kind: .foundation, config: config) {
        // 更新 UI
    }
    timer?.start()
}
```

`JobsSwiftTimerConfig` 会把非有限的 `interval` 回退到 `1` 秒，把有效间隔限制为至少 `0.000001` 秒；非有限的 `tolerance` 回退到 `0`，有效值限制在 `0...interval`。

## 三、一次性任务

```swift
let config = JobsSwiftTimerConfig(
    interval: 0.5,
    repeats: false,
    queue: .main
)

let timer = JobsTimer(kind: .gcd, config: config) {
    print("tick")
}.onFinish {
    print("finish")
}.start()
```

一次性任务先进入终态并销毁底层引擎，再在同一回调队列中依次执行 `tick`、`finish`，避免重复触发和完成顺序漂移。

## 四、生命周期保证

- `start`、`pause`、`resume`、`fireOnce`、`stop` 由生命周期锁串行化。
- `JobsSwiftTimerProtocol.requiresMainThreadLifecycle` 公开生命周期执行上下文；自定义实现默认按主线程路由，Manager 不再依赖具体类型强转。
- 每次状态切换都会刷新 generation token；已排队的旧 tick 在执行前会再次校验，`pause` / `stop` 后不会穿透。
- GCD 内核恢复时会同步重绑 event handler，避免继续携带暂停前的 token。
- Foundation `Timer` 使用弱捕获闭包，`CADisplayLink` 使用弱代理，不会通过回调链反向强持有 `JobsTimer`。
- `CFRunLoopTimer` 使用弱捕获的 block API，不保存未托管裸指针。
- `CADisplayLink` 会按 `config.interval` 节流，不再把每一帧都当成一次业务 tick。
- `deinit` 会撤销底层引擎；非 GCD 引擎在主线程完成失效处理。

## 五、前后台策略

```swift
let config = JobsSwiftTimerConfig(
    interval: 2,
    repeats: true,
    queue: .global(qos: .utility),
    pauseInBackground: true,
    autoManageAppState: true
)
```

`pauseInBackground = true` 且 `autoManageAppState = true` 时，应用进入 `.inactive` 或 `.background` 都会自动暂停；只有收到重新活跃通知时，才恢复由应用状态自动暂停的 timer。手动 `pause` 会清除自动恢复资格，因此控制中心、系统弹窗等 inactive→active 路径不会遗留暂停状态，也不会误恢复手动暂停项。

多定时器、页面复用和 identifier 去重场景统一使用 [JobsSwiftTimerMgr](../JobsSwiftTimerMgr@Pods/README.md)。

## 六、验证

```shell
xcrun swiftc -frontend -parse JobsSwiftTimer.swift JobsSwiftTimerConfig.swift JobsSwiftTimerDefs.swift JobsSwiftTimerProtocol.swift
```

```shell
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsSwiftTimer -configuration Debug -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```

应用测试 target 还覆盖自动暂停恢复、手动暂停保护以及 Manager 替换句柄隔离。
