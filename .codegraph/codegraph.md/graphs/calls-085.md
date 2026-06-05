# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CORD_riter<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:563"]
  T1["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S1 -->|calls| T1
  S2["function:CORD_riter<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:563"]
  T2["function:CORD_riter4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:522"]
  S2 -->|calls| T2
  S3["function:CORD_add_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:638"]
  T3["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S3 -->|calls| T3
  S4["function:CORD_add_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:638"]
  T4["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S4 -->|calls| T4
  S5["function:CORD_add_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:638"]
  T5["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S5 -->|calls| T5
  S6["function:CORD_concat_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:674"]
  T6["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S6 -->|calls| T6
  S7["function:CORD_balance_insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:693"]
  T7["function:CORD_add_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:638"]
  S7 -->|calls| T7
  S8["function:CORD_balance_insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:693"]
  T8["function:CORD_balance_insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:693"]
  S8 -->|calls| T8
  S9["function:CORD_balance_insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:693"]
  T9["function:CORD_balance_insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:693"]
  S9 -->|calls| T9
  S10["function:CORD_balance_insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:693"]
  T10["function:CORD_add_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:638"]
  S10 -->|calls| T10
  S11["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  T11["function:CORD_init_min_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:602"]
  S11 -->|calls| T11
  S12["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  T12["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S12 -->|calls| T12
  S13["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  T13["function:CORD_init_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:622"]
  S13 -->|calls| T13
  S14["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  T14["function:CORD_balance_insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:693"]
  S14 -->|calls| T14
  S15["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  T15["function:CORD_concat_forest<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:674"]
  S15 -->|calls| T15
  S16["function:CORD__next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:783"]
  T16["function:CORD__extend_path<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:735"]
  S16 -->|calls| T16
  S17["function:CORD__prev<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:835"]
  T17["function:CORD__extend_path<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:735"]
  S17 -->|calls| T17
  S18["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  T18["function:CORD__pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:772"]
  S18 -->|calls| T18
  S19["function:CORD_next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:879"]
  T19["function:CORD__next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:783"]
  S19 -->|calls| T19
  S20["function:CORD_prev<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:888"]
  T20["function:CORD__prev<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:835"]
  S20 -->|calls| T20
  S21["function:CORD_set_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:912"]
  T21["function:CORD__extend_path<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:735"]
  S21 -->|calls| T21
  S22["function:ec_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:53"]
  T22["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S22 -->|calls| T22
  S23["function:extract_conv_spec<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:70"]
  T23["function:CORD_pos_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:907"]
  S23 -->|calls| T23
  S24["function:extract_conv_spec<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:70"]
  T24["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  S24 -->|calls| T24
  S25["function:extract_conv_spec<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordprnt.c:70"]
  T25["function:CORD_next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:879"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
