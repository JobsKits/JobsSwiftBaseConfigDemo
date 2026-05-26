# `calls 符号关系 - 006`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BMPlayer::byPlay<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:94"]
  T1["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  S1 -->|calls| T1
  S2["method:BMPlayer::byPause<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:100"]
  T2["method:JobsLiveFloatPlayer::pause<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:77"]
  S2 -->|calls| T2
  S3["method:BMPlayer::bySeek<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:112"]
  T3["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S3 -->|calls| T3
  S4["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T4["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  S4 -->|calls| T4
  S5["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T5["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:167"]
  S5 -->|calls| T5
  S6["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T6["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S6 -->|calls| T6
  S7["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T7["method:JobsDialogBoxBuilder::byCornerRadius<br/>JobsByPods/JobsBy3rdTools@Pods/JobsDialogBox.swift:69"]
  S7 -->|calls| T7
  S8["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T8["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S8 -->|calls| T8
  S9["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T9["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S9 -->|calls| T9
  S10["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T10["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S10 -->|calls| T10
  S11["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T11["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S11 -->|calls| T11
  S12["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T12["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S12 -->|calls| T12
  S13["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:24"]
  T13["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S13 -->|calls| T13
  S14["method:JXSegmentedTitleDataSource::byDynamicConfiguration<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:143"]
  T14["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S14 -->|calls| T14
  S15["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:102"]
  T15["method:JXSegmentedListContainerView::jx_currentIndexFromContentOffset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:158"]
  S15 -->|calls| T15
  S16["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:102"]
  T16["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  S16 -->|calls| T16
  S17["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:102"]
  T17["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S17 -->|calls| T17
  S18["method:JXSegmentedListContainerView::jx_currentIndexFromContentOffset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:158"]
  T18["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  S18 -->|calls| T18
  S19["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  T19["method:JXSegmentedListContainerView::jx_currentIndexFromContentOffset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:158"]
  S19 -->|calls| T19
  S20["method:_JXScrollDelegateProxy::responds<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:188"]
  T20["method:_JXScrollDelegateProxy::responds<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:188"]
  S20 -->|calls| T20
  S21["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:197"]
  T21["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:197"]
  S21 -->|calls| T21
  S22["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:197"]
  T22["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S22 -->|calls| T22
  S23["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:203"]
  T23["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:203"]
  S23 -->|calls| T23
  S24["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:203"]
  T24["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:167"]
  S24 -->|calls| T24
  S25["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  T25["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:211"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
