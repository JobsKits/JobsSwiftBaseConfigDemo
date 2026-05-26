# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T1["method:UserDefaults::setUInt8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:56"]
  S1 -->|calls| T1
  S2["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T2["method:LaunchChecker::ymd<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:137"]
  S2 -->|calls| T2
  S3["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T3["method:LaunchChecker::writeYMD<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:148"]
  S3 -->|calls| T3
  S4["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T4["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  S4 -->|calls| T4
  S5["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T5["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S5 -->|calls| T5
  S6["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T6["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S6 -->|calls| T6
  S7["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T7["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S7 -->|calls| T7
  S8["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T8["method:LaunchChecker::ymd<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:137"]
  S8 -->|calls| T8
  S9["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T9["method:LaunchChecker::writeYMD<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:148"]
  S9 -->|calls| T9
  S10["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T10["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  S10 -->|calls| T10
  S11["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T11["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  S11 -->|calls| T11
  S12["enum:LaunchChecker<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:67"]
  T12["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S12 -->|calls| T12
  S13["method:LaunchChecker::isFirstLaunchToday<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:114"]
  T13["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S13 -->|calls| T13
  S14["method:LaunchChecker::isFirstLaunchToday<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:114"]
  T14["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S14 -->|calls| T14
  S15["method:LaunchChecker::isFirstLaunchToday<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:114"]
  T15["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S15 -->|calls| T15
  S16["method:LaunchChecker::isFirstLaunchToday<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:114"]
  T16["method:LaunchChecker::ymd<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:137"]
  S16 -->|calls| T16
  S17["method:LaunchChecker::reset<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:127"]
  T17["method:UserDefaults::removeBy<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:152"]
  S17 -->|calls| T17
  S18["method:LaunchChecker::reset<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:127"]
  T18["method:UserDefaults::removeBy<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:152"]
  S18 -->|calls| T18
  S19["method:LaunchChecker::reset<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:127"]
  T19["method:UserDefaults::removeBy<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:152"]
  S19 -->|calls| T19
  S20["method:LaunchChecker::reset<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:127"]
  T20["method:UserDefaults::removeBy<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:152"]
  S20 -->|calls| T20
  S21["method:LaunchChecker::writeYMD<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:148"]
  T21["method:UserDefaults::setUInt8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:56"]
  S21 -->|calls| T21
  S22["method:LaunchChecker::writeYMD<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:148"]
  T22["method:UserDefaults::setUInt8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:56"]
  S22 -->|calls| T22
  S23["method:LaunchChecker::writeYMD<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:148"]
  T23["method:UserDefaults::setUInt8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:56"]
  S23 -->|calls| T23
  S24["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  T24["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S24 -->|calls| T24
  S25["method:LaunchChecker::logLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:166"]
  T25["method:LaunchChecker::fullFormatter<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:157"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
