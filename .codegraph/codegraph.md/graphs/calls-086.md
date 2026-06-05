# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T1["function:CORD_set_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:912"]
  S1 -->|calls| T1
  S2["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T2["function:CORD_pos_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:907"]
  S2 -->|calls| T2
  S3["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T3["function:CORD_next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:879"]
  S3 -->|calls| T3
  S4["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T4["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  S4 -->|calls| T4
  S5["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T5["function:CORD_next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:879"]
  S5 -->|calls| T5
  S6["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T6["function:CORD_pos_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:907"]
  S6 -->|calls| T6
  S7["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T7["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  S7 -->|calls| T7
  S8["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T8["function:extract_conv_spec<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:70"]
  S8 -->|calls| T8
  S9["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T9["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  S9 -->|calls| T9
  S10["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T10["function:ec_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:53"]
  S10 -->|calls| T10
  S11["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T11["function:ec_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:53"]
  S11 -->|calls| T11
  S12["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T12["function:ec_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:53"]
  S12 -->|calls| T12
  S13["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T13["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S13 -->|calls| T13
  S14["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T14["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S14 -->|calls| T14
  S15["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T15["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S15 -->|calls| T15
  S16["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T16["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S16 -->|calls| T16
  S17["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T17["function:CORD_ec_append_cord<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:446"]
  S17 -->|calls| T17
  S18["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T18["function:CORD_ec_flush_buf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:432"]
  S18 -->|calls| T18
  S19["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T19["function:ec_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:53"]
  S19 -->|calls| T19
  S20["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  T20["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S20 -->|calls| T20
  S21["function:CORD_sprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:383"]
  T21["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  S21 -->|calls| T21
  S22["function:CORD_fprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:394"]
  T22["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  S22 -->|calls| T22
  S23["function:CORD_fprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:394"]
  T23["function:CORD_put<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:301"]
  S23 -->|calls| T23
  S24["function:CORD_vfprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:407"]
  T24["function:CORD_vsprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:191"]
  S24 -->|calls| T24
  S25["function:CORD_vfprintf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:407"]
  T25["function:CORD_put<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:301"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
