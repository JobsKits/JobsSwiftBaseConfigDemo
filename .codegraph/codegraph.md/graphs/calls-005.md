# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  T1["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S1 -->|calls| T1
  S2["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  T2["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:196"]
  S2 -->|calls| T2
  S3["method:JXSegmentedView::byDelegateProxy<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:148"]
  T3["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S3 -->|calls| T3
  S4["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:18"]
  T4["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S4 -->|calls| T4
  S5["class:SphereGeometry<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:17"]
  T5["method:SphereGeometry::generateSphere<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/SphereGeometry.swift:28"]
  S5 -->|calls| T5
  S6["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T6["method:VideoTextureManager::setupDisplayLink<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:72"]
  S6 -->|calls| T6
  S7["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T7["method:VideoTextureManager::setupTimeObserver<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:78"]
  S7 -->|calls| T7
  S8["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  T8["method:VideoTextureManager::setupNotifications<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:88"]
  S8 -->|calls| T8
  S9["method:VideoTextureManager::updateTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:101"]
  T9["method:VideoTextureManager::createTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:114"]
  S9 -->|calls| T9
  S10["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  T10["method:PlayerCenterImpl::play<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:35"]
  S10 -->|calls| T10
  S11["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:148"]
  T11["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  S11 -->|calls| T11
  S12["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:148"]
  T12["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  S12 -->|calls| T12
  S13["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  T13["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S13 -->|calls| T13
  S14["class:VideoTextureManager<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:18"]
  T14["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S14 -->|calls| T14
  S15["class:IrregularButton<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:15"]
  T15["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:34"]
  S15 -->|calls| T15
  S16["class:IrregularButton<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:15"]
  T16["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:34"]
  S16 -->|calls| T16
  S17["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:50"]
  T17["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:50"]
  S17 -->|calls| T17
  S18["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:50"]
  T18["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:68"]
  S18 -->|calls| T18
  S19["method:IrregularButton::point<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:63"]
  T19["method:IrregularButton::point<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:63"]
  S19 -->|calls| T19
  S20["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:68"]
  T20["method:IrregularButton::scaled<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:79"]
  S20 -->|calls| T20
  S21["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:68"]
  T21["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S21 -->|calls| T21
  S22["method:Bundle::jobs_enableLanguageHook<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:20"]
  T22["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:14"]
  S22 -->|calls| T22
  S23["method:Bundle::jobs_enableLanguageHook<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:20"]
  T23["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S23 -->|calls| T23
  S24["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  T24["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S24 -->|calls| T24
  S25["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  T25["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
