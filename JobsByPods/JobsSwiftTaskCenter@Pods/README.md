# JobsSwiftTaskCenter

> 🎯 Jobs 系列任务中心 - 统一管理定时任务、异步任务的轻量级框架  
> 📅 创建时间: 2026-03-15  
> 👤 作者: Jobs  
> © 2026 Jobs. All rights reserved.

[TOC]

---

## 📋 概述

`JobsSwiftTaskCenter` 是一个强大的任务管理框架，提供线程安全的任务调度、生命周期管理和标签分类功能。支持 RunLoop 和 GCD 两种定时器模式，完美集成 Swift Concurrency，并提供优雅的链式语法。

### ✨ 核心特性

- ✅ **线程安全** - 内部使用 `NSLock` 保证并发访问安全
- ✅ **任务调度** - 支持一次性、重复、延迟执行等多种调度策略
- ✅ **生命周期管理** - idle、running、suspended、cancelled、finished 五种状态
- ✅ **标签分类** - 为任务添加字符串标签，便于分组管理
- ✅ **语义化时间** - `1.seconds`、`500.milliseconds` 等直观的时间表达
- ✅ **链式语法** - 支持流畅的 DSL 链式调用
- ✅ **双模式定时器** - 支持 GCD 和 RunLoop 两种定时器实现
- ✅ **应用状态监听** - 自动处理应用进入后台/前台的任务调度

---

## 🎯 主要组件

### 1. JobsTask - 核心任务类

```swift
public final class JobsTask {
    public typealias Lifecycle = JobsTaskLifecycle
    public var lifecycle: JobsTaskLifecycle { get }
    public var executionCount: Int { get }
    public var estimatedNextExecutionDate: Date? { get }
    
    public func addAction(_ action: @escaping Action) -> UUID
    public func removeAction(_ id: UUID)
    public func suspend()
    public func resume()
    public func cancel()
    public func executeNow()
}
```

### 2. JobsTaskCenterComponent - 任务创建组件

```swift
// 创建定时任务
JobsTaskCenterComponent.createTimerTask(
    seconds: 3,
    repeatCount: 10
) {
    print("每3秒执行一次")
}

// 创建一次性任务
JobsTaskCenterComponent.createOneShotTask(seconds: 5) {
    print("5秒后执行")
}

// 创建 RunLoop 任务
JobsTaskCenterComponent.createRunLoopTask(
    runloop: .common,
    seconds: 1
) {
    print("RunLoop 任务")
}
```

### 3. JobsTaskManager - 任务管理器

```swift
// 单例访问
let manager = JobsTaskManager.default

// 添加任务
manager.addTask(task: item)

// 控制任务
manager.resume(by: "heartbeat")
manager.suspend(by: "heartbeat")
manager.executeNow(by: "heartbeat")
manager.removeTask(by: "heartbeat")
```

### 4. JobsPlan - 任务计划

```swift
// 每2秒执行一次，共10次
let plan = JobsPlan.every(
    2.seconds,
    initialDelay: 1.seconds,
    repeatCount: 10
)

// 创建任务
let task = plan.do(queue: .main) {
    print("执行")
}
```

### 5. JobsPeriod - 语义化时间

```swift
// 使用 Int
let period1 = 500.milliseconds  // 0.5秒
let period2 = 3.seconds         // 3秒

// 使用 Double  
let period3 = 1.5.seconds       // 1.5秒

// 与 Date 配合
let futureDate = Date().adding(10.seconds)
```

---

## 💡 快速开始

### 基础示例

```swift
import JobsSwiftTaskCenter

// 创建心跳任务
let heartbeat = JobsTaskCenterComponent
    .createTimerTask(seconds: 1, repeatCount: 60) {
        print("💓 心跳")
    }
    .byAttach(tag: "heartbeat", autoResume: true)

// 暂停任务
JobsTaskManager.default.suspend(by: "heartbeat")

// 恢复任务
JobsTaskManager.default.resume(by: "heartbeat")

// 清理任务
JobsTaskManager.default.removeTask(by: "heartbeat")
```

### 链式语法示例

```swift
// 优雅的链式调用
JobsTaskCenterComponent
    .createTimerTask(seconds: 3) {
        self.fetchData()
    }
    .byResume()
    .byAttach(tag: "dataFetcher", autoResume: true)
    .byExecuteNow()

// Configuration 链式配置
let config = JobsTaskCenterComponent.Configuration(interval: 1.seconds)
    .byRepeatCount(10)
    .byInitialDelay(2.seconds)
    .byFireImmediately(true)
```

---

## 🎨 实际应用

### 场景 1: 心跳检测

```swift
class NetworkMonitor {
    private var heartbeat: JobsTaskCenterComponent?
    
    func start() {
        heartbeat = JobsTaskCenterComponent
            .createTimerTask(seconds: 5) { [weak self] in
                self?.checkConnection()
            }
            .byAttach(tag: "network.heartbeat", autoResume: true)
    }
    
    func stop() {
        JobsTaskManager.default.removeTask(by: "network.heartbeat")
    }
}
```

### 场景 2: 倒计时

```swift
class CountdownTimer {
    private var remaining = 60
    
    func start() {
        JobsTaskCenterComponent
            .createTimerTask(seconds: 1, repeatCount: 60) { [weak self] in
                guard let self else { return }
                self.remaining -= 1
                print("剩余: \(self.remaining)秒")
            }
            .byAttach(tag: "countdown", autoResume: true)
    }
}
```

