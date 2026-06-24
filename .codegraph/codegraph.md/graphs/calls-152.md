# `calls 符号关系 - 152`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:92"]
  T1["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  S1 -->|calls| T1
  S2["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:109"]
  T2["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  S2 -->|calls| T2
  S3["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  T3["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  S3 -->|calls| T3
  S4["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:124"]
  T4["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S4 -->|calls| T4
  S5["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  T5["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S5 -->|calls| T5
  S6["method:UIImage::as_resizableRoundedImageWithCornerRadius:cornerColor:fillColor:borderColor:borderWidth:roundedCorners:scale:traitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIImage+ASConvenience.mm:143"]
  T6["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S6 -->|calls| T6
  S7["method:UIResponder::asdk_associatedViewController<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/UIResponder+AsyncDisplayKit.mm:17"]
  T7["method:UIResponder::asdk_responderChainEnumerator<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:40"]
  S7 -->|calls| T7
  S8["method:_ASTransitionContext::initWithAnimation:layoutDelegate:completionDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:27"]
  T8["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S8 -->|calls| T8
  S9["method:_ASTransitionContext::subnodesForKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:62"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:_ASAnimatedTransitionContext::contextForNode:alpha:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/_ASTransitionContext.mm:96"]
  T10["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S10 -->|calls| T10
  S11["method:ASControlNode::_pressDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:18"]
  T11["method:ASControlNode::setPressedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:65"]
  S11 -->|calls| T11
  S12["method:ASControlNode::_pressDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:18"]
  T12["method:ASControlNode::setFocusedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:57"]
  S12 -->|calls| T12
  S13["method:ASControlNode::didUpdateFocusInContext:withAnimationCoordinator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:41"]
  T13["method:ASControlNode::setFocusedState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:57"]
  S13 -->|calls| T13
  S14["method:ASControlNode::didUpdateFocusInContext:withAnimationCoordinator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:41"]
  T14["method:ASControlNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASControlNode+tvOS.mm:81"]
  S14 -->|calls| T14
  S15["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T15["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  S15 -->|calls| T15
  S16["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T16["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S16 -->|calls| T16
  S17["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T17["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S17 -->|calls| T17
  S18["method:ASImageNode::touchesBegan:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:23"]
  T18["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S18 -->|calls| T18
  S19["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  T19["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  S19 -->|calls| T19
  S20["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  T20["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S20 -->|calls| T20
  S21["method:ASImageNode::touchesMoved:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:59"]
  T21["method:ASImageNode::setDefaultFocusAppearance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:169"]
  S21 -->|calls| T21
  S22["method:ASImageNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:124"]
  T22["method:ASImageNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:124"]
  S22 -->|calls| T22
  S23["method:ASImageNode::touchesEnded:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:124"]
  T23["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  S23 -->|calls| T23
  S24["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  T24["method:ASImageNode::getView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:183"]
  S24 -->|calls| T24
  S25["method:ASImageNode::finishTouches<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/tvOS/ASImageNode+tvOS.mm:130"]
  T25["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
