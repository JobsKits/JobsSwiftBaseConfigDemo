# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T1["method:ControlledClient::complete<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:322"]
  S1 -->|calls| T1
  S2["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T2["method:NetworkRegression::agent<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:121"]
  S2 -->|calls| T2
  S3["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T3["method:NetworkRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:258"]
  S3 -->|calls| T3
  S4["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T4["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:45"]
  S4 -->|calls| T4
  S5["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T5["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S5 -->|calls| T5
  S6["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T6["method:NetworkRegression::checkpoint<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:273"]
  S6 -->|calls| T6
  S7["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T7["method:NetworkRegression::agent<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:121"]
  S7 -->|calls| T7
  S8["method:NetworkRegression::cancellationAndIdentity<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:127"]
  T8["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:45"]
  S8 -->|calls| T8
  S9["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T9["method:NetworkRegression::agent<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:121"]
  S9 -->|calls| T9
  S10["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T10["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:45"]
  S10 -->|calls| T10
  S11["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T11["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S11 -->|calls| T11
  S12["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T12["method:JobsDefaultAgent::upload<br/>JobsByPods/JobsNetworking@Pods/Upload/JobsDefaultAgent+Upload.swift:12"]
  S12 -->|calls| T12
  S13["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T13["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:12"]
  S13 -->|calls| T13
  S14["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T14["method:NetworkRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:22"]
  S14 -->|calls| T14
  S15["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T15["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:12"]
  S15 -->|calls| T15
  S16["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T16["method:NetworkRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:22"]
  S16 -->|calls| T16
  S17["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T17["method:JobsDefaultAgent::download<br/>JobsByPods/JobsNetworking@Pods/Download/JobsDefaultAgent+Download.swift:12"]
  S17 -->|calls| T17
  S18["method:NetworkRegression::parametersAndFiles<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:183"]
  T18["method:NetworkRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:22"]
  S18 -->|calls| T18
  S19["method:NetworkRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:258"]
  T19["method:NetworkCallbackGate::complete<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:294"]
  S19 -->|calls| T19
  S20["method:NetworkRegression::checkpoint<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:273"]
  T20["method:NetworkRegression::waitForCallback<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:258"]
  S20 -->|calls| T20
  S21["method:NetworkRegression::checkpoint<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:273"]
  T21["method:NetworkRegression::check<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:22"]
  S21 -->|calls| T21
  S22["property:NetworkCallbackGate::isCompleted<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:288"]
  T22["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S22 -->|calls| T22
  S23["method:NetworkCallbackGate::complete<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:294"]
  T23["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S23 -->|calls| T23
  S24["method:ControlledClient::perform<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:314"]
  T24["field:ControlledClient::prepared<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:306"]
  S24 -->|calls| T24
  S25["method:ControlledClient::perform<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:314"]
  T25["field:ControlledClient::callbacks<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:307"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
