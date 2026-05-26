# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CrashLogCenter::markAppLaunched<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:47"]
  T1["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S1 -->|calls| T1
  S2["method:CrashLogCenter::markSafeExitPoint<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:55"]
  T2["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S2 -->|calls| T2
  S3["method:CrashLogCenter::didCrashLastRun<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:61"]
  T3["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S3 -->|calls| T3
  S4["method:CrashLogCenter::didCrashLastRun<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:61"]
  T4["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  S4 -->|calls| T4
  S5["method:CrashLogCenter::ensureFileExists<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:91"]
  T5["method:Atomic::write<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:36"]
  S5 -->|calls| T5
  S6["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  T6["method:CrashLogCenter::ensureFileExists<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:91"]
  S6 -->|calls| T6
  S7["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  T7["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  S7 -->|calls| T7
  S8["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  T8["method:CrashLogCenter::ensureFileExists<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:91"]
  S8 -->|calls| T8
  S9["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  T9["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  S9 -->|calls| T9
  S10["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  T10["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S10 -->|calls| T10
  S11["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  T11["method:Atomic::write<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:36"]
  S11 -->|calls| T11
  S12["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  T12["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S12 -->|calls| T12
  S13["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T13["method:FileHandle::FileHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Posix/FileHandle.h:40"]
  S13 -->|calls| T13
  S14["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T14["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S14 -->|calls| T14
  S15["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T15["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S15 -->|calls| T15
  S16["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T16["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S16 -->|calls| T16
  S17["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  T17["method:CrashLogCenter::logPathHint<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:41"]
  S17 -->|calls| T17
  S18["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  T18["method:CrashLogCenter::logPathHint<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:41"]
  S18 -->|calls| T18
  S19["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  T19["method:CrashLogCenter::didCrashLastRun<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:61"]
  S19 -->|calls| T19
  S20["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T20["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S20 -->|calls| T20
  S21["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T21["function:jobs_installSignalHandlers<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:291"]
  S21 -->|calls| T21
  S22["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T22["function:jobs_installTerminateHandler<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:281"]
  S22 -->|calls| T22
  S23["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T23["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  S23 -->|calls| T23
  S24["method:CrashCatcher::installOnce<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:214"]
  T24["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  S24 -->|calls| T24
  S25["method:CrashCatcher::handleSignal<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:246"]
  T25["function:jobs_signalName<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:300"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
