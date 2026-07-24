# `Swift Package Manager 使用指南`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

本文以 `JobsBySwiftPackageManager/JobsSPMDemoPackage` 为样例，展示 [**Swift Package Manager**](https://www.swift.org/package-manager/) 的本地包、资源、宏、并发、命令行程序与测试。App 只链接没有远程依赖的基础 Library Package；Macro、Client 和宏测试收口到嵌套的独立 Package。

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
| 外部依赖 | `swift-syntax 603.0.2` | 只由独立 Macro Demo 精确锁定 |

## 二、目录结构

```text
JobsBySwiftPackageManager/
├── JobsSPMDemoPackage/
│   ├── Package.swift
│   ├── Sources/
│   │   └── JobsSPMDemoKit/
│   ├── Tests/JobsSPMDemoKitTests/
│   └── MacroDemo/
│       ├── Package.swift
│       ├── Sources/
│       │   ├── JobsSPMDemoMacros/
│       │   ├── JobsSPMDemoMacrosPlugin/
│       │   └── JobsSPMDemoClient/
│       └── Tests/JobsSPMDemoMacroTests/
├── README.md
├── 【MacOS】🧠编译通过方可集成进SPM.command
└── 【MacOS】⏬双击下载swift-syntax.command
```

Product 是宿主工程可以链接的模块，Target 是 Package 内部编译单元。iOS App 只链接根 Package 的 `JobsSPMDemoKit`，因此 Clean / Build 不会解析 `swift-syntax`；嵌套 `MacroDemo` 的宏 Product 只由命令行 Client 和宏测试执行。

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

  脚本递归验证基础库与独立 Macro Demo，依次执行 `swift package resolve`、`swift build`、`swift test`，并只在存在 Client Product 的 Package 中执行 `swift run JobsSPMDemoClient`。

- 默认不清缓存；确实需要时显式执行：

  ```shell
  DO_RESET=1 JOBS_SKIP_README=1 \
    './JobsBySwiftPackageManager/【MacOS】🧠编译通过方可集成进SPM.command'
  ```

`swift-syntax` 由嵌套 `MacroDemo` 通过 SwiftPM 下载官方精确版本，不再维护容易失配的源码副本，也不再进入 iOS App 的 Package 依赖图。

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
| `Missing package product 'JobsSPMDemoKit'` | 根 Package 是否仍保持零远程依赖；不要把 `swift-syntax` 放回 App 依赖图 |
| Macro implementation 找不到 | `swift-syntax` 是否解析、Macros Product 是否链接 |
| Package 资源找不到 | Package 内必须使用 `Bundle.module` |
| 修改后 Xcode 未刷新 | 先 Build，再按需 Reset Package Caches |
| Macro Demo 首次解析较慢 | `swift-syntax` 较大，完成后会进入 SwiftPM 缓存；不影响 App 构建 |

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
