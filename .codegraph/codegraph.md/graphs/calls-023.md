# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  T1["method:TaskCenter::tags<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:132"]
  S1 -->|calls| T1
  S2["class:TaskCenter<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:39"]
  T2["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S2 -->|calls| T2
  S3["class:TaskCenter<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:39"]
  T3["method:NSLocking::withLock<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:56"]
  S3 -->|calls| T3
  S4["method:TaskCenter::removeAll<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:162"]
  T4["method:NSLocking::withLockVoid<br/>TODO/TaskCenterComponent/Schedule/Extensions.swift:63"]
  S4 -->|calls| T4
  S5["method:TaskCenter::suspend<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:170"]
  T5["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S5 -->|calls| T5
  S6["method:TaskCenter::resume<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:175"]
  T6["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S6 -->|calls| T6
  S7["method:TaskCenter::cancel<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:180"]
  T7["method:TaskCenter::tasks<br/>TODO/TaskCenterComponent/Schedule/TaskCenter.swift:141"]
  S7 -->|calls| T7
  S8["method:TaskCenterComponent::createRunLoppTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:22"]
  T8["method:TaskCenterComponent::createRunLoopTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:14"]
  S8 -->|calls| T8
  S9["method:TaskCenterComponent::createTimerTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:38"]
  T9["method:TaskCenterComponent::createTimerTask<br/>TODO/TaskCenterComponent/TaskCenterComponent.swift:38"]
  S9 -->|calls| T9
  S10["function:InitCrashReporter<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:72"]
  T10["function:SavePendingCrashReport<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:22"]
  S10 -->|calls| T10
  S11["function:InitCrashHandling<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:99"]
  T11["function:InitCrashReporter<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:72"]
  S11 -->|calls| T11
  S12["function:InitCrashHandling<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:99"]
  T12["function:InitObjCUEHandler<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:92"]
  S12 -->|calls| T12
  S13["function:UnityRegisterAppDelegateListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/AppDelegateListener.mm:14"]
  T13["function:UnityRegisterLifeCycleListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/LifeCycleListener.mm:7"]
  S13 -->|calls| T13
  S14["function:UnityUnregisterAppDelegateListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/AppDelegateListener.mm:41"]
  T14["function:UnityUnregisterLifeCycleListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/LifeCycleListener.mm:29"]
  S14 -->|calls| T14
  S15["method:RenderPluginDelegate::mainDisplayInited:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/RenderPluginDelegate.mm:5"]
  T15["function:UnityRegisterLifeCycleListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/LifeCycleListener.mm:7"]
  S15 -->|calls| T15
  S16["method:UnityViewControllerNotificationsDefaultSender::onViewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:50"]
  T16["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S16 -->|calls| T16
  S17["method:UnityViewControllerNotificationsDefaultSender::onViewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:55"]
  T17["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S17 -->|calls| T17
  S18["method:UnityViewControllerNotificationsDefaultSender::onViewDidDisappear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:60"]
  T18["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S18 -->|calls| T18
  S19["method:UnityViewControllerNotificationsDefaultSender::onViewWillDisappear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:65"]
  T19["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S19 -->|calls| T19
  S20["method:UnityViewControllerNotificationsDefaultSender::onViewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:70"]
  T20["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S20 -->|calls| T20
  S21["method:UnityViewControllerNotificationsDefaultSender::onViewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:75"]
  T21["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S21 -->|calls| T21
  S22["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:25"]
  T22["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:25"]
  S22 -->|calls| T22
  S23["function:QuatScale<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:43"]
  T23["function:QuatMake<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:32"]
  S23 -->|calls| T23
  S24["function:QuatConjugate<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:53"]
  T24["function:QuatMake<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:32"]
  S24 -->|calls| T24
  S25["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  T25["function:QuatScale<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
