# `Swift Code Map 扫描警告`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

- 以下内容不是错误，而是静态扫描天然无法完全确认的关系。

## runtime

- 未发现。

## selector_reference

- `JobsSwiftTimer.swift:388` `swift:func:JobsTimer.startDisplayLink(...)@JobsSwiftTimer.swift:380` -> `selector`
  - 证据：`let link = CADisplayLink(target: proxy, selector: #selector(DisplayLinkProxy.tick))`
- `JobsSwiftTimer.swift:507` `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `selector`
  - 证据：`selector: #selector(onDidEnterBackground),`
- `JobsSwiftTimer.swift:513` `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `selector`
  - 证据：`selector: #selector(onWillEnterForeground),`
## notification

- `JobsSwiftTimer.swift:505` `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `NotificationCenter`
  - 证据：`NotificationCenter.default.addObserver(`
- `JobsSwiftTimer.swift:511` `swift:func:JobsAppStateManager.register(...)@JobsSwiftTimer.swift:503` -> `NotificationCenter`
  - 证据：`NotificationCenter.default.addObserver(`
- `JobsSwiftTimer.swift:522` `swift:func:JobsAppStateManager.unregister(...)@JobsSwiftTimer.swift:520` -> `NotificationCenter`
  - 证据：`NotificationCenter.default.removeObserver(self)`
## delegate_assignment

- 未发现。

## async_task

- 未发现。
