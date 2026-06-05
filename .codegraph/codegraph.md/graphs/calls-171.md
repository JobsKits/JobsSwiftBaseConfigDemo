# `calls 符号关系 - 171`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T1["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S1 -->|calls| T1
  S2["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T2["function:GC_is_visible<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:187"]
  S2 -->|calls| T2
  S3["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T3["function:GC_is_visible<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:187"]
  S3 -->|calls| T3
  S4["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T4["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S4 -->|calls| T4
  S5["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T5["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S5 -->|calls| T5
  S6["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T6["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S6 -->|calls| T6
  S7["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T7["function:GC_end_stubborn_change<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:614"]
  S7 -->|calls| T7
  S8["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T8["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S8 -->|calls| T8
  S9["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T9["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S9 -->|calls| T9
  S10["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T10["function:GC_is_valid_displacement<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:117"]
  S10 -->|calls| T10
  S11["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T11["function:GC_is_valid_displacement<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:117"]
  S11 -->|calls| T11
  S12["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T12["function:GC_is_valid_displacement<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:117"]
  S12 -->|calls| T12
  S13["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T13["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S13 -->|calls| T13
  S14["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T14["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S14 -->|calls| T14
  S15["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T15["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S15 -->|calls| T15
  S16["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T16["function:GC_memalign<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:490"]
  S16 -->|calls| T16
  S17["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T17["function:GC_get_all_interior_pointers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2419"]
  S17 -->|calls| T17
  S18["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T18["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S18 -->|calls| T18
  S19["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T19["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S19 -->|calls| T19
  S20["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T20["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S20 -->|calls| T20
  S21["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T21["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S21 -->|calls| T21
  S22["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T22["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S22 -->|calls| T22
  S23["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T23["function:test_generic_malloc_or_special<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:644"]
  S23 -->|calls| T23
  S24["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T24["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:339"]
  S24 -->|calls| T24
  S25["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T25["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
