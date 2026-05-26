# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:17"]
  T1["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S1 -->|calls| T1
  S2["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:17"]
  T2["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S2 -->|calls| T2
  S3["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T3["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S3 -->|calls| T3
  S4["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T4["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S4 -->|calls| T4
  S5["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T5["method:UILabel::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:157"]
  S5 -->|calls| T5
  S6["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T6["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S6 -->|calls| T6
  S7["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T7["method:UITapGestureRecognizer::byTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:121"]
  S7 -->|calls| T7
  S8["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T8["method:UILongPressGestureRecognizer::byMovement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:136"]
  S8 -->|calls| T8
  S9["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T9["method:UILongPressGestureRecognizer::byMinDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:130"]
  S9 -->|calls| T9
  S10["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:41"]
  T10["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S10 -->|calls| T10
  S11["method:UINavigationBar::byLegacyTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:220"]
  T11["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S11 -->|calls| T11
  S12["method:UINavigationBar::byLegacyTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:231"]
  T12["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S12 -->|calls| T12
  S13["method:UINavigationBar::byLegacyLargeTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:242"]
  T13["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S13 -->|calls| T13
  S14["method:UINavigationBar::byLegacyLargeTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:254"]
  T14["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S14 -->|calls| T14
  S15["method:UINavigationBar::byItems<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:355"]
  T15["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  S15 -->|calls| T15
  S16["method:UINavigationBarAppearance::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:20"]
  T16["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S16 -->|calls| T16
  S17["method:UINavigationBarAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:29"]
  T17["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S17 -->|calls| T17
  S18["method:UINavigationBarAppearance::byLargeTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:50"]
  T18["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S18 -->|calls| T18
  S19["method:UINavigationBarAppearance::byLargeTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:59"]
  T19["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S19 -->|calls| T19
  S20["method:UINavigationBarAppearance::bySubtitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:80"]
  T20["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S20 -->|calls| T20
  S21["method:UINavigationBarAppearance::bySubtitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:89"]
  T21["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S21 -->|calls| T21
  S22["method:UINavigationBarAppearance::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:110"]
  T22["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S22 -->|calls| T22
  S23["method:UINavigationBarAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:120"]
  T23["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S23 -->|calls| T23
  S24["method:UINavigationBarAppearance::byLargeTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:142"]
  T24["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S24 -->|calls| T24
  S25["method:UINavigationBarAppearance::byLargeTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:152"]
  T25["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
