# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T1["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S1 -->|calls| T1
  S2["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T2["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S2 -->|calls| T2
  S3["function:GC_print_address_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4930"]
  T3["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S3 -->|calls| T3
  S4["function:GC_print_address_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4930"]
  T4["function:GC_get_maps<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:171"]
  S4 -->|calls| T4
  S5["function:GC_print_address_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4930"]
  T5["function:GC_err_puts<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1860"]
  S5 -->|calls| T5
  S6["function:GC_print_address_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4930"]
  T6["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S6 -->|calls| T6
  S7["function:GC_inner_start_routine<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_start.c:45"]
  T7["function:GC_start_rtn_prepare_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1764"]
  S7 -->|calls| T7
  S8["function:GC_inner_start_routine<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_start.c:45"]
  T8["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:1"]
  T9["function:suspend_self_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:571"]
  S9 -->|calls| T9
  S10["function:GC_print_sig_mask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:77"]
  T10["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S10 -->|calls| T10
  S11["function:GC_suspend_handler<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:216"]
  T11["function:GC_with_callee_saves_pushed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:227"]
  S11 -->|calls| T11
  S12["function:GC_suspend_handler<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:216"]
  T12["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  S12 -->|calls| T12
  S13["function:GC_store_stack_ptr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:268"]
  T13["function:AO_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2039"]
  S13 -->|calls| T13
  S14["function:GC_store_stack_ptr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:268"]
  T14["function:AO_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2039"]
  S14 -->|calls| T14
  S15["function:GC_store_stack_ptr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:268"]
  T15["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S15 -->|calls| T15
  S16["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T16["function:AO_load_acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1840"]
  S16 -->|calls| T16
  S17["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T17["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S17 -->|calls| T17
  S18["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T18["function:GC_lookup_thread_async<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:255"]
  S18 -->|calls| T18
  S19["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T19["function:AO_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1938"]
  S19 -->|calls| T19
  S20["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T20["function:GC_store_stack_ptr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:268"]
  S20 -->|calls| T20
  S21["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T21["function:sem_post<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/darwin_semaphore.h:55"]
  S21 -->|calls| T21
  S22["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T22["function:suspend_self_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:571"]
  S22 -->|calls| T22
  S23["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T23["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S23 -->|calls| T23
  S24["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T24["function:GC_store_stack_ptr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:268"]
  S24 -->|calls| T24
  S25["function:GC_suspend_handler_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_stop_world.c:288"]
  T25["function:sem_post<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/darwin_semaphore.h:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
