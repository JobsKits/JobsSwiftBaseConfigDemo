# `JobsOCDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

## 🔥 <font id=前言>前言</font>

当前 Swift 检出里的 `JobsOCDSL` 是 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) DSL **兼容聚合入口**。此前仅有总头和指向缺失 Core / Support / JobsPodspecKit 的 Podspec；现已按本目录真实交付形态修正，能够独立编译。完整 OC 分类仍归 OC 工程同名 Pod 管理，本目录没有复制那套实现。

## 一、目录与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCDSL@Pods/
├── JobsOCDSL.h
├── JobsOCDSL.m
├── JobsOCDSL.podspec
└── README.md
```

默认 `Core` 子规格交付总头与能力函数，仅依赖系统 Foundation / UIKit。不存在的 JobsBlock、JobsOCDefs、JobsOCProtocols、MJRefresh、Texture 和辅助脚本不再被声明为已交付分类的必要依赖。未来真正移入分类时，必须同时补公开头、唯一实现和直接依赖，不能只把能力宏设为 1。

## 二、调用与能力检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NSArray<NSString *> *delivered = JobsOCDSLAvailableCategoryNames();
NSLog(@"JobsOCDSL %@: %@", JobsOCDSLDeliveryVersion, delivered);
```

当前 `delivered` 为**空数组**，`JOBS_OCDSL_HAS_*` 全部为 0，表示没有分类实现。引入总头不再编译失败，也不等于 `UIView.byXxx` 等 OC DSL 已恢复。原来本就无法编译的分类调用方应依赖完整 OC 工程库，或在 Swift 工程使用 JobsSwiftDSL；不要在业务层凭宏猜测 selector。

<a id="jobs-architecture"></a>

## 三、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

总头逐个核对分类公开头是否存在 → 编译期生成能力宏 → 实现函数列出真实可用分类 → 消费者按能力选择功能。每个分类单独判断，避免仅发现 Texture 框架便引用缺失的 AS 分类头。

本库保留 `Core` 名称与聚合头路径，生产 source glob 明确排除测试、示例和临时目录。没有 `Core` 分类文件时仍可编译入口；将来新增同名分类需检查全进程唯一实现及 ARC / Block 返回合同。

## 四、独立编译验收 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

从 Swift 宿主工程根目录执行：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsOCDSL --skip-host
```

该 Pod 未加入当前宿主依赖。验证器为它创建临时消费工程，执行 CocoaPods 安装，再以真实 JobsOCDSL Scheme 编译与链接；产物和日志均放在临时目录。全量验收也包含此步骤，但不把兼容入口编译成功写成完整分类功能通过。


## 五、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

每个显式 subspec 同步继承生产排除集合，避免只消费子模块时带入测试/示例源码。

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsOCDSL --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
