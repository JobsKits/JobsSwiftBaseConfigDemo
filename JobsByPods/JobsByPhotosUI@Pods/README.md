> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。


## DSL 迁移说明

- 本 Pod 原有的链式 DSL / 点语法封装已经抽离到 `JobsSwiftDSL`。
- 继续使用 `byXxx(...)`、`dsl { ... }` 这类语法时，请在调用文件显式 `import JobsSwiftDSL`。
- 本 Pod 保留薄桥接文件和 `JobsSwiftDSL` 依赖，用于兼容旧代码的过渡期。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

当前以 PhotosUI DSL 的兼容桥接为主，相关配置已迁往 JobsSwiftDSL。目录中还保留 PHPicker 与 PhotosPicker 若干类型的扩展占位文件；它们不等于已完成的相册选择业务流程。

### 1.2、运行脉络

宿主配置系统选择器 → 使用 JobsSwiftDSL 中实际存在的扩展 → 宿主接收并处理选择结果

### 1.3、关键设计与边界

- 必须区分桥接文件、已有扩展和 TODO 占位，不能将占位描述为可调用能力。
- 选择器配置、选择结果加载与相册权限属于不同环节；本目录不能被重建成自动完成这些环节的统一引擎。
- PHPicker 与 SwiftUI PhotosPicker 的类型及系统可用性不同，不能仅凭名称互相替换。

### 1.4、阅读与重建顺序

先读桥接文件，再核对各扩展正文和 JobsSwiftDSL 中的实际实现；没有实现的部分维持明确边界。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsByPhotosUIDSLBridge.swift](<./JobsByPhotosUIDSLBridge.swift>)
- [PHPickerFilter.swift](<./PHPickerFilter.swift>)
- [PHPickerResult.swift](<./PHPickerResult.swift>)
- [PhotosPickerStyle.swift](<./PhotosPickerStyle.swift>)
- [PHPickerCapabilities.swift](<./PHPickerCapabilities.swift>)

依赖与编译入口：[JobsByPhotosUI.podspec](<./JobsByPhotosUI.podspec>)。其中显式依赖声明包括 `JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
