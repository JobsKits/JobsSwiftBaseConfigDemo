# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["property:JobsTimer::isRunning<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:18"]
  T1["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S1 -->|calls| T1
  S2["method:JobsTimer::start<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:27"]
  T2["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S2 -->|calls| T2
  S3["method:JobsTimer::start<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:27"]
  T3["method:UnityWebRequestUploadStream::scheduleInRunLoop:forMode:<br/>Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:345"]
  S3 -->|calls| T3
  S4["method:JobsTimer::start<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:27"]
  T4["method:JobsTimer::fire<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:42"]
  S4 -->|calls| T4
  S5["method:JobsTimer::start<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:27"]
  T5["method:JobsTimer::resume<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:57"]
  S5 -->|calls| T5
  S6["method:JobsTimer::fire<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:42"]
  T6["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S6 -->|calls| T6
  S7["method:JobsTimer::fire<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:42"]
  T7["method:JobsTimer::stop<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:59"]
  S7 -->|calls| T7
  S8["method:JobsTimer::fire<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:42"]
  T8["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S8 -->|calls| T8
  S9["method:JobsTimer::pause<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:55"]
  T9["method:JobsTimer::stop<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:59"]
  S9 -->|calls| T9
  S10["method:JobsTimer::resume<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:57"]
  T10["method:JobsTimer::start<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:27"]
  S10 -->|calls| T10
  S11["method:JobsTimer::stop<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:59"]
  T11["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S11 -->|calls| T11
  S12["method:JobsTimer::stop<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:59"]
  T12["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:201"]
  S12 -->|calls| T12
  S13["method:JobsTimer::fireOnce<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:68"]
  T13["method:JobsTimer::fire<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:42"]
  S13 -->|calls| T13
  S14["method:JobsTimer::onTick<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:73"]
  T14["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S14 -->|calls| T14
  S15["method:JobsTimer::onFinish<br/>.github/tests/JobsPodsUpgrade/Core/Fixtures/TimerFixture.swift:80"]
  T15["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S15 -->|calls| T15
  S16["class:CallbackCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:19"]
  T16["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:61"]
  S16 -->|calls| T16
  S17["class:CallbackCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:19"]
  T17["field:CallbackCapture::replacement<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:34"]
  S17 -->|calls| T17
  S18["class:CallbackCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:19"]
  T18["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S18 -->|calls| T18
  S19["class:CallbackCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:19"]
  T19["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S19 -->|calls| T19
  S20["method:JobsBlockStorageRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:53"]
  T20["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  S20 -->|calls| T20
  S21["method:JobsBlockStorageRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:53"]
  T21["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  S21 -->|calls| T21
  S22["method:JobsBlockStorageRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:53"]
  T22["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  S22 -->|calls| T22
  S23["method:JobsBlockStorageRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:53"]
  T23["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  S23 -->|calls| T23
  S24["method:JobsBlockStorageRegression::installCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:61"]
  T24["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S24 -->|calls| T24
  S25["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  T25["method:JobsBlockStorageRegression::installCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:61"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
