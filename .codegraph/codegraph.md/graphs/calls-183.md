# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_malloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:591"]
  T1["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:331"]
  S1 -->|calls| T1
  S2["function:GC_malloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:591"]
  T2["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S2 -->|calls| T2
  S3["function:GC_malloc_explicitly_typed_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:615"]
  T3["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S3 -->|calls| T3
  S4["function:GC_malloc_explicitly_typed_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:615"]
  T4["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S4 -->|calls| T4
  S5["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  T5["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  S5 -->|calls| T5
  S6["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  T6["function:GC_get_oom_fn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2336"]
  S6 -->|calls| T6
  S7["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  T7["function:GC_malloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:591"]
  S7 -->|calls| T7
  S8["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  T8["function:GC_malloc_kind<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:331"]
  S8 -->|calls| T8
  S9["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  T9["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S9 -->|calls| T9
  S10["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  T10["function:GC_general_register_disappearing_link<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:258"]
  S10 -->|calls| T10
  S11["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  T11["function:GC_get_oom_fn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2336"]
  S11 -->|calls| T11
  S12["function:GC_init_gcj_vector<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:58"]
  T12["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S12 -->|calls| T12
  S13["function:GC_init_gcj_vector<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:58"]
  T13["function:GC_new_free_list_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2001"]
  S13 -->|calls| T13
  S14["function:GC_init_gcj_vector<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:58"]
  T14["function:GC_new_kind_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2022"]
  S14 -->|calls| T14
  S15["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:1"]
  T15["function:maybe_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:137"]
  S15 -->|calls| T15
  S16["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:1"]
  T16["function:maybe_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:137"]
  S16 -->|calls| T16
  S17["function:GC_gcj_vector_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:144"]
  T17["function:GC_signal_mark_stack_overflow<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:627"]
  S17 -->|calls| T17
  S18["function:GC_gcj_vector_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:144"]
  T18["function:GC_signal_mark_stack_overflow<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:627"]
  S18 -->|calls| T18
  S19["function:GC_gcj_vector_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:144"]
  T19["function:GC_signal_mark_stack_overflow<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:627"]
  S19 -->|calls| T19
  S20["function:GC_gcj_vector_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:144"]
  T20["function:GC_signal_mark_stack_overflow<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:627"]
  S20 -->|calls| T20
  S21["function:GC_gcj_vector_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:144"]
  T21["function:GC_signal_mark_stack_overflow<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:627"]
  S21 -->|calls| T21
  S22["function:GC_gcj_vector_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/vector_mlc.c:144"]
  T22["function:GC_signal_mark_stack_overflow<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:627"]
  S22 -->|calls| T22
  S23["function:GC_use_threads_discovery<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:173"]
  T23["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3041"]
  S23 -->|calls| T23
  S24["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:311"]
  T24["function:AO_compare_and_swap_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_atomic_ops.h:90"]
  S24 -->|calls| T24
  S25["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:311"]
  T25["function:AO_nop_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize.h:181"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
