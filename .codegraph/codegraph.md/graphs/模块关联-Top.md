# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["JobsSwiftBaseConfigDemo"]
  M2["JobsByPods/JobsNetworking@Pods"]
  M3["JobsByPods/JobsInheritance@Pods"]
  M4["JobsByPods/JobsCryptoKit@Pods"]
  M5["TODO"]
  M6["JobsByPods/JobsSwiftWorker@Pods"]
  M7["JobsByPods/JobsLocalNotification@Pods"]
  M8["JobsByPods/Jobsl10n@Pods"]
  M9["JobsByPods/JobsBy3rdTools@Pods"]
  M10["JobsByPods/JobsSwiftStandardLibrary@Pods"]
  M11["JobsByPods/JobsByUIKit@Pods"]
  M12["JobsByPods/JobsCountdownButton@Pods"]
  M13["JobsByPods/JobsSwiftBaseTools@Pods"]
  M14["JobsByPods/JobsSwiftDebugTools@Pods"]
  M15["my_flutter"]
  M1 -->|calls:9| M2
  M3 -->|calls:7| M2
  M4 -->|calls:5| M5
  M2 -->|calls:4| M5
  M1 -->|calls:4| M5
  M5 -->|calls:4| M6
  M3 -->|calls:2| M5
  M7 -->|calls:2| M2
  M8 -->|calls:2| M5
  M9 -->|calls:1| M10
  M9 -->|calls:1| M6
  M11 -->|calls:1| M2
  M12 -->|calls:1| M11
  M2 -->|calls:1| M13
  M14 -->|calls:1| M5
  M6 -->|calls:1| M5
  M8 -->|calls:1| M13
  M1 -->|calls:1| M13
  M5 -->|calls:1| M2
  M5 -->|calls:1| M15
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
