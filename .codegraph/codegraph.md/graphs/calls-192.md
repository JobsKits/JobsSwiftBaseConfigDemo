# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsImageLoadToken::cancel<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:88"]
  T1["field:JobsImageLoadToken::onCancel<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:80"]
  S1 -->|calls| T1
  S2["method:JobsImageLoader::cachedImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:121"]
  T2["method:JobsImageLoader::fallbackKey<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:370"]
  S2 -->|calls| T2
  S3["method:JobsImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:136"]
  T3["method:JobsImageLoadDelivery::finish<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:405"]
  S3 -->|calls| T3
  S4["method:JobsImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:136"]
  T4["method:JobsImageLoader::loadLocalImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:177"]
  S4 -->|calls| T4
  S5["method:JobsImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:136"]
  T5["method:JobsImageLoader::loadRemoteImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:189"]
  S5 -->|calls| T5
  S6["method:JobsImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:136"]
  T6["method:JobsImageLoadDelivery::finish<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:405"]
  S6 -->|calls| T6
  S7["method:JobsImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:136"]
  T7["method:JobsImageLoadToken::cancel<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:88"]
  S7 -->|calls| T7
  S8["method:JobsImageLoader::loadRemoteImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:189"]
  T8["method:JobsImageLoader::resolvedLoader<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:207"]
  S8 -->|calls| T8
  S9["method:JobsImageLoader::loadRemoteImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:189"]
  T9["method:JobsImageLoader::loadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:280"]
  S9 -->|calls| T9
  S10["method:JobsImageLoader::loadRemoteImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:189"]
  T10["method:JobsImageLoader::loadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:239"]
  S10 -->|calls| T10
  S11["method:JobsImageLoader::loadRemoteImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:189"]
  T11["method:JobsImageLoader::loadWithURLSession<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:324"]
  S11 -->|calls| T11
  S12["method:JobsImageLoader::resolvedLoader<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:207"]
  T12["method:JobsImageLoader::resolvedLoader<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:207"]
  S12 -->|calls| T12
  S13["method:JobsImageLoader::resolvedLoader<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:207"]
  T13["method:JobsImageLoader::resolvedLoader<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:207"]
  S13 -->|calls| T13
  S14["method:JobsImageLoader::loadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:239"]
  T14["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:196"]
  S14 -->|calls| T14
  S15["method:JobsImageLoader::loadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:270"]
  T15["method:JobsImageLoader::loadWithURLSession<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:324"]
  S15 -->|calls| T15
  S16["method:JobsImageLoader::loadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:280"]
  T16["method:ASCollectionNode::contextForSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:964"]
  S16 -->|calls| T16
  S17["method:JobsImageLoader::loadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:315"]
  T17["method:JobsImageLoader::loadWithURLSession<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:324"]
  S17 -->|calls| T17
  S18["method:JobsImageLoader::loadWithURLSession<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:324"]
  T18["method:JobsImageLoader::fallbackKey<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:370"]
  S18 -->|calls| T18
  S19["method:JobsImageLoader::loadWithURLSession<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:324"]
  T19["method:JobsImageLoader::image<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:378"]
  S19 -->|calls| T19
  S20["method:JobsImageLoader::loadWithURLSession<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:324"]
  T20["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:168"]
  S20 -->|calls| T20
  S21["method:JobsImageLoader::loadWithURLSession<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:324"]
  T21["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:196"]
  S21 -->|calls| T21
  S22["method:JobsImageLoader::image<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:378"]
  T22["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S22 -->|calls| T22
  S23["method:JobsImageLoadDelivery::finish<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:405"]
  T23["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S23 -->|calls| T23
  S24["method:JobsImageLoadDelivery::finish<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:405"]
  T24["field:JobsImageLoadDelivery::completion<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:399"]
  S24 -->|calls| T24
  S25["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T25["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
