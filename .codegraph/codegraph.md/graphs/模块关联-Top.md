# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["Unity"]
  M2["JobsByPods/ManualBySwiftPods@Pods"]
  M3["JobsSwiftBaseConfigDemo"]
  M4["my_flutter"]
  M5["JobsBySwiftPackageManager"]
  M1 -->|calls:49| M2
  M3 -->|calls:10| M2
  M2 -->|calls:1| M4
  M5 -->|calls:1| M2
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
