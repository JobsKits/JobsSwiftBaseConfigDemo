# `calls 符号关系 - 058`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Baselib_Semaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:75"]
  T1["function:Detail_Baselib_Semaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:41"]
  S1 -->|calls| T1
  S2["function:Baselib_Semaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:75"]
  T2["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S2 -->|calls| T2
  S3["function:Baselib_Semaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:75"]
  T3["function:Detail_Baselib_Semaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:41"]
  S3 -->|calls| T3
  S4["function:Baselib_Semaphore_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:161"]
  T4["function:Baselib_Semaphore_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:153"]
  S4 -->|calls| T4
  S5["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:1"]
  T5["function:HighestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:28"]
  S5 -->|calls| T5
  S6["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:1"]
  T6["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:57"]
  S6 -->|calls| T6
  S7["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:1"]
  T7["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:57"]
  S7 -->|calls| T7
  S8["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:1"]
  T8["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:57"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:1"]
  T9["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:57"]
  S9 -->|calls| T9
  S10["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:138"]
  T10["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:138"]
  S10 -->|calls| T10
  S11["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:158"]
  T11["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:158"]
  S11 -->|calls| T11
  S12["function:RoundPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:162"]
  T12["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:158"]
  S12 -->|calls| T12
  S13["function:RoundPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:162"]
  T13["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:158"]
  S13 -->|calls| T13
  S14["function:RoundPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:162"]
  T14["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:158"]
  S14 -->|calls| T14
  S15["function:RoundPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:162"]
  T15["function:CeilPowerOfTwo<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:158"]
  S15 -->|calls| T15
  S16["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:1"]
  T16["function:Clamp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:234"]
  S16 -->|calls| T16
  S17["function:Clamp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:234"]
  T17["function:Clamp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:234"]
  S17 -->|calls| T17
  S18["function:ClampToType<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:251"]
  T18["function:Clamp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:234"]
  S18 -->|calls| T18
  S19["function:ClampToType<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:265"]
  T19["function:Clamp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Algorithm.h:234"]
  S19 -->|calls| T19
  S20["function:atomic_fetch_sub_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:186"]
  T20["function:atomic_fetch_add_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:206"]
  S20 -->|calls| T20
  S21["function:atomic_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:260"]
  T21["function:atomic_load_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:194"]
  S21 -->|calls| T21
  S22["function:atomic_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:266"]
  T22["function:atomic_store_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:200"]
  S22 -->|calls| T22
  S23["function:atomic_fetch_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:272"]
  T23["function:atomic_fetch_add_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:206"]
  S23 -->|calls| T23
  S24["function:atomic_fetch_sub<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:278"]
  T24["function:atomic_fetch_sub_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:186"]
  S24 -->|calls| T24
  S25["function:atomic_fetch_and<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:284"]
  T25["function:atomic_fetch_and_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:212"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
