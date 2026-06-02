# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T1["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S1 -->|calls| T1
  S2["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T2["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S2 -->|calls| T2
  S3["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T3["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S3 -->|calls| T3
  S4["function:Baselib_EventSemaphore_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:129"]
  T4["function:Detail_Baselib_EventSemaphore_IsSet<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:92"]
  S4 -->|calls| T4
  S5["function:Baselib_EventSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:135"]
  T5["function:Detail_Baselib_EventSemaphore_IsSet<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:92"]
  S5 -->|calls| T5
  S6["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:143"]
  T6["function:Detail_Baselib_EventSemaphore_IsSet<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:92"]
  S6 -->|calls| T6
  S7["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:165"]
  T7["function:Detail_Baselib_EventSemaphore_GetWaitingForSetCount<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:102"]
  S7 -->|calls| T7
  S8["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:165"]
  T8["function:Detail_Baselib_EventSemaphore_IsSetInProgress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:97"]
  S8 -->|calls| T8
  S9["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:187"]
  T9["function:Detail_Baselib_EventSemaphore_GetWaitingForSetCount<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:102"]
  S9 -->|calls| T9
  S10["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:187"]
  T10["function:Detail_Baselib_EventSemaphore_IsSetInProgress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:97"]
  S10 -->|calls| T10
  S11["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:30"]
  T11["function:Baselib_HighCapacitySemaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:24"]
  S11 -->|calls| T11
  S12["function:Baselib_HighCapacitySemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:59"]
  T12["function:Detail_Baselib_HighCapacitySemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:37"]
  S12 -->|calls| T12
  S13["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T13["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S13 -->|calls| T13
  S14["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T14["function:Detail_Baselib_HighCapacitySemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:37"]
  S14 -->|calls| T14
  S15["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T15["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S15 -->|calls| T15
  S16["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T16["function:Detail_Baselib_HighCapacitySemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:37"]
  S16 -->|calls| T16
  S17["function:Baselib_HighCapacitySemaphore_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:159"]
  T17["function:Baselib_HighCapacitySemaphore_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:151"]
  S17 -->|calls| T17
  S18["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:24"]
  T18["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:19"]
  S18 -->|calls| T18
  S19["function:Baselib_Lock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:62"]
  T19["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S19 -->|calls| T19
  S20["function:Baselib_Lock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_FutexBased.inl.h:62"]
  T20["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S20 -->|calls| T20
  S21["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:11"]
  T21["function:Baselib_CappedSemaphore_Create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:37"]
  S21 -->|calls| T21
  S22["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:11"]
  T22["function:Baselib_CappedSemaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:119"]
  S22 -->|calls| T22
  S23["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:19"]
  T23["function:Baselib_CappedSemaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:30"]
  S23 -->|calls| T23
  S24["function:Baselib_Lock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:19"]
  T24["function:Baselib_CappedSemaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:119"]
  S24 -->|calls| T24
  S25["function:Baselib_Lock_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Lock_SemaphoreBased.inl.h:26"]
  T25["function:Baselib_CappedSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:66"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
