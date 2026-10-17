# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:69"]
  T1["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S1 -->|calls| T1
  S2["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:69"]
  T2["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S2 -->|calls| T2
  S3["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:69"]
  T3["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S3 -->|calls| T3
  S4["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:69"]
  T4["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S4 -->|calls| T4
  S5["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:69"]
  T5["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S5 -->|calls| T5
  S6["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:69"]
  T6["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:43"]
  S6 -->|calls| T6
  S7["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:69"]
  T7["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S7 -->|calls| T7
  S8["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:115"]
  T8["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  S8 -->|calls| T8
  S9["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:115"]
  T9["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:43"]
  S9 -->|calls| T9
  S10["property:String::bundleMediaURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:30"]
  T10["method:String::bundleMediaURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:34"]
  S10 -->|calls| T10
  S11["method:String::bundleMediaURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:34"]
  T11["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S11 -->|calls| T11
  S12["property:String::img<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:77"]
  T12["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S12 -->|calls| T12
  S13["property:String::img<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:77"]
  T13["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S13 -->|calls| T13
  S14["property:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:91"]
  T14["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S14 -->|calls| T14
  S15["property:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:91"]
  T15["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S15 -->|calls| T15
  S16["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:99"]
  T16["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S16 -->|calls| T16
  S17["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T17["method:JobsSymbolWeight::toSymbolWeight<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:1058"]
  S17 -->|calls| T17
  S18["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T18["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S18 -->|calls| T18
  S19["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T19["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S19 -->|calls| T19
  S20["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:173"]
  T20["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:116"]
  S20 -->|calls| T20
  S21["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:173"]
  T21["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S21 -->|calls| T21
  S22["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:179"]
  T22["method:String::kfLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:173"]
  S22 -->|calls| T22
  S23["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:189"]
  T23["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S23 -->|calls| T23
  S24["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:189"]
  T24["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S24 -->|calls| T24
  S25["method:String::sdLoadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:189"]
  T25["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
