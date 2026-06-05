# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  T1["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S1 -->|calls| T1
  S2["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T2["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  S2 -->|calls| T2
  S3["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T3["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S3 -->|calls| T3
  S4["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T4["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S4 -->|calls| T4
  S5["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T5["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S5 -->|calls| T5
  S6["function:CORD_from_fn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:320"]
  T6["function:CORD_from_fn_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:285"]
  S6 -->|calls| T6
  S7["function:CORD_substr_closure<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:358"]
  T7["function:CORD_from_fn_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:285"]
  S7 -->|calls| T7
  S8["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T8["function:CORD_substr_closure<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:358"]
  S8 -->|calls| T8
  S9["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T9["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  S9 -->|calls| T9
  S10["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T10["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  S10 -->|calls| T10
  S11["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T11["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  S11 -->|calls| T11
  S12["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T12["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  S12 -->|calls| T12
  S13["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T13["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S13 -->|calls| T13
  S14["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T14["function:CORD_substr_closure<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:358"]
  S14 -->|calls| T14
  S15["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T15["function:CORD_substr_closure<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:358"]
  S15 -->|calls| T15
  S16["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T16["function:CORD_substr_closure<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:358"]
  S16 -->|calls| T16
  S17["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  T17["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S17 -->|calls| T17
  S18["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  T18["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  S18 -->|calls| T18
  S19["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  T19["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  S19 -->|calls| T19
  S20["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  T20["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  S20 -->|calls| T20
  S21["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  T21["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  S21 -->|calls| T21
  S22["function:CORD_iter<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:517"]
  T22["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  S22 -->|calls| T22
  S23["function:CORD_riter4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:522"]
  T23["function:CORD_riter4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:522"]
  S23 -->|calls| T23
  S24["function:CORD_riter4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:522"]
  T24["function:CORD_riter4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:522"]
  S24 -->|calls| T24
  S25["function:CORD_riter4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:522"]
  T25["function:CORD_riter4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:522"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
