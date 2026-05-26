# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AESCBC::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:14"]
  T1["method:AESCBC::crypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:23"]
  S1 -->|calls| T1
  S2["method:AESCBC::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:18"]
  T2["method:AESCBC::crypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:23"]
  S2 -->|calls| T2
  S3["class:Data<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:23"]
  T3["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S3 -->|calls| T3
  S4["class:Data<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:23"]
  T4["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  S4 -->|calls| T4
  S5["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T5["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  S5 -->|calls| T5
  S6["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T6["function:randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:161"]
  S6 -->|calls| T6
  S7["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T7["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:95"]
  S7 -->|calls| T7
  S8["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T8["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S8 -->|calls| T8
  S9["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T9["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  S9 -->|calls| T9
  S10["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T10["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:128"]
  S10 -->|calls| T10
  S11["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  T11["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S11 -->|calls| T11
  S12["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:95"]
  T12["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S12 -->|calls| T12
  S13["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:128"]
  T13["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S13 -->|calls| T13
  S14["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:15"]
  T14["function:randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:148"]
  S14 -->|calls| T14
  S15["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:15"]
  T15["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:84"]
  S15 -->|calls| T15
  S16["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:43"]
  T16["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S16 -->|calls| T16
  S17["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:43"]
  T17["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:116"]
  S17 -->|calls| T17
  S18["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:84"]
  T18["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S18 -->|calls| T18
  S19["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:116"]
  T19["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S19 -->|calls| T19
  S20["class:String<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/MD5.swift:12"]
  T20["method:String::md5<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/MD5.swift:21"]
  S20 -->|calls| T20
  S21["class:Digest<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/SHA.swift:60"]
  T21["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S21 -->|calls| T21
  S22["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T22["method:CALayer::byName<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:304"]
  S22 -->|calls| T22
  S23["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T23["method:UIAlertAction::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:19"]
  S23 -->|calls| T23
  S24["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T24["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S24 -->|calls| T24
  S25["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T25["method:UITapGestureRecognizer::byTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
