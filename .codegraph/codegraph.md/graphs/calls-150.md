# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T1["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S1 -->|calls| T1
  S2["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T2["function:GC_page_was_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2893"]
  S2 -->|calls| T2
  S3["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T3["function:GC_page_was_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2893"]
  S3 -->|calls| T3
  S4["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T4["function:GC_page_was_ever_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3067"]
  S4 -->|calls| T4
  S5["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T5["function:GC_was_faulted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:50"]
  S5 -->|calls| T5
  S6["function:GC_check_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:124"]
  T6["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S6 -->|calls| T6
  S7["function:GC_check_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:124"]
  T7["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S7 -->|calls| T7
  S8["function:GC_check_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:141"]
  T8["function:GC_check_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:124"]
  S8 -->|calls| T8
  S9["function:GC_check_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:141"]
  T9["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  S9 -->|calls| T9
  S10["function:GC_check_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:141"]
  T10["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S10 -->|calls| T10
  S11["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  T11["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  S11 -->|calls| T11
  S12["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  T12["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  S12 -->|calls| T12
  S13["function:CORD_dump<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:152"]
  T13["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  S13 -->|calls| T13
  S14["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  T14["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S14 -->|calls| T14
  S15["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  T15["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S15 -->|calls| T15
  S16["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  T16["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S16 -->|calls| T16
  S17["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T17["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  S17 -->|calls| T17
  S18["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T18["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S18 -->|calls| T18
  S19["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T19["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S19 -->|calls| T19
  S20["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  T20["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S20 -->|calls| T20
  S21["function:CORD_from_fn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:320"]
  T21["function:CORD_from_fn_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:285"]
  S21 -->|calls| T21
  S22["function:CORD_substr_closure<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:358"]
  T22["function:CORD_from_fn_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:285"]
  S22 -->|calls| T22
  S23["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T23["function:CORD_substr_closure<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:358"]
  S23 -->|calls| T23
  S24["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T24["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  S24 -->|calls| T24
  S25["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  T25["function:CORD_substr_checked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:378"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
