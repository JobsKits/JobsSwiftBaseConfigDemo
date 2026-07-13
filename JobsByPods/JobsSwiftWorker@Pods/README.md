# JobsSwiftWorker

`JobsSwiftWorker` 不是单点的 debounce 封装，而是站在 `JobsSwiftTaskCenter` / `JobsSwiftTimer` 之上，补一层平行 Flutter GetX Worker 的本地响应式能力。

## 当前能力

### Worker
- `ever`
- `once`
- `debounce`
- `interval`
- `everAll`
- `skip`
- `take`

### Observable 变换
- `map`
- `filter`
- `distinctUntilChanged`
- `combineLatest`

### UI Binder
- `UILabel` 文本绑定
- `UITextField` 输入绑定
- UI 写入与事件绑定统一经由 `JobsByUIKit` / `JobsSwiftDSL`，不在 Binder 中裸调系统 API。

## 设计目标

1. **不只封 debounce**：直接提供 Worker 抽象层。
2. **兼容 Jobs 架构**：延时与窗口控制统一落到 `JobsSwiftTaskCenter`。
3. **页面级可治理**：通过 `JobsWorkerBag` / `JobsWorkerCenter` 统一释放。
4. **后续可继续长大**：可以继续补 `throttleLatest`、`zip`、`merge`、`flatMapLatest`、UI State Binder。

## 快速使用

```swift
let count = JobsObservable<Int>(0, name: "count")
let bag = JobsWorkerBag()

count
    .ever { change in
        print(change.newValue)
    }
    .store(in: bag)

count.accept(1)
```

## 推荐发展方向

下一步建议补：

- `throttleLatest`
- `merge`
- `zip`
- `removeDuplicates(by:)`
- `bindHidden / bindEnabled / bindImage`
- `JobsWorkerController`（页面控制器层）
