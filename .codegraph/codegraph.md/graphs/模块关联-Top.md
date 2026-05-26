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
  M3["JobsByPods/JobsBy3rdTools@Pods"]
  M4["JobsByPods/BRPickerViewSwift@Pods"]
  M5["TODO"]
  M6["JobsByPods/JobsByPDFKit@Pods"]
  M7["JobsByPods/JobsByQuartzCore@Pods"]
  M8["JobsByPods/JobsSwiftBaseDefines@Pods"]
  M9["JobsByPods/JobsSwiftTaskCenter@Pods"]
  M10["JobsByPods/JobsRefresher@Pods"]
  M11["JobsByPods/JobsTextTools@Pods"]
  M12["JobsByPods/JobsSwiftTimer@Pods"]
  M13["JobsByPods/JobsNetworking@Pods"]
  M14["JobsByPods/JobsInheritance@Pods"]
  M15["JobsByPods/JobsMarqueeView@Pods"]
  M16["JobsByPods/JobsSwiftFoundation@Pods"]
  M17["JobsByPods/JobsProgressBar@Pods"]
  M18["JobsByPods/JobsCountdownButton@Pods"]
  M19["JobsByPods/JobsSwiftAppTools@Pods"]
  M20["JobsByPods/JobsSwiftTools@Pods"]
  M21["JobsByPods/JobsByWebKit@Pods"]
  M22["my_flutter"]
  M23["JobsByPods/JobsSwiftWorker@Pods"]
  M24["JobsByPods/MetalKit@Pods"]
  M25["JobsByPods/JobsGestureUnlock@Pods"]
  M26["JobsByPods/JobsSwiftBaseTools@Pods"]
  M27["JobsByPods/JobsLuckyEnvelopeRain@Pods"]
  M28["JobsByPods/JobsSwiftBlock@Pods"]
  M29["JobsByPods/JobsEmptyView@Pods"]
  M30["JobsByPods/JobsSwiftStandardLibrary@Pods"]
  M1 -->|calls:2823| M2
  M1 -->|calls:1197| M3
  M1 -->|calls:829| M4
  M1 -->|calls:640| M5
  M1 -->|calls:297| M6
  M1 -->|calls:292| M7
  M1 -->|calls:131| M8
  M1 -->|calls:126| M9
  M2 -->|calls:106| M9
  M1 -->|calls:99| M10
  M2 -->|calls:84| M7
  M2 -->|calls:80| M5
  M1 -->|calls:76| M11
  M3 -->|calls:70| M2
  M2 -->|calls:65| M8
  M1 -->|calls:50| M12
  M1 -->|calls:48| M13
  M14 -->|calls:44| M2
  M10 -->|calls:40| M2
  M1 -->|calls:38| M14
  M2 -->|calls:37| M3
  M1 -->|calls:35| M15
  M1 -->|calls:35| M16
  M3 -->|calls:34| M7
  M15 -->|calls:29| M2
  M1 -->|calls:29| M17
  M5 -->|calls:29| M9
  M18 -->|calls:27| M2
  M19 -->|calls:24| M2
  M20 -->|calls:22| M8
  M1 -->|calls:22| M20
  M14 -->|calls:20| M21
  M19 -->|calls:20| M16
  M1 -->|calls:20| M19
  M2 -->|calls:19| M22
  M2 -->|calls:18| M1
  M1 -->|calls:18| M23
  M3 -->|calls:17| M24
  M20 -->|calls:17| M2
  M1 -->|calls:17| M25
  M16 -->|calls:16| M13
  M23 -->|calls:15| M9
  M2 -->|calls:14| M13
  M17 -->|calls:14| M7
  M19 -->|calls:14| M3
  M19 -->|calls:14| M11
  M1 -->|calls:14| M26
  M2 -->|calls:13| M12
  M25 -->|calls:13| M2
  M14 -->|calls:13| M3
  M27 -->|calls:13| M12
  M17 -->|calls:13| M2
  M20 -->|calls:13| M9
  M20 -->|calls:13| M5
  M1 -->|calls:13| M28
  M14 -->|calls:12| M5
  M4 -->|calls:11| M5
  M2 -->|calls:11| M10
  M29 -->|calls:11| M2
  M13 -->|calls:11| M2
  M20 -->|calls:11| M4
  M26 -->|calls:10| M9
  M20 -->|calls:10| M28
  M1 -->|calls:10| M18
  M2 -->|calls:9| M28
  M14 -->|calls:9| M4
  M14 -->|calls:9| M6
  M14 -->|calls:9| M1
  M13 -->|calls:9| M9
  M13 -->|calls:9| M5
  M16 -->|calls:9| M8
  M3 -->|calls:8| M1
  M2 -->|calls:8| M4
  M2 -->|calls:8| M30
  M2 -->|calls:8| M23
  M9 -->|calls:8| M5
  M18 -->|calls:7| M12
  M25 -->|calls:7| M7
  M14 -->|calls:7| M13
  M15 -->|calls:7| M9
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
