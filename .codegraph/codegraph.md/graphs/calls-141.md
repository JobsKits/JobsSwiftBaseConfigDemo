# `calls 符号关系 - 141`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T1["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/IOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S1 -->|calls| T1
  S2["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T2["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S2 -->|calls| T2
  S3["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T3["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/OSX/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S3 -->|calls| T3
  S4["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T4["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S4 -->|calls| T4
  S5["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T5["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Tvos/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S5 -->|calls| T5
  S6["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:42"]
  T6["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S6 -->|calls| T6
  S7["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:47"]
  T7["function:Baselib_TLS_Darwin_SlotTable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/VisionOS/Include/C/Baselib_ThreadLocalStorage.inl.h:24"]
  S7 -->|calls| T7
  S8["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Windows/Include/C/Baselib_ThreadLocalStorage.inl.h:17"]
  T8["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S8 -->|calls| T8
  S9["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/WindowsGames/Include/C/Baselib_ThreadLocalStorage.inl.h:17"]
  T9["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S9 -->|calls| T9
  S10["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T10["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S10 -->|calls| T10
  S11["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T11["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S11 -->|calls| T11
  S12["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T12["function:GC_is_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:241"]
  S12 -->|calls| T12
  S13["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T13["function:GC_is_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:241"]
  S13 -->|calls| T13
  S14["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T14["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S14 -->|calls| T14
  S15["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T15["function:GC_compute_large_free_bytes<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:110"]
  S15 -->|calls| T15
  S16["function:GC_print_hblkfreelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:129"]
  T16["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S16 -->|calls| T16
  S17["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T17["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S17 -->|calls| T17
  S18["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T18["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S18 -->|calls| T18
  S19["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T19["function:GC_hblk_fl_from_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:90"]
  S19 -->|calls| T19
  S20["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T20["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S20 -->|calls| T20
  S21["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T21["function:free_list_index_of<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:160"]
  S21 -->|calls| T21
  S22["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T22["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S22 -->|calls| T22
  S23["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T23["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S23 -->|calls| T23
  S24["function:GC_dump_regions<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:176"]
  T24["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S24 -->|calls| T24
  S25["function:setup_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:232"]
  T25["function:GC_add_map_entry<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
