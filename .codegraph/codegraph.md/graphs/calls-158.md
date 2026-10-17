# `calls 符号关系 - 158`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T1["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:106"]
  S1 -->|calls| T1
  S2["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T2["method:JobsAES::authenticatedKeys<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:75"]
  S2 -->|calls| T2
  S3["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T3["method:JobsAES::authenticationCode<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:82"]
  S3 -->|calls| T3
  S4["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T4["method:JobsAES::constantTimeEqual<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:95"]
  S4 -->|calls| T4
  S5["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T5["method:ASCornerLayoutSpecSnapshotTests::suffixWithLocation:option:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:169"]
  S5 -->|calls| T5
  S6["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T6["method:JobsAES::utf8<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:70"]
  S6 -->|calls| T6
  S7["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T7["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:146"]
  S7 -->|calls| T7
  S8["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  T8["method:JobsAES::authenticatedKeys<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:75"]
  S8 -->|calls| T8
  S9["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  T9["method:Data::randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:46"]
  S9 -->|calls| T9
  S10["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  T10["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:114"]
  S10 -->|calls| T10
  S11["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  T11["method:JobsAES::authenticationCode<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:82"]
  S11 -->|calls| T11
  S12["method:JobsAES::encryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:58"]
  T12["method:Data::randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:46"]
  S12 -->|calls| T12
  S13["method:JobsAES::encryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:58"]
  T13["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:114"]
  S13 -->|calls| T13
  S14["method:JobsAES::decryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:64"]
  T14["method:JobsAES::utf8<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:70"]
  S14 -->|calls| T14
  S15["method:JobsAES::decryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:64"]
  T15["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:146"]
  S15 -->|calls| T15
  S16["method:JobsAES::decryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:64"]
  T16["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S16 -->|calls| T16
  S17["method:JobsAES::authenticatedKeys<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:75"]
  T17["method:JobsAES::authenticationCode<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:82"]
  S17 -->|calls| T17
  S18["method:JobsAES::authenticatedKeys<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:75"]
  T18["method:JobsAES::authenticationCode<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:82"]
  S18 -->|calls| T18
  S19["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:13"]
  T19["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  S19 -->|calls| T19
  S20["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:22"]
  T20["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  S20 -->|calls| T20
  S21["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:22"]
  T21["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S21 -->|calls| T21
  S22["method:JobsChaCha20Poly1305Box::decryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:38"]
  T22["method:JobsAES::decryptLegacyCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:64"]
  S22 -->|calls| T22
  S23["method:String::hmacSHA256<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/HMAC.swift:14"]
  T23["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S23 -->|calls| T23
  S24["property:String::md5String<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/MD5.swift:15"]
  T24["method:String::md5<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/MD5.swift:21"]
  S24 -->|calls| T24
  S25["property:String::sha1<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@摘要/SHA.swift:14"]
  T25["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
