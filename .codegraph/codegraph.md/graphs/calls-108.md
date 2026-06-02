# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T1["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S1 -->|calls| T1
  S2["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T2["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S2 -->|calls| T2
  S3["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T3["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S3 -->|calls| T3
  S4["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T4["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S4 -->|calls| T4
  S5["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T5["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S5 -->|calls| T5
  S6["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T6["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S6 -->|calls| T6
  S7["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T7["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S7 -->|calls| T7
  S8["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T8["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S8 -->|calls| T8
  S9["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T9["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S9 -->|calls| T9
  S10["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T10["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S10 -->|calls| T10
  S11["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T11["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S11 -->|calls| T11
  S12["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T12["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S12 -->|calls| T12
  S13["function:Profiler_FramePresent<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:142"]
  T13["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S13 -->|calls| T13
  S14["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T14["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S14 -->|calls| T14
  S15["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T15["function:ProfilerBlock_Update<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:39"]
  S15 -->|calls| T15
  S16["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T16["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S16 -->|calls| T16
  S17["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T17["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S17 -->|calls| T17
  S18["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T18["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S18 -->|calls| T18
  S19["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T19["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S19 -->|calls| T19
  S20["function:gc_event<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:302"]
  T20["function:MachToMillisecondsDelta<br/>TODO/Unity/xcode_effectTest/Classes/Unity/InternalProfiler.cpp:25"]
  S20 -->|calls| T20
  S21["function:CreateSystemRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:63"]
  T21["function:DestroySystemRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:314"]
  S21 -->|calls| T21
  S22["function:CreateSystemRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:63"]
  T22["function:GetColorFormatForSurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:20"]
  S22 -->|calls| T22
  S23["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T23["function:DestroyRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:219"]
  S23 -->|calls| T23
  S24["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T24["function:GetColorFormatForSurface<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:20"]
  S24 -->|calls| T24
  S25["function:CreateRenderingSurfaceMTL<br/>TODO/Unity/xcode_effectTest/Classes/Unity/MetalHelper.mm:155"]
  T25["function:CreateCVTextureCache<br/>TODO/Unity/xcode_effectTest/Classes/Unity/CVTextureCache.mm:7"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
