# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T1["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S1 -->|calls| T1
  S2["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T2["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S2 -->|calls| T2
  S3["method:JobsDebugDeinitAutoLoad::load<br/>JobsByPods/JobsSwiftDebugTools@Pods/JobsDebugDeinitAutoLoad.m:18"]
  T3["method:CameraCaptureController::start<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:356"]
  S3 -->|calls| T3
  S4["method:VCDebugDeallocDebug::install<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:35"]
  T4["method:UIViewController::_vcDebug_swizzleViewDidLoadOnce<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:78"]
  S4 -->|calls| T4
  S5["method:UIViewController::_vcDebug_viewDidLoad<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:96"]
  T5["method:UIViewController::_vcDebug_attachDeinitObserverIfNeeded<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:43"]
  S5 -->|calls| T5
  S6["method:UIViewController::_vcDebug_viewDidLoad<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:96"]
  T6["method:UIViewController::_vcDebug_viewDidLoad<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:96"]
  S6 -->|calls| T6
  S7["method:Decimal::rounded<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:50"]
  T7["method:Decimal::_nsMode<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:76"]
  S7 -->|calls| T7
  S8["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  T8["method:Decimal::_nsMode<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:76"]
  S8 -->|calls| T8
  S9["method:Decimal::formatted<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:62"]
  T9["method:Decimal::rounded<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:50"]
  S9 -->|calls| T9
  S10["method:Decimal::formatted<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:62"]
  T10["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S10 -->|calls| T10
  S11["method:Decimal::formatted<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:62"]
  T11["method:NumberFormatter::byMaximumFractionDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:159"]
  S11 -->|calls| T11
  S12["method:Decimal::formatted<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:62"]
  T12["method:NumberFormatter::byMinimumFractionDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:153"]
  S12 -->|calls| T12
  S13["method:Decimal::formatted<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:62"]
  T13["method:NumberFormatter::byUsesGroupingSeparator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:103"]
  S13 -->|calls| T13
  S14["method:Decimal::formatted<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:62"]
  T14["method:NumberFormatter::byNumberStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:67"]
  S14 -->|calls| T14
  S15["method:Decimal::formatted<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:62"]
  T15["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:25"]
  S15 -->|calls| T15
  S16["method:Decimal::>=<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:93"]
  T16["method:Interval::compare<br/>TODO/TaskCenterComponent/Schedule/Interval.swift:75"]
  S16 -->|calls| T16
  S17["method:JSONDecoder::byUserInfo<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:134"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:JSONDecoder::jobsRESTDecoder<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:163"]
  T18["method:JSONDecoder::byDateISO8601<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:38"]
  S18 -->|calls| T18
  S19["method:JSONDecoder::jobsRESTDecoder<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:163"]
  T19["method:JSONDecoder::byKeyConvertFromSnakeCase<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:121"]
  S19 -->|calls| T19
  S20["method:JSONDecoder::jobsJSON5ConfigDecoder<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:170"]
  T20["method:JSONDecoder::byAssumesTopLevelDictionary<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:155"]
  S20 -->|calls| T20
  S21["method:JSONDecoder::jobsJSON5ConfigDecoder<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:170"]
  T21["method:JSONDecoder::byAllowsJSON5<br/>JobsByPods/JobsSwiftFoundation@Pods/JSONDecoder.swift:148"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::byInsert<br/>JobsByPods/JobsSwiftFoundation@Pods/NSMutableAttributedString.swift:46"]
  T22["method:JobsWorkerBag::insert<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:69"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::byAdd<br/>JobsByPods/JobsSwiftFoundation@Pods/NSMutableAttributedString.swift:52"]
  T23["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S23 -->|calls| T23
  S24["method:UserDefaults::setBool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:17"]
  T24["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S24 -->|calls| T24
  S25["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  T25["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