### 场景 3: 数据轮询

```swift
class DataRefresher {
    func startRefreshing() {
        JobsTaskCenterComponent
            .createTimerTask(
                seconds: 10,
                initialDelay: 2,
                repeatCount: nil  // 无限重复
            ) { [weak self] in
                self?.fetchLatestData()
            }
            .byAttach(tag: "data.refresh", autoResume: true)
    }
}
```

---

## 📦 安装

### CocoaPods

```ruby
pod 'JobsSwiftTaskCenter', :path => 'JobsByPods/JobsSwiftTaskCenter@Pods'
```

### 依赖

- JobsSwiftTimer
- Foundation

---

## 🔧 核心 API

### 枚举定义

```swift
// 任务生命周期
public enum JobsTaskLifecycle {
    case idle        // 待启动
    case running     // 运行中
    case suspended   // 已挂起
    case cancelled   // 已取消
    case finished    // 已结束
}

// 任务状态
public enum JobsTaskStatus {
    case expire      // 过期
    case suspend     // 暂停
    case prepare     // 准备
    case excute      // 执行中
    case ended       // 已结束
    case background  // 后台
}
```

### 链式方法

#### JobsTaskCenterComponent

| 方法 | 说明 |
|------|------|
| `byResume()` | 恢复任务 |
| `bySuspend()` | 暂停任务 |
| `byCancel()` | 取消任务 |
| `byExecuteNow()` | 立即执行 |
| `byAttach(tag:manager:autoResume:executeImmediately:)` | 绑定到管理器 |

#### JobsTaskManager

| 方法 | 说明 |
|------|------|
| `byResume(tag:)` | 恢复指定任务 |
| `bySuspend(tag:)` | 暂停指定任务 |
| `byExecuteNow(tag:)` | 立即执行任务 |
| `byCancel(tag:)` | 取消指定任务 |
| `byRemoveAllTask()` | 移除所有任务 |

---

## ⚠️ 重要提示

### 文件命名问题

**当前存在文件名与类名不一致的问题，需要手动重命名：**

```bash
cd JobsByPods/JobsSwiftTaskCenter@Pods/Classes/

# 交换文件名
mv JobsTaskCenter.swift temp.swift
mv JobsTaskCenterComponent.swift JobsTaskCenter.swift
mv temp.swift JobsTaskCenterComponent.swift
```

### 内存管理

使用闭包时务必注意循环引用：

```swift
// ✅ 正确
component.byAppendTask { [weak self] in
    self?.doWork()
}

// ❌ 错误 - 可能循环引用
component.byAppendTask {
    self.doWork()
}
```

---

## 🎯 最佳实践

### 1. 合理使用标签

```swift
// 使用命名空间式标签
"network.heartbeat"
"ui.refresh"
"data.sync"

// 批量操作
JobsTaskManager.default.suspend(condition: { 
    $0.tag.hasPrefix("network.") 
})
```

### 2. 资源清理

```swift
class MyViewController: UIViewController {
    private var component: JobsTaskCenterComponent?
    
    deinit {
        component?.cancel()
        JobsTaskManager.default.removeTask(by: "myTask")
    }
}
```

### 3. 线程安全

```swift
// 后台执行，主线程更新 UI
JobsPlan.every(1.seconds).do(queue: .global()) {
    let data = self.heavyComputation()
    DispatchQueue.main.async {
        self.updateUI(with: data)
    }
}
```

---

## 📚 组件列表

| 组件 | 说明 | 文件 |
|------|------|------|
| `JobsTask` | 核心任务类 | JobsTask.swift |
| `JobsTaskCenter` | 任务管理中心 | JobsTaskCenterComponent.swift* |
| `JobsTaskCenterComponent` | 任务创建组件 | JobsTaskCenter.swift* |
| `JobsTaskManager` | 任务管理器 | JobsTaskItem.swift |
| `JobsTaskItem` | 任务项 | JobsTaskItem.swift |
| `JobsPlan` | 任务计划 | JobsPlan.swift |
| `JobsPeriod` | 时间段类型 | JobsPeriod.swift |
| 枚举定义 | 状态/生命周期 | JobsTaskCenterDefine.swift |
| 链式扩展 | DSL 语法 | JobsTaskCenter+ChainSyntax.swift |

*文件名需要交换

---

## 🎉 特色功能

### 1. 语义化时间表达

```swift
500.milliseconds
3.seconds
1.5.seconds
Date().adding(10.seconds)
```

### 2. 流畅的链式语法

```swift
JobsTaskCenterComponent
    .createTimerTask(seconds: 1) { work() }
    .byResume()
    .byAttach(tag: "task")
```

### 3. 强大的任务管理

```swift
// 条件控制
manager.resume(condition: { $0.tag.contains("critical") })
manager.cancel(condition: { $0.status == .ended })
```

### 4. 双模式定时器

- **GCD 模式**: 高精度，支持任意队列
- **RunLoop 模式**: 与 UI 同步，主线程友好

---

## 📖 版本历史

### v1.0.0 (2026-03-15)

- ✅ 初始版本
- ✅ 完整任务管理功能
- ✅ 链式语法支持
- ✅ 双模式定时器
- ✅ 完善文档

---

## 📞 版权信息

**JobsSwiftTaskCenter**  
© 2026 Jobs. All rights reserved.

---

**让任务管理更简单、更优雅！** 🚀
