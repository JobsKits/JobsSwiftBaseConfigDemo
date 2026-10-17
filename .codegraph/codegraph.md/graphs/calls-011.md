# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T1["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S1 -->|calls| T1
  S2["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T2["method:PBKDF2::deriveKey<br/>JobsByPods/JobsCryptoKit@Pods/PBKDF2.swift:13"]
  S2 -->|calls| T2
  S3["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T3["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S3 -->|calls| T3
  S4["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T4["method:PBKDF2::deriveKey<br/>JobsByPods/JobsCryptoKit@Pods/PBKDF2.swift:13"]
  S4 -->|calls| T4
  S5["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T5["method:PBKDF2::deriveKey<br/>JobsByPods/JobsCryptoKit@Pods/PBKDF2.swift:13"]
  S5 -->|calls| T5
  S6["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T6["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  S6 -->|calls| T6
  S7["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T7["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:14"]
  S7 -->|calls| T7
  S8["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T8["method:CryptoRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:52"]
  S8 -->|calls| T8
  S9["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T9["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  S9 -->|calls| T9
  S10["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T10["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:13"]
  S10 -->|calls| T10
  S11["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T11["method:CryptoRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:52"]
  S11 -->|calls| T11
  S12["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T12["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:22"]
  S12 -->|calls| T12
  S13["method:CryptoRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:12"]
  T13["method:PBKDF2::deriveKey<br/>JobsByPods/JobsCryptoKit@Pods/PBKDF2.swift:13"]
  S13 -->|calls| T13
  S14["method:CryptoRegression::expectFailure<br/>.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift:57"]
  T14["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S14 -->|calls| T14
  S15["class:ReleaseProbe<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:10"]
  T15["field:ReleaseProbe::action<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:11"]
  S15 -->|calls| T15
  S16["function:LockReleaseRegression::main::install<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:29"]
  T16["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:32"]
  S16 -->|calls| T16
  S17["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T17["function:LockReleaseRegression::main::install<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:29"]
  S17 -->|calls| T17
  S18["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T18["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:32"]
  S18 -->|calls| T18
  S19["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T19["method:JobsRequestToken::finish<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:72"]
  S19 -->|calls| T19
  S20["function:LockReleaseRegression::main::token<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:48"]
  T20["method:JobsAsyncResultBox::cancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsAsyncResultBox.swift:70"]
  S20 -->|calls| T20
  S21["function:LockReleaseRegression::main::token<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:48"]
  T21["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:32"]
  S21 -->|calls| T21
  S22["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T22["method:JobsAsyncResultBox::install<br/>JobsByPods/JobsNetworking@Pods/Support/JobsAsyncResultBox.swift:20"]
  S22 -->|calls| T22
  S23["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T23["function:LockReleaseRegression::main::token<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:48"]
  S23 -->|calls| T23
  S24["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T24["method:JobsAsyncResultBox::install<br/>JobsByPods/JobsNetworking@Pods/Support/JobsAsyncResultBox.swift:20"]
  S24 -->|calls| T24
  S25["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T25["method:JobsAsyncResultBox::complete<br/>JobsByPods/JobsNetworking@Pods/Support/JobsAsyncResultBox.swift:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
