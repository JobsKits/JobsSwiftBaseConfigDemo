# `calls 符号关系 - 140`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:189"]
  T1["method:invalid_utf16::invalid_utf16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:61"]
  S1 -->|calls| T1
  S2["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:189"]
  T2["method:invalid_utf16::invalid_utf16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:61"]
  S2 -->|calls| T2
  S3["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:37"]
  T3["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:37"]
  S3 -->|calls| T3
  S4["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:37"]
  T4["type_alias:uint32_t<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/core.h:57"]
  S4 -->|calls| T4
  S5["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:42"]
  T5["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:42"]
  S5 -->|calls| T5
  S6["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:49"]
  T6["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:49"]
  S6 -->|calls| T6
  S7["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:56"]
  T7["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:56"]
  S7 -->|calls| T7
  S8["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:63"]
  T8["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:63"]
  S8 -->|calls| T8
  S9["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:70"]
  T9["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:70"]
  S9 -->|calls| T9
  S10["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:76"]
  T10["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:76"]
  S10 -->|calls| T10
  S11["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:81"]
  T11["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:81"]
  S11 -->|calls| T11
  S12["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:88"]
  T12["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:88"]
  S12 -->|calls| T12
  S13["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:95"]
  T13["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:95"]
  S13 -->|calls| T13
  S14["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:37"]
  T14["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:37"]
  S14 -->|calls| T14
  S15["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:37"]
  T15["type_alias:uint32_t<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/core.h:57"]
  S15 -->|calls| T15
  S16["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:42"]
  T16["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:42"]
  S16 -->|calls| T16
  S17["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:49"]
  T17["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:49"]
  S17 -->|calls| T17
  S18["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:56"]
  T18["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:56"]
  S18 -->|calls| T18
  S19["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:63"]
  T19["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:63"]
  S19 -->|calls| T19
  S20["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:70"]
  T20["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:70"]
  S20 -->|calls| T20
  S21["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:76"]
  T21["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:76"]
  S21 -->|calls| T21
  S22["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:81"]
  T22["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:81"]
  S22 -->|calls| T22
  S23["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:88"]
  T23["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:88"]
  S23 -->|calls| T23
  S24["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:95"]
  T24["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:95"]
  S24 -->|calls| T24
  S25["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T25["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
