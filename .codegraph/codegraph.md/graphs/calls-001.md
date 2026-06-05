# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXSegmentedView::byDelegateProxy<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:148"]
  T1["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S1 -->|calls| T1
  S2["class:SphereGeometry<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:17"]
  T2["method:SphereGeometry::generateSphere<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:28"]
  S2 -->|calls| T2
  S3["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T3["method:VideoTextureManager::setupDisplayLink<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:72"]
  S3 -->|calls| T3
  S4["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T4["method:VideoTextureManager::setupTimeObserver<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:78"]
  S4 -->|calls| T4
  S5["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T5["method:VideoTextureManager::setupNotifications<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:88"]
  S5 -->|calls| T5
  S6["method:VideoTextureManager::updateTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:101"]
  T6["method:VideoTextureManager::createTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:114"]
  S6 -->|calls| T6
  S7["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:148"]
  T7["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  S7 -->|calls| T7
  S8["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:148"]
  T8["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  S8 -->|calls| T8
  S9["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  T9["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S9 -->|calls| T9
  S10["class:VideoTextureManager<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:18"]
  T10["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S10 -->|calls| T10
  S11["method:Bundle::jobs_enableLanguageHook<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:20"]
  T11["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S11 -->|calls| T11
  S12["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  T12["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S12 -->|calls| T12
  S13["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  T13["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S13 -->|calls| T13
  S14["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  T14["method:Bundle::mapLanguageIdentifier<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:67"]
  S14 -->|calls| T14
  S15["method:NSObject::activeRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:18"]
  T15["function:NSObject::activeRootViewController::rank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:24"]
  S15 -->|calls| T15
  S16["method:NSObject::activeRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:18"]
  T16["function:NSObject::activeRootViewController::rank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:24"]
  S16 -->|calls| T16
  S17["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T17["method:NSObject::activeRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:18"]
  S17 -->|calls| T17
  S18["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T18["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S18 -->|calls| T18
  S19["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T19["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S19 -->|calls| T19
  S20["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T20["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S20 -->|calls| T20
  S21["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T21["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S21 -->|calls| T21
  S22["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T22["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S22 -->|calls| T22
  S23["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T23["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S23 -->|calls| T23
  S24["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T24["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S24 -->|calls| T24
  S25["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T25["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
