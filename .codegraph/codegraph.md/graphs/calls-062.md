# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  T1["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  S1 -->|calls| T1
  S2["method:JobsSwiftTimerManager::remove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:101"]
  T2["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S2 -->|calls| T2
  S3["method:JobsSwiftTimerManager::removeAll<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:109"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S3 -->|calls| T3
  S4["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:121"]
  T4["method:JobsSwiftTimerManager::act<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:87"]
  S4 -->|calls| T4
  S5["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:129"]
  T5["method:JobsSwiftTimerManager::stopAndRemove<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:129"]
  S5 -->|calls| T5
  S6["method:JobsSwiftTimerManager::register<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerManager.swift:134"]
  T6["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S6 -->|calls| T6
  S7["method:CrashLogCenter::markAppLaunched<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:47"]
  T7["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S7 -->|calls| T7
  S8["method:CrashLogCenter::markSafeExitPoint<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:55"]
  T8["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S8 -->|calls| T8
  S9["method:CrashLogCenter::didCrashLastRun<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:61"]
  T9["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S9 -->|calls| T9
  S10["method:CrashLogCenter::didCrashLastRun<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:61"]
  T10["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  S10 -->|calls| T10
  S11["method:CrashLogCenter::ensureFileExists<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:91"]
  T11["method:Atomic::write<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:36"]
  S11 -->|calls| T11
  S12["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  T12["method:CrashLogCenter::ensureFileExists<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:91"]
  S12 -->|calls| T12
  S13["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  T13["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  S13 -->|calls| T13
  S14["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  T14["method:CrashLogCenter::ensureFileExists<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:91"]
  S14 -->|calls| T14
  S15["method:CrashLogCenter::writeCrashSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:114"]
  T15["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  S15 -->|calls| T15
  S16["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  T16["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S16 -->|calls| T16
  S17["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  T17["method:Atomic::write<br/>TODO/TaskCenterComponent/Schedule/Atomic.swift:36"]
  S17 -->|calls| T17
  S18["method:CrashLogCenter::writeSync<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:120"]
  T18["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S18 -->|calls| T18
  S19["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T19["method:FileHandle::FileHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Posix/FileHandle.h:40"]
  S19 -->|calls| T19
  S20["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T20["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S20 -->|calls| T20
  S21["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T21["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S21 -->|calls| T21
  S22["method:CrashLogCenter::readTail<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:150"]
  T22["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S22 -->|calls| T22
  S23["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  T23["method:CrashLogCenter::logPathHint<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:41"]
  S23 -->|calls| T23
  S24["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  T24["method:CrashLogCenter::logPathHint<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:41"]
  S24 -->|calls| T24
  S25["method:CrashLogCenter::installedBanner<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:192"]
  T25["method:CrashLogCenter::didCrashLastRun<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:61"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
