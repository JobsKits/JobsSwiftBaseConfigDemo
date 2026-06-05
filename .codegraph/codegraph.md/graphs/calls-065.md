# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:chunked_allocator::reserve<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:417"]
  T1["method:<anonymous>::allocate_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:153"]
  S1 -->|calls| T1
  S2["class:chunked_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:223"]
  T2["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S2 -->|calls| T2
  S3["class:chunked_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:223"]
  T3["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S3 -->|calls| T3
  S4["class:chunked_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:223"]
  T4["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S4 -->|calls| T4
  S5["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:534"]
  T5["method:chunked_allocator::IsBlockReserved<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:526"]
  S5 -->|calls| T5
  S6["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:534"]
  T6["method:<anonymous>::allocate_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:153"]
  S6 -->|calls| T6
  S7["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:534"]
  T7["method:chunked_allocator::UpdateBlockGenerationId<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:527"]
  S7 -->|calls| T7
  S8["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:552"]
  T8["method:chunked_allocator::SizeToBlockSizeFactorLog2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:514"]
  S8 -->|calls| T8
  S9["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:552"]
  T9["method:chunked_allocator::IsBlockReserved<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:526"]
  S9 -->|calls| T9
  S10["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:552"]
  T10["method:chunked_allocator::IsBlockUsed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:523"]
  S10 -->|calls| T10
  S11["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:552"]
  T11["method:chunked_allocator::UpdateBlockGenerationId<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:527"]
  S11 -->|calls| T11
  S12["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:552"]
  T12["method:<anonymous>::resize_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:163"]
  S12 -->|calls| T12
  S13["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:552"]
  T13["method:<anonymous>::allocate_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:153"]
  S13 -->|calls| T13
  S14["method:chunked_allocator::AllocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:552"]
  T14["method:chunked_allocator::UpdateBlockGenerationId<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:527"]
  S14 -->|calls| T14
  S15["method:chunked_allocator::DeallocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:591"]
  T15["method:chunked_allocator::IsBlockReserved<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:526"]
  S15 -->|calls| T15
  S16["method:chunked_allocator::DeallocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:591"]
  T16["method:<anonymous>::deallocate_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:175"]
  S16 -->|calls| T16
  S17["method:chunked_allocator::DeallocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:591"]
  T17["method:chunked_allocator::SetBlockUnused<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:525"]
  S17 -->|calls| T17
  S18["method:chunked_allocator::DeallocImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:607"]
  T18["method:chunked_allocator::DeallocateBlock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:591"]
  S18 -->|calls| T18
  S19["method:chunked_allocator_stats::block_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:663"]
  T19["method:chunked_allocator::IsBlockUsed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:523"]
  S19 -->|calls| T19
  S20["method:chunked_allocator_stats::block_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:663"]
  T20["method:<anonymous>::memory_address_of<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:182"]
  S20 -->|calls| T20
  S21["method:chunked_allocator_stats::block_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:663"]
  T21["method:chunked_allocator::DecodeBlockIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:491"]
  S21 -->|calls| T21
  S22["method:chunked_allocator_stats::block_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:663"]
  T22["method:chunked_allocator::DecodeBlockPosition<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:492"]
  S22 -->|calls| T22
  S23["method:chunked_allocator_stats::set_block_generation_id<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:703"]
  T23["method:chunked_allocator::DecodeBlockIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:491"]
  S23 -->|calls| T23
  S24["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/heap_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/heap_allocator.inl.h:1"]
  T24["function:allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/heap_allocator.inl.h:110"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/heap_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/heap_allocator.inl.h:1"]
  T25["function:reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/heap_allocator.inl.h:115"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
