# `calls 符号关系 - 076`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_merge_unmapped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:463"]
  T1["function:GC_remove_from_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:327"]
  S1 -->|calls| T1
  S2["function:GC_merge_unmapped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:463"]
  T2["function:GC_remove_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:307"]
  S2 -->|calls| T2
  S3["function:GC_merge_unmapped<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:463"]
  T3["function:GC_add_to_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:362"]
  S3 -->|calls| T3
  S4["function:GC_get_first_part<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:536"]
  T4["function:GC_remove_from_fl_at<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:303"]
  S4 -->|calls| T4
  S5["function:GC_get_first_part<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:536"]
  T5["function:GC_install_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:274"]
  S5 -->|calls| T5
  S6["function:GC_get_first_part<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:536"]
  T6["function:GC_add_to_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:362"]
  S6 -->|calls| T6
  S7["function:GC_split_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:577"]
  T7["function:GC_add_to_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:362"]
  S7 -->|calls| T7
  S8["function:GC_allochblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:622"]
  T8["function:GC_hblk_fl_from_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:90"]
  S8 -->|calls| T8
  S9["function:GC_allochblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:622"]
  T9["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  S9 -->|calls| T9
  S10["function:GC_allochblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:622"]
  T10["function:GC_enough_large_bytes_left<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:76"]
  S10 -->|calls| T10
  S11["function:GC_allochblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:622"]
  T11["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  S11 -->|calls| T11
  S12["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T12["function:GC_is_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:241"]
  S12 -->|calls| T12
  S13["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T13["function:GC_is_black_listed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:241"]
  S13 -->|calls| T13
  S14["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T14["function:GC_install_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:274"]
  S14 -->|calls| T14
  S15["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T15["function:GC_remap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2605"]
  S15 -->|calls| T15
  S16["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T16["function:GC_split_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:577"]
  S16 -->|calls| T16
  S17["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T17["function:GC_remove_from_fl_at<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:303"]
  S17 -->|calls| T17
  S18["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T18["function:GC_install_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:274"]
  S18 -->|calls| T18
  S19["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T19["function:setup_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:232"]
  S19 -->|calls| T19
  S20["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T20["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  S20 -->|calls| T20
  S21["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T21["function:GC_remap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2605"]
  S21 -->|calls| T21
  S22["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T22["function:GC_get_first_part<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:536"]
  S22 -->|calls| T22
  S23["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T23["function:GC_install_counts<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:290"]
  S23 -->|calls| T23
  S24["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T24["function:setup_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:232"]
  S24 -->|calls| T24
  S25["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T25["function:GC_remove_counts<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:316"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
