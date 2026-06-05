# `calls 符号关系 - 143`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1421"]
  T1["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S1 -->|calls| T1
  S2["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1477"]
  T2["function:GC_find_limit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1025"]
  S2 -->|calls| T2
  S3["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1477"]
  T3["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S3 -->|calls| T3
  S4["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1477"]
  T4["function:GC_find_limit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1025"]
  S4 -->|calls| T4
  S5["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1477"]
  T5["function:GC_find_limit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1025"]
  S5 -->|calls| T5
  S6["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1477"]
  T6["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S6 -->|calls| T6
  S7["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1497"]
  T7["function:GC_get_main_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1513"]
  S7 -->|calls| T7
  S8["function:GC_get_main_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1513"]
  T8["function:GC_get_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1497"]
  S8 -->|calls| T8
  S9["function:GC_get_main_stack_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1513"]
  T9["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S9 -->|calls| T9
  S10["function:GC_register_data_segments<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1530"]
  T10["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S10 -->|calls| T10
  S11["function:GC_register_data_segments<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1530"]
  T11["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S11 -->|calls| T11
  S12["function:detect_GetWriteWatch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1631"]
  T12["enum_member:MonoGMarkupParseState::TEXT<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/eglib/gmarkup.c:52"]
  S12 -->|calls| T12
  S13["function:detect_GetWriteWatch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1631"]
  T13["variable:GetWriteWatch_func<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1626"]
  S13 -->|calls| T13
  S14["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T14["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S14 -->|calls| T14
  S15["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T15["function:GC_get_allocation_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1813"]
  S15 -->|calls| T15
  S16["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T16["function:GC_is_malloc_heap_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1802"]
  S16 -->|calls| T16
  S17["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T17["function:malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:447"]
  S17 -->|calls| T17
  S18["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T18["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S18 -->|calls| T18
  S19["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T19["function:GC_get_allocation_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1813"]
  S19 -->|calls| T19
  S20["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T20["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S20 -->|calls| T20
  S21["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T21["function:GC_is_malloc_heap_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1802"]
  S21 -->|calls| T21
  S22["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T22["function:GC_is_malloc_heap_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1802"]
  S22 -->|calls| T22
  S23["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  T23["function:free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:682"]
  S23 -->|calls| T23
  S24["function:GC_is_heap_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1863"]
  T24["function:GC_is_malloc_heap_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1802"]
  S24 -->|calls| T24
  S25["function:GC_register_root_section<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1879"]
  T25["function:GC_least_described_address<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1760"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
