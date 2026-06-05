# `calls 符号关系 - 073`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:batch_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:157"]
  T1["method:tlsf_allocator::batch_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:226"]
  S1 -->|calls| T1
  S2["function:batch_deallocate_link<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:169"]
  T2["method:tlsf_allocator::batch_deallocate_link<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:231"]
  S2 -->|calls| T2
  S3["function:reserve<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:189"]
  T3["function:owns<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:213"]
  S3 -->|calls| T3
  S4["function:capacity<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:195"]
  T4["function:owns<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:213"]
  S4 -->|calls| T4
  S5["function:optimal_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:203"]
  T5["function:owns<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:213"]
  S5 -->|calls| T5
  S6["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:74"]
  T6["method:invalid_code_point::invalid_code_point<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:44"]
  S6 -->|calls| T6
  S7["function:next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:123"]
  T7["method:invalid_utf8::invalid_utf8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:53"]
  S7 -->|calls| T7
  S8["function:next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:123"]
  T8["method:invalid_code_point::invalid_code_point<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:44"]
  S8 -->|calls| T8
  S9["function:prior<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:149"]
  T9["method:invalid_utf8::invalid_utf8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:53"]
  S9 -->|calls| T9
  S10["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:189"]
  T10["method:invalid_utf16::invalid_utf16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:61"]
  S10 -->|calls| T10
  S11["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:189"]
  T11["method:invalid_utf16::invalid_utf16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:61"]
  S11 -->|calls| T11
  S12["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:189"]
  T12["method:invalid_utf16::invalid_utf16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/checked.h:61"]
  S12 -->|calls| T12
  S13["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:37"]
  T13["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:37"]
  S13 -->|calls| T13
  S14["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:37"]
  T14["type_alias:uint32_t<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/core.h:57"]
  S14 -->|calls| T14
  S15["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:42"]
  T15["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:42"]
  S15 -->|calls| T15
  S16["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:49"]
  T16["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:49"]
  S16 -->|calls| T16
  S17["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:56"]
  T17["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:56"]
  S17 -->|calls| T17
  S18["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:63"]
  T18["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:63"]
  S18 -->|calls| T18
  S19["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:70"]
  T19["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:70"]
  S19 -->|calls| T19
  S20["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:76"]
  T20["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:76"]
  S20 -->|calls| T20
  S21["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:81"]
  T21["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:81"]
  S21 -->|calls| T21
  S22["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:88"]
  T22["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:88"]
  S22 -->|calls| T22
  S23["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:95"]
  T23["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp11.h:95"]
  S23 -->|calls| T23
  S24["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:37"]
  T24["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:37"]
  S24 -->|calls| T24
  S25["function:append<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:37"]
  T25["type_alias:uint32_t<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/core.h:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
