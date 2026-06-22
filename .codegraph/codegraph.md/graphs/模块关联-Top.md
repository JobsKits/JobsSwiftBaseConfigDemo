# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["JobsSwiftBaseConfigDemo"]
  M2["JobsByPods/JobsByUIKit@Pods"]
  M3["JobsByPods/JobsSwiftDSL@Pods"]
  M4["JobsByPods/ManualBySwiftPods@Pods"]
  M5["JobsByPods/JobsBy3rdTools@Pods"]
  M6["JobsByPods/JobsNavBar@Pods"]
  M7["JobsByPods/JobsProgressBar@Pods"]
  M8["JobsByPods/JobsSwiftBaseDefines@Pods"]
  M9["JobsByPods/JobsRefresher@Pods"]
  M10["JobsByPods/JobsSwiftTaskCenter@Pods"]
  M11["JobsByPods/BRPickerViewSwift@Pods"]
  M12["JobsByPods/JobsNetworking@Pods"]
  M13["JobsByPods/JobsTextTools@Pods"]
  M14["JobsByPods/JobsInheritance@Pods"]
  M15["JobsByPods/JobsMarqueeView@Pods"]
  M16["JobsByPods/JobsSwiftFoundation@Pods"]
  M17["JobsByPods/JobsSwiftTools@Pods"]
  M18["JobsByPods/JobsSwiftAppTools@Pods"]
  M19["my_flutter"]
  M20["JobsByPods/JobsSwiftTimerMgr@Pods"]
  M21["JobsByPods/JobsSwiftWorker@Pods"]
  M22["JobsByPods/JobsCountdownButton@Pods"]
  M23["JobsByPods/JobsSwiftBaseTools@Pods"]
  M24["JobsByPods/JobsImageTools@Pods"]
  M25["JobsByPods/JobsSwiftBlock@Pods"]
  M26["JobsByPods/JobsSwiftStandardLibrary@Pods"]
  M27["JobsByPods/JobsSwiftTimer@Pods"]
  M28["JobsByPods/JobsGetWindow@Pods"]
  M29["JobsByPods/JobsEmptyView@Pods"]
  M1 -->|calls:2556| M2
  M1 -->|calls:1427| M3
  M1 -->|calls:868| M4
  M1 -->|calls:489| M5
  M2 -->|calls:245| M3
  M2 -->|calls:232| M4
  M1 -->|calls:198| M6
  M1 -->|calls:126| M7
  M1 -->|calls:118| M8
  M1 -->|calls:88| M9
  M1 -->|calls:75| M10
  M5 -->|calls:72| M3
  M3 -->|calls:65| M4
  M1 -->|calls:59| M11
  M2 -->|calls:52| M8
  M1 -->|calls:52| M12
  M5 -->|calls:51| M2
  M1 -->|calls:51| M13
  M2 -->|calls:46| M10
  M14 -->|calls:43| M3
  M1 -->|calls:43| M14
  M10 -->|calls:36| M4
  M1 -->|calls:35| M15
  M11 -->|calls:34| M4
  M14 -->|calls:33| M2
  M1 -->|calls:30| M16
  M8 -->|calls:29| M4
  M14 -->|calls:26| M4
  M9 -->|calls:26| M2
  M5 -->|calls:23| M4
  M17 -->|calls:22| M8
  M2 -->|calls:20| M6
  M7 -->|calls:20| M3
  M18 -->|calls:20| M16
  M2 -->|calls:19| M19
  M18 -->|calls:19| M2
  M1 -->|calls:19| M18
  M1 -->|calls:19| M20
  M1 -->|calls:19| M21
  M1 -->|calls:17| M17
  M2 -->|calls:16| M5
  M16 -->|calls:16| M12
  M2 -->|calls:15| M7
  M22 -->|calls:15| M2
  M9 -->|calls:14| M3
  M1 -->|calls:14| M23
  M2 -->|calls:13| M21
  M17 -->|calls:13| M4
  M2 -->|calls:12| M12
  M2 -->|calls:11| M1
  M15 -->|calls:11| M4
  M23 -->|calls:11| M4
  M3 -->|calls:11| M10
  M17 -->|calls:11| M11
  M24 -->|calls:10| M4
  M17 -->|calls:10| M25
  M17 -->|calls:10| M3
  M2 -->|calls:9| M25
  M15 -->|calls:9| M2
  M18 -->|calls:9| M5
  M3 -->|calls:9| M26
  M20 -->|calls:9| M4
  M1 -->|calls:9| M26
  M2 -->|calls:8| M24
  M14 -->|calls:8| M6
  M18 -->|calls:8| M3
  M18 -->|calls:8| M13
  M18 -->|calls:8| M4
  M16 -->|calls:8| M8
  M1 -->|calls:8| M27
  M2 -->|calls:7| M28
  M29 -->|calls:7| M2
  M29 -->|calls:7| M3
  M14 -->|calls:7| M12
  M15 -->|calls:7| M3
  M15 -->|calls:7| M10
  M17 -->|calls:7| M10
  M14 -->|calls:6| M5
  M9 -->|calls:6| M4
  M18 -->|calls:6| M23
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
