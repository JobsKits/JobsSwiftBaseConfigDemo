# `JobsSwiftTaskCenter`
> 一个 **强大、灵活、线程安全的 Swift 任务调度框架**，专为 **Apple** 平台设计

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

## 一、简介

* **`JobsSwiftTaskCenter`** 提供一套完整的 **任务调度模型 (Task Scheduling
  Model)**，用于在应用中统一管理：
  * 定时任务
  * 延迟任务
  * 重复任务
  * 任务生命周期
  * 执行事件流
  * 并发任务组合

* 底层使用 [**JobsSwiftTimer**]() 提供高精度定时能力，上层负责**任务调度、生命周期管理与执行观察**

## 二、✨ 特性

### 1、完整任务生命周期

* 任务拥有清晰的生命周期：`idle → running → suspended → cancelled / finished`
* 支持：
  * **suspend**
  * **resume**
  * **cancel**
  * **executeNow**
  * 生命周期观察

### 2、`Swift Concurrency` 原生支持

* 完全支持 `Swift Concurrency`

  * `async / await`
  * `AsyncSequence`
  * `structured concurrency`
  * `Sendable`

* 示例：

  ```swift
  await task.waitUntilFinished()
  
  for await execution in task.executions() {
      print(execution)
  }
  ```

### 3、灵活调度策略

**`JobsSwiftTaskCenter`** 支持多种任务调度策略：

| 类型 | 示例 |
|---|---|
| **延迟执行** | `JobsPlan.after(.second * 5)` |
| **指定时间执行** | `JobsPlan.at(date)` |
| **立即执行** | `JobsPlan.now` |
| **定时执行** | `JobsPlan.every(.second)` |
| **限定次数** | `repeatCount` |
| **初始延迟** | `initialDelay` |
| **立即执行一次** | `fireImmediately` |

## 三、🚀 快速开始

``` swift
import JobsSwiftTaskCenter

let task = JobsPlan.after(.second * 2).do {
    print("2 秒后执行")
}
```

------------------------------------------------------------------------

## 四、📄 License

MIT
