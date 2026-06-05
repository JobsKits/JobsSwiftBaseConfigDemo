# `calls 符号关系 - 117`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_priv.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_priv.h:1"]
  T1["function:GC_text_mapping<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:355"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_priv.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_priv.h:1"]
  T2["function:GC_FreeBSDGetDataStart<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1972"]
  S2 -->|calls| T2
  S3["function:GC_getspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/specific.h:89"]
  T3["function:GC_slow_getspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:135"]
  S3 -->|calls| T3
  S4["function:lock_ool<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:106"]
  T4["function:AO_test_and_set_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize.h:136"]
  S4 -->|calls| T4
  S5["function:lock_ool<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:106"]
  T5["function:AO_pause<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:232"]
  S5 -->|calls| T5
  S6["function:lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:114"]
  T6["function:AO_test_and_set_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize.h:136"]
  S6 -->|calls| T6
  S7["function:lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:114"]
  T7["function:lock_ool<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:106"]
  S7 -->|calls| T7
  S8["function:block_all_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:130"]
  T8["function:AO_load_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1840"]
  S8 -->|calls| T8
  S9["function:block_all_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:130"]
  T9["function:lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:114"]
  S9 -->|calls| T9
  S10["function:block_all_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:130"]
  T10["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S10 -->|calls| T10
  S11["function:block_all_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:130"]
  T11["function:AO_store_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2054"]
  S11 -->|calls| T11
  S12["function:AO_fetch_compare_and_swap_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:151"]
  T12["function:block_all_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:130"]
  S12 -->|calls| T12
  S13["function:AO_fetch_compare_and_swap_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:151"]
  T13["function:lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:114"]
  S13 -->|calls| T13
  S14["function:AO_fetch_compare_and_swap_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:151"]
  T14["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S14 -->|calls| T14
  S15["function:AO_compare_double_and_swap_double_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:172"]
  T15["function:block_all_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:130"]
  S15 -->|calls| T15
  S16["function:AO_compare_double_and_swap_double_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:172"]
  T16["function:lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:114"]
  S16 -->|calls| T16
  S17["function:AO_compare_double_and_swap_double_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:172"]
  T17["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S17 -->|calls| T17
  S18["function:AO_store_full_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:199"]
  T18["function:lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:114"]
  S18 -->|calls| T18
  S19["function:AO_store_full_emulation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:199"]
  T19["function:unlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:120"]
  S19 -->|calls| T19
  S20["function:AO_spin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:221"]
  T20["function:AO_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1938"]
  S20 -->|calls| T20
  S21["function:AO_spin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:221"]
  T21["function:AO_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2039"]
  S21 -->|calls| T21
  S22["function:AO_pause<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:232"]
  T22["function:AO_spin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops.c:221"]
  S22 -->|calls| T22
  S23["function:AO_char_compare_and_swap_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-arithm.h:26"]
  T23["function:AO_char_fetch_compare_and_swap_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/generic_pthread.h:316"]
  S23 -->|calls| T23
  S24["function:AO_char_compare_and_swap_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-arithm.h:38"]
  T24["function:AO_char_fetch_compare_and_swap_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:27"]
  S24 -->|calls| T24
  S25["function:AO_char_compare_and_swap_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-arithm.h:50"]
  T25["function:AO_char_fetch_compare_and_swap_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/ia64.h:158"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
