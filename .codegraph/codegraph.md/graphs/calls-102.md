# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayLayer::display<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  T1["method:_ASDisplayLayer::_hackResetNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:168"]
  S1 -->|calls| T1
  S2["method:_ASDisplayLayer::display<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  T2["method:_ASDisplayLayer::display<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  S2 -->|calls| T2
  S3["method:_ASDisplayLayer::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:204"]
  T3["method:_ASDisplayLayer::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:204"]
  S3 -->|calls| T3
  S4["method:_ASDisplayView::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:54"]
  T4["method:_ASDisplayView::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:54"]
  S4 -->|calls| T4
  S5["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  T5["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S5 -->|calls| T5
  S6["method:_ASDisplayView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:107"]
  T6["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S6 -->|calls| T6
  S7["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T7["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S7 -->|calls| T7
  S8["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T8["method:ASDisplayNode::closestViewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Convenience.mm:17"]
  S8 -->|calls| T8
  S9["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  T9["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S9 -->|calls| T9
  S10["method:_ASDisplayView::sizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:247"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["method:_ASDisplayView::contentMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:260"]
  T11["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  S11 -->|calls| T11
  S12["method:_ASDisplayView::setContentMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:265"]
  T12["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  S12 -->|calls| T12
  S13["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  T13["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  S13 -->|calls| T13
  S14["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  T14["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  S14 -->|calls| T14
  S15["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  T15["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  S15 -->|calls| T15
  S16["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  T16["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  S16 -->|calls| T16
  S17["method:_ASDisplayView::__forwardTouchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:327"]
  T17["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  S17 -->|calls| T17
  S18["method:_ASDisplayView::__forwardTouchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:332"]
  T18["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  S18 -->|calls| T18
  S19["method:_ASDisplayView::__forwardTouchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:337"]
  T19["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  S19 -->|calls| T19
  S20["method:_ASDisplayView::__forwardTouchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:342"]
  T20["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  S20 -->|calls| T20
  S21["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  T21["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  S21 -->|calls| T21
  S22["method:_ASDisplayView::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:367"]
  T22["method:_ASDisplayView::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:367"]
  S22 -->|calls| T22
  S23["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  T23["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  S23 -->|calls| T23
  S24["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  T24["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  S24 -->|calls| T24
  S25["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  T25["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
