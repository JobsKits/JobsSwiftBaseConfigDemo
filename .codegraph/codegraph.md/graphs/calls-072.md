# `calls 符号关系 - 072`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:try_pop_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_stack.h:106"]
  T1["method:atomic_common::exchange<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:356"]
  S1 -->|calls| T1
  S2["function:try_pop_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_stack.h:106"]
  T2["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S2 -->|calls| T2
  S3["function:try_pop_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_stack.h:106"]
  T3["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  S3 -->|calls| T3
  S4["function:try_pop_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_stack.h:147"]
  T4["method:atomic_common::exchange<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:356"]
  S4 -->|calls| T4
  S5["function:try_pop_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_stack.h:147"]
  T5["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S5 -->|calls| T5
  S6["function:try_pop_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_stack.h:147"]
  T6["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  S6 -->|calls| T6
  S7["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T7["method:page_allocator::page_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/page_allocator.inl.h:65"]
  S7 -->|calls| T7
  S8["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T8["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:264"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T9["function:Baselib_ErrorState_Create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_ErrorState.h:54"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T10["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:264"]
  S10 -->|calls| T10
  S11["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T11["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:264"]
  S11 -->|calls| T11
  S12["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T12["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:352"]
  S12 -->|calls| T12
  S13["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T13["function:Baselib_ErrorState_RaiseError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_ErrorState.h:81"]
  S13 -->|calls| T13
  S14["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T14["function:Baselib_ErrorState_Create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_ErrorState.h:54"]
  S14 -->|calls| T14
  S15["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:1"]
  T15["method:chunked_allocator::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:384"]
  S15 -->|calls| T15
  S16["function:set_page_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:151"]
  T16["function:Baselib_ErrorState_Create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_ErrorState.h:54"]
  S16 -->|calls| T16
  S17["function:set_page_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:151"]
  T17["function:set_page_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:151"]
  S17 -->|calls| T17
  S18["function:set_page_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/page_allocator.h:171"]
  T18["method:page_allocator::set_page_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/page_allocator.inl.h:85"]
  S18 -->|calls| T18
  S19["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:1"]
  T19["function:tlsf_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:93"]
  S19 -->|calls| T19
  S20["function:try_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:113"]
  T20["function:owns<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:213"]
  S20 -->|calls| T20
  S21["function:try_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:113"]
  T21["method:tlsf_allocator::try_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:182"]
  S21 -->|calls| T21
  S22["function:allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:121"]
  T22["function:owns<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:213"]
  S22 -->|calls| T22
  S23["function:try_reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:130"]
  T23["function:owns<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:213"]
  S23 -->|calls| T23
  S24["function:try_reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:130"]
  T24["method:tlsf_allocator::try_reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:201"]
  S24 -->|calls| T24
  S25["function:reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:139"]
  T25["function:owns<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/tlsf_allocator.h:213"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
