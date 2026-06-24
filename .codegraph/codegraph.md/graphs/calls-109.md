# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  T1["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  S1 -->|calls| T1
  S2["method:ASLayout::layoutWithLayoutElement:size:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:131"]
  T2["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S2 -->|calls| T2
  S3["method:ASLayout::layoutWithLayoutElement:size:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:141"]
  T3["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S3 -->|calls| T3
  S4["method:ASLayout::isFlattened<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  T4["function:ASPointIsNull<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S4 -->|calls| T4
  S5["method:ASLayout::isFlattened<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  T5["function:ASLayoutIsDisplayNodeType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:46"]
  S5 -->|calls| T5
  S6["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T6["method:ASLayout::isFlattened<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  S6 -->|calls| T6
  S7["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T7["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S7 -->|calls| T7
  S8["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T8["function:ASLayoutIsDisplayNodeType<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:46"]
  S8 -->|calls| T8
  S9["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T9["function:ASCeilPointValues<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  S9 -->|calls| T9
  S10["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T10["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S10 -->|calls| T10
  S11["method:ASLayout::isEqual:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:255"]
  T11["function:ASPointIsNull<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S11 -->|calls| T11
  S12["method:ASLayout::isEqual:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:255"]
  T12["function:ASPointIsNull<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S12 -->|calls| T12
  S13["method:ASLayout::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:324"]
  T13["function:ASPointIsNull<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S13 -->|calls| T13
  S14["method:ASLayout::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  T14["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S14 -->|calls| T14
  S15["method:ASLayout::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  T15["method:ASLayout::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:324"]
  S15 -->|calls| T15
  S16["method:ASLayout::recursiveDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:345"]
  T16["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  S16 -->|calls| T16
  S17["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T17["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S17 -->|calls| T17
  S18["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T18["function:descriptionIndents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:34"]
  S18 -->|calls| T18
  S19["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T19["method:ASLayout::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  S19 -->|calls| T19
  S20["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T20["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  S20 -->|calls| T20
  S21["function:ASCalculateRootLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:371"]
  T21["function:ASCalculateLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:364"]
  S21 -->|calls| T21
  S22["method:ASLayoutElementContext::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:25"]
  T22["method:ASLayoutElementContext::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:25"]
  S22 -->|calls| T22
  S23["function:ASLayoutElementPushContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:76"]
  T23["function:ASLayoutElementContextKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S23 -->|calls| T23
  S24["function:ASLayoutElementPushContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:76"]
  T24["function:ASLayoutElementContextKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S24 -->|calls| T24
  S25["function:ASLayoutElementPopContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:92"]
  T25["function:ASLayoutElementContextKey<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
