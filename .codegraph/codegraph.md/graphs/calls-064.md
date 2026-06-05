# `calls 符号关系 - 064`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  T1["method:chunked_allocator::DecodeBlockIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:491"]
  S1 -->|calls| T1
  S2["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  T2["method:chunked_allocator::SetBlockUsed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:524"]
  S2 -->|calls| T2
  S3["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  T3["method:chunked_allocator::DecodeBlockPosition<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:492"]
  S3 -->|calls| T3
  S4["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  T4["method:chunked_allocator::DecodeBlockIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:491"]
  S4 -->|calls| T4
  S5["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  T5["method:chunked_allocator::DecodeBlockIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:491"]
  S5 -->|calls| T5
  S6["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  T6["method:chunked_allocator::DeallocImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:607"]
  S6 -->|calls| T6
  S7["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:352"]
  T7["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:359"]
  S7 -->|calls| T7
  S8["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:352"]
  T8["method:<anonymous>::block_index_of<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:187"]
  S8 -->|calls| T8
  S9["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:359"]
  T9["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  S9 -->|calls| T9
  S10["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:359"]
  T10["method:chunked_allocator::AlignSize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:620"]
  S10 -->|calls| T10
  S11["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:359"]
  T11["method:chunked_allocator::AlignSize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:620"]
  S11 -->|calls| T11
  S12["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:359"]
  T12["method:chunked_allocator::DeallocImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:607"]
  S12 -->|calls| T12
  S13["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:359"]
  T13["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:271"]
  S13 -->|calls| T13
  S14["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:359"]
  T14["method:chunked_allocator::DeallocImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:607"]
  S14 -->|calls| T14
  S15["method:chunked_allocator::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:384"]
  T15["method:chunked_allocator::DeallocImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:607"]
  S15 -->|calls| T15
  S16["method:chunked_allocator::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:384"]
  T16["method:<anonymous>::block_index_of<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:187"]
  S16 -->|calls| T16
  S17["method:chunked_allocator::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:384"]
  T17["method:chunked_allocator::AlignSize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:620"]
  S17 -->|calls| T17
  S18["method:chunked_allocator::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:392"]
  T18["method:chunked_allocator::DeallocImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:607"]
  S18 -->|calls| T18
  S19["method:chunked_allocator::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:392"]
  T19["method:chunked_allocator::AlignSize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:620"]
  S19 -->|calls| T19
  S20["method:chunked_allocator::deallocate_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:400"]
  T20["method:chunked_allocator::capacity<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:459"]
  S20 -->|calls| T20
  S21["method:chunked_allocator::deallocate_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:400"]
  T21["method:chunked_allocator::IsBlockUsed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:523"]
  S21 -->|calls| T21
  S22["method:chunked_allocator::deallocate_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:400"]
  T22["method:chunked_allocator::IsBlockReserved<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:526"]
  S22 -->|calls| T22
  S23["method:chunked_allocator::deallocate_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:400"]
  T23["method:<anonymous>::deallocate_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:175"]
  S23 -->|calls| T23
  S24["method:chunked_allocator::deallocate_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:400"]
  T24["method:chunked_allocator::EncodeBlockIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:490"]
  S24 -->|calls| T24
  S25["method:chunked_allocator::reserve<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:417"]
  T25["method:chunked_allocator::IsBlockUsed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:523"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
