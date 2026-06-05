# `calls 符号关系 - 071`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:1"]
  T1["function:SlotIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:218"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:1"]
  T2["function:WriteableChecksum<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:213"]
  S2 -->|calls| T2
  S3["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  T3["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S3 -->|calls| T3
  S4["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  T4["function:SlotIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:218"]
  S4 -->|calls| T4
  S5["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  T5["function:WriteableChecksum<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:213"]
  S5 -->|calls| T5
  S6["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  T6["function:ReadableChecksum<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:214"]
  S6 -->|calls| T6
  S7["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  T7["function:SlotIndex<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:218"]
  S7 -->|calls| T7
  S8["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  T8["function:ReadableChecksumPrevGen<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:216"]
  S8 -->|calls| T8
  S9["function:try_push_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:168"]
  T9["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  S9 -->|calls| T9
  S10["function:try_push_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:180"]
  T10["function:try_emplace_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_fixed_queue.h:128"]
  S10 -->|calls| T10
  S11["function:push_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_queue.h:89"]
  T11["method:atomic_common::exchange<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:356"]
  S11 -->|calls| T11
  S12["function:try_pop_front<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_queue.h:116"]
  T12["method:<anonymous>::fetch_and<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:406"]
  S12 -->|calls| T12
  S13["function:try_pop_front<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_queue.h:116"]
  T13["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S13 -->|calls| T13
  S14["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_stack.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_stack.h:1"]
  T14["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S14 -->|calls| T14
  S15["function:push_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_stack.h:82"]
  T15["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S15 -->|calls| T15
  S16["function:try_pop_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_stack.h:105"]
  T16["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S16 -->|calls| T16
  S17["function:try_pop_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpmc_node_stack.h:140"]
  T17["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S17 -->|calls| T17
  S18["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h:1"]
  T18["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  S18 -->|calls| T18
  S19["function:push_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h:68"]
  T19["method:atomic_common::exchange<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:356"]
  S19 -->|calls| T19
  S20["function:push_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h:68"]
  T20["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  S20 -->|calls| T20
  S21["function:try_pop_front<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h:83"]
  T21["method:<anonymous>::fetch_or<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:412"]
  S21 -->|calls| T21
  S22["function:try_pop_front<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h:83"]
  T22["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  S22 -->|calls| T22
  S23["function:try_pop_front<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h:83"]
  T23["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  S23 -->|calls| T23
  S24["function:try_pop_front<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_queue.h:83"]
  T24["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  S24 -->|calls| T24
  S25["function:push_back<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/mpsc_node_stack.h:80"]
  T25["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
