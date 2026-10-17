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
  M3["JobsByPods/ManualBySwiftPods@Pods"]
  M4["JobsByPods/JobsSwiftDSL@Pods"]
  M5["JobsByPods/JobsFuseAnimation@Pods"]
  M6["JobsByPods/JobsBy3rdTools@Pods"]
  M7["JobsByPods/JobsSwiftBlock@Pods"]
  M8["JobsByPods/JobsSwiftTaskCenter@Pods"]
  M9["JobsByPods/JobsSwiftBaseDefines@Pods"]
  M10["JobsByPods/JobsProgressBar@Pods"]
  M11["Unity"]
  M12[".github"]
  M13["JobsByPods/JobsNetworking@Pods"]
  M14["JobsByPods/JobsAppDoor@Pods"]
  M15["JobsByPods/JobsInheritance@Pods"]
  M16["JobsByPods/JobsSwiftWorker@Pods"]
  M17["JobsByPods/BRPickerViewSwift@Pods"]
  M18["JobsByPods/JobsSwiftSearcher@Pods"]
  M19["JobsByPods/JobsGestureUnlock@Pods"]
  M20["JobsByPods/JobsSwiftComment@Pods"]
  M21["JobsByPods/JobsSwiftRefresher@Pods"]
  M22["JobsByPods/JobsSwiftBaseTools@Pods"]
  M23["JobsByPods/JobsBluetooth@Pods"]
  M24["JobsByPods/JobsMarqueeView@Pods"]
  M25["JobsByPods/JobsViewPush@Pods"]
  M26["JobsByPods/JobsDebugPanel@Pods"]
  M27["JobsByPods/Jobsl10n@Pods"]
  M28["JobsByPods/JobsSwiftCalendar@Pods"]
  M29["JobsByPods/JobsSwiftSplash@Pods"]
  M30["JobsByPods/JobsSwiftTimerMgr@Pods"]
  M31["JobsByPods/JobsCryptoKit@Pods"]
  M32["JobsByPods/JobsSwiftTools@Pods"]
  M33["JobsByPods/JobsNavBar@Pods"]
  M34["JobsByPods/JobsSwiftLinkageMenuView@Pods"]
  M35["JobsByPods/JobsSwiftUILabelScrolling@Pods"]
  M36["JobsByPods/JobsSwiftExcel@Pods"]
  M37["JobsByPods/JobsSwiftAppTools@Pods"]
  M38["JobsByPods/JobsSwiftGraphicCaptcha@Pods"]
  M39["JobsByPods/JobsImageRotation@Pods"]
  M40["JobsByPods/JobsLuckyEnvelopeRain@Pods"]
  M41["JobsByPods/JobsSwiftTimer@Pods"]
  M1 -->|calls:318| M2
  M2 -->|calls:200| M3
  M2 -->|calls:192| M4
  M1 -->|calls:183| M4
  M1 -->|calls:160| M3
  M5 -->|calls:103| M4
  M6 -->|calls:101| M4
  M1 -->|calls:83| M7
  M8 -->|calls:81| M3
  M2 -->|calls:71| M9
  M1 -->|calls:67| M10
  M1 -->|calls:66| M9
  M3 -->|calls:64| M11
  M4 -->|calls:60| M3
  M12 -->|calls:58| M13
  M14 -->|calls:54| M2
  M14 -->|calls:51| M4
  M12 -->|calls:49| M3
  M5 -->|calls:49| M2
  M13 -->|calls:48| M3
  M15 -->|calls:45| M4
  M16 -->|calls:44| M3
  M2 -->|calls:40| M8
  M17 -->|calls:38| M3
  M18 -->|calls:38| M4
  M10 -->|calls:37| M4
  M17 -->|calls:36| M2
  M19 -->|calls:36| M4
  M20 -->|calls:36| M2
  M21 -->|calls:36| M4
  M6 -->|calls:33| M2
  M22 -->|calls:33| M3
  M12 -->|calls:32| M23
  M15 -->|calls:32| M2
  M24 -->|calls:32| M4
  M25 -->|calls:32| M4
  M9 -->|calls:31| M3
  M4 -->|calls:31| M9
  M26 -->|calls:30| M4
  M1 -->|calls:30| M15
  M6 -->|calls:29| M3
  M17 -->|calls:28| M4
  M14 -->|calls:28| M3
  M27 -->|calls:27| M3
  M12 -->|calls:26| M8
  M3 -->|calls:26| M12
  M15 -->|calls:25| M3
  M18 -->|calls:25| M2
  M12 -->|calls:24| M27
  M28 -->|calls:24| M4
  M29 -->|calls:24| M3
  M30 -->|calls:24| M3
  M2 -->|calls:23| M10
  M12 -->|calls:22| M31
  M14 -->|calls:22| M9
  M32 -->|calls:22| M9
  M3 -->|calls:22| M9
  M1 -->|calls:22| M33
  M12 -->|calls:20| M7
  M5 -->|calls:20| M33
  M20 -->|calls:20| M4
  M34 -->|calls:20| M4
  M32 -->|calls:20| M3
  M35 -->|calls:20| M4
  M1 -->|calls:20| M36
  M26 -->|calls:19| M2
  M17 -->|calls:18| M33
  M2 -->|calls:18| M37
  M24 -->|calls:18| M2
  M28 -->|calls:18| M2
  M38 -->|calls:18| M3
  M21 -->|calls:17| M33
  M35 -->|calls:17| M3
  M2 -->|calls:16| M33
  M5 -->|calls:16| M6
  M39 -->|calls:16| M4
  M16 -->|calls:16| M8
  M17 -->|calls:15| M7
  M14 -->|calls:15| M33
  M40 -->|calls:15| M41
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
