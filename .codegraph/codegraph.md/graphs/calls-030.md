# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:15"]
  T1["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:84"]
  S1 -->|calls| T1
  S2["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:43"]
  T2["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S2 -->|calls| T2
  S3["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:43"]
  T3["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:116"]
  S3 -->|calls| T3
  S4["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:84"]
  T4["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S4 -->|calls| T4
  S5["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:116"]
  T5["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S5 -->|calls| T5
  S6["class:String<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/MD5.swift:12"]
  T6["method:String::md5<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/MD5.swift:21"]
  S6 -->|calls| T6
  S7["class:Digest<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/SHA.swift:60"]
  T7["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S7 -->|calls| T7
  S8["class:GestureNodeView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:11"]
  T8["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S8 -->|calls| T8
  S9["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:45"]
  T9["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:45"]
  S9 -->|calls| T9
  S10["class:GestureUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:16"]
  T10["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  S10 -->|calls| T10
  S11["class:GestureUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:16"]
  T11["method:GestureUnlockView::commonInit<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:52"]
  S11 -->|calls| T11
  S12["class:GestureUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:16"]
  T12["method:GestureUnlockView::commonInit<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:52"]
  S12 -->|calls| T12
  S13["method:GestureUnlockView::commonInit<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:52"]
  T13["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  S13 -->|calls| T13
  S14["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  T14["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  S14 -->|calls| T14
  S15["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  T15["method:GestureUnlockView::layoutNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:111"]
  S15 -->|calls| T15
  S16["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  T16["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S16 -->|calls| T16
  S17["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:72"]
  T17["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  S17 -->|calls| T17
  S18["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:72"]
  T18["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S18 -->|calls| T18
  S19["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:72"]
  T19["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S19 -->|calls| T19
  S20["method:GestureUnlockView::showError<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:85"]
  T20["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  S20 -->|calls| T20
  S21["method:GestureUnlockView::showSelected<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:89"]
  T21["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  S21 -->|calls| T21
  S22["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  T23["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S23 -->|calls| T23
  S24["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:135"]
  T24["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:72"]
  S24 -->|calls| T24
  S25["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:135"]
  T25["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
