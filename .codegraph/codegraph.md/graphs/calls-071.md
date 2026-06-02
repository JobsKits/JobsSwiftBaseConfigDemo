# `calls 符号关系 - 071`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsWorkerScheduler::schedule<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:21"]
  T1["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S1 -->|calls| T1
  S2["method:JobsWorkerScheduler::schedule<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:21"]
  T2["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  S2 -->|calls| T2
  S3["method:JobsWorkerScheduler::scheduleRepeating<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:36"]
  T3["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  S3 -->|calls| T3
  S4["method:JobsWorkerScheduler::scheduleRepeating<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:36"]
  T4["method:JobsPlan::every<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:87"]
  S4 -->|calls| T4
  S5["method:JobsWorkerScheduler::scheduleRepeating<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:36"]
  T5["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S5 -->|calls| T5
  S6["method:JobsWorkerScheduler::scheduleRepeating<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:36"]
  T6["method:JobsTaskManager::tasks<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskManager.swift:233"]
  S6 -->|calls| T6
  S7["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  T7["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S7 -->|calls| T7
  S8["method:JobsWorkerScheduler::cancel<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:51"]
  T8["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  S8 -->|calls| T8
  S9["method:JobsWorkerScheduler::cancelAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:61"]
  T9["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S9 -->|calls| T9
  S10["method:JobsWorkerScheduler::cancelAll<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorkerScheduler.swift:61"]
  T10["method:JobsTaskCenter::remove<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:41"]
  S10 -->|calls| T10
  S11["method:JobsText::applying<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:108"]
  T11["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S11 -->|calls| T11
  S12["method:JobsText::+<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:133"]
  T12["method:JobsText::asAttributedString<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:89"]
  S12 -->|calls| T12
  S13["method:JobsText::+<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:133"]
  T13["method:JobsText::asAttributedString<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:89"]
  S13 -->|calls| T13
  S14["method:JobsText::==<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:146"]
  T14["method:JobsText::asAttributedString<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:89"]
  S14 -->|calls| T14
  S15["method:JobsText::==<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:146"]
  T15["method:JobsText::asAttributedString<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:89"]
  S15 -->|calls| T15
  S16["method:JobsText::rtfData<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:158"]
  T16["method:JobsText::asAttributedString<br/>JobsByPods/JobsTextTools@Pods/JobsText.swift:89"]
  S16 -->|calls| T16
  S17["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:14"]
  T17["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:14"]
  S17 -->|calls| T17
  S18["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:14"]
  T18["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:14"]
  S18 -->|calls| T18
  S19["class:String<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:11"]
  T19["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  S19 -->|calls| T19
  S20["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T20["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S20 -->|calls| T20
  S21["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T21["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S21 -->|calls| T21
  S22["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T22["variable:parts<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:20"]
  S22 -->|calls| T22
  S23["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T23["variable:parts<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:20"]
  S23 -->|calls| T23
  S24["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  T24["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S24 -->|calls| T24
  S25["method:String::normalizeToSupportedLproj<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:27"]
  T25["function:String::normalizeToSupportedLproj::pick<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/String+多语言国际化.swift:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
