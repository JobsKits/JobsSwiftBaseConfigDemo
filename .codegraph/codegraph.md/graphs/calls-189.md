# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_pthread_join<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2744"]
  T1["function:GC_lookup_pthread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:1016"]
  S1 -->|calls| T1
  S2["function:GC_pthread_join<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2744"]
  T2["function:GC_lookup_pthread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:1016"]
  S2 -->|calls| T2
  S3["function:GC_pthread_join<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2744"]
  T3["function:GC_delete_gc_thread_no_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:688"]
  S3 -->|calls| T3
  S4["function:GC_pthread_join<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2744"]
  T4["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S4 -->|calls| T4
  S5["function:GC_pthread_create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2794"]
  T5["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3041"]
  S5 -->|calls| T5
  S6["function:GC_pthread_create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2794"]
  T6["function:GC_malloc_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:412"]
  S6 -->|calls| T6
  S7["function:GC_pthread_create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2794"]
  T7["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S7 -->|calls| T7
  S8["function:GC_pthread_create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2794"]
  T8["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:562"]
  S8 -->|calls| T8
  S9["function:GC_pthread_start_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2836"]
  T9["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S9 -->|calls| T9
  S10["function:GC_pthread_start_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2836"]
  T10["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  S10 -->|calls| T10
  S11["function:GC_pthread_start_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2836"]
  T11["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:562"]
  S11 -->|calls| T11
  S12["function:GC_pthread_start_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2836"]
  T12["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S12 -->|calls| T12
  S13["function:GC_pthread_start<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2886"]
  T13["function:GC_call_with_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2100"]
  S13 -->|calls| T13
  S14["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2891"]
  T14["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S14 -->|calls| T14
  S15["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2891"]
  T15["function:GC_wait_for_gc_completion<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:827"]
  S15 -->|calls| T15
  S16["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2891"]
  T16["function:GC_getspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/specific.h:89"]
  S16 -->|calls| T16
  S17["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2891"]
  T17["function:GC_destroy_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:128"]
  S17 -->|calls| T17
  S18["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2891"]
  T18["function:GC_delete_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:737"]
  S18 -->|calls| T18
  S19["function:GC_pthread_detach<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2932"]
  T19["function:GC_lookup_pthread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:1016"]
  S19 -->|calls| T19
  S20["function:GC_pthread_detach<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2932"]
  T20["function:GC_delete_gc_thread_no_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:688"]
  S20 -->|calls| T20
  S21["function:GC_DllMain<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2971"]
  T21["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:788"]
  S21 -->|calls| T21
  S22["function:GC_DllMain<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2971"]
  T22["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:419"]
  S22 -->|calls| T22
  S23["function:GC_DllMain<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2971"]
  T23["function:GC_delete_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:737"]
  S23 -->|calls| T23
  S24["function:GC_DllMain<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2971"]
  T24["function:GC_get_max_thread_index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:539"]
  S24 -->|calls| T24
  S25["function:GC_DllMain<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2971"]
  T25["function:AO_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1938"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
