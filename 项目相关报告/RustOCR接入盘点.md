# Swift UIKit Rust OCR Demo 接入

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、入口与行为](#entry)
- [二、SDK 装配合同](#sdk)
- [三、验证状态](#verification)
- [四、源码交付与本地编译](#source-delivery)
- [五、拍照输入与整页操作](#capture-page-20261116)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

核查日期：2026-11-16。本页登记共享 Rust OCR SDK 的宿主接线与验收状态。原有其它 Demo、首页交互和未提交修改继续保留。

## 一、<span id="entry">入口与行为</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 资产 | 当前接线 |
| --- | --- |
| 入口 | 系统能力与硬件通信 → Rust OCR 离线识别 |
| 页面源码 | `../JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@RustOCR/JobsRustOCRDemoVC.swift` |
| 核心归属 | `JobsByPods/JobsRustOCR@Pods`，共享 Rust 核心的 Apple 封装 |
| 输入 | 包内真实样例、相册照片、设备真实相机拍照；权限与真机验收见本批记录 |
| 操作 | 开始离线识别；运行中改为取消；空态可重新加载 |
| 输出 | 真实识别文本、耗时和核心版本；整页滚动、文本选择及快捷复制 |
| 默认 | 内置样例；默认不自动运行、不联网 |
| 持久化 | 图片与结果只保存在页面内存，不写相册或用户数据库 |
| 生命周期 | 离开页面／退后台取消；请求代际门禁丢弃取消后或过期回调；相机权限回调只呈现仍可见页面 |
| 语言与主题 | 跟随宿主十语言与白天／黑夜／跟随系统选择，运行状态和空态同步翻译 |
| 缺少 SDK | 明确显示“OCR 核心尚未安装”，不生成模拟成功结果 |

## 二、<span id="sdk">SDK 装配合同</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- `Podfile.deps` 在本地 podspec 和 XCFramework 都存在时注册 `JobsRustOCR`；宿主适配器通过 `canImport` 判断真实模块。完整包安装后自动调用原生封装，不需要切换演示模式。
- SDK 接口为 `coreVersion()`、`sampleImage()`、`image(from:)`、`recognize(image:completion:)` 与 `cancel()`，资源位于 `JobsRustOCRResources.bundle`。识别完成回调由 SDK 送回主队列。
- `JobsOCRSDKAdapter` 只负责模块可用性和跨语言调用，不实现另一套识别算法。不能将模块缺失、资源缺失或推理错误视为成功。
- 图片和模型均在设备本地处理，此 Demo 不走网络 API。识别依赖模型权重的字符范围和能力，不能将界面十语支持等同所有文字都可识别。

## 三、<span id="verification">验证状态</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 项目 | 状态 |
| --- | --- |
| Demo 源码与目录入口 | 已实现 |
| 缺模块适配器 | 已通过独立模拟器 SDK 类型检查；缺模块明确错误 |
| 十语词条、字符串格式、依赖声明 | 已静态检查 |
| 原生 SDK 复制与 CocoaPods 装配 | 规范完整包已 APFS clone；纯 pod install 成功，含模型、三平台 XCFramework 与原始许可 |
| 主工程构建 | 原 workspace Debug arm64 模拟器构建成功；140 个依赖框架及主 App 全部通过 |
| iOS 模拟器真实识别 | 专用 iPhone 17 Pro / iOS 27.2 已验：35 行、1326 字符、约 711 ms；真实 JSON 和页面截图已保存 |
| iOS 真机真实识别 | 待验：当前真机不可用，不以模拟器代替 |
| 十语三主题实屏与极端字号 | 待验 |

自动验收可在正常 App 构建后用 `--jobs-coverage-route JobsRustOCRDemoVC --jobs-ocr-auto --jobs-ocr-output ocr-probe.json` 进入该页面并触发内置样例的真实推理。显式给出相对输出文件名时，JSON 保存到 App 沙盒 Documents；也支持调用方明确指定的绝对路径。正常使用不保存结果文件。该参数不替换模型或识别结果；应核对 JSON 的 `ok`、真实文本、文字行和核心版本，而非只看进程启动。

实际证据位于 OCR 仓库 `测试/报告与证据/iOS/SwiftUIKit`；App 冻结在 `交付/iOS/SwiftUIKit`。页面截图已实看，原图、完成状态、核心版本和下方韩文结果可见；既有宿主首次通知授权框覆盖中部，CUA 未能绑定 Simulator，因此未把无遮挡全交互、通知选择或完整主题语言矩阵标记为通过。该弹窗不影响已经完成的真实 OCR。

构建曾因磁盘门禁主动中断；保留原 DD 增量后恢复。现有 `my_flutter` 的旧生成配置与当前已安装 SDK 不匹配，已用官方 `flutter pub get --offline` 重建必要配置（依赖锁文件调整、业务源码与第三方 SDK 源码未改），修复证据在 OCR `项目相关报告/UIKit内置Flutter依赖修复`。最终构建与真实识别通过后，临时 DD 已回收。

## 四、<span id="source-delivery">源码交付与本地编译</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

2026-11-16 用户确认五个 Demo 全部交付自有源码；此前预编译包构建和设备结果保留为历史批次证据。当前交付改造先登记、后分发和验证。

| 资产 | 当前合同 | 默认／持久化／生命周期与验证 |
| --- | --- | --- |
| 自有核心源码 | SDK 的 `Source/JobsOCR` 包含 Cargo 清单、锁文件、src、C接口、测试与许可 | 不依赖开发机外部OCR目录；源码可直接研究修改；六SDK的21份Source／Scripts／忽略规则逐字节同源，自检与Cargo.lock可见性已验 |
| 构建入口 | [BuildRustOCR.command](<../JobsByPods/JobsRustOCR@Pods/Scripts/BuildRustOCR.command>)；[参数及依赖](<../JobsByPods/JobsRustOCR@Pods/Scripts/README.md>) | 先手动运行再执行原有pod install／构建；CI显式--non-interactive；源码变化后重新执行 |
| 本地产物 | `Frameworks/JobsOCRCore.xcframework` 的.a与 `.build-rust-ocr/` 缓存 | Git忽略；当前暂存中的自建.a精确移除并保留本地文件；不擅自重写历史 |
| 第三方与模型 | 锁定官方ONNX Runtime 1.24.2 ZIP并核对SHA；原模型／许可继续随资源bundle分发 | 自有Rust本地编译与第三方官方依赖下载分别声明；首次构建可能联网，准备完可显式离线 |
| 运行行为 | 既有入口、手动识别、取消、真实结果、错误重试、十语三主题 | 默认值、偏好和生命周期沿原合同，不新增假识别回退；本批实际构建及运行另记 |
| GitHub验收 | 五个Demo分别核对本批实际提交与全部必需workflow | 本地检查、远端运行和旧证据分别记账；未完成前不写通过 |

从本项目根目录构建核心：

```shell
/bin/zsh "JobsByPods/JobsRustOCR@Pods/Scripts/BuildRustOCR.command" --yes
```

本批源码验证：共享包与Flutter iOS SDK副本均已实际用Rust1.95.0完成五Apple目标编译、组合XCFramework及原库保留；六SDK源码／脚本同源检查、自检、Cargo.lock不会被OC的*.lock误忽略、Git索引无自建.a均通过。21项核心测试与7组失败／迁移检查见共享OCR的源码交付报告；其它宿主本批UI改造后的构建及远端Workflow仍须各自验收，不外推上述构建。


## 五、<span id="capture-page-20261116">拍照输入与整页操作</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

2026-11-16 用户确认本批改造；先登记，实际实现和验证分开回填。

| 资产 | 本批合同 | 默认／持久化／生命周期／当前状态 |
| --- | --- | --- |
| 输入操作 | 原图预览下提供样本、相册、真实相机拍照 | 默认内置样本；取消或拒绝保留既有图片和结果；不保存相册；源码已实现；实际相机／交互另验 |
| 整页浏览 | 单一外层纵向滚动，结果自适应撑高并支持选中文字 | 结果区没有独立滚动；不新增持久偏好；源码已实现；实际相机／交互另验 |
| 识别主动作 | 44–48pt紧凑开始／取消；结果标题旁快捷复制 | 识别期间禁止替换输入，复制当前结果；保留请求代际与离页取消；源码已实现；实际相机／交互另验 |
| 外观与语言 | 白天操作底色和文字清晰成对，宿主十语与三主题 | OCR不另建主题偏好；2026-11-17宿主唯一入口／Settings三选、Scene真实trait接线已实现；生产Theme源真实iOS编译与5项隔离XCTest通过，11词库有效；新SHA整包／实屏待验，配色数值见下 |
| 相机边界 | 可用性和权限检查，使用真实camera sourceType | 无相机／拒绝提供明确提示及重试或系统设置入口；取消不清空原状态；真机拍摄另验 |

UIKit：真实 iOS 27.2 Simulator SDK、真实 SnapKit 源码及生产 NSObject 工厂参与的独立类型检查通过；宿主 BaseVC／主题／既有 Jobs DSL／OCR 适配器使用最小接口夹具，因此不把该结果视为主工程整包构建或真实 OCR 验收。源码 parse 与 11 份现有语言资源 plutil 通过。

配色：实际 UIKit trait 解析＋WCAG 亮度计算，输入／复制按钮白天黑字＋`#E5E5EA` 为16.727:1、黑夜白字＋`#2C2C2E` 为13.937:1；主动作白字＋`#1565C0` 两主题均5.746:1。SwiftUI状态文字白天0.33灰／系统分组底为6.770:1、黑夜0.78灰／黑底为12.410:1。UIKit title transformer 与 SwiftUI ButtonStyle 明确保留禁用文字前景，不依赖默认变淡；这部分的实屏／禁用态像素验收仍待专用设备，不把颜色计算写为 UI 已验。

仍待：本批长结果整页滚动、复制到真实剪贴板、三主题／十语／窄屏与大字实屏、相机不可用提示及实体设备拍照／拒绝／取消；不会用模拟器冒充实体相机成功。

<a id="🔚" href="#前言">返回前言</a>
