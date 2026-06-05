# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:operator!=<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:74"]
  T1["method:UnityInterfaceGUID::Equals<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:66"]
  S1 -->|calls| T1
  S2["function:operator<<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:75"]
  T2["method:UnityInterfaceGUID::LessThan<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:67"]
  S2 -->|calls| T2
  S3["function:operator><br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:76"]
  T3["method:UnityInterfaceGUID::LessThan<br/>TODO/Unity/xcode_effectTest/Classes/Unity/IUnityInterface.h:67"]
  S3 -->|calls| T3
  S4["function:Profiler_InitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:111"]
  T4["function:Profiler_SetupScriptingProfile<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:368"]
  S4 -->|calls| T4
  S5["function:Profiler_InitProfiler<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:111"]
  T5["function:ProfilerInit<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:20"]
  S5 -->|calls| T5
  S6["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T6["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S6 -->|calls| T6
  S7["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T7["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S7 -->|calls| T7
  S8["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T8["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S8 -->|calls| T8
  S9["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T9["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S9 -->|calls| T9
  S10["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T10["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S10 -->|calls| T10
  S11["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T11["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S11 -->|calls| T11
  S12["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T12["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S12 -->|calls| T12
  S13["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T13["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S13 -->|calls| T13
  S14["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T14["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S14 -->|calls| T14
  S15["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T15["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S15 -->|calls| T15
  S16["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T16["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S16 -->|calls| T16
  S17["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T17["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S17 -->|calls| T17
  S18["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T18["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S18 -->|calls| T18
  S19["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T19["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S19 -->|calls| T19
  S20["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T20["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S20 -->|calls| T20
  S21["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T21["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S21 -->|calls| T21
  S22["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T22["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S22 -->|calls| T22
  S23["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T23["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S23 -->|calls| T23
  S24["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T24["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S24 -->|calls| T24
  S25["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T25["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
