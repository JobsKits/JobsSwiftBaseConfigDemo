# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:25"]
  T1["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  S1 -->|calls| T1
  S2["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:25"]
  T2["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S2 -->|calls| T2
  S3["method:HUDHelper::show<br/>JobsByPods/JobsBy3rdTools@Pods/HUDHelper.swift:25"]
  T3["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S3 -->|calls| T3
  S4["method:JXSegmentedBaseDataSource::byAttach<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedBaseDataSource.swift:68"]
  T4["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  S4 -->|calls| T4
  S5["method:JXSegmentedBaseDataSource::byAttach<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedBaseDataSource.swift:68"]
  T5["method:JobsSwiftExcelView::reloadData<br/>JobsByPods/JobsSwiftExcel@Pods/Core/JobsSwiftExcelView/JobsSwiftExcelView.swift:77"]
  S5 -->|calls| T5
  S6["method:JXSegmentedBaseDataSource::byReload<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedBaseDataSource.swift:79"]
  T6["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  S6 -->|calls| T6
  S7["method:JobsSegmentedTitleClosureConfiguration::titleNumberOfLines<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:26"]
  T7["field:JobsSegmentedTitleClosureConfiguration::numberOfLines<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:20"]
  S7 -->|calls| T7
  S8["method:JobsSegmentedTitleClosureConfiguration::titleNormalColor<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:29"]
  T8["field:JobsSegmentedTitleClosureConfiguration::normalColor<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:21"]
  S8 -->|calls| T8
  S9["method:JobsSegmentedTitleClosureConfiguration::titleSelectedColor<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:32"]
  T9["field:JobsSegmentedTitleClosureConfiguration::selectedColor<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:22"]
  S9 -->|calls| T9
  S10["method:JobsSegmentedTitleClosureConfiguration::titleNormalFont<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:35"]
  T10["field:JobsSegmentedTitleClosureConfiguration::normalFont<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:23"]
  S10 -->|calls| T10
  S11["method:JobsSegmentedTitleClosureConfiguration::titleSelectedFont<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:38"]
  T11["field:JobsSegmentedTitleClosureConfiguration::selectedFont<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:24"]
  S11 -->|calls| T11
  S12["method:JXSegmentedTitleDataSource::byAttach<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:152"]
  T12["method:JobsSwiftExcelView::reloadData<br/>JobsByPods/JobsSwiftExcel@Pods/Core/JobsSwiftExcelView/JobsSwiftExcelView.swift:77"]
  S12 -->|calls| T12
  S13["method:JXSegmentedListContainerView::byShowsIndicators<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:56"]
  T13["method:UIScrollView::byShowsVerticalScrollIndicator<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:25"]
  S13 -->|calls| T13
  S14["method:JXSegmentedListContainerView::byShowsIndicators<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:56"]
  T14["method:UIScrollView::byShowsHorizontalScrollIndicator<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:31"]
  S14 -->|calls| T14
  S15["method:JXSegmentedListContainerView::byNeverAdjustContentInset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:74"]
  T15["method:UIScrollView::byContentInsetAdjustmentBehavior<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:122"]
  S15 -->|calls| T15
  S16["method:JXSegmentedListContainerView::byReload<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:87"]
  T16["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  S16 -->|calls| T16
  S17["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:101"]
  T17["method:JXSegmentedListContainerView::jx_currentIndexFromContentOffset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:156"]
  S17 -->|calls| T17
  S18["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:101"]
  T18["method:UIScrollView::byDelegate<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:91"]
  S18 -->|calls| T18
  S19["method:JXSegmentedListContainerView::byIndexChange<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:101"]
  T19["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:165"]
  S19 -->|calls| T19
  S20["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:165"]
  T20["method:JXSegmentedListContainerView::jx_currentIndexFromContentOffset<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:156"]
  S20 -->|calls| T20
  S21["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:165"]
  T21["property:JXSegmentedListContainerView::jx_handler<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:136"]
  S21 -->|calls| T21
  S22["method:_JXScrollDelegateProxy::responds<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:185"]
  T22["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S22 -->|calls| T22
  S23["method:_JXScrollDelegateProxy::responds<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:185"]
  T23["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S23 -->|calls| T23
  S24["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:193"]
  T24["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:193"]
  S24 -->|calls| T24
  S25["method:_JXScrollDelegateProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:193"]
  T25["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:165"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
