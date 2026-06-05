# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:<anonymous>::operator++<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:425"]
  T1["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S1 -->|calls| T1
  S2["method:<anonymous>::operator--<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:426"]
  T2["function:atomic_fetch_sub_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:186"]
  S2 -->|calls| T2
  S3["method:<anonymous>::operator--<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:426"]
  T3["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S3 -->|calls| T3
  S4["method:<anonymous>::operator--<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:426"]
  T4["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S4 -->|calls| T4
  S5["method:<anonymous>::operator+=<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:427"]
  T5["function:atomic_fetch_add_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:206"]
  S5 -->|calls| T5
  S6["method:<anonymous>::operator-=<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:428"]
  T6["function:atomic_fetch_sub_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:186"]
  S6 -->|calls| T6
  S7["method:<anonymous>::operator&=<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:429"]
  T7["function:atomic_fetch_and_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:212"]
  S7 -->|calls| T7
  S8["method:<anonymous>::operator/=<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:430"]
  T8["function:atomic_fetch_or_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:218"]
  S8 -->|calls| T8
  S9["method:<anonymous>::operator^=<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:431"]
  T9["function:atomic_fetch_xor_explicit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:224"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Barrier.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Barrier.h:1"]
  T10["variable:m_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Barrier.h:95"]
  S10 -->|calls| T10
  S11["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Barrier.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Barrier.h:1"]
  T11["method:<anonymous>::fetch_sub<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:400"]
  S11 -->|calls| T11
  S12["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Barrier.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Barrier.h:1"]
  T12["method:SocketHandleWrapper::Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Socket.h:416"]
  S12 -->|calls| T12
  S13["function:Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CappedSemaphore.h:54"]
  T13["function:Baselib_CappedSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:66"]
  S13 -->|calls| T13
  S14["function:TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CappedSemaphore.h:64"]
  T14["function:Baselib_CappedSemaphore_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:55"]
  S14 -->|calls| T14
  S15["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CappedSemaphore.h:83"]
  T15["function:Baselib_CappedSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:78"]
  S15 -->|calls| T15
  S16["function:Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CappedSemaphore.h:94"]
  T16["function:Baselib_CappedSemaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:119"]
  S16 -->|calls| T16
  S17["function:ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CappedSemaphore.h:104"]
  T17["function:Baselib_CappedSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:143"]
  S17 -->|calls| T17
  S18["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ConditionVariable.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ConditionVariable.h:1"]
  T18["function:NotifyAll<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ConditionVariable.h:82"]
  S18 -->|calls| T18
  S19["function:GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CountdownTimer.h:50"]
  T19["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S19 -->|calls| T19
  S20["function:TimeoutExpired<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CountdownTimer.h:58"]
  T20["function:Baselib_CountdownTimer_TimeoutExpired<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:58"]
  S20 -->|calls| T20
  S21["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CountdownTimer.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CountdownTimer.h:1"]
  T21["function:CountdownTimer<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CountdownTimer.h:65"]
  S21 -->|calls| T21
  S22["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/EventSemaphore.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/EventSemaphore.h:1"]
  T22["function:Baselib_EventSemaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:68"]
  S22 -->|calls| T22
  S23["function:Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/EventSemaphore.h:61"]
  T23["function:Baselib_EventSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:87"]
  S23 -->|calls| T23
  S24["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/EventSemaphore.h:79"]
  T24["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:105"]
  S24 -->|calls| T24
  S25["function:Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/EventSemaphore.h:91"]
  T25["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
