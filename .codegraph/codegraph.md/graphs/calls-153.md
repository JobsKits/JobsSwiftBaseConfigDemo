# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_atfork_prepare<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1148"]
  T1["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S1 -->|calls| T1
  S2["function:GC_atfork_prepare<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1148"]
  T2["function:fork_prepare_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1069"]
  S2 -->|calls| T2
  S3["function:GC_atfork_parent<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1161"]
  T3["function:fork_parent_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1096"]
  S3 -->|calls| T3
  S4["function:GC_atfork_child<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1167"]
  T4["function:fork_child_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1110"]
  S4 -->|calls| T4
  S5["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T5["function:GC_enclosing_mapping<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:325"]
  S5 -->|calls| T5
  S6["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T6["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S6 -->|calls| T6
  S7["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T7["function:GC_new_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:530"]
  S7 -->|calls| T7
  S8["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T8["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S8 -->|calls| T8
  S9["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T9["function:GC_stop_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:1235"]
  S9 -->|calls| T9
  S10["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T10["function:GC_get_nprocs_present<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:990"]
  S10 -->|calls| T10
  S11["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T11["function:GC_get_nprocs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:902"]
  S11 -->|calls| T11
  S12["function:GC_thr_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1182"]
  T12["function:setup_mark_lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:2188"]
  S12 -->|calls| T12
  S13["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1313"]
  T13["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S13 -->|calls| T13
  S14["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1313"]
  T14["function:GC_init_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:94"]
  S14 -->|calls| T14
  S15["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1313"]
  T15["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S15 -->|calls| T15
  S16["function:WRAP_FUNC(pthread_sigmask)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1332"]
  T16["function:GC_get_suspend_signal<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:624"]
  S16 -->|calls| T16
  S17["function:GC_do_blocking_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1354"]
  T17["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S17 -->|calls| T17
  S18["function:GC_do_blocking_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1354"]
  T18["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S18 -->|calls| T18
  S19["function:GC_do_blocking_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1354"]
  T19["function:GC_FindTopOfStack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:56"]
  S19 -->|calls| T19
  S20["function:GC_call_with_gc_active<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1403"]
  T20["function:GC_lookup_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:652"]
  S20 -->|calls| T20
  S21["function:GC_call_with_gc_active<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1403"]
  T21["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S21 -->|calls| T21
  S22["function:GC_unregister_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1466"]
  T22["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S22 -->|calls| T22
  S23["function:GC_unregister_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1466"]
  T23["function:GC_count_threads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:507"]
  S23 -->|calls| T23
  S24["function:GC_unregister_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1466"]
  T24["function:GC_getspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/specific.h:89"]
  S24 -->|calls| T24
  S25["function:GC_unregister_my_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1466"]
  T25["function:GC_destroy_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:128"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
