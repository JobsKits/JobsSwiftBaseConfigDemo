> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。


## DSL 迁移说明

- 本 Pod 原有的链式 DSL / 点语法封装已经抽离到 `JobsSwiftDSL`。
- 继续使用 `byXxx(...)`、`dsl { ... }` 这类语法时，请在调用文件显式 `import JobsSwiftDSL`。
- 本 Pod 保留薄桥接文件和 `JobsSwiftDSL` 依赖，用于兼容旧代码的过渡期。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

当前目录是 PDFKit DSL 迁移后的兼容入口。原来的系统对象链式配置已归入 JobsSwiftDSL，本 Pod 保留桥接文件与依赖关系，不独立实现 PDF 文档解析或页面渲染。

### 1.2、运行脉络

宿主选择兼容 Pod → 引入 JobsSwiftDSL → 对系统 PDFKit 对象进行配置

### 1.3、关键设计与边界

- 重建目标应是兼容入口及模块关系，不要根据 Pod 名称凭空补出 PDF 引擎。
- 调用侧按原文显式导入所需模块，不能假定依赖声明自动等于所有符号都被重新导出。
- 真正需要复原的 DSL 应追到 JobsSwiftDSL 的对应系统框架扩展，避免重复定义同名方法。

### 1.4、阅读与重建顺序

先看 JobsByPDFKitDSLBridge.swift 与 podspec，再追 JobsSwiftDSL 中 PDFKit 的实现。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsByPDFKitDSLBridge.swift](<./JobsByPDFKitDSLBridge.swift>)

依赖与编译入口：[JobsByPDFKit.podspec](<./JobsByPDFKit.podspec>)。其中显式依赖声明包括 `JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
