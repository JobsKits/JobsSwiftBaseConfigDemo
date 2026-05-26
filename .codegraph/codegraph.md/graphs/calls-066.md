# `calls 符号关系 - 066`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  T1["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S1 -->|calls| T1
  S2["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  T2["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S2 -->|calls| T2
  S3["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T3["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S3 -->|calls| T3
  S4["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T4["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S4 -->|calls| T4
  S5["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T5["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S5 -->|calls| T5
  S6["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  T6["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S6 -->|calls| T6
  S7["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  T7["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S7 -->|calls| T7
  S8["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  T8["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S8 -->|calls| T8
  S9["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  T9["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S9 -->|calls| T9
  S10["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  T10["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S10 -->|calls| T10
  S11["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  T11["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S11 -->|calls| T11
  S12["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  T12["method:UIGestureRecognizer::_setActionBlock<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:75"]
  S12 -->|calls| T12
  S13["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  T13["method:UIGestureRecognizer::_ensureInvokeTargetInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:84"]
  S13 -->|calls| T13
  S14["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:33"]
  T14["method:UIGestureRecognizer::_setActionBlock<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:75"]
  S14 -->|calls| T14
  S15["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:33"]
  T15["method:UIGestureRecognizer::_ensureInvokeTargetInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:84"]
  S15 -->|calls| T15
  S16["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:43"]
  T16["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:53"]
  S16 -->|calls| T16
  S17["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:48"]
  T17["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:53"]
  S17 -->|calls| T17
  S18["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:53"]
  T18["method:UIGestureRecognizer::_setActionBlock<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:75"]
  S18 -->|calls| T18
  S19["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:53"]
  T19["method:UIGestureRecognizer::_ensureInvokeTargetInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:84"]
  S19 -->|calls| T19
  S20["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:60"]
  T20["method:UIGestureRecognizer::_setActionBlock<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:75"]
  S20 -->|calls| T20
  S21["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:60"]
  T21["method:UIGestureRecognizer::_ensureInvokeTargetInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:84"]
  S21 -->|calls| T21
  S22["method:UIGestureRecognizer::_ensureInvokeTargetInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:84"]
  T22["method:UIGestureRecognizer::_gestureInvoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:70"]
  S22 -->|calls| T22
  S23["method:UIRotationGestureRecognizer::byOnRotationChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:194"]
  T23["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:53"]
  S23 -->|calls| T23
  S24["method:UIPinchGestureRecognizer::byOnScaleChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:230"]
  T24["method:UIGestureRecognizer::byAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:53"]
  S24 -->|calls| T24
  S25["method:UIImage::jobs_solidColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:19"]
  T25["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
