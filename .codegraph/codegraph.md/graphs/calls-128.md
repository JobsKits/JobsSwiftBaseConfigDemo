# `calls 符号关系 - 128`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:HighestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:28"]
  T1["function:HighestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:41"]
  S1 -->|calls| T1
  S2["function:LowestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:47"]
  T2["function:LowestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:38"]
  S2 -->|calls| T2
  S3["function:LowestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:52"]
  T3["function:LowestBitNonZero<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:38"]
  S3 -->|calls| T3
  S4["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:59"]
  T4["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:59"]
  S4 -->|calls| T4
  S5["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:60"]
  T5["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:60"]
  S5 -->|calls| T5
  S6["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:1"]
  T6["function:HighestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:28"]
  S6 -->|calls| T6
  S7["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:1"]
  T7["function:HighestBit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/ClangOrGcc/AlgorithmClangOrGcc.inl.h:28"]
  S7 -->|calls| T7
  S8["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  T8["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  S8 -->|calls| T8
  S9["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  T9["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:101"]
  S9 -->|calls| T9
  S10["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:105"]
  T10["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:105"]
  S10 -->|calls| T10
  S11["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:126"]
  T11["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:126"]
  S11 -->|calls| T11
  S12["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:127"]
  T12["function:BitsInMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/Compiler/Msvc/AlgorithmMsvc.inl.h:127"]
  S12 -->|calls| T12
  S13["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T13["function:ConditionVariable::Wait<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ConditionVariable.cpp:30"]
  S13 -->|calls| T13
  S14["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T14["method:SocketHandleWrapper::Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Socket.h:416"]
  S14 -->|calls| T14
  S15["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T15["function:mono_string_from_bstr_checked::if<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/cominterop.c:3243"]
  S15 -->|calls| T15
  S16["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_FutexBased.inl.h:1"]
  T16["method:SocketHandleWrapper::Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Socket.h:416"]
  S16 -->|calls| T16
  S17["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T17["function:ConditionVariable::Wait<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ConditionVariable.cpp:30"]
  S17 -->|calls| T17
  S18["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T18["function:ConditionVariable::TimedWait<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ConditionVariable.cpp:35"]
  S18 -->|calls| T18
  S19["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T19["method:SocketHandleWrapper::Acquire<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/Socket.h:416"]
  S19 -->|calls| T19
  S20["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/ConditionVariable_SemaphoreBased.inl.h:1"]
  T20["function:mono_string_from_bstr_checked::if<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/cominterop.c:3243"]
  S20 -->|calls| T20
  S21["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T21["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S21 -->|calls| T21
  S22["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T22["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S22 -->|calls| T22
  S23["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T23["method:tlsf_allocator::CompileTime::Log2Base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/tlsf_allocator.inl.h:254"]
  S23 -->|calls| T23
  S24["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T24["function:BitMask<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/os/ClassLibraryPAL/brotli/dec/bit_reader.h:26"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:1"]
  T25["method:<anonymous>::block_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:145"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
