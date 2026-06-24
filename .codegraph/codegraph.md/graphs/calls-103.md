# `calls 符号关系 - 103`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayView::__forwardTouchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:327"]
  T1["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  S1 -->|calls| T1
  S2["method:_ASDisplayView::__forwardTouchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:332"]
  T2["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  S2 -->|calls| T2
  S3["method:_ASDisplayView::__forwardTouchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:337"]
  T3["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  S3 -->|calls| T3
  S4["method:_ASDisplayView::__forwardTouchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:342"]
  T4["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  S4 -->|calls| T4
  S5["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  T5["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  S5 -->|calls| T5
  S6["method:_ASDisplayView::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:367"]
  T6["method:_ASDisplayView::pointInside:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:367"]
  S6 -->|calls| T6
  S7["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  T7["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  S7 -->|calls| T7
  S8["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  T8["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  S8 -->|calls| T8
  S9["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  T9["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S9 -->|calls| T9
  S10["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  T10["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  S10 -->|calls| T10
  S11["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  T11["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S11 -->|calls| T11
  S12["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  T12["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  S12 -->|calls| T12
  S13["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  T13["method:ASEditableTextNode::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:506"]
  S13 -->|calls| T13
  S14["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  T14["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  S14 -->|calls| T14
  S15["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  T15["method:ASEditableTextNode::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:511"]
  S15 -->|calls| T15
  S16["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  T16["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  S16 -->|calls| T16
  S17["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  T17["method:ASEditableTextNode::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:489"]
  S17 -->|calls| T17
  S18["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  T18["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  S18 -->|calls| T18
  S19["method:_ASDisplayView::canPerformAction:withSender:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:462"]
  T19["method:_ASDisplayView::canPerformAction:withSender:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:462"]
  S19 -->|calls| T19
  S20["method:_ASDisplayView::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:469"]
  T20["method:_ASDisplayView::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:469"]
  S20 -->|calls| T20
  S21["method:_ASDisplayView::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:469"]
  T21["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  S21 -->|calls| T21
  S22["method:_ASDisplayView::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:477"]
  T22["method:_ASDisplayView::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:477"]
  S22 -->|calls| T22
  S23["method:_ASDisplayView::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:477"]
  T23["method:ASDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1051"]
  S23 -->|calls| T23
  S24["method:_ASDisplayView::canBecomeFocused<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:496"]
  T24["method:ASDisplayNode::canBecomeFocused<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:90"]
  S24 -->|calls| T24
  S25["method:_ASDisplayView::setNeedsFocusUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:508"]
  T25["method:ASDisplayNode::setNeedsFocusUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:95"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
