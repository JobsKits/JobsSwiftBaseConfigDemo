# `calls 符号关系 - 105`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T1["function:SortAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S1 -->|calls| T1
  S2["method:IGListAdapter::setASDKCollectionNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/IGListAdapter+AsyncDisplayKit.mm:19"]
  T2["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  S2 -->|calls| T2
  S3["function:absoluteLayoutSpecWithSizing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:28"]
  T3["function:initWithSizing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  S3 -->|calls| T3
  S4["function:initWithChildren:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:40"]
  T4["function:initWithSizing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  S4 -->|calls| T4
  S5["function:initWithSizing:children:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  T5["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:1"]
  T6["function:ASSizeRangeClamp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S6 -->|calls| T6
  S7["method:NSString::debugbox_stringWithString:repeatedCount:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:29"]
  T7["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S7 -->|calls| T7
  S8["method:NSString::debugbox_stringByAddingPadding:count:location:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:38"]
  T8["variable:copy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S8 -->|calls| T8
  S9["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T9["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S9 -->|calls| T9
  S10["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T10["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S10 -->|calls| T10
  S11["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T11["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S11 -->|calls| T11
  S12["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T13["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  S13 -->|calls| T13
  S14["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T14["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S14 -->|calls| T14
  S15["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T15["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S15 -->|calls| T15
  S16["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T16["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  S16 -->|calls| T16
  S17["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T17["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S17 -->|calls| T17
  S18["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T18["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S18 -->|calls| T18
  S19["method:ASBackgroundLayoutSpec::backgroundLayoutSpecWithChild:background:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:23"]
  T19["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  S19 -->|calls| T19
  S20["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  T20["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S20 -->|calls| T20
  S21["method:ASBackgroundLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:45"]
  T21["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S21 -->|calls| T21
  S22["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  T22["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S22 -->|calls| T22
  S23["method:ASBackgroundLayoutSpec::setBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:80"]
  T23["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S23 -->|calls| T23
  S24["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  T24["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S24 -->|calls| T24
  S25["method:ASCenterLayoutSpec::centerLayoutSpecWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:33"]
  T25["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
