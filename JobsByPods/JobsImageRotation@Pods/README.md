# JobsImageRotation

## 定位

`JobsImageRotation` 是基于 `JobsSwiftTimer` 的轻量旋转组件。它绑定任意 `UIView`，适合按钮前景图、时钟图标、刷新图标和状态图标，不接管按钮标题、布局或业务倒计时。

## 目录

```text
JobsImageRotation@Pods/
├── Core/
│   ├── JobsImageRotationDirection/
│   └── JobsImageRotator/
├── JobsImageRotation.podspec
└── README.md
```

当前没有资源，不创建空 `Resource`。

## 公开能力

- `JobsImageRotationDirection`：`.clockwise` 与 `.counterclockwise`，默认顺时针。
- `JobsImageRotator.defaultInterval`：默认 `1.0 / 60.0` 秒。
- `direction`：运行中可切换方向。
- `interval`：Timer tick 间隔；修改后在下一次 `start()` 时生效。
- `start()` / `pause()` / `resume()` / `stop(reset:)`：统一生命周期。

```swift
import JobsImageRotation

let rotator = JobsImageRotator(
    targetView: button.imageView ?? button,
    direction: .counterclockwise,
    interval: 1.0 / 60.0
)
rotator.start()
```

## 依赖与边界

- 直接依赖 `JobsSwiftTimer`。
- 每个 tick 固定旋转 `6°`，因此 `interval` 越小旋转越快。
- 生命周期和 UI 更新必须从主线程调用。
- `stop()` 默认恢复绑定视图创建组件时的 transform。

## 验证

```shell
ruby -c JobsImageRotation.podspec
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsImageRotation -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```
