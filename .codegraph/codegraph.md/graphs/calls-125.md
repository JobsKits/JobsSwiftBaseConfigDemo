# `calls 符号关系 - 125`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:AO_store_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:46"]
  T1["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S1 -->|calls| T1
  S2["function:AO_test_and_set_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:64"]
  T2["function:AO_test_and_set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize.h:162"]
  S2 -->|calls| T2
  S3["function:AO_test_and_set_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:64"]
  T3["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S3 -->|calls| T3
  S4["function:AO_test_and_set_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:72"]
  T4["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S4 -->|calls| T4
  S5["function:AO_test_and_set_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:72"]
  T5["function:AO_test_and_set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize.h:162"]
  S5 -->|calls| T5
  S6["function:AO_test_and_set_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:79"]
  T6["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S6 -->|calls| T6
  S7["function:AO_test_and_set_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:79"]
  T7["function:AO_test_and_set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize.h:162"]
  S7 -->|calls| T7
  S8["function:AO_test_and_set_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:79"]
  T8["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S8 -->|calls| T8
  S9["function:AO_fetch_compare_and_swap_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:97"]
  T9["function:AO_fetch_compare_and_swap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:465"]
  S9 -->|calls| T9
  S10["function:AO_fetch_compare_and_swap_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:97"]
  T10["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S10 -->|calls| T10
  S11["function:AO_fetch_compare_and_swap_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:107"]
  T11["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S11 -->|calls| T11
  S12["function:AO_fetch_compare_and_swap_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:107"]
  T12["function:AO_fetch_compare_and_swap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:465"]
  S12 -->|calls| T12
  S13["function:AO_fetch_compare_and_swap_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:116"]
  T13["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S13 -->|calls| T13
  S14["function:AO_fetch_compare_and_swap_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:116"]
  T14["function:AO_fetch_compare_and_swap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:465"]
  S14 -->|calls| T14
  S15["function:AO_fetch_compare_and_swap_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/ibmc/powerpc.h:116"]
  T15["function:AO_lwsync<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/powerpc.h:44"]
  S15 -->|calls| T15
  S16["function:PushMacRegisters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:49"]
  T16["function:getRegisters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:42"]
  S16 -->|calls| T16
  S17["function:GC_push_regs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:191"]
  T17["function:PushMacRegisters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:49"]
  S17 -->|calls| T17
  S18["function:GC_with_callee_saves_pushed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:227"]
  T18["function:GC_push_regs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:191"]
  S18 -->|calls| T18
  S19["function:GC_with_callee_saves_pushed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:227"]
  T19["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S19 -->|calls| T19
  S20["function:GC_with_callee_saves_pushed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:227"]
  T20["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S20 -->|calls| T20
  S21["function:GC_alloc_reclaim_list<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:24"]
  T21["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  S21 -->|calls| T21
  S22["function:GC_alloc_large<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:38"]
  T22["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S22 -->|calls| T22
  S23["function:GC_alloc_large<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:38"]
  T23["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  S23 -->|calls| T23
  S24["function:GC_alloc_large<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:38"]
  T24["function:GC_allochblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:622"]
  S24 -->|calls| T24
  S25["function:GC_alloc_large<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:38"]
  T25["function:GC_merge_unmapped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:463"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
