# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1167"]
  T1["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S1 -->|calls| T1
  S2["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1167"]
  T2["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S2 -->|calls| T2
  S3["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1167"]
  T3["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S3 -->|calls| T3
  S4["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1167"]
  T4["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S4 -->|calls| T4
  S5["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1167"]
  T5["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S5 -->|calls| T5
  S6["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1167"]
  T6["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S6 -->|calls| T6
  S7["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1167"]
  T7["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S7 -->|calls| T7
  S8["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1220"]
  T8["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S8 -->|calls| T8
  S9["function:GC_dyld_image_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1318"]
  T9["function:GC_dyld_name_for_hdr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1307"]
  S9 -->|calls| T9
  S10["function:GC_dyld_image_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1318"]
  T10["function:GC_dyld_name_for_hdr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1307"]
  S10 -->|calls| T10
  S11["function:GC_dyld_image_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1318"]
  T11["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S11 -->|calls| T11
  S12["function:GC_dyld_image_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1318"]
  T12["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S12 -->|calls| T12
  S13["function:GC_dyld_image_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1318"]
  T13["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S13 -->|calls| T13
  S14["function:GC_dyld_image_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1318"]
  T14["function:GC_add_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:152"]
  S14 -->|calls| T14
  S15["function:GC_dyld_image_add<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1318"]
  T15["function:GC_print_static_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:58"]
  S15 -->|calls| T15
  S16["function:GC_dyld_image_remove<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1388"]
  T16["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S16 -->|calls| T16
  S17["function:GC_dyld_image_remove<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1388"]
  T17["function:GC_dyld_name_for_hdr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1307"]
  S17 -->|calls| T17
  S18["function:GC_dyld_image_remove<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1388"]
  T18["function:GC_remove_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:347"]
  S18 -->|calls| T18
  S19["function:GC_dyld_image_remove<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1388"]
  T19["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S19 -->|calls| T19
  S20["function:GC_dyld_image_remove<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1388"]
  T20["function:GC_dyld_name_for_hdr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1307"]
  S20 -->|calls| T20
  S21["function:GC_dyld_image_remove<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1388"]
  T21["function:GC_remove_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:347"]
  S21 -->|calls| T21
  S22["function:GC_dyld_image_remove<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1388"]
  T22["function:GC_print_static_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:58"]
  S22 -->|calls| T22
  S23["function:GC_init_dyld<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1457"]
  T23["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S23 -->|calls| T23
  S24["function:GC_init_dyld<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1457"]
  T24["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S24 -->|calls| T24
  S25["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:1522"]
  T25["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
