# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  T1["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S1 -->|calls| T1
  S2["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  T2["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  S2 -->|calls| T2
  S3["function:GetSymbolNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:252"]
  T3["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  S3 -->|calls| T3
  S4["function:GetSymbolNameFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:252"]
  T4["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  S4 -->|calls| T4
  S5["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  T5["function:GetSymHandle<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:50"]
  S5 -->|calls| T5
  S6["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  T6["function:CheckAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:107"]
  S6 -->|calls| T6
  S7["function:GetFileLineFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:293"]
  T7["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  S7 -->|calls| T7
  S8["function:GetFileLineFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:293"]
  T8["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  S8 -->|calls| T8
  S9["function:GetDescriptionFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:305"]
  T9["function:GetFileLineFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:263"]
  S9 -->|calls| T9
  S10["function:GetDescriptionFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:305"]
  T10["function:GetSymbolNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:212"]
  S10 -->|calls| T10
  S11["function:GetDescriptionFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:305"]
  T11["function:GetModuleNameFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:179"]
  S11 -->|calls| T11
  S12["function:GetDescriptionFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:348"]
  T12["function:GetDescriptionFromAddress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:305"]
  S12 -->|calls| T12
  S13["function:backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:370"]
  T13["function:GetStackFrames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:114"]
  S13 -->|calls| T13
  S14["function:backtrace_symbols<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:375"]
  T14["function:GetDescriptionFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:348"]
  S14 -->|calls| T14
  S15["function:backtrace_symbols<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:375"]
  T15["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S15 -->|calls| T15
  S16["function:backtrace_symbols<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:375"]
  T16["function:GetDescriptionFromStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:348"]
  S16 -->|calls| T16
  S17["function:GC_AllocProc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:27"]
  T17["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:339"]
  S17 -->|calls| T17
  S18["function:GC_AllocProc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:27"]
  T18["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S18 -->|calls| T18
  S19["function:GC_DebugAllocProc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:38"]
  T19["function:GC_debug_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:633"]
  S19 -->|calls| T19
  S20["function:GC_DebugAllocProc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:38"]
  T20["function:GC_debug_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:527"]
  S20 -->|calls| T20
  S21["function:GC_DebugReallocProc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:51"]
  T21["function:GC_debug_realloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:821"]
  S21 -->|calls| T21
  S22["function:GC_EnumerateProc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:95"]
  T22["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S22 -->|calls| T22
  S23["function:PCR_GC_Run<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:153"]
  T23["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S23 -->|calls| T23
  S24["function:PCR_GC_Run<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/pcr_interface.c:153"]
  T24["function:GC_enable_incremental<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1335"]
  S24 -->|calls| T24
  S25["function:real_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/real_malloc.c:28"]
  T25["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
