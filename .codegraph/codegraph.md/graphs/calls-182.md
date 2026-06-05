# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T1["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:339"]
  S1 -->|calls| T1
  S2["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T2["function:GC_make_sequence_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:314"]
  S2 -->|calls| T2
  S3["function:GC_make_array_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:219"]
  T3["function:GC_make_sequence_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:314"]
  S3 -->|calls| T3
  S4["function:GC_make_sequence_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:314"]
  T4["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S4 -->|calls| T4
  S5["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  T5["function:GC_new_free_list_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2001"]
  S5 -->|calls| T5
  S6["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  T6["function:GC_new_kind_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2022"]
  S6 -->|calls| T6
  S7["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  T7["function:GC_new_proc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2062"]
  S7 -->|calls| T7
  S8["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  T8["function:GC_new_proc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2062"]
  S8 -->|calls| T8
  S9["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  T9["function:GC_new_kind_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2022"]
  S9 -->|calls| T9
  S10["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  T10["function:GC_new_free_list_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2001"]
  S10 -->|calls| T10
  S11["function:GC_typed_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:365"]
  T11["function:GC_signal_mark_stack_overflow<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:627"]
  S11 -->|calls| T11
  S12["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  T12["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  S12 -->|calls| T12
  S13["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  T13["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  S13 -->|calls| T13
  S14["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  T14["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  S14 -->|calls| T14
  S15["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  T15["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  S15 -->|calls| T15
  S16["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  T16["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  S16 -->|calls| T16
  S17["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  T17["function:GC_descr_obj_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:405"]
  S17 -->|calls| T17
  S18["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  T18["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  S18 -->|calls| T18
  S19["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  T19["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  S19 -->|calls| T19
  S20["function:GC_array_mark_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:479"]
  T20["function:GC_push_complex_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:424"]
  S20 -->|calls| T20
  S21["function:GC_make_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:527"]
  T21["function:AO_load_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1840"]
  S21 -->|calls| T21
  S22["function:GC_make_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:527"]
  T22["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  S22 -->|calls| T22
  S23["function:GC_make_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:527"]
  T23["function:AO_store_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2054"]
  S23 -->|calls| T23
  S24["function:GC_make_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:527"]
  T24["function:GC_init_explicit_typing<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:341"]
  S24 -->|calls| T24
  S25["function:GC_make_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:527"]
  T25["function:GC_add_ext_descriptor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:124"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
