# `JobsOCDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

`JobsOCDSL` 用于集中管理 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 链式 DSL 分类，避免各个本地 Pod 重复携带同一批 `+DSL` 文件。

## 一、适用场景

- 系统类或三方基础类的点语法链式配置。
- 需要依赖 `JobsBlock` 全局 Block typedef 的 OC DSL。
- 从业务 Pod 中剥离 DSL，让使用者可以按需依赖。

## 二、目录结构

```text
JobsOCDSL@Pods/
├── Core/
│   ├── UIKit/
│   └── ThirdParty/Texture/
├── JobsOCDSL.h
├── JobsOCDSL.podspec
└── README.md
```

## 三、依赖关系

- `JobsBlock`：提供 DSL 需要的 Block 类型。
- `JobsOCDefs`：提供宏、枚举和通用定义。
- `JobsOCProtocols`：提供部分 UIKit DSL 协议声明。
- `MJRefresh` / `Texture`：只服务当前已迁入的对应 DSL 分类。

## 四、引用方式

```objc
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
```

## 五、风险说明

后续迁移其它 `+DSL` 文件时，要先确认它是否只负责 DSL。若文件同时依赖业务 Support 能力，应先拆出纯 DSL 部分，避免把非 DSL 支撑代码塞进本 Pod。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分

当前 [**Swift**](https://www.swift.org/) 仓库里的这个目录保留 OC DSL 的总头文件和 Podspec 定义，设计上用于收口 Foundation、UIKit 及可选 Texture 的链式分类。核对当前目录后，未发现总头文件引用的 Core 分类实现。

### 6.2、运行脉络

Podspec 声明 Core 源码路径 → 总头文件引用分类 → 实际接入前核对对应实现是否存在

### 6.3、关键设计与边界

- 这是当前检出的不完整入口，不能仅凭总头文件列出的 import 宣称这些分类在本目录都已实现。
- 重建时可参照 OC 新项目中同名库的职责，但必须明确移入哪些自维护分类，不能把另一仓库的实现视为本目录已有内容。
- Texture 分类通过头文件可用性条件引用；仍需同时检查 podspec 的实际依赖声明。
- 文档仅解释当前入口和缺失边界，不以总头文件或依赖声明保证这个目录可独立编译。

### 6.4、阅读与重建顺序

先对照 JobsOCDSL.h 的引用和 podspec 的 Core glob，再确认是否具备实际分类文件，最后才设计补齐顺序。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCDSL.h](<./JobsOCDSL.h>)

依赖与编译入口：[JobsOCDSL.podspec](<./JobsOCDSL.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsOCDefs`、`JobsOCProtocols`、`MJRefresh`、`Texture`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
