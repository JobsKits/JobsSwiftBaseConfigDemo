# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:InitCrashHandling<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:99"]
  T1["function:InitCrashReporter<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:72"]
  S1 -->|calls| T1
  S2["function:InitCrashHandling<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:99"]
  T2["function:InitObjCUEHandler<br/>TODO/Unity/xcode_effectTest/Classes/CrashReporter.mm:92"]
  S2 -->|calls| T2
  S3["function:UnityRegisterAppDelegateListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/AppDelegateListener.mm:14"]
  T3["function:UnityRegisterLifeCycleListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/LifeCycleListener.mm:7"]
  S3 -->|calls| T3
  S4["function:UnityUnregisterAppDelegateListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/AppDelegateListener.mm:41"]
  T4["function:UnityUnregisterLifeCycleListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/LifeCycleListener.mm:29"]
  S4 -->|calls| T4
  S5["method:RenderPluginDelegate::mainDisplayInited:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/RenderPluginDelegate.mm:5"]
  T5["function:UnityRegisterLifeCycleListener<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/LifeCycleListener.mm:7"]
  S5 -->|calls| T5
  S6["method:UnityViewControllerNotificationsDefaultSender::onViewWillLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:50"]
  T6["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S6 -->|calls| T6
  S7["method:UnityViewControllerNotificationsDefaultSender::onViewDidLayoutSubviews<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:55"]
  T7["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S7 -->|calls| T7
  S8["method:UnityViewControllerNotificationsDefaultSender::onViewDidDisappear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:60"]
  T8["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S8 -->|calls| T8
  S9["method:UnityViewControllerNotificationsDefaultSender::onViewWillDisappear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:65"]
  T9["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S9 -->|calls| T9
  S10["method:UnityViewControllerNotificationsDefaultSender::onViewDidAppear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:70"]
  T10["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S10 -->|calls| T10
  S11["method:UnityViewControllerNotificationsDefaultSender::onViewWillAppear:<br/>TODO/Unity/xcode_effectTest/Classes/PluginBase/UnityViewControllerListener.mm:75"]
  T11["function:AppController_SendUnityViewControllerNotification<br/>TODO/Unity/xcode_effectTest/Classes/UnityAppController.mm:598"]
  S11 -->|calls| T11
  S12["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:25"]
  T12["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:25"]
  S12 -->|calls| T12
  S13["function:QuatScale<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:43"]
  T13["function:QuatMake<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:32"]
  S13 -->|calls| T13
  S14["function:QuatConjugate<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:53"]
  T14["function:QuatMake<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:32"]
  S14 -->|calls| T14
  S15["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  T15["function:QuatScale<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:43"]
  S15 -->|calls| T15
  S16["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  T16["function:QuatConjugate<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:53"]
  S16 -->|calls| T16
  S17["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  T17["function:QuatNormSquared<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:48"]
  S17 -->|calls| T17
  S18["function:QuatToEuler<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:63"]
  T18["function:VecMake<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:18"]
  S18 -->|calls| T18
  S19["function:QuatNorm<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:73"]
  T19["function:QuatNormSquared<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:48"]
  S19 -->|calls| T19
  S20["function:QuatNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:78"]
  T20["function:QuatScale<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:43"]
  S20 -->|calls| T20
  S21["function:QuatNormalize<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:78"]
  T21["function:QuatNorm<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:73"]
  S21 -->|calls| T21
  S22["function:QuatDifference<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:83"]
  T22["function:QuatMultiply<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:25"]
  S22 -->|calls| T22
  S23["function:QuatDifference<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:83"]
  T23["function:QuatInverse<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:58"]
  S23 -->|calls| T23
  S24["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T24["function:VecMagnitude<br/>TODO/Unity/xcode_effectTest/Classes/Vector3.h:13"]
  S24 -->|calls| T24
  S25["function:QuatRotationFromTo<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:88"]
  T25["function:QuatIdentity<br/>TODO/Unity/xcode_effectTest/Classes/Quaternion4.h:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
