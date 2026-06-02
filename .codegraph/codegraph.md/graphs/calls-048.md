# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  T1["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S1 -->|calls| T1
  S2["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:88"]
  T2["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S2 -->|calls| T2
  S3["method:JobsCallbackable::jobsCallOptional<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:93"]
  T3["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:37"]
  S3 -->|calls| T3
  S4["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T4["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S4 -->|calls| T4
  S5["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:103"]
  T5["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S5 -->|calls| T5
  S6["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T6["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S6 -->|calls| T6
  S7["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:107"]
  T7["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S7 -->|calls| T7
  S8["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T8["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:83"]
  S8 -->|calls| T8
  S9["method:JobsCallbackable::jobsCallSelfKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:111"]
  T9["method:JobsCallbackable::jobs_normalizeFunctionKey<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:98"]
  S9 -->|calls| T9
  S10["method:JobsDebugDeinitAutoLoad::load<br/>JobsByPods/JobsSwiftDebugTools@Pods/JobsDebugDeinitAutoLoad.m:18"]
  T10["method:CameraCaptureController::start<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CameraCapture.mm:356"]
  S10 -->|calls| T10
  S11["method:VCDebugDeallocDebug::install<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:35"]
  T11["method:UIViewController::_vcDebug_swizzleViewDidLoadOnce<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:78"]
  S11 -->|calls| T11
  S12["method:UIViewController::_vcDebug_viewDidLoad<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:96"]
  T12["method:UIViewController::_vcDebug_attachDeinitObserverIfNeeded<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:43"]
  S12 -->|calls| T12
  S13["method:UIViewController::_vcDebug_viewDidLoad<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:96"]
  T13["method:UIViewController::_vcDebug_viewDidLoad<br/>JobsByPods/JobsSwiftDebugTools@Pods/UIViewController+DebugDeallocSwizzle.swift:96"]
  S13 -->|calls| T13
  S14["method:UserDefaults::setBool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:17"]
  T14["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S14 -->|calls| T14
  S15["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  T15["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S15 -->|calls| T15
  S16["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  T16["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  S16 -->|calls| T16
  S17["method:UserDefaults::setInt<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:25"]
  T17["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S17 -->|calls| T17
  S18["method:UserDefaults::int<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:28"]
  T18["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S18 -->|calls| T18
  S19["method:UserDefaults::setDouble<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:33"]
  T19["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S19 -->|calls| T19
  S20["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  T20["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S20 -->|calls| T20
  S21["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  T21["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  S21 -->|calls| T21
  S22["method:UserDefaults::setFloat<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:41"]
  T22["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S22 -->|calls| T22
  S23["method:UserDefaults::float<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:44"]
  T23["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S23 -->|calls| T23
  S24["method:UserDefaults::float<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:44"]
  T24["method:UserDefaults::float<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:44"]
  S24 -->|calls| T24
  S25["method:UserDefaults::setString<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:49"]
  T25["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
