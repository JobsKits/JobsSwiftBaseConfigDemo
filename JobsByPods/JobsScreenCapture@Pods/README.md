# `JobsScreenCapture`

## 定位

`JobsScreenCapture` 是 Swift 工程的本地 Pod，统一承载三类能力：

- 主动渲染当前 `UIView` / `UIWindow` 并把截图保存到系统相册。
- 监听 `UIApplication.userDidTakeScreenshotNotification`，在截屏完成后回调业务层。
- 通过 `JobsScreenshotProtectionView` 承载敏感 UI，使其进入系统安全文本渲染容器，降低截图泄露风险。

系统的截屏通知发生在截图完成之后，因此“截屏提示”和“敏感内容保护”是两个独立方向，不能互相替代。

## 目录

```text
JobsScreenCapture@Pods/
├── Core/
│   ├── JobsScreenshotCapturer/
│   ├── JobsScreenshotObserver/
│   └── JobsScreenshotProtectionView/
├── JobsScreenCapture.podspec
└── README.md
```

`Core` 只放公开 Swift 源码；当前没有资源，不创建空 `Resource`。

## 公开能力

- `JobsScreenshotCapturer`：主动截取指定视图，并按相册添加权限保存图片。
- `JobsScreenshotObserver`：开始、停止监听截屏完成通知。
- `JobsScreenshotProtectionView`：提供 `contentView` 作为敏感 UI 容器，并支持运行时开关保护。

## 依赖与引用

- 系统框架：`Photos`、`UIKit`
- Pod：`SnapKit`

```swift
import JobsScreenCapture
```

## 风险边界

- iOS 没有公开 API 可禁止用户按下系统截屏组合键。
- 程序主动截屏不会触发 `UIApplication.userDidTakeScreenshotNotification`，调用方应把它与物理按键截屏分开反馈。
- 宿主 App 必须提供非空的 `NSPhotoLibraryAddUsageDescription`；用户拒绝相册添加权限时返回明确错误，不伪报保存成功。
- `JobsScreenshotProtectionView` 依赖系统安全文本渲染层的现有行为，应在目标 iOS 版本和真机上回归截图结果。
- 若系统内部视图结构无法识别，`isProtectionAvailable` 会返回 `false`，内容退回普通容器显示，不伪报已保护。

## 验证

```shell
ruby -c JobsScreenCapture.podspec
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsScreenCapture -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。
