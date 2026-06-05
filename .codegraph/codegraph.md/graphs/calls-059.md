# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:atomic_fetch_or<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:290"]
  T1["function:atomic_fetch_or_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:218"]
  S1 -->|calls| T1
  S2["function:atomic_fetch_xor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:296"]
  T2["function:atomic_fetch_xor_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:224"]
  S2 -->|calls| T2
  S3["function:atomic_exchange<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:302"]
  T3["function:atomic_exchange_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:230"]
  S3 -->|calls| T3
  S4["function:atomic_compare_exchange_weak<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:308"]
  T4["function:atomic_compare_exchange_weak_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:236"]
  S4 -->|calls| T4
  S5["function:atomic_compare_exchange_strong<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:316"]
  T5["function:atomic_compare_exchange_strong_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:247"]
  S5 -->|calls| T5
  S6["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  T6["function:atomic_load_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:194"]
  S6 -->|calls| T6
  S7["method:atomic_common::operator=<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:341"]
  T7["function:atomic_store_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:200"]
  S7 -->|calls| T7
  S8["method:atomic_common::load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:344"]
  T8["function:atomic_load_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:194"]
  S8 -->|calls| T8
  S9["method:atomic_common::store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:350"]
  T9["function:atomic_store_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:200"]
  S9 -->|calls| T9
  S10["method:atomic_common::exchange<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:356"]
  T10["function:atomic_exchange_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:230"]
  S10 -->|calls| T10
  S11["method:atomic_common::compare_exchange_weak<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:362"]
  T11["function:atomic_compare_exchange_weak_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:236"]
  S11 -->|calls| T11
  S12["method:atomic_common::compare_exchange_weak<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:367"]
  T12["function:atomic_compare_exchange_weak_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:236"]
  S12 -->|calls| T12
  S13["method:atomic_common::compare_exchange_strong<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:373"]
  T13["function:atomic_compare_exchange_strong_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:247"]
  S13 -->|calls| T13
  S14["method:atomic_common::compare_exchange_strong<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:378"]
  T14["function:atomic_compare_exchange_strong_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:247"]
  S14 -->|calls| T14
  S15["method:<anonymous>::fetch_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:394"]
  T15["function:atomic_fetch_add_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:206"]
  S15 -->|calls| T15
  S16["method:<anonymous>::fetch_sub<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:400"]
  T16["function:atomic_fetch_sub_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:186"]
  S16 -->|calls| T16
  S17["method:<anonymous>::fetch_and<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:406"]
  T17["function:atomic_fetch_and_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:212"]
  S17 -->|calls| T17
  S18["method:<anonymous>::fetch_or<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:412"]
  T18["function:atomic_fetch_or_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:218"]
  S18 -->|calls| T18
  S19["method:<anonymous>::fetch_xor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:418"]
  T19["function:atomic_fetch_xor_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:224"]
  S19 -->|calls| T19
  S20["method:<anonymous>::operator++<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:423"]
  T20["function:atomic_fetch_add_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:206"]
  S20 -->|calls| T20
  S21["method:<anonymous>::operator++<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:423"]
  T21["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S21 -->|calls| T21
  S22["method:<anonymous>::operator--<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:424"]
  T22["function:atomic_fetch_sub_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:186"]
  S22 -->|calls| T22
  S23["method:<anonymous>::operator--<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:424"]
  T23["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S23 -->|calls| T23
  S24["method:<anonymous>::operator++<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:425"]
  T24["function:atomic_fetch_add_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:206"]
  S24 -->|calls| T24
  S25["method:<anonymous>::operator++<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:425"]
  T25["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
