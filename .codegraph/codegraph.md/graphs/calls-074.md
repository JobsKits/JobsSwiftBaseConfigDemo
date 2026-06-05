# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:42"]
  T1["function:utf16to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:42"]
  S1 -->|calls| T1
  S2["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:49"]
  T2["function:utf8to16<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:49"]
  S2 -->|calls| T2
  S3["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:56"]
  T3["function:utf32to8<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:56"]
  S3 -->|calls| T3
  S4["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:63"]
  T4["function:utf8to32<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:63"]
  S4 -->|calls| T4
  S5["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:70"]
  T5["function:find_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:70"]
  S5 -->|calls| T5
  S6["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:76"]
  T6["function:is_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:76"]
  S6 -->|calls| T6
  S7["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:81"]
  T7["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:81"]
  S7 -->|calls| T7
  S8["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:88"]
  T8["function:replace_invalid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:88"]
  S8 -->|calls| T8
  S9["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:95"]
  T9["function:starts_with_bom<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/External/utfcpp/source/utf8/cpp17.h:95"]
  S9 -->|calls| T9
  S10["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T10["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S10 -->|calls| T10
  S11["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T11["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S11 -->|calls| T11
  S12["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T12["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S12 -->|calls| T12
  S13["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T13["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S13 -->|calls| T13
  S14["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T14["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S14 -->|calls| T14
  S15["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T15["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S15 -->|calls| T15
  S16["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T16["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S16 -->|calls| T16
  S17["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T17["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S17 -->|calls| T17
  S18["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Windows/Include/C/Baselib_ThreadLocalStorage.inl.h:17"]
  T18["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S18 -->|calls| T18
  S19["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/WindowsGames/Include/C/Baselib_ThreadLocalStorage.inl.h:17"]
  T19["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S19 -->|calls| T19
  S20["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T20["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S20 -->|calls| T20
  S21["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T21["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S21 -->|calls| T21
  S22["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T22["function:GC_is_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:241"]
  S22 -->|calls| T22
  S23["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T23["function:GC_is_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:241"]
  S23 -->|calls| T23
  S24["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T24["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S24 -->|calls| T24
  S25["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T25["function:GC_compute_large_free_bytes<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:110"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
