# `calls 符号关系 - 159`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_check_tsd_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:162"]
  T1["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S1 -->|calls| T1
  S2["function:GC_check_tsd_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:162"]
  T2["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S2 -->|calls| T2
  S3["function:testobj_new<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_bench.c:61"]
  T3["function:GC_finalized_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/fnlz_mlc.c:85"]
  S3 -->|calls| T3
  S4["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_bench.c:99"]
  T4["function:GC_init_finalized_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/fnlz_mlc.c:52"]
  S4 -->|calls| T4
  S5["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_bench.c:99"]
  T5["function:testobj_new<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_bench.c:61"]
  S5 -->|calls| T5
  S6["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_bench.c:99"]
  T6["function:GC_gcollect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1221"]
  S6 -->|calls| T6
  S7["function:misc_sizes_dct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:64"]
  T7["function:memeq<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:54"]
  S7 -->|calls| T7
  S8["function:test_misc_sizes<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:75"]
  T8["function:GC_finalized_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/fnlz_mlc.c:85"]
  S8 -->|calls| T8
  S9["function:test_misc_sizes<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:75"]
  T9["function:memeq<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:54"]
  S9 -->|calls| T9
  S10["function:pair_dct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:107"]
  T10["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S10 -->|calls| T10
  S11["function:pair_dct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:107"]
  T11["function:is_pair<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:102"]
  S11 -->|calls| T11
  S12["function:pair_dct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:107"]
  T12["function:is_pair<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:102"]
  S12 -->|calls| T12
  S13["function:pair_dct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:107"]
  T13["function:is_pair<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:102"]
  S13 -->|calls| T13
  S14["function:pair_dct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:107"]
  T14["function:GC_end_stubborn_change<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:614"]
  S14 -->|calls| T14
  S15["function:pair_new<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:134"]
  T15["function:GC_finalized_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/fnlz_mlc.c:85"]
  S15 -->|calls| T15
  S16["function:pair_new<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:134"]
  T16["function:is_pair<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:102"]
  S16 -->|calls| T16
  S17["function:pair_new<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:134"]
  T17["function:memeq<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:54"]
  S17 -->|calls| T17
  S18["function:pair_new<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:134"]
  T18["function:GC_end_stubborn_change<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:614"]
  S18 -->|calls| T18
  S19["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:192"]
  T19["function:pair_new<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:134"]
  S19 -->|calls| T19
  S20["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:192"]
  T20["function:pair_check_rec<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:159"]
  S20 -->|calls| T20
  S21["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:219"]
  T21["function:GC_set_all_interior_pointers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2402"]
  S21 -->|calls| T21
  S22["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:219"]
  T22["function:GC_init_finalized_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/fnlz_mlc.c:52"]
  S22 -->|calls| T22
  S23["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:219"]
  T23["function:GC_enable_incremental<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1335"]
  S23 -->|calls| T23
  S24["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:219"]
  T24["function:test_misc_sizes<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:75"]
  S24 -->|calls| T24
  S25["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:219"]
  T25["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/disclaim_test.c:192"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
