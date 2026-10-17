# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  T1["function:NetworkRegression::cacheAndValues::key<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:29"]
  S1 -->|calls| T1
  S2["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  T2["function:NetworkRegression::cacheAndValues::key<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:29"]
  S2 -->|calls| T2
  S3["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  T3["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:84"]
  S3 -->|calls| T3
  S4["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  T4["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:84"]
  S4 -->|calls| T4
  S5["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  T5["method:JobsMemoryCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:57"]
  S5 -->|calls| T5
  S6["method:NetworkRegression::cacheAndValues<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:27"]
  T6["method:JobsMemoryCache::get<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:57"]
  S6 -->|calls| T6
  S7["method:NetworkRegression::tokenRegistration<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:79"]
  T7["method:JobsRequestToken::cancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:52"]
  S7 -->|calls| T7
  S8["method:NetworkRegression::tokenRegistration<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:79"]
  T8["method:JobsRequestToken::setCancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:32"]
  S8 -->|calls| T8
  S9["method:NetworkRegression::tokenRegistration<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:79"]
  T9["method:JobsRequestToken::cancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:52"]
  S9 -->|calls| T9
  S10["method:NetworkRegression::tokenRegistration<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:79"]
  T10["method:JobsRequestToken::finish<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:72"]
  S10 -->|calls| T10
  S11["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T11["method:NetworkRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:258"]
  S11 -->|calls| T11
  S12["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T12["method:JobsRequestToken::scheduleRetry<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:97"]
  S12 -->|calls| T12
  S13["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T13["method:JobsRequestToken::scheduleRetry<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:97"]
  S13 -->|calls| T13
  S14["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T14["method:LockedEvents::append<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:351"]
  S14 -->|calls| T14
  S15["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T15["method:NetworkRegression::checkpoint<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:273"]
  S15 -->|calls| T15
  S16["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T16["method:JobsRequestToken::scheduleRetry<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:97"]
  S16 -->|calls| T16
  S17["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T17["method:JobsRequestToken::cancel<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:52"]
  S17 -->|calls| T17
  S18["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T18["method:NetworkRegression::checkpoint<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:273"]
  S18 -->|calls| T18
  S19["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T19["method:JobsRequestToken::scheduleRetry<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:97"]
  S19 -->|calls| T19
  S20["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T20["method:JobsRequestToken::finish<br/>JobsByPods/JobsNetworking@Pods/Support/JobsRequestToken.swift:72"]
  S20 -->|calls| T20
  S21["method:NetworkRegression::retryReplacement<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:94"]
  T21["method:NetworkRegression::checkpoint<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:273"]
  S21 -->|calls| T21
  S22["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T22["method:NetworkRegression::agent<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:121"]
  S22 -->|calls| T22
  S23["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T23["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:45"]
  S23 -->|calls| T23
  S24["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T24["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:45"]
  S24 -->|calls| T24
  S25["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T25["method:ControlledClient::complete<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:322"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
