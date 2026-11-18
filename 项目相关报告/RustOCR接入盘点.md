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
- [六、中英混排核心与源码状态](#mixed-script-source-20261117)
- [七、同提交远端与实屏验收](#ci-app-ui-95cd)

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

本节保留前期预编译包批次记录；最新冻结提交 `95cd833` 的完整远端与实屏结果见[同提交验收](#ci-app-ui-95cd)。该提交不提供 `--jobs-ocr-output` JSON 导出，本轮以页面全文、真实剪贴板和测试附件核验，不沿用早期导出参数。

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
| 输入操作 | 原图预览下提供样本、相册、真实相机拍照 | 默认内置样本；取消或拒绝保留既有图片和结果；不保存相册；源码已实现；95cd工件已验系统相机／相册打开取消及结果保留，实体拍照仍待验 |
| 整页浏览 | 单一外层纵向滚动，结果自适应撑高并支持选中文字 | 结果区没有独立滚动；不新增持久偏好；95cd工件已验从结果区域拖动带动整页，选中文字的长按交互未单独验收 |
| 识别主动作 | 44–48pt紧凑开始／取消；结果标题旁快捷复制 | 识别期间禁止替换输入，复制当前结果；保留请求代际与离页取消；95cd工件已验真实识别、紧凑主按钮与全文剪贴板比对，运行中点击取消仍待实屏 |
| 外观与语言 | 白天操作底色和文字清晰成对，宿主十语与三主题 | OCR不另建主题偏好；2026-11-17宿主唯一入口／Settings三选、Scene真实trait接线已实现；显式选择种类保留同名system等旧主题，生产Theme源真实iOS编译与6项隔离XCTest通过，11词库有效；95cd完整workflow与三主题实屏通过，十语逐项切换／窄屏／大字仍待验，配色数值见下 |
| 相机边界 | 可用性和权限检查，使用真实camera sourceType | 无相机／拒绝提供明确提示及重试或系统设置入口；取消不清空原状态；真机拍摄另验 |

UIKit：真实 iOS 27.2 Simulator SDK、真实 SnapKit 源码及生产 NSObject 工厂参与的独立类型检查通过；宿主 BaseVC／主题／既有 Jobs DSL／OCR 适配器使用最小接口夹具，因此不把该结果视为主工程整包构建或真实 OCR 验收。源码 parse 与 11 份现有语言资源 plutil 通过。

配色：实际 UIKit trait 解析＋WCAG 亮度计算，输入／复制按钮白天黑字＋`#E5E5EA` 为16.727:1、黑夜白字＋`#2C2C2E` 为13.937:1；主动作白字＋`#1565C0` 两主题均5.746:1。SwiftUI状态文字白天0.33灰／系统分组底为6.770:1、黑夜0.78灰／黑底为12.410:1。UIKit title transformer 与 SwiftUI ButtonStyle 明确保留禁用文字前景，不依赖默认变淡；95cd工件的白天／黑夜／跟随系统正常态已实看，禁用态像素仍待验，不把颜色计算写为禁用态 UI 已验。

仍待：十语逐项切换、窄屏与大字、运行中点击取消、选中文字长按、相机不可用／拒绝提示，以及实体设备拍照与权限回路；不会用模拟器相机界面冒充实体相机采集成功。

## 六、<span id="mixed-script-source-20261117">中英混排核心与源码状态</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

当前[随仓源码](<../JobsByPods/JobsRustOCR@Pods/Source/JobsOCR>)已同步本机验收通过的中英混排路由，包含 `pipeline.rs`、`runtime.rs`、`lib.rs`、`routing.rs`、独立 E2E 测试和 `MixedScript` 夹具。核心常规测试 30 项、显式 E2E 1 项覆盖 8 张真实夹具（其中 4 张精确逐行控制）通过；范围与证据见[共享核心回归记录](<../../../OCR/项目相关报告/混排回归/README.md>)。

本状态确认核心本机回归及随仓源码一致；本宿主尚未使用此次新核心重编、运行，原有 35 行样本／界面／Workflow 记录仍限原批次。使用新核心前先运行[SDK 本地构建入口](<../JobsByPods/JobsRustOCR@Pods/Scripts/BuildRustOCR.command>)，源码输入哈希变化会使旧库缓存失效；保留本地构建方式，不分发自建 `.a`。显式 E2E 需指定本机 ORT 与随 SDK 的模型目录。

## 七、<span id="ci-app-ui-95cd">同提交远端与实屏验收</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

冻结提交为 `95cd833ca26844e027127aea3312d89f0910e4bf`；[**GitHub Actions**](https://docs.github.com/en/actions) 的[完整运行 44004349559](https://github.com/JobsKits/JobsSwiftBaseConfigDemo/actions/runs/44004349559) 与下载后实际运行的 App 属于同一提交。本节不外推到上节后继混排源码，原源码交付合同及混排回归记录保持原范围。

| 验收项 | 实际结果 |
| --- | --- |
| 远端全部门禁 | 完整 workflow / 唯一 job 成功；含源码 OCR 构建、全部自有 Pod 构建、134 项 Stability 测试（含三主题 6 项）、主 App／测试包构建、hosted UIKit／计时器回归、打包上传 |
| 工件身份 | artifact `14299826276`；外层 ZIP SHA256 `a96ecb6ff6479712fa4de3c1d99f35b546b1f4cee74a8baf5e0b12ce50dc788e` 与官方记录一致；ARM64 / iOS Simulator；主可执行文件及真正 App 代码的 debug dylib 安装前后哈希一致，无重签 |
| 实屏环境 | 新专用 iPhone 17 Pro / iOS 27.2，`C76C5014-150B-4B02-B6A1-6D2D9657F40A`；原 F5 已被用户清理，不沿用其状态 |
| 页面入口 | 既有 DEBUG 注册工厂建立 RootListVC → JobsRustOCRDemoVC 导航栈，再操作生产页面和真实主题菜单；未注入主题或伪造 OCR 结果 |
| 真实识别 | 包内样例实际识别 35 行、1326 字符；本次耗时 390 ms，核心显示 `jobs-rust-ocr/0.1.0` |
| 整页与全文复制 | 结果区域拖动带动整页；系统剪贴板 2936 UTF-8 字节与页面全文逐字一致，SHA256 `290a01ed34c536ea7f07bb220268fa814af767c3d796856d2b9048ef83005cdc` |
| 三主题 | 实际菜单选择白天／黑夜／跟随系统；真实系统外观 light → dark → light 热切换，持久 mode／selectionKind 始终为 system，effective style 正确变化；结果保留 |
| 系统媒体入口 | 实际打开原生照片相机和相册，取消后原图与识别结果保留；没有执行实体相机采集 |
| 用例与恢复 | 1 项完整 UI case，75.392 秒、0 失败；host driver 成功，设备恢复到实读的初始 light，App／Host／Runner 均已退出 |

[验收 manifest](<RustOCR集成/主题验收/验收manifest.json>) 保存工件、App 代码、剪贴板和截图哈希，以及设备初始／恢复、测试范围与待验边界。完整原始 xcresult、case log、driver、剪贴板正文及身份回执保留于本机 Codex 当前任务 evidence。以下 PNG 从原始测试附件直接复制，未修饰；系统相册及取消截图可能包含宿主既有 Debug deinit 提示，不将其当作 OCR 状态。

| 现场 | 原始截图 |
| --- | --- |
| 白天识别 | [白天识别](<RustOCR集成/主题验收/白天识别.png>) |
| 手动黑夜 | [黑夜识别](<RustOCR集成/主题验收/黑夜识别.png>) |
| 跟随系统黑夜／白天 | [系统黑夜](<RustOCR集成/主题验收/跟随系统-黑夜.png>)、[系统白天](<RustOCR集成/主题验收/跟随系统-白天.png>) |
| 整页拖动 | [整页滚动](<RustOCR集成/主题验收/整页滚动.png>) |
| 相机／相册与取消 | [系统相机](<RustOCR集成/主题验收/系统相机.png>)、[系统相册](<RustOCR集成/主题验收/系统相册.png>)、[取消保留结果](<RustOCR集成/主题验收/取消保留结果.png>) |

<a id="🔚" href="#前言">返回前言</a>
