# ⏰`JobsTimer`

[toc]

## 一、摘要

* <font color=red>**用协议统一iOS的4种定时器**</font>，外界只关心：

  * 定时器（内核）类型 ➤ `JobsTimerKind` 支持 4 种内核：`gcd`/ `foundation` / `displayLink` / `runLoop`

    ```swift
    /// 只有.gcd 才能随便线程调用。非 GCD 内核强制主线程
    public enum JobsTimerKind: Sendable {
        case gcd // 不依赖 RunLoop，不强制主线程、回调在 `config.queue` 上执行、适合后台任务、非 UI、精准调度
        case foundation
        case displayLink
        case runLoop
    }
    ```

  * 定时器基础配置`JobsTimerConfig` 

    ```swift
    public struct JobsTimerConfig {
        public var interval: TimeInterval    // 时间间隔（最小会被 clamp 到 0.000001）
        public var repeats: Bool             // 是否重复；false 就是 one-shot
        public var tolerance: TimeInterval   // 容忍误差（对 `Timer` 有意义；GCD 用 leeway）
    
        public var queue: DispatchQueue      // 回调实际执行的队列
        public var runLoop: RunLoop          // 非 GCD 内核用（且必须 `.main`）
        public var runLoopMode: RunLoop.Mode // 非 GCD 内核用（且必须 `.main`）
    
        public var pauseInBackground: Bool   // 进入后台是否 pause（UIKit 下有效）
        public var autoManageAppState: Bool  // 是否自动监听前后台（UIKit 下有效）
    
        public init(
            interval: TimeInterval = 1.0,
            repeats: Bool = true,
            tolerance: TimeInterval = 0,
            queue: DispatchQueue = .main,
            runLoop: RunLoop = .main,
            runLoopMode: RunLoop.Mode = .common,
            pauseInBackground: Bool = true,
            autoManageAppState: Bool = true
        ) {
            self.interval = max(0.000_001, interval)
            self.repeats = repeats
            self.tolerance = max(0, tolerance)
            self.queue = queue
            self.runLoop = runLoop
            self.runLoopMode = runLoopMode
            self.pauseInBackground = pauseInBackground
            self.autoManageAppState = autoManageAppState
        }
    }
    ```

  * 定时器回调任务

    ```swift
    /// 无论哪种内核，真正执行 tick/finish 的地方是：
    config.queue.async { snapshot.tick() }
    ```

  * 定时器状态

    ```swift
    public protocol JobsTimerProtocol: AnyObject {
        var isRunning: Bool { get }
        func start()
        func pause()
        func resume()
        func stop()
    
        @discardableResult
        func onTick(_ block: @escaping JobsTimerCallback) -> Self
    
        @discardableResult
        func onFinish(_ block: @escaping JobsTimerCallback) -> Self
    }
    ```

* 用 [**JobsTimerManager**](#JobsTimerManager) 管理多个 `JobsTimer`（带 identifier）

  * 用 `identifier` 管理 timer 生命周期（列表 cell / 页面复用特别实用）
    * 有**去重策略** `JobsTimerDedupPolicy`➤ `keepExisting` / `replace` / `error` 
  * 一行 act：start/pause/resume/stop/cancel 

## 二、<font id=JobsTimer>`JobsTimer`的使用</font>

### 1、GCD 定时器

> 不吃主线程/RunLoop限制

```swift
let config = JobsTimerConfig(
    interval: 1.0,
    repeats: true,
    tolerance: 0.1,
    queue: DispatchQueue.global(qos: .userInitiated) // 回调跑这里
)

let timer = JobsTimer(kind: .gcd, config: config) {
    // tick：在 config.queue 上执行
    print("tick")
}

timer
    .onFinish { print("finish") } // repeats=false 时才会触发 finish
    .start()

timer.pause()
timer.resume()
timer.stop()
```

### 2、主线程 UI 定时

> 必须主线程创建+操作

```swift
/// .foundation / .runLoop / .displayLink：init/start/pause/resume/stop 全都必须主线程，否则 precondition 直接 crash

DispatchQueue.main.async {
    let config = JobsTimerConfig(
        interval: 1.0,
        repeats: true,
        queue: .main,               // 回调在主线程跑，适合更新 UI
        runLoop: .main,
        runLoopMode: .common
    )

    let timer = JobsTimer(kind: .foundation, config: config) {
        // 更新 UI
    }

    timer.start()
}
```

### 3、只触发一次

```swift
let config = JobsTimerConfig(interval: 0.5, repeats: false, queue: .main)
let t = JobsTimer(kind: .gcd, config: config) {
    print("only once")
}
t.onFinish {
    print("finished")
}.start()
```

## 三、<font id=JobsTimerManager>`JobsTimerManager` 的使用</font>

### 1、创建并注册（🌟最推荐用法🌟）

```swift
/// 同 id 已存在时，默认策略是 .replace（Manager 内部默认）
let id = "home.countdown"
var config = JobsTimerConfig(interval: 1.0, repeats: true, queue: .main)
let timer = try JobsTimerManager.shared.create(
    kind: .foundation,
    identifier: id,// 不能为空，否则抛 identifierRequired
    config: config,
    dedupPolicy: .replace
) {
    // tick
}

timer.start()
```

### 2、用 act 控制

> 不需要持有 **JobsTimer** 引用

```swift
try JobsTimerManager.shared.act(.start, identifier: id)
try JobsTimerManager.shared.act(.pause, identifier: id)
try JobsTimerManager.shared.act(.resume, identifier: id)
try JobsTimerManager.shared.act(.stop, identifier: id)
```

```swift
/// cancel ➤ 停止并移除
/// 最适合 cell reuse / deinit
/// JobsTimerManager 的 .cancel 会先 stop() 再 remove()

try JobsTimerManager.shared.act(.cancel, identifier: id)
```

### 3、停止并移除

> <font color=red>**async**</font> 版，吞错误，适合复用场景
>
> 内部 <font color=red>try/catch</font> 静默掉**找不到 id**的情况，适合 cell 已复用的场景 

```swift
Task {
    await JobsTimerManager.shared.stopAndRemove(identifier: id)
}
```

## 四、经典场景推荐方案

### 1、列表 cell 每秒更新倒计时 ➤ 防复用

```swift
/// 用 Manager + identifier（把 indexPath / model id 拼进去）
/// 出队/复用时 cancel

let id = "cell.\(model.id)"
let config = JobsTimerConfig(interval: 1, repeats: true, queue: .main)

try? JobsTimerManager.shared.create(kind: .foundation, identifier: id, config: config) {
    // 更新 label
}.start()

// 在 prepareForReuse / didEndDisplaying / deinit:
Task { await JobsTimerManager.shared.stopAndRemove(identifier: id) }
```

### 2、后台轮询 ➤ 不阻塞主线程

```swift
/// .gcd + 后台 queue
let config = JobsTimerConfig(interval: 2, repeats: true, queue: .global(qos: .background))
let t = JobsTimer(kind: .gcd, config: config) { /* poll */ }
t.start()
```





