# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T1["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S1 -->|calls| T1
  S2["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T2["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S2 -->|calls| T2
  S3["function:Win32Window::Create<br/>my_flutter/windows/runner/win32_window.cpp:123"]
  T3["function:Scale<br/>my_flutter/windows/runner/win32_window.cpp:36"]
  S3 -->|calls| T3
  S4["function:CALLBACK Win32Window::WndProc<br/>my_flutter/windows/runner/win32_window.cpp:157"]
  T4["function:EnableFullDpiSupportIfAvailable<br/>my_flutter/windows/runner/win32_window.cpp:42"]
  S4 -->|calls| T4
  S5["function:Win32Window::Destroy<br/>my_flutter/windows/runner/win32_window.cpp:224"]
  T5["method:WindowClassRegistrar::GetInstance<br/>my_flutter/windows/runner/win32_window.cpp:64"]
  S5 -->|calls| T5
  S6["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  T6["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S6 -->|calls| T6
  S7["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  T7["function:alignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:58"]
  S7 -->|calls| T7
  S8["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  T8["function:alignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:58"]
  S8 -->|calls| T8
  S9["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  T9["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S9 -->|calls| T9
  S10["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T10["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S10 -->|calls| T10
  S11["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T11["method:ASLayoutElementStyle::yogaNodeCreateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:778"]
  S11 -->|calls| T11
  S12["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T12["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  S12 -->|calls| T12
  S13["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T13["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  S13 -->|calls| T13
  S14["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T14["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S14 -->|calls| T14
  S15["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T15["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S15 -->|calls| T15
  S16["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T16["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S16 -->|calls| T16
  S17["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T17["function:ASEdgeInsetsMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S17 -->|calls| T17
  S18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  T19["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S19 -->|calls| T19
  S20["method:ASButtonNode::titleNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:50"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["method:ASButtonNode::imageNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:70"]
  T21["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S21 -->|calls| T21
  S22["method:ASButtonNode::backgroundImageNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:80"]
  T22["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S22 -->|calls| T22
  S23["method:ASButtonNode::setEnabled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:97"]
  T23["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S23 -->|calls| T23
  S24["method:ASButtonNode::setHighlighted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:106"]
  T24["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S24 -->|calls| T24
  S25["method:ASButtonNode::setSelected:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:114"]
  T25["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
