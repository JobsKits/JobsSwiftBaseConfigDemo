# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsUIKitRegression::testScaleInvalidDesignDimensionsHaveFiniteWindowScale<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:228"]
  T1["method:JobsScale::heightScale<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:138"]
  S1 -->|calls| T1
  S2["method:JobsUIKitRegression::testServerCaptchaRejectsLocalAnswerAndIgnoresPreviousChallenge<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:235"]
  T2["method:JobsSwiftGraphicCaptchaView::refreshCaptcha<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:87"]
  S2 -->|calls| T2
  S3["method:JobsUIKitRegression::testServerCaptchaRejectsLocalAnswerAndIgnoresPreviousChallenge<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:235"]
  T3["method:JobsSwiftGraphicCaptchaView::validateInput<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:126"]
  S3 -->|calls| T3
  S4["method:JobsUIKitRegression::testServerCaptchaRejectsLocalAnswerAndIgnoresPreviousChallenge<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:235"]
  T4["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S4 -->|calls| T4
  S5["method:JobsUIKitRegression::testServerCaptchaRejectsLocalAnswerAndIgnoresPreviousChallenge<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:235"]
  T5["method:JobsSwiftGraphicCaptchaView::verifyInput<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:133"]
  S5 -->|calls| T5
  S6["method:JobsUIKitRegression::testCaptchaConsumeNotificationCanRefreshWithoutCancellingSuccess<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:275"]
  T6["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S6 -->|calls| T6
  S7["method:JobsUIKitRegression::testCaptchaConsumeNotificationCanRefreshWithoutCancellingSuccess<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:275"]
  T7["method:JobsSwiftGraphicCaptchaView::refreshCaptcha<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:87"]
  S7 -->|calls| T7
  S8["method:JobsUIKitRegression::testCaptchaConsumeNotificationCanRefreshWithoutCancellingSuccess<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:275"]
  T8["method:JobsSwiftGraphicCaptchaView::verifyInput<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:133"]
  S8 -->|calls| T8
  S9["method:JobsUIKitRegression::testCaptchaCancellationCallbackKeepsNewestVerification<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:320"]
  T9["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S9 -->|calls| T9
  S10["method:JobsUIKitRegression::testCaptchaCancellationCallbackKeepsNewestVerification<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:320"]
  T10["method:JobsSwiftGraphicCaptchaView::verifyInput<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:133"]
  S10 -->|calls| T10
  S11["method:JobsUIKitRegression::testCaptchaCancellationCallbackKeepsNewestVerification<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:320"]
  T11["method:JobsSwiftGraphicCaptchaView::verifyInput<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:133"]
  S11 -->|calls| T11
  S12["method:JobsUIKitRegression::testCaptchaCancellationCallbackKeepsNewestVerification<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:320"]
  T12["method:JobsSwiftGraphicCaptchaView::verifyInput<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:133"]
  S12 -->|calls| T12
  S13["method:JobsSwiftBlockRegression::main<br/>.github/tests/JobsSwiftBlockRegression.swift:21"]
  T13["method:JobsSwiftBlockRegression::verifyFactoryTypesAndConfiguration<br/>.github/tests/JobsSwiftBlockRegression.swift:29"]
  S13 -->|calls| T13
  S14["method:JobsSwiftBlockRegression::main<br/>.github/tests/JobsSwiftBlockRegression.swift:21"]
  T14["method:JobsSwiftBlockRegression::verifyGenericAndDynamicMetatypes<br/>.github/tests/JobsSwiftBlockRegression.swift:53"]
  S14 -->|calls| T14
  S15["method:JobsSwiftBlockRegression::main<br/>.github/tests/JobsSwiftBlockRegression.swift:21"]
  T15["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  S15 -->|calls| T15
  S16["method:JobsSwiftBlockRegression::main<br/>.github/tests/JobsSwiftBlockRegression.swift:21"]
  T16["method:JobsSwiftBlockRegression::verifyPureSwiftCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:99"]
  S16 -->|calls| T16
  S17["method:JobsSwiftBlockRegression::verifyFactoryTypesAndConfiguration<br/>.github/tests/JobsSwiftBlockRegression.swift:29"]
  T17["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S17 -->|calls| T17
  S18["method:JobsSwiftBlockRegression::verifyFactoryTypesAndConfiguration<br/>.github/tests/JobsSwiftBlockRegression.swift:29"]
  T18["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S18 -->|calls| T18
  S19["method:JobsSwiftBlockRegression::verifyGenericAndDynamicMetatypes<br/>.github/tests/JobsSwiftBlockRegression.swift:53"]
  T19["method:JobsSwiftBlockRegression::makeGeneric<br/>.github/tests/JobsSwiftBlockRegression.swift:64"]
  S19 -->|calls| T19
  S20["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T20["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S20 -->|calls| T20
  S21["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T21["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S21 -->|calls| T21
  S22["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T22["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S22 -->|calls| T22
  S23["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T23["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:61"]
  S23 -->|calls| T23
  S24["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T24["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S24 -->|calls| T24
  S25["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T25["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
