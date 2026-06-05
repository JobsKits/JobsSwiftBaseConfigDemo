# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:line_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:163"]
  T1["function:CORD_chr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:347"]
  S1 -->|calls| T1
  S2["function:line_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:163"]
  T2["function:add_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:143"]
  S2 -->|calls| T2
  S3["function:line_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:163"]
  T3["function:CORD_chr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:347"]
  S3 -->|calls| T3
  S4["function:add_hist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:189"]
  T4["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S4 -->|calls| T4
  S5["function:del_hist<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:201"]
  T5["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S5 -->|calls| T5
  S6["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  T6["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S6 -->|calls| T6
  S7["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  T7["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S7 -->|calls| T7
  S8["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  T8["function:CORD_cmp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:152"]
  S8 -->|calls| T8
  S9["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  T9["variable:move<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:65"]
  S9 -->|calls| T9
  S10["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  T10["variable:move<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mach_dep.c:65"]
  S10 -->|calls| T10
  S11["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  T11["function:CORD_pos_fetch<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:870"]
  S11 -->|calls| T11
  S12["function:retrieve_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:256"]
  T12["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S12 -->|calls| T12
  S13["function:retrieve_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:256"]
  T13["function:CORD_chr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:347"]
  S13 -->|calls| T13
  S14["function:retrieve_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:256"]
  T14["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S14 -->|calls| T14
  S15["function:retrieve_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:256"]
  T15["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S15 -->|calls| T15
  S16["function:retrieve_screen_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:272"]
  T16["function:invalidate_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:117"]
  S16 -->|calls| T16
  S17["function:retrieve_screen_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:272"]
  T17["function:line_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:163"]
  S17 -->|calls| T17
  S18["function:retrieve_screen_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:272"]
  T18["function:retrieve_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:256"]
  S18 -->|calls| T18
  S19["function:redisplay<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:284"]
  T19["function:invalidate_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:117"]
  S19 -->|calls| T19
  S20["function:redisplay<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:284"]
  T20["function:line_pos<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:163"]
  S20 -->|calls| T20
  S21["function:redisplay<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:284"]
  T21["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  S21 -->|calls| T21
  S22["function:redisplay<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:284"]
  T22["function:retrieve_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:256"]
  S22 -->|calls| T22
  S23["function:redisplay<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:284"]
  T23["function:replace_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:217"]
  S23 -->|calls| T23
  S24["function:fix_cursor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:333"]
  T24["function:normalize_display<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:308"]
  S24 -->|calls| T24
  S25["function:fix_cursor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:333"]
  T25["function:redisplay<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:284"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
