# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CORD_from_file_eager<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:462"]
  T1["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S1 -->|calls| T1
  S2["function:CORD_from_file_eager<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:462"]
  T2["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S2 -->|calls| T2
  S3["function:CORD_lf_func<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:554"]
  T3["function:GC_call_with_alloc_lock<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2085"]
  S3 -->|calls| T3
  S4["function:CORD_from_file_lazy_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:582"]
  T4["function:CORD_from_fn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:320"]
  S4 -->|calls| T4
  S5["function:CORD_from_file_lazy<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:610"]
  T5["function:CORD_from_file_lazy_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:582"]
  S5 -->|calls| T5
  S6["function:CORD_from_file<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:624"]
  T6["function:CORD_from_file_eager<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:462"]
  S6 -->|calls| T6
  S7["function:CORD_from_file<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:624"]
  T7["function:CORD_from_file_lazy_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:582"]
  S7 -->|calls| T7
  S8["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T8["function:CORD_from_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:257"]
  S8 -->|calls| T8
  S9["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T9["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S9 -->|calls| T9
  S10["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T10["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S10 -->|calls| T10
  S11["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T11["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S11 -->|calls| T11
  S12["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T12["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S12 -->|calls| T12
  S13["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T13["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  S13 -->|calls| T13
  S14["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T14["function:CORD_set_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:912"]
  S14 -->|calls| T14
  S15["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T15["function:CORD_pos_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:907"]
  S15 -->|calls| T15
  S16["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T16["function:test_fn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:41"]
  S16 -->|calls| T16
  S17["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T17["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  S17 -->|calls| T17
  S18["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T18["function:CORD_next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:879"]
  S18 -->|calls| T18
  S19["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T19["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S19 -->|calls| T19
  S20["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T20["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S20 -->|calls| T20
  S21["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T21["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S21 -->|calls| T21
  S22["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T22["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S22 -->|calls| T22
  S23["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T23["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S23 -->|calls| T23
  S24["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T24["function:CORD_iter5<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:470"]
  S24 -->|calls| T24
  S25["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T25["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
