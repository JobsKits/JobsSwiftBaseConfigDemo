# `calls 符号关系 - 184`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:311"]
  T1["function:AO_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1938"]
  S1 -->|calls| T1
  S2["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:311"]
  T2["function:AO_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2039"]
  S2 -->|calls| T2
  S3["function:GC_new_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:367"]
  T3["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S3 -->|calls| T3
  S4["function:GC_new_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:367"]
  T4["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S4 -->|calls| T4
  S5["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  T5["function:GC_set_write_fault_handler<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3441"]
  S5 -->|calls| T5
  S6["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  T6["function:GC_new_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:367"]
  S6 -->|calls| T6
  S7["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  T7["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S7 -->|calls| T7
  S8["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  T8["function:GC_record_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:403"]
  S8 -->|calls| T8
  S9["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  T9["function:GC_init_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:94"]
  S9 -->|calls| T9
  S10["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  T10["function:AO_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2039"]
  S10 -->|calls| T10
  S11["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  T11["function:AO_nop_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize.h:181"]
  S11 -->|calls| T11
  S12["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  T12["function:GC_get_max_thread_index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:539"]
  S12 -->|calls| T12
  S13["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  T13["function:AO_load_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1840"]
  S13 -->|calls| T13
  S14["function:GC_reset_finalizer_nested<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:588"]
  T14["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S14 -->|calls| T14
  S15["function:GC_check_finalizer_nested<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:601"]
  T15["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S15 -->|calls| T15
  S16["function:GC_is_thread_tsd_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:620"]
  T16["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S16 -->|calls| T16
  S17["function:GC_thread_is_registered<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:633"]
  T17["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S17 -->|calls| T17
  S18["function:GC_delete_gc_thread_no_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:688"]
  T18["function:AO_store_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2054"]
  S18 -->|calls| T18
  S19["function:GC_delete_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:737"]
  T19["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S19 -->|calls| T19
  S20["function:GC_delete_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:737"]
  T20["function:GC_delete_gc_thread_no_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:688"]
  S20 -->|calls| T20
  S21["function:GC_allow_register_threads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:773"]
  T21["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S21 -->|calls| T21
  S22["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:785"]
  T22["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S22 -->|calls| T22
  S23["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:785"]
  T23["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  S23 -->|calls| T23
  S24["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:785"]
  T24["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  S24 -->|calls| T24
  S25["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:785"]
  T25["function:GC_record_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:403"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
