# `calls 符号关系 - 017`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::pauseJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:342"]
  T1["method:UIButton::pauseTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:235"]
  S1 -->|calls| T1
  S2["method:UIButton::resumeJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:345"]
  T2["method:UIButton::resumeTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:242"]
  S2 -->|calls| T2
  S3["method:UIButton::fireJobsTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:348"]
  T3["method:UIButton::fireTimerOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:249"]
  S3 -->|calls| T3
  S4["method:UIButton::stopJobsTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:351"]
  T4["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S4 -->|calls| T4
  S5["method:UIButton::startJobsCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:354"]
  T5["method:UIButton::startTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:126"]
  S5 -->|calls| T5
  S6["method:UIButton::stopJobsCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:361"]
  T6["method:UIButton::stopTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+倒计时.swift:311"]
  S6 -->|calls| T6
  S7["method:UIButton::_jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:31"]
  T7["function:onMainImmediateOrAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:245"]
  S7 -->|calls| T7
  S8["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  T8["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S8 -->|calls| T8
  S9["method:UIButton::_jobs_nextToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:37"]
  T9["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S9 -->|calls| T9
  S10["method:UIButton::_jobs_isCurrentToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:53"]
  T10["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S10 -->|calls| T10
  S11["method:UIButton::_jobs_loadingPlaceholderImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:146"]
  T11["method:UIImage::_jobs_transparentPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+呼吸占位效果.swift:154"]
  S11 -->|calls| T11
  S12["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:44"]
  T12["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:154"]
  S12 -->|calls| T12
  S13["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:44"]
  T13["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  S13 -->|calls| T13
  S14["method:UIButton::byRemoveTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:84"]
  T14["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:154"]
  S14 -->|calls| T14
  S15["method:UIButton::_jobs_onTapPlaySound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:101"]
  T15["method:VideoPlayer::playToView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:201"]
  S15 -->|calls| T15
  S16["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  T16["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S16 -->|calls| T16
  S17["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  T17["method:UIButton::_jobs_onTapPlaySound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:101"]
  S17 -->|calls| T17
  S18["method:UIButton::_jobs_bindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:130"]
  T18["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S18 -->|calls| T18
  S19["method:UIButton::_jobs_unbindTapHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:154"]
  T19["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S19 -->|calls| T19
  S20["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  T20["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:77"]
  S20 -->|calls| T20
  S21["method:_JobsButtonLongPressSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:40"]
  T21["method:UIButton::jobs_invokeLongPressBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:83"]
  S21 -->|calls| T21
  S22["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T22["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:77"]
  S22 -->|calls| T22
  S23["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T23["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S23 -->|calls| T23
  S24["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T24["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  S24 -->|calls| T24
  S25["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:120"]
  T25["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
