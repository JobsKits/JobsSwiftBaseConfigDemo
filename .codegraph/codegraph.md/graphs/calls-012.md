# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:LockReleaseRegression::main::value<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:72"]
  T1["method:JobsMemoryCache::removeAll<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:130"]
  S1 -->|calls| T1
  S2["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T2["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:84"]
  S2 -->|calls| T2
  S3["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T3["function:LockReleaseRegression::main::value<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:72"]
  S3 -->|calls| T3
  S4["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T4["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:84"]
  S4 -->|calls| T4
  S5["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T5["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:84"]
  S5 -->|calls| T5
  S6["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T6["method:JobsMemoryCache::removeAll<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:130"]
  S6 -->|calls| T6
  S7["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T7["method:JobsMemoryCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:57"]
  S7 -->|calls| T7
  S8["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T8["method:JobsMemoryCache::remove<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:119"]
  S8 -->|calls| T8
  S9["method:LockReleaseRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:24"]
  T9["function:LockReleaseRegression::main::install<br/>.github/tests/JobsPodsUpgrade/Network/LockReleaseRegression.swift:99"]
  S9 -->|calls| T9
  S10["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T10["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:45"]
  S10 -->|calls| T10
  S11["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T11["variable:object<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASRunLoopQueue.h:64"]
  S11 -->|calls| T11
  S12["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T12["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:45"]
  S12 -->|calls| T12
  S13["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T13["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:12"]
  S13 -->|calls| T13
  S14["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T14["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:12"]
  S14 -->|calls| T14
  S15["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T15["method:JobsCacheKey::digest<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:46"]
  S15 -->|calls| T15
  S16["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T16["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:12"]
  S16 -->|calls| T16
  S17["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T17["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:12"]
  S17 -->|calls| T17
  S18["method:NetworkHTTPRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkHTTPRegression.swift:12"]
  T18["function:AS::filter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASLayoutSpecUtilities.h:49"]
  S18 -->|calls| T18
  S19["method:NetworkRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:13"]
  T19["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  S19 -->|calls| T19
  S20["method:NetworkRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:13"]
  T20["method:NetworkRegression::tokenRegistration<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:79"]
  S20 -->|calls| T20
  S21["method:NetworkRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:13"]
  T21["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  S21 -->|calls| T21
  S22["method:NetworkRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:13"]
  T22["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  S22 -->|calls| T22
  S23["method:NetworkRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:13"]
  T23["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  S23 -->|calls| T23
  S24["function:NetworkRegression::cacheAndValues::key<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:29"]
  T24["method:JobsCacheKey::make<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheKey.swift:16"]
  S24 -->|calls| T24
  S25["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  T25["function:NetworkRegression::cacheAndValues::key<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
