# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["JobsByPods/JobsByUIKit@Pods"]
  M2["JobsByPods/JobsSwiftTaskCenter@Pods"]
  M3["TODO"]
  M4["JobsByPods/JobsSwiftBaseDefines@Pods"]
  M5["my_flutter"]
  M6["JobsByPods/JobsSwiftTools@Pods"]
  M7["JobsByPods/JobsSwiftFoundation@Pods"]
  M8["JobsByPods/JobsNetworking@Pods"]
  M9["JobsByPods/JobsSwiftWorker@Pods"]
  M10["JobsByPods/BRPickerViewSwift@Pods"]
  M11["JobsSwiftBaseConfigDemo"]
  M12["JobsByPods/JobsSwiftBaseTools@Pods"]
  M13["JobsByPods/JobsSwiftBlock@Pods"]
  M14["JobsByPods/JobsInheritance@Pods"]
  M15["JobsByPods/JobsSwiftTimer@Pods"]
  M16["JobsByPods/JobsCryptoKit@Pods"]
  M17["JobsByPods/JobsImageTools@Pods"]
  M18["JobsByPods/JobsBy3rdTools@Pods"]
  M19["JobsByPods/JobsTextTools@Pods"]
  M20["JobsByPods/Jobsl10n@Pods"]
  M21["JobsByPods/JobsSwiftStandardLibrary@Pods"]
  M22["JobsByPods/JobsGestureUnlock@Pods"]
  M23["JobsByPods/JobsLocalNotification@Pods"]
  M1 -->|calls:40| M2
  M1 -->|calls:31| M3
  M3 -->|calls:29| M2
  M1 -->|calls:25| M4
  M1 -->|calls:18| M5
  M6 -->|calls:17| M4
  M7 -->|calls:16| M8
  M9 -->|calls:15| M2
  M6 -->|calls:13| M2
  M10 -->|calls:11| M3
  M11 -->|calls:11| M8
  M1 -->|calls:10| M8
  M8 -->|calls:9| M2
  M8 -->|calls:9| M3
  M12 -->|calls:9| M2
  M7 -->|calls:9| M4
  M11 -->|calls:9| M2
  M1 -->|calls:8| M13
  M8 -->|calls:8| M1
  M2 -->|calls:8| M3
  M11 -->|calls:8| M4
  M1 -->|calls:7| M9
  M14 -->|calls:7| M8
  M11 -->|calls:7| M13
  M11 -->|calls:7| M3
  M1 -->|calls:6| M15
  M4 -->|calls:6| M6
  M12 -->|calls:6| M6
  M6 -->|calls:6| M3
  M9 -->|calls:6| M3
  M3 -->|calls:6| M12
  M16 -->|calls:5| M3
  M2 -->|calls:5| M15
  M6 -->|calls:5| M15
  M11 -->|calls:5| M7
  M3 -->|calls:5| M9
  M17 -->|calls:4| M4
  M8 -->|calls:4| M6
  M6 -->|calls:4| M13
  M3 -->|calls:4| M15
  M10 -->|calls:3| M2
  M18 -->|calls:3| M1
  M1 -->|calls:3| M12
  M1 -->|calls:3| M19
  M1 -->|calls:3| M20
  M21 -->|calls:3| M2
  M2 -->|calls:3| M9
  M15 -->|calls:3| M3
  M6 -->|calls:3| M1
  M6 -->|calls:3| M8
  M6 -->|calls:3| M7
  M20 -->|calls:3| M22
  M20 -->|calls:3| M3
  M10 -->|calls:2| M1
  M10 -->|calls:2| M8
  M18 -->|calls:2| M21
  M1 -->|calls:2| M14
  M1 -->|calls:2| M6
  M16 -->|calls:2| M1
  M16 -->|calls:2| M2
  M22 -->|calls:2| M2
  M22 -->|calls:2| M3
  M17 -->|calls:2| M2
  M14 -->|calls:2| M4
  M14 -->|calls:2| M15
  M14 -->|calls:2| M3
  M23 -->|calls:2| M8
  M8 -->|calls:2| M7
  M12 -->|calls:2| M1
  M12 -->|calls:2| M3
  M7 -->|calls:2| M6
  M7 -->|calls:2| M3
  M21 -->|calls:2| M6
  M6 -->|calls:2| M18
  M20 -->|calls:2| M1
  M20 -->|calls:2| M7
  M20 -->|calls:2| M2
  M11 -->|calls:2| M10
  M11 -->|calls:2| M1
  M11 -->|calls:2| M22
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
