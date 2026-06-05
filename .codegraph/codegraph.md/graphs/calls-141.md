# `calls 符号关系 - 141`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_dump_named<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2237"]
  T1["function:GC_print_block_list<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:569"]
  S1 -->|calls| T1
  S2["function:GC_get_memory_use<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2273"]
  T2["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S2 -->|calls| T2
  S3["function:GC_set_all_interior_pointers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2402"]
  T3["function:GC_initialize_offsets<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:79"]
  S3 -->|calls| T3
  S4["function:GC_set_all_interior_pointers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2402"]
  T4["function:GC_bl_init_no_interiors<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:92"]
  S4 -->|calls| T4
  S5["function:GC_build_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:109"]
  T5["function:GC_build_fl_clear2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:30"]
  S5 -->|calls| T5
  S6["function:GC_build_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:109"]
  T6["function:GC_build_fl2<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:70"]
  S6 -->|calls| T6
  S7["function:GC_build_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:109"]
  T7["function:GC_build_fl_clear4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:50"]
  S7 -->|calls| T7
  S8["function:GC_build_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:109"]
  T8["function:GC_build_fl4<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:86"]
  S8 -->|calls| T8
  S9["function:GC_new_hblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:171"]
  T9["function:GC_allochblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:622"]
  S9 -->|calls| T9
  S10["function:GC_new_hblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:171"]
  T10["function:GC_set_hdr_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:163"]
  S10 -->|calls| T10
  S11["function:GC_new_hblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:171"]
  T11["function:GC_build_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/new_hblk.c:109"]
  S11 -->|calls| T11
  S12["function:GC_register_displacement<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:27"]
  T12["function:GC_register_displacement_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:36"]
  S12 -->|calls| T12
  S13["function:GC_add_map_entry<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:51"]
  T13["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  S13 -->|calls| T13
  S14["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:156"]
  T14["function:GC_get_file_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:141"]
  S14 -->|calls| T14
  S15["function:GC_get_maps<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:171"]
  T15["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  S15 -->|calls| T15
  S16["function:GC_get_maps<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:171"]
  T16["function:GC_repeat_read<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:122"]
  S16 -->|calls| T16
  S17["function:GC_enclosing_mapping<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:325"]
  T17["function:GC_get_maps<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:171"]
  S17 -->|calls| T17
  S18["function:GC_enclosing_mapping<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:325"]
  T18["function:GC_parse_map_entry<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:273"]
  S18 -->|calls| T18
  S19["function:GC_text_mapping<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:355"]
  T19["function:GC_get_maps<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:171"]
  S19 -->|calls| T19
  S20["function:GC_text_mapping<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:355"]
  T20["function:GC_parse_map_entry<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:273"]
  S20 -->|calls| T20
  S21["function:backing_store_base_from_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:389"]
  T21["function:GC_enclosing_mapping<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:325"]
  S21 -->|calls| T21
  S22["function:GC_init_linux_data_start<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:428"]
  T22["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S22 -->|calls| T22
  S23["function:GC_init_linux_data_start<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:428"]
  T23["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S23 -->|calls| T23
  S24["function:GC_init_linux_data_start<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:428"]
  T24["function:GC_find_limit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1025"]
  S24 -->|calls| T24
  S25["function:GC_init_netbsd_elf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:505"]
  T25["function:GC_find_limit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1025"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
