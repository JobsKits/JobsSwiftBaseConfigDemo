# `calls 符号关系 - 194`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FlutterBridge::closeFlutterPage<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:205"]
  T1["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S1 -->|calls| T1
  S2["method:FlutterBridge::closeFlutterPage<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:205"]
  T2["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S2 -->|calls| T2
  S3["method:FlutterBridge::closeFlutterPage<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:205"]
  T3["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S3 -->|calls| T3
  S4["method:FlutterBridge::closeFlutterPage<br/>JobsByPods/JobsSwiftTools@Pods/FlutterBridge.swift:205"]
  T4["method:UINavigationController::popViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:126"]
  S4 -->|calls| T4
  S5["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T5["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S5 -->|calls| T5
  S6["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T6["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S6 -->|calls| T6
  S7["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T7["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S7 -->|calls| T7
  S8["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T8["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S8 -->|calls| T8
  S9["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T9["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S9 -->|calls| T9
  S10["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T10["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S10 -->|calls| T10
  S11["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T11["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S11 -->|calls| T11
  S12["method:JobsFormatters::phoneCN<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:91"]
  T12["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S12 -->|calls| T12
  S13["method:JobsLog::log<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:160"]
  T13["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  S13 -->|calls| T13
  S14["method:JobsLog::log<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:160"]
  T14["method:JobsLog::timeNow<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:207"]
  S14 -->|calls| T14
  S15["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T15["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S15 -->|calls| T15
  S16["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T16["method:JobsLog::toJSONString<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:272"]
  S16 -->|calls| T16
  S17["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T17["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S17 -->|calls| T17
  S18["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T18["method:JobsLog::toJSONStringFromObject<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:313"]
  S18 -->|calls| T18
  S19["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T19["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S19 -->|calls| T19
  S20["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T20["method:JobsLog::toJSONString<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:272"]
  S20 -->|calls| T20
  S21["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T21["method:JobsLog::tryJSONFromContainers<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:295"]
  S21 -->|calls| T21
  S22["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T22["method:JobsLog::toJSONStringFromObject<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:313"]
  S22 -->|calls| T22
  S23["method:JobsLog::render<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:184"]
  T23["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  S23 -->|calls| T23
  S24["method:JobsLog::timeNow<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:207"]
  T24["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S24 -->|calls| T24
  S25["method:JobsLog::stringify<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:212"]
  T25["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
