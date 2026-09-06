# `JobsSwiftPatch`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftPatch` 是 Jobs Swift 工程里的本地 Runtime Patch Pod。第一版只支持把 Objective-C runtime 可见的方法临时替换为本地 payload 返回方法，并提供 rollback 能力。

## 一、Pod 定位

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsSwiftPatch` |
| Pod 类型 | 自建本地 Swift Pod |
| 版本 | `0.0.1` |
| 平台 | `ios 12.0` |
| podspec | `JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.podspec` |

## 二、适用场景

- Swift Demo 演示 Runtime 热更新思想。
- 页面级临时 patch：进入页面安装，离开页面 rollback。
- 后续可扩展网络补丁、签名校验、白名单 selector 和脚本解释层。

## 三、公开能力

- `JobsSwiftPatchModel`：描述 patch 的 identifier、target class、selector 和 payload。
- `JobsSwiftPatchMgr`：安装、回滚、查询 patch。

## 四、风险说明

- 当前能力属于高风险 Runtime 演示能力，不建议提交 App Store。
- 第一版只支持 payload provider，不支持任意 Swift/ObjC 消息派发或 JS 脚本执行。
- 被替换方法必须暴露给 Objective-C runtime，且返回类型应与 payload block 一致。

<a id="jobs-architecture"></a>

## 五、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 5.1、设计目的与职责划分

以 PatchModel 描述目标与 payload，由管理器保存原始实现、安装受限方法替换并按标识查询和回滚。当前是 Runtime 演示，不是通用脚本热更新系统。

### 5.2、运行脉络

配置补丁模型 → 核对目标方法 → 保存原实现并安装 → 调用取得 payload → 回滚恢复

### 5.3、关键设计与边界

- 目标方法必须暴露给 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) runtime，纯 [**Swift**](https://www.swift.org/) 静态派发方法不能按同样方式替换。
- 返回值与 payload block 签名必须匹配，当前不支持任意消息派发或 JS 脚本执行。
- 标识、目标方法和原始 IMP 的对应关系决定回滚是否正确，不应覆盖后丢失原记录。
- 保留原文的高风险演示边界，不将这一能力扩大成生产热更新承诺。

### 5.4、阅读与重建顺序

先读 Model 与支持的签名，再看 installPayloadPatch 的记录、查询和 rollback。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftPatch.swift](<./JobsSwiftPatch.swift>)

依赖与编译入口：[JobsSwiftPatch.podspec](<./JobsSwiftPatch.podspec>)。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
