# `JobsSwiftPatch`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftPatch` 是 Jobs Swift 工程里的本地 Runtime Patch Pod。第一版只支持把 Objective-C runtime 可见的方法临时替换为本地 payload 返回方法，并提供 rollback 能力。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsSwiftPatch` |
| Pod 类型 | 自建本地 Swift Pod |
| 版本 | `0.0.1` |
| 平台 | `ios 12.0` |
| podspec | `JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.podspec` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Swift Demo 演示 Runtime 热更新思想。
- 页面级临时 patch：进入页面安装，离开页面 rollback。
- 后续可扩展网络补丁、签名校验、白名单 selector 和脚本解释层。

## 三、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsSwiftPatchModel`：描述 patch 的 identifier、target class、selector 和 payload。
- `JobsSwiftPatchMgr`：安装、回滚、查询 patch。

## 四、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前能力属于高风险 Runtime 演示能力，不建议提交 App Store。
- 第一版只支持 payload provider，不支持任意 Swift/ObjC 消息派发或 JS 脚本执行。
- 被替换方法必须通过无参数对象返回的 ABI 校验，并遵守上述 payload 和方法族限制。

<a id="jobs-architecture"></a>

## 五、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 5.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

以 PatchModel 描述目标与 payload，由管理器保存原始实现、安装受限方法替换并按标识查询和回滚。当前是 Runtime 演示，不是通用脚本热更新系统。

### 5.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置补丁模型 → 核对目标方法 → 保存原实现并安装 → 调用取得 payload → 回滚恢复

### 5.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 目标方法必须暴露给 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) runtime，纯 [**Swift**](https://www.swift.org/) 静态派发方法不能按同样方式替换。
- 返回值与 payload block 签名必须匹配，当前不支持任意消息派发或 JS 脚本执行。
- 标识、目标方法和原始 IMP 的对应关系决定回滚是否正确，不应覆盖后丢失原记录。
- 保留原文的高风险演示边界，不将这一能力扩大成生产热更新承诺。

### 5.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 Model 与支持的签名，再看 installPayloadPatch 的记录、查询和 rollback。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftPatch.swift](<./JobsSwiftPatch.swift>)

依赖与编译入口：[JobsSwiftPatch.podspec](<./JobsSwiftPatch.podspec>)。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 六、使用合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 仅接受无业务参数、Objective-C runtime 可见、对象返回编码为 `@` 或 NSDictionary 的 payload provider。调用方须保证对象返回在业务上可由 NSDictionary 替代，`@` 编码本身不提供具体对象类型证明。标量、额外参数、Block 返回以及 ARC retained-return 方法族 `alloc/new/copy/mutableCopy/init` 拒绝安装。
- payload 必须能转换为不可变 Foundation 快照：字符串键的字典、数组、字符串、有限 NSNumber、NSNull、Data 和有限 Date；任意自定义可变对象与过深结构拒绝安装。安装期间不得并发修改输入 payload；安装成功后外部修改原容器不改变补丁快照。
- 同一 Class + Selector 只有一个当前 patch；替换会撤销旧 identifier 的回滚资格，新的 identifier 才能回滚当前实现。子类继承方法先落成本类方法，不修改父类或兄弟类。
- 安装与回滚串行事务化，外部 swizzle 发生冲突时返回失败，不覆盖其它组件的实现。每个目标槽保留可复用 trampoline 直到管理器生命周期结束，避免释放正在执行的 IMP。
- 此模块仍是受限 Runtime 演示能力；不会因为加锁和 ABI 校验而扩展成任意生产热更新承诺。


## 七、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftPatch --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
