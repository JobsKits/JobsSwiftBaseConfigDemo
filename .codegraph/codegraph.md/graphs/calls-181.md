# `calls 符号关系 - 181`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T1["function:GC_malloc_kind_global<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:292"]
  S1 -->|calls| T1
  S2["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T2["function:GC_malloc_kind_global<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:292"]
  S2 -->|calls| T2
  S3["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T3["function:GC_getspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/specific.h:89"]
  S3 -->|calls| T3
  S4["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T4["function:GC_malloc_kind_global<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:292"]
  S4 -->|calls| T4
  S5["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T5["function:GC_getspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/specific.h:89"]
  S5 -->|calls| T5
  S6["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T6["function:GC_malloc_kind_global<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:292"]
  S6 -->|calls| T6
  S7["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T7["function:GC_is_thread_tsd_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:689"]
  S7 -->|calls| T7
  S8["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T8["function:GC_malloc_kind_global<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:292"]
  S8 -->|calls| T8
  S9["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:144"]
  T9["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S9 -->|calls| T9
  S10["function:GC_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:216"]
  T10["function:GC_getspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/specific.h:89"]
  S10 -->|calls| T10
  S11["function:GC_mark_thread_local_fls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:262"]
  T11["function:AO_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1938"]
  S11 -->|calls| T11
  S12["function:GC_mark_thread_local_fls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:262"]
  T12["function:GC_set_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:899"]
  S12 -->|calls| T12
  S13["function:GC_mark_thread_local_fls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:262"]
  T13["function:AO_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1938"]
  S13 -->|calls| T13
  S14["function:GC_mark_thread_local_fls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:262"]
  T14["function:GC_set_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:899"]
  S14 -->|calls| T14
  S15["function:GC_check_tls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:287"]
  T15["function:GC_check_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:932"]
  S15 -->|calls| T15
  S16["function:GC_check_tls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:287"]
  T16["function:GC_check_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:932"]
  S16 -->|calls| T16
  S17["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tools/setjmp_t.c:79"]
  T17["function:nested_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tools/setjmp_t.c:63"]
  S17 -->|calls| T17
  S18["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tools/setjmp_t.c:79"]
  T18["function:g<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tools/setjmp_t.c:155"]
  S18 -->|calls| T18
  S19["function:GC_add_ext_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:124"]
  T19["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:339"]
  S19 -->|calls| T19
  S20["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:1"]
  T20["function:GC_make_sequence_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:314"]
  S20 -->|calls| T20
  S21["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T21["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  S21 -->|calls| T21
  S22["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T22["function:GC_double_descr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:187"]
  S22 -->|calls| T22
  S23["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T23["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:339"]
  S23 -->|calls| T23
  S24["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T24["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:339"]
  S24 -->|calls| T24
  S25["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T25["function:GC_make_sequence_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:314"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
