# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Reset<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/EventSemaphore.h:102"]
  T1["function:Baselib_EventSemaphore_Reset<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:130"]
  S1 -->|calls| T1
  S2["function:ResetAndRelease<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/EventSemaphore.h:113"]
  T2["function:Baselib_EventSemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_EventSemaphore_FutexBased.inl.h:171"]
  S2 -->|calls| T2
  S3["function:Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/HighCapacitySemaphore.h:46"]
  T3["function:Baselib_HighCapacitySemaphore_Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:59"]
  S3 -->|calls| T3
  S4["function:TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/HighCapacitySemaphore.h:56"]
  T4["function:Baselib_HighCapacitySemaphore_TryAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:48"]
  S4 -->|calls| T4
  S5["function:TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/HighCapacitySemaphore.h:75"]
  T5["function:Baselib_HighCapacitySemaphore_TryTimedAcquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:71"]
  S5 -->|calls| T5
  S6["function:Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/HighCapacitySemaphore.h:86"]
  T6["function:Baselib_HighCapacitySemaphore_Release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:109"]
  S6 -->|calls| T6
  S7["function:ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/HighCapacitySemaphore.h:96"]
  T7["function:Baselib_HighCapacitySemaphore_ResetAndReleaseWaitingThreads<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/C/Internal/Baselib_HighCapacitySemaphore_FutexBased.inl.h:139"]
  S7 -->|calls| T7
  S8["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:1"]
  T8["function:HighestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:41"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:1"]
  T9["function:HighestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:41"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:1"]
  T10["function:HighestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:41"]
  S10 -->|calls| T10
  S11["function:HighestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:28"]
  T11["function:HighestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:41"]
  S11 -->|calls| T11
  S12["function:LowestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:47"]
  T12["function:LowestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:38"]
  S12 -->|calls| T12
  S13["function:LowestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:52"]
  T13["function:LowestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:38"]
  S13 -->|calls| T13
  S14["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:59"]
  T14["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:59"]
  S14 -->|calls| T14
  S15["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:60"]
  T15["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:60"]
  S15 -->|calls| T15
  S16["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:1"]
  T16["function:HighestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:28"]
  S16 -->|calls| T16
  S17["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:1"]
  T17["function:HighestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:28"]
  S17 -->|calls| T17
  S18["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  T18["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  S18 -->|calls| T18
  S19["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  T19["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  S19 -->|calls| T19
  S20["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:105"]
  T20["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:105"]
  S20 -->|calls| T20
  S21["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:126"]
  T21["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:126"]
  S21 -->|calls| T21
  S22["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:127"]
  T22["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:127"]
  S22 -->|calls| T22
  S23["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T23["function:ConditionVariable::Wait<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ConditionVariable.cpp:30"]
  S23 -->|calls| T23
  S24["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T24["method:SocketHandleWrapper::Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Socket.h:416"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T25["function:mono_string_from_bstr_checked::if<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/cominterop.c:3243"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
