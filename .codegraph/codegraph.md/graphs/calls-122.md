# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Baselib_CountdownTimer_TimeoutExpired<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:58"]
  T1["function:Baselib_CountdownTimer_GetTimeLeftInTicks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:39"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_HighCapacitySemaphore.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_HighCapacitySemaphore.h:1"]
  T2["function:Baselib_HighCapacitySemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:139"]
  S2 -->|calls| T2
  S3["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_Semaphore.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_Semaphore.h:1"]
  T3["function:Baselib_Semaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:142"]
  S3 -->|calls| T3
  S4["function:Baselib_CappedSemaphore_Create<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:37"]
  T4["function:Baselib_CappedSemaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:30"]
  S4 -->|calls| T4
  S5["function:Baselib_CappedSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:66"]
  T5["function:Detail_Baselib_CappedSemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:44"]
  S5 -->|calls| T5
  S6["function:Baselib_CappedSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:78"]
  T6["function:Detail_Baselib_CappedSemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:44"]
  S6 -->|calls| T6
  S7["function:Baselib_CappedSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:78"]
  T7["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S7 -->|calls| T7
  S8["function:Baselib_CappedSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:78"]
  T8["function:Detail_Baselib_CappedSemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:44"]
  S8 -->|calls| T8
  S9["function:Baselib_CappedSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:78"]
  T9["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S9 -->|calls| T9
  S10["function:Baselib_CappedSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:78"]
  T10["function:Detail_Baselib_CappedSemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:44"]
  S10 -->|calls| T10
  S11["function:Baselib_CappedSemaphore_FreeInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:162"]
  T11["function:Baselib_CappedSemaphore_Free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_CappedSemaphore_FutexBased.inl.h:154"]
  S11 -->|calls| T11
  S12["function:Detail_Baselib_EventSemaphore_TransitionFrom_ResetNoWaitingThreadsState_To_ResetState<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:55"]
  T12["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S12 -->|calls| T12
  S13["function:Detail_Baselib_EventSemaphore_TransitionFrom_ResetNoWaitingThreadsState_To_ResetState<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:55"]
  T13["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S13 -->|calls| T13
  S14["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:73"]
  T14["function:Baselib_EventSemaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:68"]
  S14 -->|calls| T14
  S15["function:Baselib_EventSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:87"]
  T15["function:Detail_Baselib_EventSemaphore_TransitionFrom_ResetNoWaitingThreadsState_To_ResetState<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:55"]
  S15 -->|calls| T15
  S16["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:105"]
  T16["function:Detail_Baselib_EventSemaphore_TransitionFrom_ResetNoWaitingThreadsState_To_ResetState<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:55"]
  S16 -->|calls| T16
  S17["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:105"]
  T17["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S17 -->|calls| T17
  S18["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:105"]
  T18["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S18 -->|calls| T18
  S19["function:Baselib_EventSemaphore_Reset<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:130"]
  T19["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S19 -->|calls| T19
  S20["function:Baselib_EventSemaphore_Reset<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:130"]
  T20["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S20 -->|calls| T20
  S21["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T21["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S21 -->|calls| T21
  S22["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T22["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S22 -->|calls| T22
  S23["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T23["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S23 -->|calls| T23
  S24["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T24["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S24 -->|calls| T24
  S25["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T25["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
