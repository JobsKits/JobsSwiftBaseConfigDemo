# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:105"]
  T1["function:Detail_Baselib_EventSemaphore_TransitionFrom_ResetNoWaitingThreadsState_To_ResetState<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:55"]
  S1 -->|calls| T1
  S2["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:105"]
  T2["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S2 -->|calls| T2
  S3["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:105"]
  T3["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S3 -->|calls| T3
  S4["function:Baselib_EventSemaphore_Reset<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:130"]
  T4["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S4 -->|calls| T4
  S5["function:Baselib_EventSemaphore_Reset<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:130"]
  T5["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S5 -->|calls| T5
  S6["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T6["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S6 -->|calls| T6
  S7["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T7["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S7 -->|calls| T7
  S8["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T8["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S8 -->|calls| T8
  S9["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:143"]
  T9["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S9 -->|calls| T9
  S10["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T10["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S10 -->|calls| T10
  S11["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T11["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S11 -->|calls| T11
  S12["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T12["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S12 -->|calls| T12
  S13["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  T13["function:Detail_Baselib_EventSemaphore_Generation<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:47"]
  S13 -->|calls| T13
  S14["function:Baselib_EventSemaphore_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:129"]
  T14["function:Detail_Baselib_EventSemaphore_IsSet<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:92"]
  S14 -->|calls| T14
  S15["function:Baselib_EventSemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:135"]
  T15["function:Detail_Baselib_EventSemaphore_IsSet<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:92"]
  S15 -->|calls| T15
  S16["function:Baselib_EventSemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:143"]
  T16["function:Detail_Baselib_EventSemaphore_IsSet<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:92"]
  S16 -->|calls| T16
  S17["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:165"]
  T17["function:Detail_Baselib_EventSemaphore_GetWaitingForSetCount<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:102"]
  S17 -->|calls| T17
  S18["function:Baselib_EventSemaphore_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:165"]
  T18["function:Detail_Baselib_EventSemaphore_IsSetInProgress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:97"]
  S18 -->|calls| T18
  S19["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:187"]
  T19["function:Detail_Baselib_EventSemaphore_GetWaitingForSetCount<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:102"]
  S19 -->|calls| T19
  S20["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:187"]
  T20["function:Detail_Baselib_EventSemaphore_IsSetInProgress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_SemaphoreBased.inl.h:97"]
  S20 -->|calls| T20
  S21["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:30"]
  T21["function:Baselib_HighCapacitySemaphore_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:24"]
  S21 -->|calls| T21
  S22["function:Baselib_HighCapacitySemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:59"]
  T22["function:Detail_Baselib_HighCapacitySemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:37"]
  S22 -->|calls| T22
  S23["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T23["function:Baselib_CountdownTimer_StartMs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:23"]
  S23 -->|calls| T23
  S24["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T24["function:Detail_Baselib_HighCapacitySemaphore_ConsumeWakeup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:37"]
  S24 -->|calls| T24
  S25["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  T25["function:Baselib_CountdownTimer_GetTimeLeftInMilliseconds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Baselib_CountdownTimer.h:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
