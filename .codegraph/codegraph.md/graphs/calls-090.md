# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T1["function:CORD_from_fn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:320"]
  S1 -->|calls| T1
  S2["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T2["function:CORD_set_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:912"]
  S2 -->|calls| T2
  S3["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T3["function:CORD_pos_valid<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:907"]
  S3 -->|calls| T3
  S4["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T4["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  S4 -->|calls| T4
  S5["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T5["function:CORD_next<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:879"]
  S5 -->|calls| T5
  S6["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T6["function:CORD_prev<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:888"]
  S6 -->|calls| T6
  S7["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T7["function:CORD_pos_to_cord<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:902"]
  S7 -->|calls| T7
  S8["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T8["function:CORD_pos_to_index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:897"]
  S8 -->|calls| T8
  S9["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T9["function:CORD_iter<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:517"]
  S9 -->|calls| T9
  S10["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T10["function:CORD_riter<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:563"]
  S10 -->|calls| T10
  S11["function:test_basics<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:65"]
  T11["function:CORD_dump<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:152"]
  S11 -->|calls| T11
  S12["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T12["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S12 -->|calls| T12
  S13["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T13["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S13 -->|calls| T13
  S14["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T14["function:CORD_catn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:84"]
  S14 -->|calls| T14
  S15["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T15["function:CORD_cmp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:152"]
  S15 -->|calls| T15
  S16["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T16["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S16 -->|calls| T16
  S17["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T17["function:CORD_balance<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:713"]
  S17 -->|calls| T17
  S18["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T18["function:CORD_cmp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:152"]
  S18 -->|calls| T18
  S19["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T19["function:CORD_cmp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:152"]
  S19 -->|calls| T19
  S20["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T20["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S20 -->|calls| T20
  S21["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T21["function:CORD_cmp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:152"]
  S21 -->|calls| T21
  S22["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T22["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S22 -->|calls| T22
  S23["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T23["function:CORD_cmp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:152"]
  S23 -->|calls| T23
  S24["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T24["function:CORD_cat<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:244"]
  S24 -->|calls| T24
  S25["function:test_extras<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/cordtest.c:147"]
  T25["function:CORD_put<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:301"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
