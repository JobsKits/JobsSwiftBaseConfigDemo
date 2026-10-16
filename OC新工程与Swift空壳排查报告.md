# OC 新工程与 Swift 空壳排查报告

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

日期：**2026-10-16，Asia/Shanghai**。按用户在排查后的明确授权，删除 <u>[**Swift**](https://www.swift.org/)</u> 与 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 新工程中已经确认的无效接口、空文件和空目录，并同步 OC 老工程的自维护对应代码。

**已清理报告列出的空壳；完整 OC JobsOCDSL、真实功能模块、协议、重导出桥接和抽象扩展点保留。** 删除的是未交付的接口和配置，没有把这些功能替换成模拟成功实现。源代码、调用方、公共头、相关 README 与公共代码块一起同步。

## 一、范围与当前结构 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 工程 | 清理范围 | 当前自建 Pod 数 |
| --- | --- | --- |
| Swift 基础工程 | 主工程与自建 `JobsByPods/` | 64 |
| OC 新工程 | 主工程与自建 `JobsByPods/` | 109 |
| OC 老工程 | 新工程对应的自维护网络扩展、公共声明、草稿 Demo 与工程引用 | 保持主工程源码集成，不新增 Pod |

Swift 根目录为 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo`；OC 新工程为 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods`；OC 老工程为 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo`。

先用已有 [**CodeGraph**](https://github.com/colbymchenry/codegraph) 索引定位，再检查真实实现、调用和集成引用。源码候选均核对 Jobs 作者头或已确认维护范围。根 `Pods/`、`ManualBy*Pods@Pods/`、`PodsManual`、手工第三方、供应商、生成代码和所有权不明源码继续按维护边界处理；生成的工程和锁文件通过正常工具刷新。

## 二、Swift 清理结果 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 对象 | 实际处理 |
| --- | --- |
| `JobsOCDSL@Pods` | 删除仅交付版本与空能力清单的 4 个文件、空目录及独立消费者验证特判。该模块原本未集成到宿主。 |
| `UIGestureRecognizer.byModifierFlags` / `byButtonMask` | 删除忽略参数的伪 setter；系统只读属性不再伪装成可设置接口。 |
| `BRDatePicker.byAllowToNow` | 删除未实现的字段、公开方法及空分支，保留真实日期选择逻辑。 |
| `BRSystemCountDownPicker.bySelectDate` | 删除兼容 no-op；宿主 Demo 和公共 CodeSnippets 使用 `byCountDownDuration(0)`，保持原默认零秒语义。其它日期选择器的真实同名方法保留。 |
| `JobsSwiftBaseTools/JobsSwiftTimer` | 删除匹配不到源码的过时子规格；独立 `JobsSwiftTimer` Pod 保留。 |
| `PHPickerCapabilities.swift` | 删除只有 TODO 的空 extension 文件，保留 JobsByPhotosUI 的真实重导出与扩展。 |
| `LunarDemoVC.updateFooterAvailability()` | 删除空 helper 及调用，保留农历转换与页面功能。 |
| 标准库 13 个纯头文件 | 删除只有 Jobs 文件头、没有声明的文件；标准库其它有效实现保留。 |

13 个标准库文件原位于 `JobsByPods/JobsSwiftStandardLibrary@Pods/`：

```text
整形/Int.swift
整形/Int8.swift
整形/Int16.swift
整形/Int32.swift
整形/Int64.swift
整形/UInt.swift
整形/UInt8.swift
整形/UInt16.swift
整形/UInt32.swift
整形/UInt64.swift
浮点类型/Float.swift
浮点类型/Float16.swift
浮点类型/Float80.swift
```

Swift 两组无源码、无 podspec 的预留目录已逐层通过 `rmdir` 移除：

- `JobsByPods/JobsAppEnvironmentRibbon@Pods/`
- `JobsByPods/JobsOCSkeletonView@Pods/`

相关 Pod README 已同步说明有效能力和迁移入口；Swift 当前目录只保留 64 个有真实规格的一级自建模块。

## 三、OC 清理结果 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 对象 | 实际处理 |
| --- | --- |
| 新工程 `JobsVPN` | 删除示例服务器、恒空凭据的 `.h/.m`，从 JobsOCTools 公开聚合头撤销导出。 |
| `YTKAnimatingRequestAccessory` | 双工程删除只打日志的附件及 Base / Batch / Chain 三组专用装配分类，清掉导出、forward、Block typedef、类型判断辅助和公共代码块引用。真实网络请求、上传、结果映射保留。 |
| `JobsPostVC` | 双工程删除上传视频、上传图片、发帖、权限检测 4 个空 Block 及无效发布按钮、状态和调用；页面保留文字、选图、拖动删除及原有草稿代码路径，菜单明确改为“图文草稿编辑”。 |
| OC 老工程引用 | 同步公共头与主工程对应实现，删除已移除网络源文件的 membership exception；保持原有主工程集成形态。 |

OC 新工程三组未跟踪空目录已逐层通过 `rmdir` 移除：

- `JobsByPods/JobsAppEnvironmentRibbon@Pods/`
- `JobsByPods/JobsSwiftComment@Pods/`
- `JobsByPods/JobsSwiftSearcher@Pods/`

旧工程的 `JobsOCBaseConfigDemo/🔨Manual_Add_ThirdParty（按需引入）/VPN/JobsVPN.{h,m}` 位于明确排除的手工第三方区，本轮未删除；自维护的 JobsOCTools 公开头已撤销其导出。该位置不属于原报告的 OC 新工程待删除源码范围。

## 四、保留的有效模块 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- **OC JobsOCDSL**：有完整分类实现，保留；不能因为与 Swift 空兼容入口同名就一起删除。
- **Swift PDFKit / QuartzCore / WebKit / MetalKit 桥接**：真实重导出 JobsSwiftDSL，宿主仍使用相关模块。
- **OC FSCalendarExtra、This、JobsGetWindow、JobsOCProtocols**：分别承载 inline 工厂、分类基类、头文件工具和协议，符合自身职责。
- **默认委托、抽象基类钩子、平台条件回退**：空实现有明确合同，不属于此次未交付功能。

## 五、集成与验证 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- Swift 5 个修改源码的 `swiftc -frontend -parse`、规格的 `ruby -c`、公共代码块的 `plutil -lint` 通过；相关 README 本地链接检查通过。
- Swift 已使用现有 [**CocoaPods**](https://cocoapods.org/) 纯模式离线刷新：锁文件中的旧 Timer 子规格移除，14 个已删除文件的 Sources 引用清理，真实 Pods 工程重新可读；锁文件与 Manifest 一致。
- OC 新工程同样完成纯模式离线刷新；两侧锁文件与 Manifest 一致，全部自建 Pod target 存在，没有缺失源码引用。Swift / OC 新工程的原生依赖报告各 8 个产物重新生成。
- **9 个受影响 Pod 的 Debug 模拟器编译均通过**：Swift 的 JobsSwiftDSL、BRPickerViewSwift、JobsSwiftBaseTools、JobsSwiftStandardLibrary、JobsByPhotosUI；OC 的 JobsBlock、JobsOCDefs、JobsOCTools、YTKNetworkExtra。
- 三个宿主采用临时工程副本编译相同源码，调整临时输入路径与生成输出位置，并移除会清理原 `build/` 的 IPA 打包阶段；ObjectBox、图标绶带和 Markdown 打包输出位于临时目录。
- **Swift、OC 新、OC 老三个宿主的 Debug / arm64 Simulator 编译及链接均通过，退出码均为 0**。Swift 宿主及扩展通过，临时 Sourcery 输入的 282 份源码与原文件散列一致；OC 新、旧分别完成 348、1372 个宿主对象。旧 OC 临时验证额外传入 `GCC_PRECOMPILE_PREFIX_HEADER=YES` 并使用 6 个并发任务，实际工程未写入该选项，不能把此结果描述成原默认配置的冷编译验收。
- 独立复核确认 OC 编辑、选图、草稿调用和返回链保留，附件相关调用与公开引用清理完整。未执行页面运行验收。旧工程未修改的 `NSObject+Data.m` 仍有 `saveData:withDocumentsChildDir:fileFullname:error:` 缺少实现的编译警告；此次构建通过不能证明草稿保存运行正常，未据此新增删除。
- 旧宿主 Markdown 打包完成，但统计 8 个缺失资源项：5 个未修改文档中的截图、README 既有 `TODO` 链接、带 `+` 图片名的解析误报，以及并行源选择脚本 README 的目录链接。均不指向本轮删除文件；旧 `libstdc++` 的 arm64 忽略警告也保留，本轮未修复这些独立问题。
- 首轮模块编译产生的额外 `build/` 目录已移到系统临时目录，原有 IPA 散列保持一致。Swift 图标阶段曾生成被 `.gitignore` 排除的绶带缓存，跟踪资源无新增差异；后续生成输出已隔离，没有覆盖或清理用户原缓存。
- 验证摘要、退出码、完整构建日志和原文件散列核对记录位于系统临时目录 `jobs-empty-shell-cleanup-20261016/integration/`；`verification-summary.json` 汇总三个宿主、9 个 Pod 和依赖图检查，`oc-old-build-result.json` 保留旧宿主的独立验收细节。三个工程最终 `git diff --check` 均通过。
- 根 README、SwiftDoc、相关 OC 文档和 Pod README 随当前能力同步；2026-10-05 的审阅、编译日志和 Acceptance / StaticValidation JSON 保留为历史证据，没有改写成本轮测试结果。
- 不创建提交、不推送；保留用户已有和并行修改的 Podfile、Flutter 脚本、CocoaPods 源选择脚本与其它变更。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
