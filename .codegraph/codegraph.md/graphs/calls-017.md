# `calls 符号关系 - 017`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsUIKitRegression::testPickerTaskCancellationReturnsTerminalResult<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:64"]
  T1["method:BRBasePicker::awaitResultOrNil<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:161"]
  S1 -->|calls| T1
  S2["method:JobsUIKitRegression::testPickerTaskCancellationReturnsTerminalResult<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:64"]
  T2["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:196"]
  S2 -->|calls| T2
  S3["method:JobsUIKitRegression::testPickerInitialOffWindowAndSynchronousWindowTransferKeepAwaiting<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:87"]
  T3["method:BRStringPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:23"]
  S3 -->|calls| T3
  S4["method:JobsUIKitRegression::testPickerInitialOffWindowAndSynchronousWindowTransferKeepAwaiting<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:87"]
  T4["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  S4 -->|calls| T4
  S5["method:JobsUIKitRegression::testPickerInitialOffWindowAndSynchronousWindowTransferKeepAwaiting<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:87"]
  T5["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:89"]
  S5 -->|calls| T5
  S6["method:JobsUIKitRegression::testPickerInitialOffWindowAndSynchronousWindowTransferKeepAwaiting<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:87"]
  T6["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:36"]
  S6 -->|calls| T6
  S7["method:JobsUIKitRegression::testPickerInitialOffWindowAndSynchronousWindowTransferKeepAwaiting<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:87"]
  T7["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  S7 -->|calls| T7
  S8["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T8["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S8 -->|calls| T8
  S9["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T9["method:BRStringPicker::byDataSource<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:23"]
  S9 -->|calls| T9
  S10["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T10["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  S10 -->|calls| T10
  S11["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T11["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S11 -->|calls| T11
  S12["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T12["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:179"]
  S12 -->|calls| T12
  S13["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T13["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  S13 -->|calls| T13
  S14["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T14["method:BRStringPicker::confirmSelection<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRStringPicker.swift:36"]
  S14 -->|calls| T14
  S15["method:JobsUIKitRegression::testPickerHostLeavingWindowCancelsAndPickerCanBePresentedAgain<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:124"]
  T15["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:117"]
  S15 -->|calls| T15
  S16["method:JobsUIKitRegression::testWebConfigurationAppliesBeforeFirstDocument<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:175"]
  T16["method:BaseWebView::byPersistentStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:72"]
  S16 -->|calls| T16
  S17["method:JobsUIKitRegression::testWebConfigurationAppliesBeforeFirstDocument<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:175"]
  T17["method:BaseWebView::byWebViewConfiguration<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:84"]
  S17 -->|calls| T17
  S18["method:JobsUIKitRegression::testJavaScriptUndefinedResolvesAsNil<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:187"]
  T18["method:BaseWebView::evalAsyncRaw<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:376"]
  S18 -->|calls| T18
  S19["method:JobsUIKitRegression::testCalendarWeekAnchorHonorsFirstWeekdayAcrossMonth<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:193"]
  T19["method:JobsSwiftCalendar::setCurrentPage<br/>JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendar/JobsSwiftCalendar.swift:130"]
  S19 -->|calls| T19
  S20["method:JobsUIKitRegression::testDeepCommentTreeStopsAtConfiguredBudget<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:209"]
  T20["method:JobsSwiftCommentView::reloadWithComments<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentView/JobsSwiftCommentView.swift:66"]
  S20 -->|calls| T20
  S21["method:JobsUIKitRegression::testDeepCommentTreeStopsAtConfiguredBudget<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:209"]
  T21["method:JobsSwiftCommentView::tableView<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentView/JobsSwiftCommentView.swift:95"]
  S21 -->|calls| T21
  S22["method:JobsUIKitRegression::testDeepCommentTreeStopsAtConfiguredBudget<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:209"]
  T22["method:JobsSwiftCommentView::reloadWithComments<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentView/JobsSwiftCommentView.swift:66"]
  S22 -->|calls| T22
  S23["method:JobsUIKitRegression::testScaleInvalidDesignDimensionsHaveFiniteWindowScale<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:228"]
  T23["method:JobsScale::setup<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:57"]
  S23 -->|calls| T23
  S24["method:JobsUIKitRegression::testScaleInvalidDesignDimensionsHaveFiniteWindowScale<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:228"]
  T24["method:JobsScale::setup<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:57"]
  S24 -->|calls| T24
  S25["method:JobsUIKitRegression::testScaleInvalidDesignDimensionsHaveFiniteWindowScale<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:228"]
  T25["method:JobsScale::widthScale<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:134"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
