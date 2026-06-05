# `calls 符号关系 - 169`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T1["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  S1 -->|calls| T1
  S2["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T2["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S2 -->|calls| T2
  S3["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T3["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  S3 -->|calls| T3
  S4["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T4["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  S4 -->|calls| T4
  S5["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T5["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S5 -->|calls| T5
  S6["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T6["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S6 -->|calls| T6
  S7["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T7["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S7 -->|calls| T7
  S8["function:typed_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1127"]
  T8["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S8 -->|calls| T8
  S9["function:uniq<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1244"]
  T9["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S9 -->|calls| T9
  S10["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T10["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S10 -->|calls| T10
  S11["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T11["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S11 -->|calls| T11
  S12["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T12["function:GC_thread_is_registered<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:702"]
  S12 -->|calls| T12
  S13["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T13["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S13 -->|calls| T13
  S14["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T14["function:test_tinyfl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1038"]
  S14 -->|calls| T14
  S15["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T15["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S15 -->|calls| T15
  S16["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T16["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S16 -->|calls| T16
  S17["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T17["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S17 -->|calls| T17
  S18["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T18["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S18 -->|calls| T18
  S19["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T19["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S19 -->|calls| T19
  S20["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T20["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S20 -->|calls| T20
  S21["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T21["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S21 -->|calls| T21
  S22["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T22["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S22 -->|calls| T22
  S23["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T23["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S23 -->|calls| T23
  S24["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T24["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S24 -->|calls| T24
  S25["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  T25["function:AO_fetch_and_add1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/sysdeps/gcc/arm.h:292"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
