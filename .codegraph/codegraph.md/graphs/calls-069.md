# `calls 符号关系 - 069`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:operator=<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:61"]
  T1["function:Baselib_TLS_Set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Android/Include/C/Baselib_ThreadLocalStorage.inl.h:10"]
  S1 -->|calls| T1
  S2["function:operator T() const<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:76"]
  T2["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Android/Include/C/Baselib_ThreadLocalStorage.inl.h:16"]
  S2 -->|calls| T2
  S3["function:operator-><br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/ThreadLocalStorage.h:81"]
  T3["function:Baselib_TLS_Get<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Platforms/Android/Include/C/Baselib_ThreadLocalStorage.inl.h:16"]
  S3 -->|calls| T3
  S4["method:high_precision_clock::now<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:23"]
  T4["method:high_precision_clock::time_point_from_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:44"]
  S4 -->|calls| T4
  S5["method:high_precision_clock::now<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:23"]
  T5["method:high_precision_clock::now_in_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:28"]
  S5 -->|calls| T5
  S6["method:high_precision_clock::duration_from_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:33"]
  T6["type_alias:high_precision_clock::duration<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:16"]
  S6 -->|calls| T6
  S7["method:high_precision_clock::time_point_from_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:44"]
  T7["type_alias:high_precision_clock::time_point<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:17"]
  S7 -->|calls| T7
  S8["method:high_precision_clock::time_point_from_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:44"]
  T8["method:high_precision_clock::duration_from_ticks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Time.h:33"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:1"]
  T9["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:264"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:1"]
  T10["method:Allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/Allocator.h:23"]
  S10 -->|calls| T10
  S11["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:1"]
  T11["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:264"]
  S11 -->|calls| T11
  S12["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:1"]
  T12["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:99"]
  S12 -->|calls| T12
  S13["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:1"]
  T13["function:OffsetPtr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:93"]
  S13 -->|calls| T13
  S14["function:suffix<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:84"]
  T14["function:OffsetPtr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:93"]
  S14 -->|calls| T14
  S15["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:1"]
  T15["method:chunked_allocator::AlignSize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:620"]
  S15 -->|calls| T15
  S16["function:OffsetPtrChecked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:92"]
  T16["function:OffsetPtr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:93"]
  S16 -->|calls| T16
  S17["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:99"]
  T17["function:OffsetPtrChecked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:92"]
  S17 -->|calls| T17
  S18["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:99"]
  T18["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:352"]
  S18 -->|calls| T18
  S19["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:99"]
  T19["function:OffsetPtr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:93"]
  S19 -->|calls| T19
  S20["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:105"]
  T20["function:suffix<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:84"]
  S20 -->|calls| T20
  S21["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:105"]
  T21["method:chunked_allocator::reallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:352"]
  S21 -->|calls| T21
  S22["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:105"]
  T22["function:OffsetPtr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:93"]
  S22 -->|calls| T22
  S23["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:105"]
  T23["function:OffsetPtr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:93"]
  S23 -->|calls| T23
  S24["function:ReallocateImpl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:105"]
  T24["function:suffix<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/affix_allocator.h:84"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/fallback_allocator.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/fallback_allocator.h:1"]
  T25["method:chunked_allocator::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Internal/chunked_allocator.inl.h:264"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
