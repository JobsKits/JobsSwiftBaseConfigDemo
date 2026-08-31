# `JobsSwiftBlock`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsSwiftBlock` 集中提供 [**Swift**](https://www.swift.org/) Block / closure 类型别名，并承接不能放在高层 UI Pod 的最低层创建 closure。

## 一、创建与依赖边界

- `NSObject.jobsMake { object in ... }` 统一无参系统对象创建，原生 `init()` 只存在于该入口内部。
- `NSObject` 统一遵循 `JobsNSObjectMaking`，工厂在 `Self: NSObject` 的协议扩展中实现；配置参数和返回值都保留调用类型，调用方无需额外遵循协议或改变现有写法。
- `JSONDecoder.make { decoder in ... }` / `JSONEncoder.make { encoder in ... }` 为不继承 `NSObject` 的 Foundation 类提供同语义入口。
- `JobsSwiftDSL` 通过桥接文件公开转出本 Pod；底层 Pod 可以直接依赖 `JobsSwiftBlock`，避免为了创建对象反向依赖 `JobsByUIKit`。

创建完成后的属性、无参实例方法和单参实例方法不由本 Pod 承担，统一进入真实类型的 `JobsSwiftDSL.byXxx(...)`。

## 二、编译兼容与回归

- 工厂使用协议泛型 `Self`，避免类扩展动态 `Self` 在协议调用方的 IR 生成路径。Xcode 26.3 / Swift 6.2.4 曾在 `JobsCallbackable.jobs_callbackStore` 调用工厂时于 `getDynamicSelfMetadata()` 崩溃；不能仅用语法解析通过判断该问题已修复。
- [**GitHub Actions**](https://docs.github.com/en/actions) 工作流 `../../.github/workflows/build_simulator_app.yml` 在安装依赖之前执行 `../../.github/tests/JobsSwiftBlockRegression.swift`，验证跨模块调用、具体子类、动态元类型、配置闭包只执行一次，以及回调注册、替换、移除、返回值和实例隔离。
- 同一检查使用当前 [**Xcode**](https://developer.apple.com/xcode) 为 `arm64`、`x86_64` 模拟器生成实际回调源码的 IR；完整 App 构建仍保持 `ONLY_ACTIVE_ARCH=NO`，不通过排除架构或忽略编译失败放行。
- 完整构建失败时上传 `Simulator-Build-Diagnostics-运行ID-尝试次数`，包含 `simulator-build.log` 和 `SimulatorBuild.xcresult`。日志经过 `tee` 保存，但 `pipefail` 保留真实构建失败状态。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
