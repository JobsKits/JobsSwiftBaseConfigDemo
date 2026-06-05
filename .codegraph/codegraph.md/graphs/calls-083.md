# `calls 符号关系 - 083`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_promote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:137"]
  T1["function:GC_clear_bl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:123"]
  S1 -->|calls| T1
  S2["function:GC_promote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:137"]
  T2["function:GC_clear_bl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:123"]
  S2 -->|calls| T2
  S3["function:GC_promote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:137"]
  T3["function:total_stack_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:290"]
  S3 -->|calls| T3
  S4["function:GC_unpromote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:170"]
  T4["function:GC_copy_bl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:128"]
  S4 -->|calls| T4
  S5["function:GC_unpromote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:170"]
  T5["function:GC_copy_bl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:128"]
  S5 -->|calls| T5
  S6["function:GC_add_to_black_list_normal<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:194"]
  T6["function:GC_print_blacklisted_ptr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:71"]
  S6 -->|calls| T6
  S7["function:GC_add_to_black_list_stack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:216"]
  T7["function:GC_print_blacklisted_ptr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:71"]
  S7 -->|calls| T7
  S8["function:total_stack_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:290"]
  T8["function:GC_number_stack_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:275"]
  S8 -->|calls| T8
  S9["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T9["function:GC_checksum<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:61"]
  S9 -->|calls| T9
  S10["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T10["function:GC_page_was_ever_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3067"]
  S10 -->|calls| T10
  S11["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T11["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S11 -->|calls| T11
  S12["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T12["function:GC_page_was_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2893"]
  S12 -->|calls| T12
  S13["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T13["function:GC_page_was_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2893"]
  S13 -->|calls| T13
  S14["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T14["function:GC_page_was_ever_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3067"]
  S14 -->|calls| T14
  S15["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  T15["function:GC_was_faulted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:50"]
  S15 -->|calls| T15
  S16["function:GC_check_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:124"]
  T16["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S16 -->|calls| T16
  S17["function:GC_check_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:124"]
  T17["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S17 -->|calls| T17
  S18["function:GC_check_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:141"]
  T18["function:GC_check_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:124"]
  S18 -->|calls| T18
  S19["function:GC_check_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:141"]
  T19["function:GC_update_check_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:78"]
  S19 -->|calls| T19
  S20["function:GC_check_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/checksums.c:141"]
  T20["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S20 -->|calls| T20
  S21["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  T21["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  S21 -->|calls| T21
  S22["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  T22["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  S22 -->|calls| T22
  S23["function:CORD_dump<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:152"]
  T23["function:CORD_dump_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:115"]
  S23 -->|calls| T23
  S24["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  T24["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S24 -->|calls| T24
  S25["function:CORD_cat_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:158"]
  T25["enum_member:inflate_mode::LEN<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/zlib/inflate.h:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
