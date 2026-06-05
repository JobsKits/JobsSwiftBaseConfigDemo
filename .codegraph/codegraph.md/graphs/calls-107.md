# `calls 符号关系 - 107`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1540"]
  T1["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S1 -->|calls| T1
  S2["function:GC_register_data_segments<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:68"]
  T2["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S2 -->|calls| T2
  S3["function:GC_amiga_rec_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:313"]
  T3["function:GC_amiga_rec_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:313"]
  S3 -->|calls| T3
  S4["function:GC_amiga_allocwrapper_any<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:356"]
  T4["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S4 -->|calls| T4
  S5["function:GC_amiga_allocwrapper_any<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:356"]
  T5["function:GC_amiga_rec_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:313"]
  S5 -->|calls| T5
  S6["function:GC_amiga_allocwrapper_any<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:356"]
  T6["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:562"]
  S6 -->|calls| T6
  S7["function:GC_amiga_allocwrapper_any<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:356"]
  T7["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:562"]
  S7 -->|calls| T7
  S8["function:GC_amiga_allocwrapper_fast<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:444"]
  T8["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S8 -->|calls| T8
  S9["function:GC_amiga_allocwrapper_fast<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:444"]
  T9["function:GC_amiga_allocwrapper_any<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:356"]
  S9 -->|calls| T9
  S10["function:GC_amiga_allocwrapper_firsttime<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:479"]
  T10["function:GC_amiga_allocwrapper_fast<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:444"]
  S10 -->|calls| T10
  S11["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T11["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S11 -->|calls| T11
  S12["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T12["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S12 -->|calls| T12
  S13["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T13["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S13 -->|calls| T13
  S14["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T14["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S14 -->|calls| T14
  S15["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T15["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S15 -->|calls| T15
  S16["function:perform_final_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/MacOS.c:100"]
  T16["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S16 -->|calls| T16
  S17["function:GC_MacFreeTemporaryMemory<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/MacOS.c:117"]
  T17["function:perform_final_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/MacOS.c:100"]
  S17 -->|calls| T17
  S18["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  T18["function:GetModuleBase<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:71"]
  S18 -->|calls| T18
  S19["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  T19["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S19 -->|calls| T19
  S20["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  T20["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S20 -->|calls| T20
  S21["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  T21["function:GetStackFramesFromContext<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:131"]
  S21 -->|calls| T21
  S22["function:GetModuleNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:179"]
  T22["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S22 -->|calls| T22
  S23["function:GetModuleNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:179"]
  T23["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  S23 -->|calls| T23
  S24["function:GetModuleNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:202"]
  T24["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  S24 -->|calls| T24
  S25["function:GetModuleNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:202"]
  T25["function:GetModuleNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:179"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
