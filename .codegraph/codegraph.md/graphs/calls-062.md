# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T1["method:SocketHandleWrapper::Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Socket.h:416"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T2["function:ConditionVariable::Wait<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ConditionVariable.cpp:30"]
  S2 -->|calls| T2
  S3["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T3["function:ConditionVariable::TimedWait<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ConditionVariable.cpp:35"]
  S3 -->|calls| T3
  S4["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T4["method:SocketHandleWrapper::Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Socket.h:416"]
  S4 -->|calls| T4
  S5["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T5["function:mono_string_from_bstr_checked::if<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/cominterop.c:3243"]
  S5 -->|calls| T5
  S6["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T6["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S6 -->|calls| T6
  S7["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T7["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S7 -->|calls| T7
  S8["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T8["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T9["function:BitMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ClassLibraryPAL/brotli/dec/bit_reader.h:26"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T10["method:<anonymous>::block_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:145"]
  S10 -->|calls| T10
  S11["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T11["variable:m_BlockSizeMax<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:120"]
  S11 -->|calls| T11
  S12["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T12["method:chunked_allocator::optimal_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:464"]
  S12 -->|calls| T12
  S13["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T13["variable:m_BlockCount<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:121"]
  S13 -->|calls| T13
  S14["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T14["method:chunked_allocator::optimal_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:464"]
  S14 -->|calls| T14
  S15["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T15["variable:m_BlockSizeMaxLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:122"]
  S15 -->|calls| T15
  S16["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T16["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S16 -->|calls| T16
  S17["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T17["variable:m_MaxCapacity<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:123"]
  S17 -->|calls| T17
  S18["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T18["variable:m_BlockMemory<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:124"]
  S18 -->|calls| T18
  S19["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T19["method:Allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/Allocator.h:23"]
  S19 -->|calls| T19
  S20["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T20["method:<anonymous>::memory_address_of<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:182"]
  S20 -->|calls| T20
  S21["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T21["function:mono_string_from_bstr_checked::if<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/cominterop.c:3243"]
  S21 -->|calls| T21
  S22["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T22["function:mono_string_from_bstr_checked::if<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/cominterop.c:3243"]
  S22 -->|calls| T22
  S23["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T23["method:page_allocator::set_page_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/page_allocator.inl.h:85"]
  S23 -->|calls| T23
  S24["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T24["method:<anonymous>::memory_address_of<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:182"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T25["function:mono_string_from_bstr_checked::if<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/cominterop.c:3243"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
