# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T1["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  S1 -->|calls| T1
  S2["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T2["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S2 -->|calls| T2
  S3["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:19"]
  T3["method:String::isEmoji<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:22"]
  S3 -->|calls| T3
  S4["method:String::isRegionalIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:83"]
  T4["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S4 -->|calls| T4
  S5["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  T5["method:String::isRegionalIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:83"]
  S5 -->|calls| T5
  S6["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  T6["method:String::isLikelyStrongEmojiScalar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:70"]
  S6 -->|calls| T6
  S7["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T7["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S7 -->|calls| T7
  S8["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T8["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  S8 -->|calls| T8
  S9["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T9["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S9 -->|calls| T9
  S10["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T10["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  S10 -->|calls| T10
  S11["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T11["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  S11 -->|calls| T11
  S12["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T12["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  S12 -->|calls| T12
  S13["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T13["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S13 -->|calls| T13
  S14["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T14["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  S14 -->|calls| T14
  S15["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T15["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S15 -->|calls| T15
  S16["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:60"]
  T16["method:String::emojiStrength<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+Emoji.swift:88"]
  S16 -->|calls| T16
  S17["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:17"]
  T17["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:37"]
  S17 -->|calls| T17
  S18["method:String::svg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:28"]
  T18["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:37"]
  S18 -->|calls| T18
  S19["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:21"]
  T19["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S19 -->|calls| T19
  S20["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:43"]
  T20["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S20 -->|calls| T20
  S21["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:83"]
  T21["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S21 -->|calls| T21
  S22["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:83"]
  T22["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S22 -->|calls| T22
  S23["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:83"]
  T23["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S23 -->|calls| T23
  S24["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:83"]
  T24["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S24 -->|calls| T24
  S25["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:26"]
  T25["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
