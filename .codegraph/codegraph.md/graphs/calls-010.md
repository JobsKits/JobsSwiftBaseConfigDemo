# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BluetoothCallbackGate::complete<br/>.github/tests/JobsPodsUpgrade/Network/BluetoothRegression.swift:214"]
  T1["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S1 -->|calls| T1
  S2["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T2["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  S2 -->|calls| T2
  S3["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T3["method:CryptoRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:52"]
  S3 -->|calls| T3
  S4["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T4["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  S4 -->|calls| T4
  S5["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T5["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  S5 -->|calls| T5
  S6["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T6["method:CryptoRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:52"]
  S6 -->|calls| T6
  S7["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T7["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  S7 -->|calls| T7
  S8["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T8["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S8 -->|calls| T8
  S9["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T9["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  S9 -->|calls| T9
  S10["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T10["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S10 -->|calls| T10
  S11["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T11["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  S11 -->|calls| T11
  S12["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T12["method:JobsAES::encryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:58"]
  S12 -->|calls| T12
  S13["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T13["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S13 -->|calls| T13
  S14["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T14["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  S14 -->|calls| T14
  S15["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T15["method:CryptoRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:52"]
  S15 -->|calls| T15
  S16["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T16["method:JobsAES::decryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:64"]
  S16 -->|calls| T16
  S17["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T17["method:JobsAES::encryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:58"]
  S17 -->|calls| T17
  S18["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T18["method:CryptoRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:52"]
  S18 -->|calls| T18
  S19["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T19["method:JobsAES::decryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:64"]
  S19 -->|calls| T19
  S20["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T20["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S20 -->|calls| T20
  S21["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T21["method:Data::randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:46"]
  S21 -->|calls| T21
  S22["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T22["method:CryptoRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:52"]
  S22 -->|calls| T22
  S23["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T23["method:Data::randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:46"]
  S23 -->|calls| T23
  S24["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T24["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S24 -->|calls| T24
  S25["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T25["method:PBKDF2::deriveKey<br/>JobsByPods/JobsCryptoKit@Pods/PBKDF2.swift:13"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
