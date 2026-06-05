# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T1["function:Detail_Baselib_HighCapacitySemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:37"]
  S1 -->|calls| T1
  S2["function:Baselib_HighCapacitySemaphore_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:159"]
  T2["function:Baselib_HighCapacitySemaphore_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:151"]
  S2 -->|calls| T2
  S3["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:24"]
  T3["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:19"]
  S3 -->|calls| T3
  S4["function:Baselib_Lock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:62"]
  T4["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S4 -->|calls| T4
  S5["function:Baselib_Lock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:62"]
  T5["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S5 -->|calls| T5
  S6["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:11"]
  T6["function:Baselib_CappedSemaphore_Create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:37"]
  S6 -->|calls| T6
  S7["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:11"]
  T7["function:Baselib_CappedSemaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:119"]
  S7 -->|calls| T7
  S8["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:19"]
  T8["function:Baselib_CappedSemaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:30"]
  S8 -->|calls| T8
  S9["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:19"]
  T9["function:Baselib_CappedSemaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:119"]
  S9 -->|calls| T9
  S10["function:Baselib_Lock_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:26"]
  T10["function:Baselib_CappedSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:66"]
  S10 -->|calls| T10
  S11["function:Baselib_Lock_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:32"]
  T11["function:Baselib_CappedSemaphore_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:55"]
  S11 -->|calls| T11
  S12["function:Baselib_Lock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:38"]
  T12["function:Baselib_CappedSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:78"]
  S12 -->|calls| T12
  S13["function:Baselib_Lock_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:43"]
  T13["function:Baselib_CappedSemaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:119"]
  S13 -->|calls| T13
  S14["function:Baselib_Lock_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:48"]
  T14["function:Baselib_CappedSemaphore_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:154"]
  S14 -->|calls| T14
  S15["function:Baselib_Lock_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:55"]
  T15["function:Baselib_CappedSemaphore_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:162"]
  S15 -->|calls| T15
  S16["function:Baselib_ReentrantLock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:24"]
  T16["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:19"]
  S16 -->|calls| T16
  S17["function:Baselib_ReentrantLock_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:32"]
  T17["function:Baselib_Lock_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:32"]
  S17 -->|calls| T17
  S18["function:Baselib_ReentrantLock_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:48"]
  T18["function:Baselib_Lock_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:44"]
  S18 -->|calls| T18
  S19["function:Baselib_ReentrantLock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:63"]
  T19["function:Baselib_Lock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:62"]
  S19 -->|calls| T19
  S20["function:Baselib_ReentrantLock_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:79"]
  T20["function:Baselib_Lock_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:89"]
  S20 -->|calls| T20
  S21["function:Baselib_ReentrantLock_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:95"]
  T21["function:Baselib_Lock_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:96"]
  S21 -->|calls| T21
  S22["function:Baselib_ReentrantLock_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:102"]
  T22["function:Baselib_Lock_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:100"]
  S22 -->|calls| T22
  S23["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:34"]
  T23["function:Baselib_Semaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:28"]
  S23 -->|calls| T23
  S24["function:Baselib_Semaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:63"]
  T24["function:Detail_Baselib_Semaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:41"]
  S24 -->|calls| T24
  S25["function:Baselib_Semaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:75"]
  T25["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
