# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T1["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S1 -->|calls| T1
  S2["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T2["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S2 -->|calls| T2
  S3["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:166"]
  T3["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:166"]
  S3 -->|calls| T3
  S4["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:166"]
  T4["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S4 -->|calls| T4
  S5["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:172"]
  T5["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:172"]
  S5 -->|calls| T5
  S6["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:224"]
  T6["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:224"]
  S6 -->|calls| T6
  S7["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:224"]
  T7["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S7 -->|calls| T7
  S8["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:235"]
  T8["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S8 -->|calls| T8
  S9["method:String::addInPlace<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:26"]
  T9["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S9 -->|calls| T9
  S10["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:15"]
  T10["method:chunked_allocator_stats::block_stat::index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/chunked_allocator.h:254"]
  S10 -->|calls| T10
  S11["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:49"]
  T11["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S11 -->|calls| T11
  S12["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:82"]
  T12["method:String::percentEncodedURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:96"]
  S12 -->|calls| T12
  S13["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:82"]
  T13["method:String::percentEncodedURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:96"]
  S13 -->|calls| T13
  S14["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  T14["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S14 -->|calls| T14
  S15["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  T15["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S15 -->|calls| T15
  S16["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  T16["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S16 -->|calls| T16
  S17["method:UIBarButtonItem::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:23"]
  T17["method:UIBarButtonItem::_jobs_handleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:43"]
  S17 -->|calls| T17
  S18["method:UIBarButtonItem::fixed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:82"]
  T18["method:UIBarButtonItem::byWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:100"]
  S18 -->|calls| T18
  S19["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:71"]
  T19["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:71"]
  S19 -->|calls| T19
  S20["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:71"]
  T20["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S20 -->|calls| T20
  S21["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:71"]
  T21["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  S21 -->|calls| T21
  S22["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:87"]
  T22["method:UIButton::byContentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:71"]
  S22 -->|calls| T22
  S23["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:87"]
  T23["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S23 -->|calls| T23
  S24["method:UIButton::byContentEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:87"]
  T24["method:UIButton::_jobsSyncLegacyInsetsIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:674"]
  S24 -->|calls| T24
  S25["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:105"]
  T25["method:UIButton.Configuration::byImagePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:182"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
