# `calls 符号关系 - 096`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:APIENTRY<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:42"]
  T1["function:de_error<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:35"]
  S1 -->|calls| T1
  S2["function:APIENTRY<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:42"]
  T2["function:de_error<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:35"]
  S2 -->|calls| T2
  S3["function:APIENTRY<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:42"]
  T3["function:CORD_to_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:245"]
  S3 -->|calls| T3
  S4["function:APIENTRY<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:42"]
  T4["function:CORD_substr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:460"]
  S4 -->|calls| T4
  S5["function:APIENTRY<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:42"]
  T5["enum_member:MonoGMarkupParseState::TEXT<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/eglib/gmarkup.c:52"]
  S5 -->|calls| T5
  S6["function:APIENTRY<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:42"]
  T6["function:de_error<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:35"]
  S6 -->|calls| T6
  S7["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T7["function:generic_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:549"]
  S7 -->|calls| T7
  S8["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T8["function:do_command<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:406"]
  S8 -->|calls| T8
  S9["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T9["function:update_cursor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:353"]
  S9 -->|calls| T9
  S10["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T10["function:set_position<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:392"]
  S10 -->|calls| T10
  S11["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T11["function:do_command<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:406"]
  S11 -->|calls| T11
  S12["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T12["function:do_command<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:406"]
  S12 -->|calls| T12
  S13["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T13["enum_member:MonoGMarkupParseState::TEXT<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/eglib/gmarkup.c:52"]
  S13 -->|calls| T13
  S14["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T14["function:de_error<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:35"]
  S14 -->|calls| T14
  S15["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T15["function:GC_win32_free_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2444"]
  S15 -->|calls| T15
  S16["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T16["function:get_line_rect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:160"]
  S16 -->|calls| T16
  S17["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T17["function:retrieve_screen_line<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de.c:272"]
  S17 -->|calls| T17
  S18["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T18["function:CORD_len<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordbscs.c:325"]
  S18 -->|calls| T18
  S19["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T19["function:CORD_to_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:245"]
  S19 -->|calls| T19
  S20["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T20["function:plain_chars<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:121"]
  S20 -->|calls| T20
  S21["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T21["function:CORD_to_char_star<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:245"]
  S21 -->|calls| T21
  S22["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T22["function:CORD_chars<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/cordxtra.c:457"]
  S22 -->|calls| T22
  S23["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T23["function:control_chars<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:140"]
  S23 -->|calls| T23
  S24["function:CALLBACK<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:201"]
  T24["function:de_error<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:35"]
  S24 -->|calls| T24
  S25["function:move_cursor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:345"]
  T25["function:update_cursor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/cord/tests/de_win.c:353"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
