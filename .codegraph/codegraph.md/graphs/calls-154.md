# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_unregister_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1466"]
  T1["function:GC_delete_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:576"]
  S1 -->|calls| T1
  S2["function:GC_unregister_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1496"]
  T2["function:GC_wait_for_gc_completion<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1024"]
  S2 -->|calls| T2
  S3["function:GC_unregister_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1496"]
  T3["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S3 -->|calls| T3
  S4["function:GC_unregister_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1496"]
  T4["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S4 -->|calls| T4
  S5["function:GC_unregister_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1496"]
  T5["function:GC_unregister_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1466"]
  S5 -->|calls| T5
  S6["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1526"]
  T6["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S6 -->|calls| T6
  S7["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1526"]
  T7["function:GC_wait_for_gc_completion<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1024"]
  S7 -->|calls| T7
  S8["function:GC_thread_exit_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1526"]
  T8["function:GC_unregister_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1466"]
  S8 -->|calls| T8
  S9["function:WRAP_FUNC(pthread_join)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1544"]
  T9["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S9 -->|calls| T9
  S10["function:WRAP_FUNC(pthread_join)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1544"]
  T10["function:GC_delete_gc_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:616"]
  S10 -->|calls| T10
  S11["function:WRAP_FUNC(pthread_detach)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1580"]
  T11["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S11 -->|calls| T11
  S12["function:WRAP_FUNC(pthread_detach)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1580"]
  T12["function:GC_delete_gc_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:616"]
  S12 -->|calls| T12
  S13["function:WRAP_FUNC(pthread_cancel)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1614"]
  T13["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S13 -->|calls| T13
  S14["function:WRAP_FUNC(pthread_exit)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1639"]
  T14["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S14 -->|calls| T14
  S15["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1677"]
  T15["function:GC_new_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:530"]
  S15 -->|calls| T15
  S16["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1677"]
  T16["function:GC_record_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1663"]
  S16 -->|calls| T16
  S17["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1677"]
  T17["function:GC_unblock_gc_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:198"]
  S17 -->|calls| T17
  S18["function:GC_allow_register_threads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1699"]
  T18["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S18 -->|calls| T18
  S19["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1706"]
  T19["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S19 -->|calls| T19
  S20["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1706"]
  T20["function:GC_register_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1677"]
  S20 -->|calls| T20
  S21["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1706"]
  T21["function:GC_init_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:94"]
  S21 -->|calls| T21
  S22["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1706"]
  T22["function:GC_record_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1663"]
  S22 -->|calls| T22
  S23["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1706"]
  T23["function:GC_unblock_gc_signals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:198"]
  S23 -->|calls| T23
  S24["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1706"]
  T24["function:GC_init_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:94"]
  S24 -->|calls| T24
  S25["function:GC_start_rtn_prepare_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1764"]
  T25["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
