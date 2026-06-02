# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  T1["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  S1 -->|calls| T1
  S2["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  T2["method:JobsRetryPolicy::decision<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsRetryPolicy.swift:66"]
  S2 -->|calls| T2
  S3["method:JobsDefaultAgent::retryUploadIfNeeded<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:85"]
  T3["method:JobsDefaultAgent::doUpload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:28"]
  S3 -->|calls| T3
  S4["method:UIScrollView::byRefreshFeedback<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:215"]
  T4["method:UIScrollView::jobs_playHapticImpact<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:233"]
  S4 -->|calls| T4
  S5["method:UIScrollView::byRefreshFeedback<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:215"]
  T5["method:UIScrollView::jobs_playSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:243"]
  S5 -->|calls| T5
  S6["method:UIScrollView::jobs_playSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:243"]
  T6["method:UIScrollView::jobs_resolveSoundURL<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:269"]
  S6 -->|calls| T6
  S7["method:UIScrollView::jobs_playSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:243"]
  T7["method:UIScrollView::jobs_playSystemSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:287"]
  S7 -->|calls| T7
  S8["enum:JobsScale<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:32"]
  T8["method:JobsScale::scaleFromBreakpoints<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:119"]
  S8 -->|calls| T8
  S9["enum:JobsScale<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:32"]
  T9["method:JobsScale::clamp<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:134"]
  S9 -->|calls| T9
  S10["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  T10["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:115"]
  S10 -->|calls| T10
  S11["class:BinaryInteger<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:141"]
  T11["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S11 -->|calls| T11
  S12["class:BinaryInteger<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:141"]
  T12["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S12 -->|calls| T12
  S13["class:BinaryInteger<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:141"]
  T13["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S13 -->|calls| T13
  S14["class:BinaryFloatingPoint<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:150"]
  T14["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S14 -->|calls| T14
  S15["class:BinaryFloatingPoint<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:150"]
  T15["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S15 -->|calls| T15
  S16["class:BinaryFloatingPoint<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:150"]
  T16["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S16 -->|calls| T16
  S17["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  T17["method:JobsCor::resolveUIColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:18"]
  S17 -->|calls| T17
  S18["method:JobsCor::dynamic15<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:35"]
  T18["method:JobsCor::resolveUIColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:18"]
  S18 -->|calls| T18
  S19["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T19["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S19 -->|calls| T19
  S20["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T20["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S20 -->|calls| T20
  S21["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T21["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S21 -->|calls| T21
  S22["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T22["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S22 -->|calls| T22
  S23["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T23["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S23 -->|calls| T23
  S24["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T24["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S24 -->|calls| T24
  S25["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T25["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
