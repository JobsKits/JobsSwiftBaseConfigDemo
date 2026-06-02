# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::__probe_viewDidAppear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:226"]
  T1["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S1 -->|calls| T1
  S2["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  T2["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  S2 -->|calls| T2
  S3["method:UIViewController::__probe_viewWillDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:230"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S3 -->|calls| T3
  S4["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  T4["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  S4 -->|calls| T4
  S5["method:UIViewController::__probe_viewDidDisappear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:234"]
  T5["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S5 -->|calls| T5
  S6["method:UIViewController::__probe_viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:238"]
  T6["method:UIViewController::__probe_viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:238"]
  S6 -->|calls| T6
  S7["method:UIViewController::__probe_viewWillLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:238"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:242"]
  T8["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:242"]
  S8 -->|calls| T8
  S9["method:UIViewController::__probe_viewDidLayoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:242"]
  T9["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S9 -->|calls| T9
  S10["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:246"]
  T10["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:246"]
  S10 -->|calls| T10
  S11["method:UIViewController::__probe_viewSafeAreaInsetsDidChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+生命周期探针.swift:246"]
  T11["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S11 -->|calls| T11
  S12["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:64"]
  T12["method:UIAlertAction::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:32"]
  S12 -->|calls| T12
  S13["method:AESCBC::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:14"]
  T13["method:AESCBC::crypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:23"]
  S13 -->|calls| T13
  S14["method:AESCBC::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:18"]
  T14["method:AESCBC::crypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:23"]
  S14 -->|calls| T14
  S15["class:Data<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:23"]
  T15["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S15 -->|calls| T15
  S16["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T16["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  S16 -->|calls| T16
  S17["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T17["function:randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:161"]
  S17 -->|calls| T17
  S18["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T18["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:95"]
  S18 -->|calls| T18
  S19["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T19["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S19 -->|calls| T19
  S20["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T20["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  S20 -->|calls| T20
  S21["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T21["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:128"]
  S21 -->|calls| T21
  S22["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  T22["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S22 -->|calls| T22
  S23["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:95"]
  T23["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S23 -->|calls| T23
  S24["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:128"]
  T24["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S24 -->|calls| T24
  S25["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:15"]
  T25["function:randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:148"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
