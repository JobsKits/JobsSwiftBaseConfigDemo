# `calls 符号关系 - 068`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:TryTimedAcquireScoped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:149"]
  T1["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:74"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Lock.h:1"]
  T2["method:WaitObject::ReleaseOnDestroy::ReleaseOnDestroy<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Generic/WaitObject.h:33"]
  S2 -->|calls| T2
  S3["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:1"]
  T3["function:Baselib_ReentrantLock_CreateInplace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:24"]
  S3 -->|calls| T3
  S4["function:TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:67"]
  T4["function:Baselib_ReentrantLock_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:32"]
  S4 -->|calls| T4
  S5["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:87"]
  T5["function:Baselib_ReentrantLock_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:63"]
  S5 -->|calls| T5
  S6["function:Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:100"]
  T6["function:Baselib_ReentrantLock_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_ReentrantLock.inl.h:79"]
  S6 -->|calls| T6
  S7["function:AcquireScoped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:115"]
  T7["function:Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/CappedSemaphore.h:54"]
  S7 -->|calls| T7
  S8["function:TryAcquireScoped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:135"]
  T8["function:TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:67"]
  S8 -->|calls| T8
  S9["function:TryTimedAcquireScoped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:163"]
  T9["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:87"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ReentrantLock.h:1"]
  T10["method:WaitObject::ReleaseOnDestroy::ReleaseOnDestroy<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Generic/WaitObject.h:33"]
  S10 -->|calls| T10
  S11["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h:1"]
  T11["function:Semaphore<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/icalls/System/System.Threading/Semaphore.h:15"]
  S11 -->|calls| T11
  S12["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h:1"]
  T12["function:Semaphore<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/icalls/System/System.Threading/Semaphore.h:15"]
  S12 -->|calls| T12
  S13["function:Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h:57"]
  T13["function:Baselib_Semaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:63"]
  S13 -->|calls| T13
  S14["function:TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h:67"]
  T14["function:Baselib_Semaphore_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:52"]
  S14 -->|calls| T14
  S15["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h:86"]
  T15["function:Baselib_Semaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:75"]
  S15 -->|calls| T15
  S16["function:Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h:97"]
  T16["function:Baselib_Semaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:113"]
  S16 -->|calls| T16
  S17["function:ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Semaphore.h:107"]
  T17["function:Baselib_Semaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_Semaphore_FutexBased.inl.h:142"]
  S17 -->|calls| T17
  S18["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h:1"]
  T18["method:high_precision_clock::now_in_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:28"]
  S18 -->|calls| T18
  S19["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h:1"]
  T19["method:high_precision_clock::now_in_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:28"]
  S19 -->|calls| T19
  S20["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h:1"]
  T20["function:Stopwatch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/icalls/System/System.Diagnostics/Stopwatch.h:16"]
  S20 -->|calls| T20
  S21["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Stopwatch.h:1"]
  T21["method:high_precision_clock::now_in_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:28"]
  S21 -->|calls| T21
  S22["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Thread.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Thread.h:1"]
  T22["function:Thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Thread.h:83"]
  S22 -->|calls| T22
  S23["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:1"]
  T23["function:ThreadLocalStorage<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:38"]
  S23 -->|calls| T23
  S24["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:1"]
  T24["function:ThreadLocalStorage<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:38"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:1"]
  T25["function:IsValid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
