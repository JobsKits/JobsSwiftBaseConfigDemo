# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UICollectionViewCell::bySelected<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:78"]
  T1["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S1 -->|calls| T1
  S2["method:UICollectionViewCell::byHighlighted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:92"]
  T2["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S2 -->|calls| T2
  S3["method:UICollectionViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:106"]
  T3["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S3 -->|calls| T3
  S4["method:UICollectionViewCell::byBackgroundConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:120"]
  T4["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S4 -->|calls| T4
  S5["method:UICollectionViewCell::byListContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:140"]
  T5["method:UICollectionViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:106"]
  S5 -->|calls| T5
  S6["method:UICollectionViewCell::byListBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:154"]
  T6["method:UICollectionViewCell::byBackgroundConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:120"]
  S6 -->|calls| T6
  S7["method:UICollectionViewCell::byListBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:154"]
  T7["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S7 -->|calls| T7
  S8["method:UIControl::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:196"]
  T8["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S8 -->|calls| T8
  S9["method:UIControl::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:203"]
  T9["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S9 -->|calls| T9
  S10["method:UIControl::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:203"]
  T10["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S10 -->|calls| T10
  S11["method:UIControl::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:203"]
  T11["method:UIControl::_JobsActionTrampoline::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:144"]
  S11 -->|calls| T11
  S12["method:UIControl::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:228"]
  T12["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S12 -->|calls| T12
  S13["method:UIControl::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:228"]
  T13["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S13 -->|calls| T13
  S14["method:UIControl::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:228"]
  T14["method:UIControl::_JobsActionTrampoline::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:144"]
  S14 -->|calls| T14
  S15["method:UIControl::byRemoveAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:250"]
  T15["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S15 -->|calls| T15
  S16["method:UIControl::byRemoveAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:256"]
  T16["method:JobsTask::removeAction<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:134"]
  S16 -->|calls| T16
  S17["method:UIControl::byOn<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:262"]
  T17["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S17 -->|calls| T17
  S18["method:UIControl::byOnPrimaryAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:271"]
  T18["method:UIControl::byOn<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIControl/UIControl+DSL.swift:262"]
  S18 -->|calls| T18
  S19["method:UIDocumentPickerViewController::jobs_opening<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:22"]
  T19["method:UIDocumentPickerViewController::byShouldShowFileExtensions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:87"]
  S19 -->|calls| T19
  S20["method:UIDocumentPickerViewController::jobs_opening<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:22"]
  T20["method:UIDocumentPickerViewController::byAllowsMultipleSelection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:82"]
  S20 -->|calls| T20
  S21["method:UIDocumentPickerViewController::jobs_openXLSX<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:34"]
  T21["method:UIDocumentPickerViewController::jobs_opening<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:22"]
  S21 -->|calls| T21
  S22["method:UIDocumentPickerViewController::jobs_openSpreadsheet<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:48"]
  T22["method:UIDocumentPickerViewController::jobs_opening<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:22"]
  S22 -->|calls| T22
  S23["method:UIDocumentPickerViewController::jobs_exporting<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:63"]
  T23["method:UIDocumentPickerViewController::byShouldShowFileExtensions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIDocumentPickerViewController/UIDocumentPickerViewController+DSL.swift:87"]
  S23 -->|calls| T23
  S24["method:UIFont::DINAlternate::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:18"]
  T24["method:UIFont::DINAlternate::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:22"]
  S24 -->|calls| T24
  S25["method:UIFont::DINPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:30"]
  T25["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
