# `calls 符号关系 - 174`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T1["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S1 -->|calls| T1
  S2["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T2["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S2 -->|calls| T2
  S3["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T3["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S3 -->|calls| T3
  S4["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T4["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S4 -->|calls| T4
  S5["function:GC_amiga_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/AmigaOS.c:495"]
  T5["function:GC_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:82"]
  S5 -->|calls| T5
  S6["function:perform_final_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/MacOS.c:100"]
  T6["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S6 -->|calls| T6
  S7["function:GC_MacFreeTemporaryMemory<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/MacOS.c:117"]
  T7["function:perform_final_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/MacOS.c:100"]
  S7 -->|calls| T7
  S8["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  T8["function:GetModuleBase<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:71"]
  S8 -->|calls| T8
  S9["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  T9["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S9 -->|calls| T9
  S10["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  T10["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S10 -->|calls| T10
  S11["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  T11["function:GetStackFramesFromContext<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:131"]
  S11 -->|calls| T11
  S12["function:GetModuleNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:179"]
  T12["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S12 -->|calls| T12
  S13["function:GetModuleNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:179"]
  T13["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  S13 -->|calls| T13
  S14["function:GetModuleNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:202"]
  T14["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  S14 -->|calls| T14
  S15["function:GetModuleNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:202"]
  T15["function:GetModuleNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:179"]
  S15 -->|calls| T15
  S16["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  T16["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S16 -->|calls| T16
  S17["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  T17["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  S17 -->|calls| T17
  S18["function:GetSymbolNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:252"]
  T18["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  S18 -->|calls| T18
  S19["function:GetSymbolNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:252"]
  T19["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  S19 -->|calls| T19
  S20["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  T20["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S20 -->|calls| T20
  S21["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  T21["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  S21 -->|calls| T21
  S22["function:GetFileLineFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:293"]
  T22["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  S22 -->|calls| T22
  S23["function:GetFileLineFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:293"]
  T23["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  S23 -->|calls| T23
  S24["function:GetDescriptionFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:305"]
  T24["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  S24 -->|calls| T24
  S25["function:GetDescriptionFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:305"]
  T25["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
