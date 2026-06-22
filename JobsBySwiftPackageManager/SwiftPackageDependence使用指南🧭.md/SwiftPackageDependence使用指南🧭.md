# `Swift Package Manager 使用指南`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

本文以 `JobsBySwiftPackageManager/JobsSPMDemoPackage` 为样例，展示 [**Swift Package Manager**](https://www.swift.org/package-manager/) 的本地包、资源、宏、并发、命令行程序与测试。复杂实现留在 Package，App 页面只消费公开 Product。

## 一、Demo 能力

| 能力 | 对应实现 | App 演示 |
| --- | --- | --- |
| Library Product | `JobsSPMDemoKit` | 包版本与公开摘要 |
| Resource Bundle | `Bundle.module` | 解码 Package 内 JSON |
| 泛型 | `JobsSPMDemoFormatter` | 格式化 Collection |
| Swift Concurrency | `JobsSPMDemoRepository actor` | 异步检索与隔离状态 |
| Swift Macro | `@EquatableBy("id")` | 自动生成相等与哈希 |
| Executable | `JobsSPMDemoClient` | 终端独立运行 |
| Swift Testing | `JobsSPMDemoTests` | 验证资源、actor 与宏 |
| 外部依赖 | `swift-syntax 603.0.2` | 精确版本锁定 |

## 二、目录结构

```text
JobsBySwiftPackageManager/
├── JobsSPMDemoPackage/
│   ├── Package.swift
│   ├── Sources/
│   │   ├── JobsSPMDemoKit/
│   │   ├── JobsSPMDemoMacros/
│   │   ├── JobsSPMDemoMacrosPlugin/
│   │   └── JobsSPMDemoClient/
│   └── Tests/JobsSPMDemoTests/
├── README.md
├── 【MacOS】🧠编译通过方可集成进SPM.command
└── 【MacOS】⏬双击下载swift-syntax.command
```

Product 是宿主工程可以链接的模块，Target 是 Package 内部编译单元。iOS App 链接 `JobsSPMDemoKit`；宏 Product 由命令行 Client 和测试目标执行，避免把编译器宿主插件误当成 iOS 运行时依赖。

## 三、Xcode 集成

当前工程已经使用相对路径集成本地 Package：

1. `File` ➤ `Add Package Dependencies...` ➤ `Add Local...`。
2. 选择 `JobsBySwiftPackageManager/JobsSPMDemoPackage`。
3. 给 App Target 添加 `JobsSPMDemoKit`。

```swift
import JobsSPMDemoKit
let catalog = try JobsSPMDemoCatalog.loadBundled()
let repository = JobsSPMDemoRepository(catalog: catalog)
let results = await repository.search("resource")
```

交互页面位于 `JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@SwiftPackageManager/SwiftPackageManagerDemoVC.swift`。

## 四、命令行验证

- 执行完整门禁：

  ```shell
  JOBS_SKIP_README=1 './JobsBySwiftPackageManager/【MacOS】🧠编译通过方可集成进SPM.command'
  ```

  脚本依次执行 `swift package resolve`、`swift build`、`swift test` 和 `swift run JobsSPMDemoClient`。

- 默认不清缓存；确实需要时显式执行：

  ```shell
  DO_RESET=1 JOBS_SKIP_README=1 \
    './JobsBySwiftPackageManager/【MacOS】🧠编译通过方可集成进SPM.command'
  ```

旧版依赖缺失的同级 `../swift-syntax`。现在改为 SwiftPM 下载官方精确版本，不再维护容易失配的源码副本。

## 五、与 CocoaPods 的集成

`【MacOS】🧠编译通过方可集成进SPM.command` 同时支持两种入口：

- 独立入口：双击脚本，或在终端直接执行。
- CocoaPods 入口：`pod install` 进入 `pre_install` 时询问。直接回车执行，输入任意字符后回车跳过。

Podfile 会先检查脚本是否存在，缺失时只告警并继续；调用时设置 `JOBS_SKIP_README=1` 避免二次交互。一旦选择执行，脚本授权、编译或测试失败会终止集成，符合“编译通过方可集成”。非交互环境按默认选项执行。

## 六、移除与排错

移除时先删除业务中的 `import JobsSPMDemoKit`，再从 PROJECT 的 Package Dependencies 与 App Target 的 Frameworks 中移除 Product。

| 现象 | 优先检查 |
| --- | --- |
| `no such module JobsSPMDemoKit` | App Target 是否链接对应 Product |
| Macro implementation 找不到 | `swift-syntax` 是否解析、Macros Product 是否链接 |
| Package 资源找不到 | Package 内必须使用 `Bundle.module` |
| 修改后 Xcode 未刷新 | 先 Build，再按需 Reset Package Caches |
| 首次解析较慢 | `swift-syntax` 较大，完成后会进入 SwiftPM 缓存 |

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
