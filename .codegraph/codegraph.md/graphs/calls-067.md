# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:tlsf_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:164"]
  T1["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S1 -->|calls| T1
  S2["class:tlsf_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:164"]
  T2["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S2 -->|calls| T2
  S3["class:tlsf_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:164"]
  T3["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S3 -->|calls| T3
  S4["class:tlsf_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:164"]
  T4["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S4 -->|calls| T4
  S5["method:tlsf_allocator::size_t AllocatorSize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:277"]
  T5["method:tlsf_allocator::AllocatorSizeLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:267"]
  S5 -->|calls| T5
  S6["method:tlsf_allocator::& getAllocator(const size_t size)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:296"]
  T6["method:tlsf_allocator::AllocatorSizeLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:267"]
  S6 -->|calls| T6
  S7["method:tlsf_allocator::& getAllocator(size_t size)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:302"]
  T7["method:tlsf_allocator::LinearAllocatorSizeLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:268"]
  S7 -->|calls| T7
  S8["method:tlsf_allocator::& getAllocator(size_t size)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:302"]
  T8["method:tlsf_allocator::AllocatorSizeLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:267"]
  S8 -->|calls| T8
  S9["method:tlsf_allocator::& getAllocator(size_t size)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:309"]
  T9["method:tlsf_allocator::AllocatorSizeLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:267"]
  S9 -->|calls| T9
  S10["method:tlsf_allocator::& getAllocator(size_t size)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:309"]
  T10["method:tlsf_allocator::LinearAllocatorSizeLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:268"]
  S10 -->|calls| T10
  S11["method:tlsf_allocator::DeallocateSegmentsImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:325"]
  T11["method:chunked_allocator::deallocate_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:400"]
  S11 -->|calls| T11
  S12["method:tlsf_allocator::ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:339"]
  T12["method:tlsf_allocator::try_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:182"]
  S12 -->|calls| T12
  S13["method:tlsf_allocator::ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:339"]
  T13["method:tlsf_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:187"]
  S13 -->|calls| T13
  S14["method:tlsf_allocator::ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:339"]
  T14["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:264"]
  S14 -->|calls| T14
  S15["method:tlsf_allocator::ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:339"]
  T15["method:tlsf_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:187"]
  S15 -->|calls| T15
  S16["method:tlsf_allocator::ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:339"]
  T16["method:chunked_allocator::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:384"]
  S16 -->|calls| T16
  S17["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:1"]
  T17["method:MutexImpl::Lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Generic/MutexImpl.h:31"]
  S17 -->|calls| T17
  S18["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:1"]
  T18["method:MutexImpl::Lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Generic/MutexImpl.h:31"]
  S18 -->|calls| T18
  S19["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:1"]
  T19["method:MutexImpl::Lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Generic/MutexImpl.h:31"]
  S19 -->|calls| T19
  S20["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:1"]
  T20["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:19"]
  S20 -->|calls| T20
  S21["function:TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:56"]
  T21["function:Baselib_Lock_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:32"]
  S21 -->|calls| T21
  S22["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:74"]
  T22["function:Baselib_Lock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:62"]
  S22 -->|calls| T22
  S23["function:Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:86"]
  T23["function:Baselib_Lock_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:89"]
  S23 -->|calls| T23
  S24["function:AcquireScoped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:101"]
  T24["function:Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CappedSemaphore.h:54"]
  S24 -->|calls| T24
  S25["function:TryAcquireScoped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:121"]
  T25["function:TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
