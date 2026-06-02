# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T1["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S1 -->|calls| T1
  S2["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T2["method:String::bundleMediaURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:35"]
  S2 -->|calls| T2
  S3["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T3["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S3 -->|calls| T3
  S4["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T4["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S4 -->|calls| T4
  S5["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T5["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S5 -->|calls| T5
  S6["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T6["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S6 -->|calls| T6
  S7["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:99"]
  T7["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S7 -->|calls| T7
  S8["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T8["method:JobsSymbolWeight::toSymbolWeight<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:1028"]
  S8 -->|calls| T8
  S9["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T9["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S9 -->|calls| T9
  S10["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T10["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S10 -->|calls| T10
  S11["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:166"]
  T11["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:166"]
  S11 -->|calls| T11
  S12["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:166"]
  T12["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S12 -->|calls| T12
  S13["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:172"]
  T13["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:172"]
  S13 -->|calls| T13
  S14["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:224"]
  T14["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:224"]
  S14 -->|calls| T14
  S15["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:224"]
  T15["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S15 -->|calls| T15
  S16["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:235"]
  T16["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S16 -->|calls| T16
  S17["method:String::addInPlace<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:26"]
  T17["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S17 -->|calls| T17
  S18["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:15"]
  T18["method:chunked_allocator_stats::block_stat::index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/chunked_allocator.h:254"]
  S18 -->|calls| T18
  S19["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:49"]
  T19["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S19 -->|calls| T19
  S20["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:82"]
  T20["method:String::percentEncodedURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:96"]
  S20 -->|calls| T20
  S21["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:82"]
  T21["method:String::percentEncodedURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:96"]
  S21 -->|calls| T21
  S22["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  T22["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S22 -->|calls| T22
  S23["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  T23["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S23 -->|calls| T23
  S24["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  T24["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S24 -->|calls| T24
  S25["method:UIButton::sd_imageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:112"]
  T25["method:UIButton::_sd_setImageURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+SDWebImage.swift:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
