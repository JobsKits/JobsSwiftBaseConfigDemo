# `JobsOCDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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
