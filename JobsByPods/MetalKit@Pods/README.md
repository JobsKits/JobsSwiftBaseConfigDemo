> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。


## DSL 迁移说明

- 本 Pod 原有的链式 DSL / 点语法封装已经抽离到 `JobsSwiftDSL`。
- 继续使用 `byXxx(...)`、`dsl { ... }` 这类语法时，请在调用文件显式 `import JobsSwiftDSL`。
- 本 Pod 保留薄桥接文件和 `JobsSwiftDSL` 依赖，用于兼容旧代码的过渡期。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

这个本地 Pod 保留 JobsSwiftMetalKit 模块入口，原有 MetalKit 对象 DSL 已迁到 JobsSwiftDSL。当前目录并不实现 GPU 渲染管线或 Shader 引擎。

### 1.2、运行脉络

引入兼容模块 → 到 JobsSwiftDSL 获取 MetalKit 扩展 → 配置系统对象 → 宿主执行渲染

### 1.3、关键设计与边界

- 本地 Pod 名 MetalKit 与系统框架名称相同，理解依赖时需区分本地包装和 Apple 系统框架。
- 重建应恢复桥接关系和所需配置入口，不要凭空新增着色器、资源管理或渲染循环。
- 调用 byXxx 等方法按原文显式导入 JobsSwiftDSL，并核对实际可用系统类型。

### 1.4、阅读与重建顺序

先读 JobsSwiftMetalKit.swift 和 podspec，再看 JobsSwiftDSL/MetalKit 下的扩展。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftMetalKit.swift](<./JobsSwiftMetalKit.swift>)

依赖与编译入口：[JobsSwiftMetalKit.podspec](<./JobsSwiftMetalKit.podspec>)。其中显式依赖声明包括 `JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
