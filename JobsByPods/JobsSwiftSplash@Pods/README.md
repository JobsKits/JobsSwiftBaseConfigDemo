# `JobsSwiftSplash`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftSplash` 是 [**Swift**](https://www.swift.org/) 开屏组件，支持图片、GIF、视频、倒计时跳过和开屏交互行为。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 内容支持本地静态图、本地 GIF、远程图片、本地视频和远程视频。
- 远程视频首次下载到 `Caches/JobsSwiftSplash`，后续直接读取本地缓存。
- 跳过按钮默认显示在安全区右上角，也可以通过 `bySkipButtonFrame` 使用指定 Frame。
- 默认没有倒计时；配置倒计时后，时间结束与用户手动点击都会执行同一套跳过行为。
- 跳过文案默认跟随系统语言，也可以通过 `.code("zh-Hans")` 等语言码固定语言。
- 点击开屏和摇一摇默认通过 `JobsSwiftOpen` 在应用内打开百度，也可以分别替换成自定义闭包或关闭行为。
- `JobsSplashPreferences.isEnabledForNextLaunch` 持久化记录下次启动是否展示开屏，首次使用默认为开启。

## 二、接入示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsSwiftSplash
import JobsSwiftOpen

let configuration = JobsSplashConfiguration(
    content: .localImage(name: "Splash")
)
.byCountdownSeconds(5)
.byLanguage(.system)
.bySkipButtonVisible(true)
.byTapAction(.open(JobsOpenConfiguration()))
.byShakeAction(.open(JobsOpenConfiguration().byMode(.externalBrowser)))
.bySkip { _ in
    print("进入首页")
}

JobsSplashPresenter.show(over: homeViewController, configuration: configuration)
```

`JobsSplashPresenter` 把开屏作为首页的子控制器覆盖展示。点击跳过或倒计时结束后，开屏会被移除，原首页自然显露。

## 三、内容配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
.localImage(name: "Splash")
.localGIF(name: "SplashAnimation")
.remoteImage(URL(string: "https://example.com/splash.jpg")!)
.localVideo(name: "SplashVideo", fileExtension: "mp4")
.remoteVideo(URL(string: "https://example.com/splash.mp4")!)
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
