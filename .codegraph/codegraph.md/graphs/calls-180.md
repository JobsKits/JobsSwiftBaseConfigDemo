# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/thread_leak_test.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/thread_leak_test.c:1"]
  T1["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S1 -->|calls| T1
  S2["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/thread_leak_test.c:47"]
  T2["function:GC_set_find_leak<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2391"]
  S2 -->|calls| T2
  S3["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/thread_leak_test.c:47"]
  T3["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S3 -->|calls| T3
  S4["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/thread_leak_test.c:47"]
  T4["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S4 -->|calls| T4
  S5["function:on_thread_exit_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/threadkey_test.c:52"]
  T5["function:GC_register_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1706"]
  S5 -->|calls| T5
  S6["function:on_thread_exit_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/threadkey_test.c:52"]
  T6["function:GC_pthread_create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:171"]
  S6 -->|calls| T6
  S7["function:on_thread_exit_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/threadkey_test.c:52"]
  T7["function:GC_unregister_my_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:1496"]
  S7 -->|calls| T7
  S8["function:on_thread_exit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/threadkey_test.c:73"]
  T8["function:GC_call_with_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2100"]
  S8 -->|calls| T8
  S9["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/threadkey_test.c:87"]
  T9["function:GC_pthread_create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:171"]
  S9 -->|calls| T9
  S10["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/threadkey_test.c:87"]
  T10["function:GC_pthread_join<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:186"]
  S10 -->|calls| T10
  S11["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/threadkey_test.c:87"]
  T11["function:GC_pthread_detach<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:191"]
  S11 -->|calls| T11
  S12["function:mktree<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:16"]
  T12["function:mktree<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:16"]
  S12 -->|calls| T12
  S13["function:mktree<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:16"]
  T13["function:mktree<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:16"]
  S13 -->|calls| T13
  S14["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:31"]
  T14["function:mktree<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:16"]
  S14 -->|calls| T14
  S15["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:31"]
  T15["function:GC_generate_random_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:260"]
  S15 -->|calls| T15
  S16["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:31"]
  T16["function:GC_generate_random_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:260"]
  S16 -->|calls| T16
  S17["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:31"]
  T17["function:GC_generate_random_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:260"]
  S17 -->|calls| T17
  S18["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/trace_test.c:31"]
  T18["function:GC_generate_random_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:260"]
  S18 -->|calls| T18
  S19["function:return_single_freelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:38"]
  T19["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S19 -->|calls| T19
  S20["function:return_single_freelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:38"]
  T20["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S20 -->|calls| T20
  S21["function:return_freelists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:58"]
  T21["function:return_single_freelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:38"]
  S21 -->|calls| T21
  S22["function:return_freelists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:58"]
  T22["function:return_single_freelist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:38"]
  S22 -->|calls| T22
  S23["function:GC_init_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:94"]
  T23["function:GC_setspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:51"]
  S23 -->|calls| T23
  S24["function:GC_destroy_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:128"]
  T24["function:return_freelists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:58"]
  S24 -->|calls| T24
  S25["function:GC_destroy_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:128"]
  T25["function:return_freelists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:58"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
