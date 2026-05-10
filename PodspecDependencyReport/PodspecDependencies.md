# Podspec 依赖分析报告
![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")
[toc]

## 🔥 <font id=前言>前言</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 此文件由脚本自动运行分析得出
- 分析目录：`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo`
- 生成时间：`2026-05-06 21:03:05`
- Podspec 数量：`39`
- 0 下游依赖 Pod 数量：`9`
- 全部依赖边数量：`143`
- 仓库内 Pod 依赖边数量：`95`
- Pod 间循环依赖数量：`0`
- 已过滤同 Pod 内部 subspec 依赖数量：`4`
- 外部依赖来源注释文件数量：`3`
- 已识别外部依赖来源链接数量：`63`
- DSL 执行式解析 Podspec 数量：`39`
- 静态兜底解析 Podspec 数量：`0`

> 更易读的动态关系图见：`PodspecDependencies_interactive.html`。

## 一、总览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| Pod | Podspec | 下游依赖数量 | 下游依赖 | 上游依赖数量 | 上游依赖方 |
|---|---|---:|---|---:|---|
| [**BRPickerViewSwift**](#BRPickerViewSwift) | `JobsByPods/BRPickerViewSwift@Pods/BRPickerViewSwift.podspec` | 2 | [JobsByUIKit](#JobsByUIKit), [SnapKit](https://github.com/SnapKit/SnapKit) | 0 |  |
| [**Flutter**](#Flutter) | `my_flutter/.ios/Flutter/Flutter.podspec` | 0 |  | 2 | [**FlutterPluginRegistrant**](#FlutterPluginRegistrant), [**JobsSwiftTools**](#JobsSwiftTools) |
| [**FlutterPluginRegistrant**](#FlutterPluginRegistrant) | `my_flutter/.ios/Flutter/FlutterPluginRegistrant/FlutterPluginRegistrant.podspec` | 1 | [Flutter](#Flutter) | 1 | [**JobsSwiftTools**](#JobsSwiftTools) |
| [**JobsBy3rdTools**](#JobsBy3rdTools) | `JobsByPods/JobsBy3rdTools@Pods/JobsBy3rdTools.podspec` | 18 | [BMPlayer](https://github.com/BrikerMan/BMPlayer), [GKNavigationBarSwift](https://github.com/QuintGao/GKNavigationBarSwift), [JXSegmentedView](https://github.com/pujiaxin33/JXSegmentedView), [JobsByUIKit](#JobsByUIKit), [JobsInheritance](#JobsInheritance), [JobsScale](#JobsScale), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBaseTools](#JobsSwiftBaseTools), [JobsSwiftMetalKit](#JobsSwiftMetalKit), [JobsSwiftStandardLibrary](#JobsSwiftStandardLibrary), [JobsSwiftTools](#JobsSwiftTools), [JobsTextTools](#JobsTextTools), [Kingfisher](https://github.com/onevcat/Kingfisher), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [SDWebImage](https://github.com/SDWebImage/SDWebImage), [SnapKit](https://github.com/SnapKit/SnapKit), [SwiftEntryKit](https://github.com/huri000/SwiftEntryKit), [YTKNetwork](https://github.com/kanyun-inc/YTKNetwork) | 1 | [**JobsSwiftAppTools**](#JobsSwiftAppTools) |
| [**JobsByPDFKit**](#JobsByPDFKit) | `JobsByPods/JobsByPDFKit@Pods/JobsByPDFKit.podspec` | 0 |  | 0 |  |
| [**JobsByPhotosUI**](#JobsByPhotosUI) | `JobsByPods/JobsByPhotosUI@Pods/JobsByPhotosUI.podspec` | 0 |  | 1 | [**JobsSwiftTools**](#JobsSwiftTools) |
| [**JobsByQuartzCore**](#JobsByQuartzCore) | `JobsByPods/JobsByQuartzCore@Pods/JobsByQuartzCore.podspec` | 2 | [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock) | 1 | [**JobsByUIKit**](#JobsByUIKit) |
| [**JobsByUIKit**](#JobsByUIKit) | `JobsByPods/JobsByUIKit@Pods/JobsByUIKit.podspec` | 20 | [ESPullToRefresh](https://github.com/eggswift/pull-to-refresh), [GKNavigationBarSwift](https://github.com/QuintGao/GKNavigationBarSwift), [JobsByQuartzCore](#JobsByQuartzCore), [JobsImageTools](#JobsImageTools), [JobsNavBar](#JobsNavBar), [JobsScale](#JobsScale), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [JobsSwiftTimer](#JobsSwiftTimer), [JobsTextTools](#JobsTextTools), [Jobsl10n](#Jobsl10n), [Kingfisher](https://github.com/onevcat/Kingfisher), [NSObject+Rx](https://github.com/RxSwiftCommunity/NSObject-Rx), [RxCocoa](https://github.com/ReactiveX/RxSwift), [RxRelay](https://cocoapods.org/pods/RxRelay), [RxSwift](https://github.com/ReactiveX/RxSwift), [SVGKit](https://github.com/SVGKit/SVGKit), [SkeletonView](https://github.com/Juanpe/SkeletonView), [SnapKit](https://github.com/SnapKit/SnapKit), [lottie-ios](https://github.com/airbnb/lottie-ios) | 19 | [**BRPickerViewSwift**](#BRPickerViewSwift), [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsByWebKit**](#JobsByWebKit), [**JobsCountdownButton**](#JobsCountdownButton), [**JobsEmptyView**](#JobsEmptyView), [**JobsGestureUnlock**](#JobsGestureUnlock), [**JobsInheritance**](#JobsInheritance), [**JobsLocalNotification**](#JobsLocalNotification), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsMarqueeView**](#JobsMarqueeView), [**JobsProgressBar**](#JobsProgressBar), [**JobsRefresher**](#JobsRefresher), [**JobsSwiftAppTools**](#JobsSwiftAppTools), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools), [**JobsSwiftDebugTools**](#JobsSwiftDebugTools), [**JobsSwiftFoundation**](#JobsSwiftFoundation), [**JobsSwiftTools**](#JobsSwiftTools), [**JobsSwiftWorker**](#JobsSwiftWorker), [**JobsToast**](#JobsToast) |
| [**JobsByWebKit**](#JobsByWebKit) | `JobsByPods/JobsByWebKit@Pods/JobsByWebKit.podspec` | 1 | [JobsByUIKit](#JobsByUIKit) | 1 | [**JobsInheritance**](#JobsInheritance) |
| [**JobsCountdownButton**](#JobsCountdownButton) | `JobsByPods/JobsCountdownButton@Pods/JobsCountdownButton.podspec` | 3 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftTimer](#JobsSwiftTimer) | 0 |  |
| [**JobsCryptoKit**](#JobsCryptoKit) | `JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit.podspec` | 0 |  | 0 |  |
| [**JobsEmptyView**](#JobsEmptyView) | `JobsByPods/JobsEmptyView@Pods/JobsEmptyView.podspec` | 4 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [SnapKit](https://github.com/SnapKit/SnapKit) | 0 |  |
| [**JobsGestureUnlock**](#JobsGestureUnlock) | `JobsByPods/JobsGestureUnlock@Pods/JobsGestureUnlock.podspec` | 4 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [SnapKit](https://github.com/SnapKit/SnapKit) | 0 |  |
| [**JobsGetWindow**](#JobsGetWindow) | `JobsByPods/JobsGetWindow@Pods/JobsGetWindow.podspec` | 0 |  | 1 | [**JobsScale**](#JobsScale) |
| [**JobsImageTools**](#JobsImageTools) | `JobsByPods/JobsImageTools@Pods/JobsImageTools.podspec` | 4 | [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [Kingfisher](https://github.com/onevcat/Kingfisher), [SDWebImage](https://github.com/SDWebImage/SDWebImage) | 1 | [**JobsByUIKit**](#JobsByUIKit) |
| [**JobsInheritance**](#JobsInheritance) | `JobsByPods/JobsInheritance@Pods/JobsInheritance.podspec` | 11 | [GKNavigationBarSwift](https://github.com/QuintGao/GKNavigationBarSwift), [JobsByUIKit](#JobsByUIKit), [JobsByWebKit](#JobsByWebKit), [JobsNavBar](#JobsNavBar), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [JobsSwiftDebugTools](#JobsSwiftDebugTools), [JobsSwiftFoundation](#JobsSwiftFoundation), [JobsSwiftStandardLibrary](#JobsSwiftStandardLibrary), [JobsToast](#JobsToast), [SnapKit](https://github.com/SnapKit/SnapKit) | 2 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsSwiftAppTools**](#JobsSwiftAppTools) |
| [**JobsLocalNotification**](#JobsLocalNotification) | `JobsByPods/JobsLocalNotification@Pods/JobsLocalNotification.podspec` | 2 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftTools](#JobsSwiftTools) | 0 |  |
| [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain) | `JobsByPods/JobsLuckyEnvelopeRain@Pods/JobsLuckyEnvelopeRain.podspec` | 3 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftTimer](#JobsSwiftTimer), [SnapKit](https://github.com/SnapKit/SnapKit) | 0 |  |
| [**JobsMarqueeView**](#JobsMarqueeView) | `JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.podspec` | 3 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftTimer](#JobsSwiftTimer) | 0 |  |
| [**JobsNavBar**](#JobsNavBar) | `JobsByPods/JobsNavBar@Pods/JobsNavBar.podspec` | 4 | [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [SnapKit](https://github.com/SnapKit/SnapKit), [SwiftMessages](https://github.com/SwiftKickMobile/SwiftMessages) | 2 | [**JobsByUIKit**](#JobsByUIKit), [**JobsInheritance**](#JobsInheritance) |
| [**JobsNetworking**](#JobsNetworking) | `JobsByPods/JobsNetworking@Pods/JobsNetworking.podspec` | 2 | [Alamofire](https://github.com/Alamofire/Alamofire), [PromiseKit](https://github.com/mxcl/PromiseKit) | 0 |  |
| [**JobsProgressBar**](#JobsProgressBar) | `JobsByPods/JobsProgressBar@Pods/JobsProgressBar.podspec` | 4 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftTimer](#JobsSwiftTimer), [SnapKit](https://github.com/SnapKit/SnapKit) | 0 |  |
| [**JobsRefresher**](#JobsRefresher) | `JobsByPods/JobsRefresher@Pods/JobsRefresher.podspec` | 5 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [SnapKit](https://github.com/SnapKit/SnapKit), [lottie-ios](https://github.com/airbnb/lottie-ios) | 1 | [**JobsSwiftWorker**](#JobsSwiftWorker) |
| [**JobsScale**](#JobsScale) | `JobsByPods/JobsScale@Pods/JobsScale.podspec` | 1 | [JobsGetWindow](#JobsGetWindow) | 3 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsByUIKit**](#JobsByUIKit), [**JobsSwiftAppTools**](#JobsSwiftAppTools) |
| [**JobsSwiftAppTools**](#JobsSwiftAppTools) | `JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.podspec` | 11 | [JobsBy3rdTools](#JobsBy3rdTools), [JobsByUIKit](#JobsByUIKit), [JobsInheritance](#JobsInheritance), [JobsScale](#JobsScale), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBaseTools](#JobsSwiftBaseTools), [JobsSwiftBlock](#JobsSwiftBlock), [JobsSwiftTools](#JobsSwiftTools), [JobsTextTools](#JobsTextTools), [SnapKit](https://github.com/SnapKit/SnapKit), [SwiftEntryKit](https://github.com/huri000/SwiftEntryKit) | 0 |  |
| [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines) | `JobsByPods/JobsSwiftBaseDefines@Pods/JobsSwiftBaseDefines.podspec` | 2 | [JobsSwiftBlock](#JobsSwiftBlock), [JobsTextTools](#JobsTextTools) | 19 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsByQuartzCore**](#JobsByQuartzCore), [**JobsByUIKit**](#JobsByUIKit), [**JobsCountdownButton**](#JobsCountdownButton), [**JobsEmptyView**](#JobsEmptyView), [**JobsGestureUnlock**](#JobsGestureUnlock), [**JobsImageTools**](#JobsImageTools), [**JobsInheritance**](#JobsInheritance), [**JobsMarqueeView**](#JobsMarqueeView), [**JobsNavBar**](#JobsNavBar), [**JobsProgressBar**](#JobsProgressBar), [**JobsRefresher**](#JobsRefresher), [**JobsSwiftAppTools**](#JobsSwiftAppTools), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools), [**JobsSwiftDebugTools**](#JobsSwiftDebugTools), [**JobsSwiftStandardLibrary**](#JobsSwiftStandardLibrary), [**JobsSwiftTools**](#JobsSwiftTools), [**JobsSwiftWorker**](#JobsSwiftWorker), [**JobsToast**](#JobsToast) |
| [**JobsSwiftBaseTools**](#JobsSwiftBaseTools) | `JobsByPods/JobsSwiftBaseTools@Pods/JobsSwiftBaseTools.podspec` | 8 | [Alamofire](https://github.com/Alamofire/Alamofire), [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [NSObject+Rx](https://github.com/RxSwiftCommunity/NSObject-Rx), [RxCocoa](https://github.com/ReactiveX/RxSwift), [RxSwift](https://github.com/ReactiveX/RxSwift), [SnapKit](https://github.com/SnapKit/SnapKit) | 2 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsSwiftAppTools**](#JobsSwiftAppTools) |
| [**JobsSwiftBlock**](#JobsSwiftBlock) | `JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBlock.podspec` | 4 | [Kingfisher](https://github.com/onevcat/Kingfisher), [Moya](https://github.com/Moya/Moya), [SnapKit](https://github.com/SnapKit/SnapKit), [YTKNetwork](https://github.com/kanyun-inc/YTKNetwork) | 13 | [**JobsByQuartzCore**](#JobsByQuartzCore), [**JobsByUIKit**](#JobsByUIKit), [**JobsEmptyView**](#JobsEmptyView), [**JobsGestureUnlock**](#JobsGestureUnlock), [**JobsImageTools**](#JobsImageTools), [**JobsInheritance**](#JobsInheritance), [**JobsNavBar**](#JobsNavBar), [**JobsRefresher**](#JobsRefresher), [**JobsSwiftAppTools**](#JobsSwiftAppTools), [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools), [**JobsSwiftTools**](#JobsSwiftTools), [**JobsToast**](#JobsToast) |
| [**JobsSwiftDebugTools**](#JobsSwiftDebugTools) | `JobsByPods/JobsSwiftDebugTools@Pods/JobsSwiftDebugTools.podspec` | 3 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsToast](#JobsToast) | 1 | [**JobsInheritance**](#JobsInheritance) |
| [**JobsSwiftFoundation**](#JobsSwiftFoundation) | `JobsByPods/JobsSwiftFoundation@Pods/JobsSwiftFoundation.podspec` | 1 | [JobsByUIKit](#JobsByUIKit) | 1 | [**JobsInheritance**](#JobsInheritance) |
| [**JobsSwiftMetalKit**](#JobsSwiftMetalKit) | `JobsByPods/MetalKit@Pods/JobsSwiftMetalKit.podspec` | 0 |  | 1 | [**JobsBy3rdTools**](#JobsBy3rdTools) |
| [**JobsSwiftStandardLibrary**](#JobsSwiftStandardLibrary) | `JobsByPods/JobsSwiftStandardLibrary@Pods/JobsSwiftStandardLibrary.podspec` | 1 | [JobsSwiftBaseDefines](#JobsSwiftBaseDefines) | 2 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsInheritance**](#JobsInheritance) |
| [**JobsSwiftTaskCenter**](#JobsSwiftTaskCenter) | `JobsByPods/JobsSwiftTaskCenter@Pods/JobsSwiftTaskCenter.podspec` | 1 | [JobsSwiftTimer](#JobsSwiftTimer) | 1 | [**JobsSwiftWorker**](#JobsSwiftWorker) |
| [**JobsSwiftTimer**](#JobsSwiftTimer) | `JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.podspec` | 0 |  | 7 | [**JobsByUIKit**](#JobsByUIKit), [**JobsCountdownButton**](#JobsCountdownButton), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsMarqueeView**](#JobsMarqueeView), [**JobsProgressBar**](#JobsProgressBar), [**JobsSwiftTaskCenter**](#JobsSwiftTaskCenter), [**JobsSwiftWorker**](#JobsSwiftWorker) |
| [**JobsSwiftTools**](#JobsSwiftTools) | `JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.podspec` | 7 | [Flutter](#Flutter), [FlutterPluginRegistrant](#FlutterPluginRegistrant), [JobsByPhotosUI](#JobsByPhotosUI), [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [JobsToast](#JobsToast) | 3 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsLocalNotification**](#JobsLocalNotification), [**JobsSwiftAppTools**](#JobsSwiftAppTools) |
| [**JobsSwiftWorker**](#JobsSwiftWorker) | `JobsByPods/JobsSwiftWorker@Pods/JobsSwiftWorker.podspec` | 7 | [JobsByUIKit](#JobsByUIKit), [JobsRefresher](#JobsRefresher), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftTaskCenter](#JobsSwiftTaskCenter), [JobsSwiftTimer](#JobsSwiftTimer), [Jobsl10n](#Jobsl10n), [SnapKit](https://github.com/SnapKit/SnapKit) | 0 |  |
| [**JobsTextTools**](#JobsTextTools) | `JobsByPods/JobsTextTools@Pods/JobsTextTools.podspec` | 0 |  | 4 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsByUIKit**](#JobsByUIKit), [**JobsSwiftAppTools**](#JobsSwiftAppTools), [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines) |
| [**JobsToast**](#JobsToast) | `JobsByPods/JobsToast@Pods/JobsToast.podspec` | 4 | [JobsByUIKit](#JobsByUIKit), [JobsSwiftBaseDefines](#JobsSwiftBaseDefines), [JobsSwiftBlock](#JobsSwiftBlock), [SnapKit](https://github.com/SnapKit/SnapKit) | 3 | [**JobsInheritance**](#JobsInheritance), [**JobsSwiftDebugTools**](#JobsSwiftDebugTools), [**JobsSwiftTools**](#JobsSwiftTools) |
| [**Jobsl10n**](#Jobsl10n) | `JobsByPods/Jobsl10n@Pods/Jobsl10n.podspec` | 0 |  | 2 | [**JobsByUIKit**](#JobsByUIKit), [**JobsSwiftWorker**](#JobsSwiftWorker) |

## 二、0 下游依赖 Pod <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| Pod | Podspec |
|---|---|
| [**Flutter**](#Flutter) | `my_flutter/.ios/Flutter/Flutter.podspec` |
| [**JobsByPDFKit**](#JobsByPDFKit) | `JobsByPods/JobsByPDFKit@Pods/JobsByPDFKit.podspec` |
| [**JobsByPhotosUI**](#JobsByPhotosUI) | `JobsByPods/JobsByPhotosUI@Pods/JobsByPhotosUI.podspec` |
| [**JobsCryptoKit**](#JobsCryptoKit) | `JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit.podspec` |
| [**JobsGetWindow**](#JobsGetWindow) | `JobsByPods/JobsGetWindow@Pods/JobsGetWindow.podspec` |
| [**JobsSwiftMetalKit**](#JobsSwiftMetalKit) | `JobsByPods/MetalKit@Pods/JobsSwiftMetalKit.podspec` |
| [**JobsSwiftTimer**](#JobsSwiftTimer) | `JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.podspec` |
| [**JobsTextTools**](#JobsTextTools) | `JobsByPods/JobsTextTools@Pods/JobsTextTools.podspec` |
| [**Jobsl10n**](#Jobsl10n) | `JobsByPods/Jobsl10n@Pods/Jobsl10n.podspec` |

## 三、已过滤的同 Pod 内部 subspec 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

这些依赖只表达同一个 Pod 内部 subspec 的包含关系，不参与 Pod 与 Pod 之间的循环依赖判断。

| Pod | 声明位置 | 内部依赖 | 行号 |
|---|---|---|---:|
| [**JobsNetworking**](#JobsNetworking) | `JobsNetworking/AF4` | `JobsNetworking/Core` | `58` |
| [**JobsNetworking**](#JobsNetworking) | `JobsNetworking/AF5` | `JobsNetworking/Core` | `51` |
| [**JobsNetworking**](#JobsNetworking) | `JobsNetworking/Async` | `JobsNetworking/Core` | `64` |
| [**JobsNetworking**](#JobsNetworking) | `JobsNetworking/PromiseKit` | `JobsNetworking/Core` | `70` |

## 四、Pod 间循环依赖检测 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 未发现仓库内 Pod 间循环依赖。

## 五、仓库内 Pod 相互依赖图 Mermaid <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

只展示依赖目标也在本次扫描到的 `.podspec` 里存在的关系；同 Pod 内部 subspec 依赖已过滤，不计入 Pod 级依赖/循环分析；跨 Pod subspec 依赖显示为主 Pod 名；仓库内 Pod 匹配只采用精确名称，避免把 MJRefresh 误判为 MJRefreshExtra。

```mermaid
flowchart LR
  Nd4b3dbc3878b["BRPickerViewSwift"] --> N32038075ad22["JobsByUIKit"]
  N14747c15d95a["FlutterPluginRegistrant"] --> Nc047b10eee76["Flutter"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N32038075ad22["JobsByUIKit"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N7a9c7bee01af["JobsInheritance"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Nc605e6b5421d["JobsScale"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N5c1ec45910c6["JobsSwiftBaseTools"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N9ab5a04190d8["JobsSwiftMetalKit"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N8f1bbfe879cc["JobsSwiftStandardLibrary"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Na568a595b2c6["JobsSwiftTools"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Nfc90a51d0828["JobsTextTools"]
  Nc743e46b146a["JobsByQuartzCore"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nc743e46b146a["JobsByQuartzCore"] --> Nc7567108c45a["JobsSwiftBlock"]
  N32038075ad22["JobsByUIKit"] --> Nc743e46b146a["JobsByQuartzCore"]
  N32038075ad22["JobsByUIKit"] --> N6dbcbd6c076c["JobsImageTools"]
  N32038075ad22["JobsByUIKit"] --> Nd9dbfc611984["JobsNavBar"]
  N32038075ad22["JobsByUIKit"] --> Nc605e6b5421d["JobsScale"]
  N32038075ad22["JobsByUIKit"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N32038075ad22["JobsByUIKit"] --> Nc7567108c45a["JobsSwiftBlock"]
  N32038075ad22["JobsByUIKit"] --> Nfd94adb51598["JobsSwiftTimer"]
  N32038075ad22["JobsByUIKit"] --> Nfc90a51d0828["JobsTextTools"]
  N32038075ad22["JobsByUIKit"] --> N9dff37c8d77e["Jobsl10n"]
  N1f955db97679["JobsByWebKit"] --> N32038075ad22["JobsByUIKit"]
  N8a2865d24b8e["JobsCountdownButton"] --> N32038075ad22["JobsByUIKit"]
  N8a2865d24b8e["JobsCountdownButton"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N8a2865d24b8e["JobsCountdownButton"] --> Nfd94adb51598["JobsSwiftTimer"]
  Nb2853a7530c8["JobsEmptyView"] --> N32038075ad22["JobsByUIKit"]
  Nb2853a7530c8["JobsEmptyView"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nb2853a7530c8["JobsEmptyView"] --> Nc7567108c45a["JobsSwiftBlock"]
  N8ce46417a954["JobsGestureUnlock"] --> N32038075ad22["JobsByUIKit"]
  N8ce46417a954["JobsGestureUnlock"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N8ce46417a954["JobsGestureUnlock"] --> Nc7567108c45a["JobsSwiftBlock"]
  N6dbcbd6c076c["JobsImageTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N6dbcbd6c076c["JobsImageTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  N7a9c7bee01af["JobsInheritance"] --> N32038075ad22["JobsByUIKit"]
  N7a9c7bee01af["JobsInheritance"] --> N1f955db97679["JobsByWebKit"]
  N7a9c7bee01af["JobsInheritance"] --> Nd9dbfc611984["JobsNavBar"]
  N7a9c7bee01af["JobsInheritance"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N7a9c7bee01af["JobsInheritance"] --> Nc7567108c45a["JobsSwiftBlock"]
  N7a9c7bee01af["JobsInheritance"] --> N807eaeffe5a4["JobsSwiftDebugTools"]
  N7a9c7bee01af["JobsInheritance"] --> N37fa4b9e4579["JobsSwiftFoundation"]
  N7a9c7bee01af["JobsInheritance"] --> N8f1bbfe879cc["JobsSwiftStandardLibrary"]
  N7a9c7bee01af["JobsInheritance"] --> N9817f6c3f4e6["JobsToast"]
  N21756f8f29e8["JobsLocalNotification"] --> N32038075ad22["JobsByUIKit"]
  N21756f8f29e8["JobsLocalNotification"] --> Na568a595b2c6["JobsSwiftTools"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N32038075ad22["JobsByUIKit"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> Nfd94adb51598["JobsSwiftTimer"]
  N9e7dc84491e8["JobsMarqueeView"] --> N32038075ad22["JobsByUIKit"]
  N9e7dc84491e8["JobsMarqueeView"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N9e7dc84491e8["JobsMarqueeView"] --> Nfd94adb51598["JobsSwiftTimer"]
  Nd9dbfc611984["JobsNavBar"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nd9dbfc611984["JobsNavBar"] --> Nc7567108c45a["JobsSwiftBlock"]
  Na62a2c62f899["JobsProgressBar"] --> N32038075ad22["JobsByUIKit"]
  Na62a2c62f899["JobsProgressBar"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Na62a2c62f899["JobsProgressBar"] --> Nfd94adb51598["JobsSwiftTimer"]
  N4f19e371e55e["JobsRefresher"] --> N32038075ad22["JobsByUIKit"]
  N4f19e371e55e["JobsRefresher"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N4f19e371e55e["JobsRefresher"] --> Nc7567108c45a["JobsSwiftBlock"]
  Nc605e6b5421d["JobsScale"] --> N10ee0e68a559["JobsGetWindow"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nfe1ff997a5d3["JobsBy3rdTools"]
  N7203a303dc13["JobsSwiftAppTools"] --> N32038075ad22["JobsByUIKit"]
  N7203a303dc13["JobsSwiftAppTools"] --> N7a9c7bee01af["JobsInheritance"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nc605e6b5421d["JobsScale"]
  N7203a303dc13["JobsSwiftAppTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N7203a303dc13["JobsSwiftAppTools"] --> N5c1ec45910c6["JobsSwiftBaseTools"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  N7203a303dc13["JobsSwiftAppTools"] --> Na568a595b2c6["JobsSwiftTools"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nfc90a51d0828["JobsTextTools"]
  N8dbe54185e82["JobsSwiftBaseDefines"] --> Nc7567108c45a["JobsSwiftBlock"]
  N8dbe54185e82["JobsSwiftBaseDefines"] --> Nfc90a51d0828["JobsTextTools"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N32038075ad22["JobsByUIKit"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  N807eaeffe5a4["JobsSwiftDebugTools"] --> N32038075ad22["JobsByUIKit"]
  N807eaeffe5a4["JobsSwiftDebugTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N807eaeffe5a4["JobsSwiftDebugTools"] --> N9817f6c3f4e6["JobsToast"]
  N37fa4b9e4579["JobsSwiftFoundation"] --> N32038075ad22["JobsByUIKit"]
  N8f1bbfe879cc["JobsSwiftStandardLibrary"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Naf3906ede4aa["JobsSwiftTaskCenter"] --> Nfd94adb51598["JobsSwiftTimer"]
  Na568a595b2c6["JobsSwiftTools"] --> Nc047b10eee76["Flutter"]
  Na568a595b2c6["JobsSwiftTools"] --> N14747c15d95a["FlutterPluginRegistrant"]
  Na568a595b2c6["JobsSwiftTools"] --> Nca216f1c5269["JobsByPhotosUI"]
  Na568a595b2c6["JobsSwiftTools"] --> N32038075ad22["JobsByUIKit"]
  Na568a595b2c6["JobsSwiftTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Na568a595b2c6["JobsSwiftTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  Na568a595b2c6["JobsSwiftTools"] --> N9817f6c3f4e6["JobsToast"]
  N2f0325b518dd["JobsSwiftWorker"] --> N32038075ad22["JobsByUIKit"]
  N2f0325b518dd["JobsSwiftWorker"] --> N4f19e371e55e["JobsRefresher"]
  N2f0325b518dd["JobsSwiftWorker"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N2f0325b518dd["JobsSwiftWorker"] --> Naf3906ede4aa["JobsSwiftTaskCenter"]
  N2f0325b518dd["JobsSwiftWorker"] --> Nfd94adb51598["JobsSwiftTimer"]
  N2f0325b518dd["JobsSwiftWorker"] --> N9dff37c8d77e["Jobsl10n"]
  N9817f6c3f4e6["JobsToast"] --> N32038075ad22["JobsByUIKit"]
  N9817f6c3f4e6["JobsToast"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N9817f6c3f4e6["JobsToast"] --> Nc7567108c45a["JobsSwiftBlock"]
```

## 六、全部依赖图 Mermaid <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```mermaid
flowchart LR
  Nd4b3dbc3878b["BRPickerViewSwift"] --> N32038075ad22["JobsByUIKit"]
  Nd4b3dbc3878b["BRPickerViewSwift"] --> N1f6f7544eaea["SnapKit"]
  N14747c15d95a["FlutterPluginRegistrant"] --> Nc047b10eee76["Flutter"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N4600deacaa5d["BMPlayer"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N83033e9c4a40["GKNavigationBarSwift"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Ncdd860399dd5["JXSegmentedView"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N32038075ad22["JobsByUIKit"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N7a9c7bee01af["JobsInheritance"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Nc605e6b5421d["JobsScale"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N5c1ec45910c6["JobsSwiftBaseTools"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N9ab5a04190d8["JobsSwiftMetalKit"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N8f1bbfe879cc["JobsSwiftStandardLibrary"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Na568a595b2c6["JobsSwiftTools"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Nfc90a51d0828["JobsTextTools"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> Naa66d7428d73["Kingfisher"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N0fbdcc518572["MJRefresh"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N1173b6117a2c["SDWebImage"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N1f6f7544eaea["SnapKit"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N3d7752c6a15e["SwiftEntryKit"]
  Nfe1ff997a5d3["JobsBy3rdTools"] --> N14727719233d["YTKNetwork"]
  Nc743e46b146a["JobsByQuartzCore"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nc743e46b146a["JobsByQuartzCore"] --> Nc7567108c45a["JobsSwiftBlock"]
  N32038075ad22["JobsByUIKit"] --> N7f51a56e8eb4["ESPullToRefresh"]
  N32038075ad22["JobsByUIKit"] --> N83033e9c4a40["GKNavigationBarSwift"]
  N32038075ad22["JobsByUIKit"] --> Nc743e46b146a["JobsByQuartzCore"]
  N32038075ad22["JobsByUIKit"] --> N6dbcbd6c076c["JobsImageTools"]
  N32038075ad22["JobsByUIKit"] --> Nd9dbfc611984["JobsNavBar"]
  N32038075ad22["JobsByUIKit"] --> Nc605e6b5421d["JobsScale"]
  N32038075ad22["JobsByUIKit"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N32038075ad22["JobsByUIKit"] --> Nc7567108c45a["JobsSwiftBlock"]
  N32038075ad22["JobsByUIKit"] --> Nfd94adb51598["JobsSwiftTimer"]
  N32038075ad22["JobsByUIKit"] --> Nfc90a51d0828["JobsTextTools"]
  N32038075ad22["JobsByUIKit"] --> N9dff37c8d77e["Jobsl10n"]
  N32038075ad22["JobsByUIKit"] --> Naa66d7428d73["Kingfisher"]
  N32038075ad22["JobsByUIKit"] --> N5a1ee480a7b5["NSObject+Rx"]
  N32038075ad22["JobsByUIKit"] --> N3c1fed1bce1e["RxCocoa"]
  N32038075ad22["JobsByUIKit"] --> N924072f9470a["RxRelay"]
  N32038075ad22["JobsByUIKit"] --> N2ece58ac4857["RxSwift"]
  N32038075ad22["JobsByUIKit"] --> Nd490c163f52c["SVGKit"]
  N32038075ad22["JobsByUIKit"] --> Nccf54c6c215b["SkeletonView"]
  N32038075ad22["JobsByUIKit"] --> N1f6f7544eaea["SnapKit"]
  N32038075ad22["JobsByUIKit"] --> N71d0944e102a["lottie-ios"]
  N1f955db97679["JobsByWebKit"] --> N32038075ad22["JobsByUIKit"]
  N8a2865d24b8e["JobsCountdownButton"] --> N32038075ad22["JobsByUIKit"]
  N8a2865d24b8e["JobsCountdownButton"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N8a2865d24b8e["JobsCountdownButton"] --> Nfd94adb51598["JobsSwiftTimer"]
  Nb2853a7530c8["JobsEmptyView"] --> N32038075ad22["JobsByUIKit"]
  Nb2853a7530c8["JobsEmptyView"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nb2853a7530c8["JobsEmptyView"] --> Nc7567108c45a["JobsSwiftBlock"]
  Nb2853a7530c8["JobsEmptyView"] --> N1f6f7544eaea["SnapKit"]
  N8ce46417a954["JobsGestureUnlock"] --> N32038075ad22["JobsByUIKit"]
  N8ce46417a954["JobsGestureUnlock"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N8ce46417a954["JobsGestureUnlock"] --> Nc7567108c45a["JobsSwiftBlock"]
  N8ce46417a954["JobsGestureUnlock"] --> N1f6f7544eaea["SnapKit"]
  N6dbcbd6c076c["JobsImageTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N6dbcbd6c076c["JobsImageTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  N6dbcbd6c076c["JobsImageTools"] --> Naa66d7428d73["Kingfisher"]
  N6dbcbd6c076c["JobsImageTools"] --> N1173b6117a2c["SDWebImage"]
  N7a9c7bee01af["JobsInheritance"] --> N83033e9c4a40["GKNavigationBarSwift"]
  N7a9c7bee01af["JobsInheritance"] --> N32038075ad22["JobsByUIKit"]
  N7a9c7bee01af["JobsInheritance"] --> N1f955db97679["JobsByWebKit"]
  N7a9c7bee01af["JobsInheritance"] --> Nd9dbfc611984["JobsNavBar"]
  N7a9c7bee01af["JobsInheritance"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N7a9c7bee01af["JobsInheritance"] --> Nc7567108c45a["JobsSwiftBlock"]
  N7a9c7bee01af["JobsInheritance"] --> N807eaeffe5a4["JobsSwiftDebugTools"]
  N7a9c7bee01af["JobsInheritance"] --> N37fa4b9e4579["JobsSwiftFoundation"]
  N7a9c7bee01af["JobsInheritance"] --> N8f1bbfe879cc["JobsSwiftStandardLibrary"]
  N7a9c7bee01af["JobsInheritance"] --> N9817f6c3f4e6["JobsToast"]
  N7a9c7bee01af["JobsInheritance"] --> N1f6f7544eaea["SnapKit"]
  N21756f8f29e8["JobsLocalNotification"] --> N32038075ad22["JobsByUIKit"]
  N21756f8f29e8["JobsLocalNotification"] --> Na568a595b2c6["JobsSwiftTools"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N32038075ad22["JobsByUIKit"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> Nfd94adb51598["JobsSwiftTimer"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N1f6f7544eaea["SnapKit"]
  N9e7dc84491e8["JobsMarqueeView"] --> N32038075ad22["JobsByUIKit"]
  N9e7dc84491e8["JobsMarqueeView"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N9e7dc84491e8["JobsMarqueeView"] --> Nfd94adb51598["JobsSwiftTimer"]
  Nd9dbfc611984["JobsNavBar"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Nd9dbfc611984["JobsNavBar"] --> Nc7567108c45a["JobsSwiftBlock"]
  Nd9dbfc611984["JobsNavBar"] --> N1f6f7544eaea["SnapKit"]
  Nd9dbfc611984["JobsNavBar"] --> N3ee0366c374e["SwiftMessages"]
  Nf3793743ec40["JobsNetworking"] --> Nda208d9cbd49["Alamofire"]
  Nf3793743ec40["JobsNetworking"] --> Naf18e27d86f8["PromiseKit"]
  Na62a2c62f899["JobsProgressBar"] --> N32038075ad22["JobsByUIKit"]
  Na62a2c62f899["JobsProgressBar"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Na62a2c62f899["JobsProgressBar"] --> Nfd94adb51598["JobsSwiftTimer"]
  Na62a2c62f899["JobsProgressBar"] --> N1f6f7544eaea["SnapKit"]
  N4f19e371e55e["JobsRefresher"] --> N32038075ad22["JobsByUIKit"]
  N4f19e371e55e["JobsRefresher"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N4f19e371e55e["JobsRefresher"] --> Nc7567108c45a["JobsSwiftBlock"]
  N4f19e371e55e["JobsRefresher"] --> N1f6f7544eaea["SnapKit"]
  N4f19e371e55e["JobsRefresher"] --> N71d0944e102a["lottie-ios"]
  Nc605e6b5421d["JobsScale"] --> N10ee0e68a559["JobsGetWindow"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nfe1ff997a5d3["JobsBy3rdTools"]
  N7203a303dc13["JobsSwiftAppTools"] --> N32038075ad22["JobsByUIKit"]
  N7203a303dc13["JobsSwiftAppTools"] --> N7a9c7bee01af["JobsInheritance"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nc605e6b5421d["JobsScale"]
  N7203a303dc13["JobsSwiftAppTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N7203a303dc13["JobsSwiftAppTools"] --> N5c1ec45910c6["JobsSwiftBaseTools"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  N7203a303dc13["JobsSwiftAppTools"] --> Na568a595b2c6["JobsSwiftTools"]
  N7203a303dc13["JobsSwiftAppTools"] --> Nfc90a51d0828["JobsTextTools"]
  N7203a303dc13["JobsSwiftAppTools"] --> N1f6f7544eaea["SnapKit"]
  N7203a303dc13["JobsSwiftAppTools"] --> N3d7752c6a15e["SwiftEntryKit"]
  N8dbe54185e82["JobsSwiftBaseDefines"] --> Nc7567108c45a["JobsSwiftBlock"]
  N8dbe54185e82["JobsSwiftBaseDefines"] --> Nfc90a51d0828["JobsTextTools"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> Nda208d9cbd49["Alamofire"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N32038075ad22["JobsByUIKit"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N5a1ee480a7b5["NSObject+Rx"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N3c1fed1bce1e["RxCocoa"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N2ece58ac4857["RxSwift"]
  N5c1ec45910c6["JobsSwiftBaseTools"] --> N1f6f7544eaea["SnapKit"]
  Nc7567108c45a["JobsSwiftBlock"] --> Naa66d7428d73["Kingfisher"]
  Nc7567108c45a["JobsSwiftBlock"] --> N8a7fbfbb0330["Moya"]
  Nc7567108c45a["JobsSwiftBlock"] --> N1f6f7544eaea["SnapKit"]
  Nc7567108c45a["JobsSwiftBlock"] --> N14727719233d["YTKNetwork"]
  N807eaeffe5a4["JobsSwiftDebugTools"] --> N32038075ad22["JobsByUIKit"]
  N807eaeffe5a4["JobsSwiftDebugTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N807eaeffe5a4["JobsSwiftDebugTools"] --> N9817f6c3f4e6["JobsToast"]
  N37fa4b9e4579["JobsSwiftFoundation"] --> N32038075ad22["JobsByUIKit"]
  N8f1bbfe879cc["JobsSwiftStandardLibrary"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Naf3906ede4aa["JobsSwiftTaskCenter"] --> Nfd94adb51598["JobsSwiftTimer"]
  Na568a595b2c6["JobsSwiftTools"] --> Nc047b10eee76["Flutter"]
  Na568a595b2c6["JobsSwiftTools"] --> N14747c15d95a["FlutterPluginRegistrant"]
  Na568a595b2c6["JobsSwiftTools"] --> Nca216f1c5269["JobsByPhotosUI"]
  Na568a595b2c6["JobsSwiftTools"] --> N32038075ad22["JobsByUIKit"]
  Na568a595b2c6["JobsSwiftTools"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  Na568a595b2c6["JobsSwiftTools"] --> Nc7567108c45a["JobsSwiftBlock"]
  Na568a595b2c6["JobsSwiftTools"] --> N9817f6c3f4e6["JobsToast"]
  N2f0325b518dd["JobsSwiftWorker"] --> N32038075ad22["JobsByUIKit"]
  N2f0325b518dd["JobsSwiftWorker"] --> N4f19e371e55e["JobsRefresher"]
  N2f0325b518dd["JobsSwiftWorker"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N2f0325b518dd["JobsSwiftWorker"] --> Naf3906ede4aa["JobsSwiftTaskCenter"]
  N2f0325b518dd["JobsSwiftWorker"] --> Nfd94adb51598["JobsSwiftTimer"]
  N2f0325b518dd["JobsSwiftWorker"] --> N9dff37c8d77e["Jobsl10n"]
  N2f0325b518dd["JobsSwiftWorker"] --> N1f6f7544eaea["SnapKit"]
  N9817f6c3f4e6["JobsToast"] --> N32038075ad22["JobsByUIKit"]
  N9817f6c3f4e6["JobsToast"] --> N8dbe54185e82["JobsSwiftBaseDefines"]
  N9817f6c3f4e6["JobsToast"] --> Nc7567108c45a["JobsSwiftBlock"]
  N9817f6c3f4e6["JobsToast"] --> N1f6f7544eaea["SnapKit"]
```

## 七、外部依赖引用关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

这里统计本次扫描到的 `.podspec` 对外部 Pod 的引用；同 Pod 内部 subspec 依赖已过滤；跨 Pod subspec 依赖显示为主 Pod 名；仓库内 Pod 匹配只采用精确名称，避免把 MJRefresh 误判为 MJRefreshExtra。外部来源链接匹配规则已放宽为：完全匹配 → base 名匹配 → 字符串包含匹配。

| 外部依赖 | 被引用数量 | 引用方 | 引用声明 |
|---|---:|---|---|
| [Alamofire](https://github.com/Alamofire/Alamofire) | 2 | [**JobsNetworking**](#JobsNetworking), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools) | [Alamofire](https://github.com/Alamofire/Alamofire) |
| [BMPlayer](https://github.com/BrikerMan/BMPlayer) | 1 | [**JobsBy3rdTools**](#JobsBy3rdTools) | [BMPlayer](https://github.com/BrikerMan/BMPlayer) |
| [ESPullToRefresh](https://github.com/eggswift/pull-to-refresh) | 1 | [**JobsByUIKit**](#JobsByUIKit) | [ESPullToRefresh](https://github.com/eggswift/pull-to-refresh) |
| [GKNavigationBarSwift](https://github.com/QuintGao/GKNavigationBarSwift) | 3 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsByUIKit**](#JobsByUIKit), [**JobsInheritance**](#JobsInheritance) | [GKNavigationBarSwift](https://github.com/QuintGao/GKNavigationBarSwift) |
| [JXSegmentedView](https://github.com/pujiaxin33/JXSegmentedView) | 1 | [**JobsBy3rdTools**](#JobsBy3rdTools) | [JXSegmentedView](https://github.com/pujiaxin33/JXSegmentedView) |
| [Kingfisher](https://github.com/onevcat/Kingfisher) | 4 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsByUIKit**](#JobsByUIKit), [**JobsImageTools**](#JobsImageTools), [**JobsSwiftBlock**](#JobsSwiftBlock) | [Kingfisher](https://github.com/onevcat/Kingfisher) |
| [MJRefresh](https://github.com/CoderMJLee/MJRefresh) | 1 | [**JobsBy3rdTools**](#JobsBy3rdTools) | [MJRefresh](https://github.com/CoderMJLee/MJRefresh) |
| [Moya](https://github.com/Moya/Moya) | 1 | [**JobsSwiftBlock**](#JobsSwiftBlock) | [Moya](https://github.com/Moya/Moya) |
| [NSObject+Rx](https://github.com/RxSwiftCommunity/NSObject-Rx) | 2 | [**JobsByUIKit**](#JobsByUIKit), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools) | [NSObject+Rx](https://github.com/RxSwiftCommunity/NSObject-Rx) |
| [PromiseKit](https://github.com/mxcl/PromiseKit) | 1 | [**JobsNetworking**](#JobsNetworking) | [PromiseKit](https://github.com/mxcl/PromiseKit) |
| [RxCocoa](https://github.com/ReactiveX/RxSwift) | 2 | [**JobsByUIKit**](#JobsByUIKit), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools) | [RxCocoa](https://github.com/ReactiveX/RxSwift) |
| [RxRelay](https://cocoapods.org/pods/RxRelay) | 1 | [**JobsByUIKit**](#JobsByUIKit) | [RxRelay](https://cocoapods.org/pods/RxRelay) |
| [RxSwift](https://github.com/ReactiveX/RxSwift) | 2 | [**JobsByUIKit**](#JobsByUIKit), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools) | [RxSwift](https://github.com/ReactiveX/RxSwift) |
| [SDWebImage](https://github.com/SDWebImage/SDWebImage) | 2 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsImageTools**](#JobsImageTools) | [SDWebImage](https://github.com/SDWebImage/SDWebImage) |
| [SVGKit](https://github.com/SVGKit/SVGKit) | 1 | [**JobsByUIKit**](#JobsByUIKit) | [SVGKit](https://github.com/SVGKit/SVGKit) |
| [SkeletonView](https://github.com/Juanpe/SkeletonView) | 1 | [**JobsByUIKit**](#JobsByUIKit) | [SkeletonView](https://github.com/Juanpe/SkeletonView) |
| [SnapKit](https://github.com/SnapKit/SnapKit) | 15 | [**BRPickerViewSwift**](#BRPickerViewSwift), [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsByUIKit**](#JobsByUIKit), [**JobsEmptyView**](#JobsEmptyView), [**JobsGestureUnlock**](#JobsGestureUnlock), [**JobsInheritance**](#JobsInheritance), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsNavBar**](#JobsNavBar), [**JobsProgressBar**](#JobsProgressBar), [**JobsRefresher**](#JobsRefresher), [**JobsSwiftAppTools**](#JobsSwiftAppTools), [**JobsSwiftBaseTools**](#JobsSwiftBaseTools), [**JobsSwiftBlock**](#JobsSwiftBlock), [**JobsSwiftWorker**](#JobsSwiftWorker), [**JobsToast**](#JobsToast) | [SnapKit](https://github.com/SnapKit/SnapKit) |
| [SwiftEntryKit](https://github.com/huri000/SwiftEntryKit) | 2 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsSwiftAppTools**](#JobsSwiftAppTools) | [SwiftEntryKit](https://github.com/huri000/SwiftEntryKit) |
| [SwiftMessages](https://github.com/SwiftKickMobile/SwiftMessages) | 1 | [**JobsNavBar**](#JobsNavBar) | [SwiftMessages](https://github.com/SwiftKickMobile/SwiftMessages) |
| [YTKNetwork](https://github.com/kanyun-inc/YTKNetwork) | 2 | [**JobsBy3rdTools**](#JobsBy3rdTools), [**JobsSwiftBlock**](#JobsSwiftBlock) | [YTKNetwork](https://github.com/kanyun-inc/YTKNetwork) |
| [lottie-ios](https://github.com/airbnb/lottie-ios) | 2 | [**JobsByUIKit**](#JobsByUIKit), [**JobsRefresher**](#JobsRefresher) | [lottie-ios](https://github.com/airbnb/lottie-ios) |

## 八、明细 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1、<font id="BRPickerViewSwift">BRPickerViewSwift</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/BRPickerViewSwift@Pods/BRPickerViewSwift.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 2、<font id="Flutter">Flutter</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`my_flutter/.ios/Flutter/Flutter.podspec`

- **上游依赖**

  - [**FlutterPluginRegistrant**](#FlutterPluginRegistrant)
  - [**JobsSwiftTools**](#JobsSwiftTools)


### 3、<font id="FlutterPluginRegistrant">FlutterPluginRegistrant</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`my_flutter/.ios/Flutter/FlutterPluginRegistrant/FlutterPluginRegistrant.podspec`

- **上游依赖**

  - [**JobsSwiftTools**](#JobsSwiftTools)

- **下游依赖**

  - [**Flutter**](#Flutter)


### 4、<font id="JobsBy3rdTools">JobsBy3rdTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsBy3rdTools@Pods/JobsBy3rdTools.podspec`

- **上游依赖**

  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)

- **下游依赖**

  - [**BMPlayer**](https://github.com/BrikerMan/BMPlayer)
  - [**GKNavigationBarSwift**](https://github.com/QuintGao/GKNavigationBarSwift)
  - [**JXSegmentedView**](https://github.com/pujiaxin33/JXSegmentedView)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsInheritance**](#JobsInheritance)
  - [**JobsScale**](#JobsScale)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBaseTools**](#JobsSwiftBaseTools)
  - [**JobsSwiftMetalKit**](#JobsSwiftMetalKit)
  - [**JobsSwiftStandardLibrary**](#JobsSwiftStandardLibrary)
  - [**JobsSwiftTools**](#JobsSwiftTools)
  - [**JobsTextTools**](#JobsTextTools)
  - [**Kingfisher**](https://github.com/onevcat/Kingfisher)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)
  - [**SwiftEntryKit**](https://github.com/huri000/SwiftEntryKit)
  - [**YTKNetwork**](https://github.com/kanyun-inc/YTKNetwork)


### 5、<font id="JobsByPDFKit">JobsByPDFKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsByPDFKit@Pods/JobsByPDFKit.podspec`


### 6、<font id="JobsByPhotosUI">JobsByPhotosUI</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsByPhotosUI@Pods/JobsByPhotosUI.podspec`

- **上游依赖**

  - [**JobsSwiftTools**](#JobsSwiftTools)


### 7、<font id="JobsByQuartzCore">JobsByQuartzCore</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsByQuartzCore@Pods/JobsByQuartzCore.podspec`

- **上游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)

- **下游依赖**

  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)


### 8、<font id="JobsByUIKit">JobsByUIKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsByUIKit@Pods/JobsByUIKit.podspec`

- **上游依赖**

  - [**BRPickerViewSwift**](#BRPickerViewSwift)
  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsByWebKit**](#JobsByWebKit)
  - [**JobsCountdownButton**](#JobsCountdownButton)
  - [**JobsEmptyView**](#JobsEmptyView)
  - [**JobsGestureUnlock**](#JobsGestureUnlock)
  - [**JobsInheritance**](#JobsInheritance)
  - [**JobsLocalNotification**](#JobsLocalNotification)
  - [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain)
  - [**JobsMarqueeView**](#JobsMarqueeView)
  - [**JobsProgressBar**](#JobsProgressBar)
  - [**JobsRefresher**](#JobsRefresher)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)
  - [**JobsSwiftBaseTools**](#JobsSwiftBaseTools)
  - [**JobsSwiftDebugTools**](#JobsSwiftDebugTools)
  - [**JobsSwiftFoundation**](#JobsSwiftFoundation)
  - [**JobsSwiftTools**](#JobsSwiftTools)
  - [**JobsSwiftWorker**](#JobsSwiftWorker)
  - [**JobsToast**](#JobsToast)

- **下游依赖**

  - [**ESPullToRefresh**](https://github.com/eggswift/pull-to-refresh)
  - [**GKNavigationBarSwift**](https://github.com/QuintGao/GKNavigationBarSwift)
  - [**JobsByQuartzCore**](#JobsByQuartzCore)
  - [**JobsImageTools**](#JobsImageTools)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsScale**](#JobsScale)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**JobsSwiftTimer**](#JobsSwiftTimer)
  - [**JobsTextTools**](#JobsTextTools)
  - [**Jobsl10n**](#Jobsl10n)
  - [**Kingfisher**](https://github.com/onevcat/Kingfisher)
  - [**NSObject+Rx**](https://github.com/RxSwiftCommunity/NSObject-Rx)
  - [**RxCocoa**](https://github.com/ReactiveX/RxSwift)
  - [**RxRelay**](https://cocoapods.org/pods/RxRelay)
  - [**RxSwift**](https://github.com/ReactiveX/RxSwift)
  - [**SVGKit**](https://github.com/SVGKit/SVGKit)
  - [**SkeletonView**](https://github.com/Juanpe/SkeletonView)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 9、<font id="JobsByWebKit">JobsByWebKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsByWebKit@Pods/JobsByWebKit.podspec`

- **上游依赖**

  - [**JobsInheritance**](#JobsInheritance)

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)


### 10、<font id="JobsCountdownButton">JobsCountdownButton</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsCountdownButton@Pods/JobsCountdownButton.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftTimer**](#JobsSwiftTimer)


### 11、<font id="JobsCryptoKit">JobsCryptoKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit.podspec`


### 12、<font id="JobsEmptyView">JobsEmptyView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsEmptyView@Pods/JobsEmptyView.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 13、<font id="JobsGestureUnlock">JobsGestureUnlock</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsGestureUnlock@Pods/JobsGestureUnlock.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 14、<font id="JobsGetWindow">JobsGetWindow</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsGetWindow@Pods/JobsGetWindow.podspec`

- **上游依赖**

  - [**JobsScale**](#JobsScale)


### 15、<font id="JobsImageTools">JobsImageTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsImageTools@Pods/JobsImageTools.podspec`

- **上游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)

- **下游依赖**

  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**Kingfisher**](https://github.com/onevcat/Kingfisher)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)


### 16、<font id="JobsInheritance">JobsInheritance</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsInheritance@Pods/JobsInheritance.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)

- **下游依赖**

  - [**GKNavigationBarSwift**](https://github.com/QuintGao/GKNavigationBarSwift)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsByWebKit**](#JobsByWebKit)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**JobsSwiftDebugTools**](#JobsSwiftDebugTools)
  - [**JobsSwiftFoundation**](#JobsSwiftFoundation)
  - [**JobsSwiftStandardLibrary**](#JobsSwiftStandardLibrary)
  - [**JobsToast**](#JobsToast)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 17、<font id="JobsLocalNotification">JobsLocalNotification</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsLocalNotification@Pods/JobsLocalNotification.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftTools**](#JobsSwiftTools)


### 18、<font id="JobsLuckyEnvelopeRain">JobsLuckyEnvelopeRain</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsLuckyEnvelopeRain@Pods/JobsLuckyEnvelopeRain.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftTimer**](#JobsSwiftTimer)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 19、<font id="JobsMarqueeView">JobsMarqueeView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftTimer**](#JobsSwiftTimer)


### 20、<font id="JobsNavBar">JobsNavBar</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsNavBar@Pods/JobsNavBar.podspec`

- **上游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsInheritance**](#JobsInheritance)

- **下游依赖**

  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)
  - [**SwiftMessages**](https://github.com/SwiftKickMobile/SwiftMessages)


### 21、<font id="JobsNetworking">JobsNetworking</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsNetworking@Pods/JobsNetworking.podspec`

- **下游依赖**

  - [**Alamofire**](https://github.com/Alamofire/Alamofire)
  - [**PromiseKit**](https://github.com/mxcl/PromiseKit)


### 22、<font id="JobsProgressBar">JobsProgressBar</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsProgressBar@Pods/JobsProgressBar.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftTimer**](#JobsSwiftTimer)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 23、<font id="JobsRefresher">JobsRefresher</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsRefresher@Pods/JobsRefresher.podspec`

- **上游依赖**

  - [**JobsSwiftWorker**](#JobsSwiftWorker)

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 24、<font id="JobsScale">JobsScale</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsScale@Pods/JobsScale.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)

- **下游依赖**

  - [**JobsGetWindow**](#JobsGetWindow)


### 25、<font id="JobsSwiftAppTools">JobsSwiftAppTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.podspec`

- **下游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsInheritance**](#JobsInheritance)
  - [**JobsScale**](#JobsScale)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBaseTools**](#JobsSwiftBaseTools)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**JobsSwiftTools**](#JobsSwiftTools)
  - [**JobsTextTools**](#JobsTextTools)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)
  - [**SwiftEntryKit**](https://github.com/huri000/SwiftEntryKit)


### 26、<font id="JobsSwiftBaseDefines">JobsSwiftBaseDefines</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftBaseDefines@Pods/JobsSwiftBaseDefines.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsByQuartzCore**](#JobsByQuartzCore)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsCountdownButton**](#JobsCountdownButton)
  - [**JobsEmptyView**](#JobsEmptyView)
  - [**JobsGestureUnlock**](#JobsGestureUnlock)
  - [**JobsImageTools**](#JobsImageTools)
  - [**JobsInheritance**](#JobsInheritance)
  - [**JobsMarqueeView**](#JobsMarqueeView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsProgressBar**](#JobsProgressBar)
  - [**JobsRefresher**](#JobsRefresher)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)
  - [**JobsSwiftBaseTools**](#JobsSwiftBaseTools)
  - [**JobsSwiftDebugTools**](#JobsSwiftDebugTools)
  - [**JobsSwiftStandardLibrary**](#JobsSwiftStandardLibrary)
  - [**JobsSwiftTools**](#JobsSwiftTools)
  - [**JobsSwiftWorker**](#JobsSwiftWorker)
  - [**JobsToast**](#JobsToast)

- **下游依赖**

  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**JobsTextTools**](#JobsTextTools)


### 27、<font id="JobsSwiftBaseTools">JobsSwiftBaseTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftBaseTools@Pods/JobsSwiftBaseTools.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)

- **下游依赖**

  - [**Alamofire**](https://github.com/Alamofire/Alamofire)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**NSObject+Rx**](https://github.com/RxSwiftCommunity/NSObject-Rx)
  - [**RxCocoa**](https://github.com/ReactiveX/RxSwift)
  - [**RxSwift**](https://github.com/ReactiveX/RxSwift)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 28、<font id="JobsSwiftBlock">JobsSwiftBlock</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBlock.podspec`

- **上游依赖**

  - [**JobsByQuartzCore**](#JobsByQuartzCore)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsEmptyView**](#JobsEmptyView)
  - [**JobsGestureUnlock**](#JobsGestureUnlock)
  - [**JobsImageTools**](#JobsImageTools)
  - [**JobsInheritance**](#JobsInheritance)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsRefresher**](#JobsRefresher)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBaseTools**](#JobsSwiftBaseTools)
  - [**JobsSwiftTools**](#JobsSwiftTools)
  - [**JobsToast**](#JobsToast)

- **下游依赖**

  - [**Kingfisher**](https://github.com/onevcat/Kingfisher)
  - [**Moya**](https://github.com/Moya/Moya)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)
  - [**YTKNetwork**](https://github.com/kanyun-inc/YTKNetwork)


### 29、<font id="JobsSwiftDebugTools">JobsSwiftDebugTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftDebugTools@Pods/JobsSwiftDebugTools.podspec`

- **上游依赖**

  - [**JobsInheritance**](#JobsInheritance)

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsToast**](#JobsToast)


### 30、<font id="JobsSwiftFoundation">JobsSwiftFoundation</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftFoundation@Pods/JobsSwiftFoundation.podspec`

- **上游依赖**

  - [**JobsInheritance**](#JobsInheritance)

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)


### 31、<font id="JobsSwiftMetalKit">JobsSwiftMetalKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/MetalKit@Pods/JobsSwiftMetalKit.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)


### 32、<font id="JobsSwiftStandardLibrary">JobsSwiftStandardLibrary</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftStandardLibrary@Pods/JobsSwiftStandardLibrary.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsInheritance**](#JobsInheritance)

- **下游依赖**

  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)


### 33、<font id="JobsSwiftTaskCenter">JobsSwiftTaskCenter</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftTaskCenter@Pods/JobsSwiftTaskCenter.podspec`

- **上游依赖**

  - [**JobsSwiftWorker**](#JobsSwiftWorker)

- **下游依赖**

  - [**JobsSwiftTimer**](#JobsSwiftTimer)


### 34、<font id="JobsSwiftTimer">JobsSwiftTimer</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.podspec`

- **上游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsCountdownButton**](#JobsCountdownButton)
  - [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain)
  - [**JobsMarqueeView**](#JobsMarqueeView)
  - [**JobsProgressBar**](#JobsProgressBar)
  - [**JobsSwiftTaskCenter**](#JobsSwiftTaskCenter)
  - [**JobsSwiftWorker**](#JobsSwiftWorker)


### 35、<font id="JobsSwiftTools">JobsSwiftTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsLocalNotification**](#JobsLocalNotification)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)

- **下游依赖**

  - [**Flutter**](#Flutter)
  - [**FlutterPluginRegistrant**](#FlutterPluginRegistrant)
  - [**JobsByPhotosUI**](#JobsByPhotosUI)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**JobsToast**](#JobsToast)


### 36、<font id="JobsSwiftWorker">JobsSwiftWorker</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSwiftWorker@Pods/JobsSwiftWorker.podspec`

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsRefresher**](#JobsRefresher)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftTaskCenter**](#JobsSwiftTaskCenter)
  - [**JobsSwiftTimer**](#JobsSwiftTimer)
  - [**Jobsl10n**](#Jobsl10n)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 37、<font id="JobsTextTools">JobsTextTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsTextTools@Pods/JobsTextTools.podspec`

- **上游依赖**

  - [**JobsBy3rdTools**](#JobsBy3rdTools)
  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftAppTools**](#JobsSwiftAppTools)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)


### 38、<font id="JobsToast">JobsToast</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsToast@Pods/JobsToast.podspec`

- **上游依赖**

  - [**JobsInheritance**](#JobsInheritance)
  - [**JobsSwiftDebugTools**](#JobsSwiftDebugTools)
  - [**JobsSwiftTools**](#JobsSwiftTools)

- **下游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftBaseDefines**](#JobsSwiftBaseDefines)
  - [**JobsSwiftBlock**](#JobsSwiftBlock)
  - [**SnapKit**](https://github.com/SnapKit/SnapKit)


### 39、<font id="Jobsl10n">Jobsl10n</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/Jobsl10n@Pods/Jobsl10n.podspec`

- **上游依赖**

  - [**JobsByUIKit**](#JobsByUIKit)
  - [**JobsSwiftWorker**](#JobsSwiftWorker)


## 九、生成的文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `PodspecDependencies_interactive.html`：可搜索、可拖拽、可缩放动态图
- `PodspecDependencies.md`：本报告
- `PodspecDependencies_all.mmd`：全部依赖 Mermaid 图源码
- `PodspecDependencies_internal.mmd`：仓库内 Pod 相互依赖 Mermaid 图源码
- `PodspecDependencies_all.dot`：全部依赖 Graphviz DOT 源码
- `PodspecDependencies_internal.dot`：仓库内 Pod 相互依赖 Graphviz DOT 源码

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
