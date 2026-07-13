# `JobsMarqueeView`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

## 一、简介

* 定时器核心依托于 [<font size=5>**`JobsSwiftTimer`**</font>](https://github.com/JobsKits/JobsSwiftTimer)
* 显示的UI为**UIButton** ➤ 充分利用**UIButton**自带的：
  * 主标题/副标题/前景图/背景图/点击事件（可续）/长按事件（可续）
  * 按钮图片支持2种获取模式 ➤ 本地图片 / 网络图片（[**Kingfisher**](https://github.com/onevcat/Kingfisher) / [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)）
* 支持**轮播图**和**跑马灯**2种常见的UI业务场景
  * 轮播图 ➤ 间隔滚动
  * 跑马灯 ➤ 连续滚动
* 支持设置滚动方向 ➤ 上/下/左/右
* 支持手势拖拽后定时器继续计时
* 支持**`UIPageControl`**
  * 【当前 / 其他】背景图支持2种获取模式 ➤ 本地图片 / 网络图片（[**Kingfisher**](https://github.com/onevcat/Kingfisher) / [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)）
  * 支持定义**`UIPageControl`**与**`JobsMarqueeView`**的位置 ➤ 左下/底部/右下

## 二、相关配置属性

### 1、滚动方向

```swift
.byDirection(.bottom)
```

```swift
public enum JobsDirection: UInt {
    case top,   /// 上面
         bottom,/// 下面
         left,  /// 左边
         right  /// 右边
    public var isHorizontal: Bool {
        switch self {
        case .top, .bottom: return false
        case .left, .right: return true
        }
    }
    /// 是否垂直方向（与 isHorizontal 语义对称）
    public var isVertical: Bool {
        switch self {
        case .top, .bottom: return true
        case .left, .right: return false
        }
    }
}
```

### 2、滚动模式

```swift
.byScrollMode(.frequency(interval: 1.0))
```

```swift
/// 滚动模式
public enum ScrollMode {
    /// 按频率滚动（间隔滚动）：interval = 每次触发时间（秒）
    case frequency(interval: TimeInterval)
    /// 一直滚动（连续滚动）：speed = 每秒滚动的点数（pt/s）
    case continuous(speed: CGFloat)
}
```

### 3、**item** 尺寸模式

```swift
.byItemSizeMode(.fillBounds)
```

```swift
/// item 尺寸模式
/// - fitContent: 使用按钮本身内容尺寸（跑马灯）
/// - fillBounds: 每个按钮尺寸 = JobsMarqueeView 的宽/高（轮播图）
public enum ItemSizeMode {
    case fitContent
    case fillBounds
}
```

### 4、数据源配置

```swift
.byDataSourceButtons([ 
  UIButton.sys()...]
```

### 5、<font color=red>内容可视化区域配置</font>

* 执行**`UIButton`**方面的配置即可

## 三、初始化方案

### 1、跑马灯

* 连续滚动（**向上**）

  ```swift
  import JobsSwiftBaseDefines

  private lazy var upContinuousMarquee: JobsMarqueeView = { [unowned self] in
          JobsMarqueeView()
              .byDirection(.top)
              .byScrollMode(.continuous(speed: 40))
              .byItemSizeMode(.fitContent)   // 典型公告跑马灯
              .byDataSourceButtons([
                  UIButton.sys()
                      .byBackgroundColor(JobsCor.systemYellow.withAlphaComponent(0.2))
                      .byTitle("向上连续 · 公告 1")
                      .byTitleColor(JobsCor.label)
                      .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                      .bySubTitle("更多内容 1")
                      .bySubTitleColor(JobsCor.secondaryLabel)
                      .bySubTitleFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
                      .byImage("megaphone.fill".sysImg)
                      .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                      .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔔 向上连续 · 公告 1 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          sender.title?.toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byBackgroundColor(JobsCor.systemYellow.withAlphaComponent(0.2))
                      .byTitle("向上连续 · 公告 2")
                      .byTitleColor(JobsCor.label)
                      .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                      .bySubTitle("更多内容 2")
                      .bySubTitleColor(JobsCor.secondaryLabel)
                      .bySubTitleFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
                      .byImage("megaphone.fill".sysImg)
                      .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                      .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔔 向上连续 · 公告 2 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          sender.title?.toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byBackgroundColor(JobsCor.systemYellow.withAlphaComponent(0.2))
                      .byTitle("向上连续 · 公告 3")
                      .byTitleColor(JobsCor.label)
                      .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                      .bySubTitle("更多内容 3")
                      .bySubTitleColor(JobsCor.secondaryLabel)
                      .bySubTitleFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
                      .byImage("megaphone.fill".sysImg)
                      .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                      .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔔 向上连续 · 公告 3 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          sender.title?.toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      }
              ])
              .byBackgroundColor(.randomColor)
              .byAddTo(self.scrollView) { [unowned self] make in
                  if #available(iOS 11.0, *) {
                      make.top.equalTo(self.scrollView.contentLayoutGuide.snp.top).offset(10)
                      make.left.equalTo(self.scrollView.frameLayoutGuide.snp.left).offset(self.horizontalInset)
                      make.right.equalTo(self.scrollView.frameLayoutGuide.snp.right).inset(self.horizontalInset)
                  } else {
                      make.top.equalTo(self.scrollView.snp.top).offset(10)
                      make.left.equalTo(self.scrollView).offset(self.horizontalInset)
                      make.right.equalTo(self.scrollView).inset(self.horizontalInset)
                  }
                  make.height.equalTo(self.marqueeHeight)
              }
      }()
  ```

* 间隔滚动（**向上**）

  ```swift
  import JobsSwiftBaseDefines

  private lazy var upFrequencyMarquee: JobsMarqueeView = { [unowned self] in
          JobsMarqueeView()
              .byDirection(.top)
              .byScrollMode(.frequency(interval: 1.0))
              .byItemSizeMode(.fillBounds)   // 每页 1 行
              .byDataSourceButtons([
                  UIButton.sys()
                      .byBackgroundColor(JobsCor.systemBlue.withAlphaComponent(0.2))
                      .byTitle("向上间隔 · 公告 1")
                      .byTitleColor(JobsCor.label)
                      .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                      .bySubTitle("每 1 秒翻页")
                      .bySubTitleColor(JobsCor.secondaryLabel)
                      .bySubTitleFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
                      .byImage("arrow.up.square.fill".sysImg)
                      .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                      .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔔 向上间隔 · 公告 1 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          sender.title?.toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byBackgroundColor(JobsCor.systemBlue.withAlphaComponent(0.2))
                      .byTitle("向上间隔 · 公告 2")
                      .byTitleColor(JobsCor.label)
                      .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                      .bySubTitle("每 1 秒翻页")
                      .bySubTitleColor(JobsCor.secondaryLabel)
                      .bySubTitleFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
                      .byImage("arrow.up.square.fill".sysImg)
                      .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                      .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔔 向上间隔 · 公告 2 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          sender.title?.toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byBackgroundColor(JobsCor.systemBlue.withAlphaComponent(0.2))
                      .byTitle("向上间隔 · 公告 3")
                      .byTitleColor(JobsCor.label)
                      .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                      .bySubTitle("每 1 秒翻页")
                      .bySubTitleColor(JobsCor.secondaryLabel)
                      .bySubTitleFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
                      .byImage("arrow.up.square.fill".sysImg)
                      .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                      .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔔 向上间隔 · 公告 3 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          sender.title?.toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      }
              ])
              .byBackgroundColor(.randomColor)
              .byAddTo(self.scrollView) { [unowned self] make in
                  make.top.equalTo(self.rightContinuousMarquee.snp.bottom).offset(self.verticalSpacing * 2)
                  make.left.right.height.equalTo(self.upContinuousMarquee)
              }
      }()
  ```

### 2、轮播图

* 本地@背景图

  ```swift
  import JobsSwiftBaseDefines

  private lazy var localImageButtonsMarquee: JobsMarqueeView = {  [unowned self] in
          JobsMarqueeView()
              .byDirection(.left)
              .byScrollMode(.frequency(interval: 1.0))
              .byItemSizeMode(.fillBounds)
              .byManualScrollEnabled(true)   // ✅ 开启手动拖拽
              .byDataSourceButtons([
                  UIButton.sys()
                      .byImage("唐老鸭".img)
                      .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 极端 本地图 · 唐老鸭 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了唐老鸭".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byImage("米老鼠".img)
                      .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 极端 本地图 · 米老鼠 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了米老鼠".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byImage("迪斯尼".img)
                      .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 极端 本地图 · 迪斯尼 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了迪斯尼".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      }
              ])
              .byBackgroundColor(.randomColor)
              .byAddTo(self.scrollView) { [unowned self] make in
                  make.top.equalTo(self.twoButtonsMarquee.snp.bottom).offset(self.verticalSpacing)
                  make.left.right.height.equalTo(self.upContinuousMarquee)
              }
              .then { v in
  //                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
  //                v.pageControlPosition = .leftBottom
                  v.pageControlPosition = .rightBottom
                  v.isPageControlEnabled = true
                  v.pageControl.jobs_setIndicatorImageURLs(
                      normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                      currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                      fallbackNormal: "circle".sysImg,
                      fallbackCurrent: "circle.fill".sysImg
                  )
              }
      }()
  ```

* [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)@背景图

  ```swift
  import JobsSwiftBaseDefines

  private lazy var sdWebImageButtonsMarquee: JobsMarqueeView = { [unowned self] in
          JobsMarqueeView()
              .byDirection(.left)
              .byScrollMode(.frequency(interval: 1.0))
              .byItemSizeMode(.fillBounds)
              .byManualScrollEnabled(true)   // ✅ 开启手动拖拽
              .byDataSourceButtons([
                  UIButton.sys()
                      .byBorderColor(JobsCor.systemGray3)
                      .byTitle("我是UIButton主标题@SDWebImage")
                      .bySubTitle("我是UIButton副标题@SDWebImage")
                      .sd_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                      .sd_placeholderImage(nil)
                      .sd_options([.retryFailed, .highPriority, .scaleDownLargeImages])
                      .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 SDWebImage@背景图 1 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了SDWebImage@背景图".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byBorderColor(JobsCor.systemGray3)
                      .byTitle("我是UIButton主标题@SDWebImage")
                      .bySubTitle("我是UIButton副标题@SDWebImage")
                      .sd_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                      .sd_placeholderImage(nil)
                      .sd_options([.retryFailed, .highPriority, .scaleDownLargeImages])
                      .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 SDWebImage@背景图 2 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了SDWebImage@背景图".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byBorderColor(JobsCor.systemGray3)
                      .byTitle("我是UIButton主标题@SDWebImage")
                      .bySubTitle("我是UIButton副标题@SDWebImage")
                      .sd_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                      .sd_placeholderImage(nil)
                      .sd_options([.retryFailed, .highPriority, .scaleDownLargeImages])
                      .sd_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 SDWebImage@背景图 3 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了SDWebImage@背景图".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      }
              ])
              .byBackgroundColor(.randomColor)
              .byAddTo(self.scrollView) { [unowned self] make in
                  make.top.equalTo(self.localImageButtonsMarquee.snp.bottom).offset(self.verticalSpacing)
                  make.left.right.height.equalTo(self.upContinuousMarquee)
              }
              .then { v in
  //                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
  //                v.pageControlPosition = .leftBottom
                  v.pageControlPosition = .rightBottom
                  v.isPageControlEnabled = true
                  v.pageControl.jobs_setIndicatorImageURLs(
                      normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                      currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                      fallbackNormal: "circle".sysImg,
                      fallbackCurrent: "circle.fill".sysImg
                  )
              }
              .then { v in
  //                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
  //                v.pageControlPosition = .leftBottom
                  v.pageControlPosition = .rightBottom
                  v.isPageControlEnabled = true
                  v.pageControl.jobs_setIndicatorImageURLs(
                      normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                      currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                      fallbackNormal: "circle".sysImg,
                      fallbackCurrent: "circle.fill".sysImg
                  )
              }
      }()

* [**Kingfisher**](https://github.com/onevcat/Kingfisher)@背景图

  ```swift
  import JobsSwiftBaseDefines

  private lazy var kingfisherImageButtonsMarquee: JobsMarqueeView = { [unowned self] in
          JobsMarqueeView()
              .byDirection(.left)
              .byScrollMode(.frequency(interval: 1.0))
              .byItemSizeMode(.fillBounds)
              .byManualScrollEnabled(true)   // ✅ 开启手动拖拽
              .byDataSourceButtons ([
                  UIButton.sys()
                      .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(JobsCor.red)
                      .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(JobsCor.yellow)
                      .kf_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                      .kf_placeholderImage("唐老鸭".img)
                      .kf_options([
                          .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                          .scaleFactor(UIScreen.main.scale),
                          .cacheOriginalImage,
                          .transition(.fade(0.25)),
                          .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
                      ])
                      .kf_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 Kingfisher@背景图 1 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了Kingfisher@背景图".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(JobsCor.red)
                      .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(JobsCor.yellow)
                      .kf_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                      .kf_placeholderImage("唐老鸭".img)
                      .kf_options([
                          .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                          .scaleFactor(UIScreen.main.scale),
                          .cacheOriginalImage,
                          .transition(.fade(0.25)),
                          .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
                      ])
                      .kf_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 Kingfisher@背景图 2 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了Kingfisher@背景图".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
                  UIButton.sys()
                      .byTitle("我是UIButton主标题@Kingfisher").byTitleColor(JobsCor.red)
                      .bySubTitle("我是UIButton副标题@Kingfisher").bySubTitleColor(JobsCor.yellow)
                      .kf_imageURL("https://picsum.photos/" + ScreenWidth().toString(0) + "/" + self.marqueeHeight.toString(0))
                      .kf_placeholderImage("唐老鸭".img)
                      .kf_options([
                          .processor(DownsamplingImageProcessor(size: CGSize(width: 500, height: 200))),
                          .scaleFactor(UIScreen.main.scale),
                          .cacheOriginalImage,
                          .transition(.fade(0.25)),
                          .retryStrategy(DelayRetryStrategy(maxRetryCount: 2, retryInterval: .seconds(1)))
                      ])
                      .kf_bgNormalLoad()// 之前是配置项，这里才是真正决定渲染背景图/前景图
                      .byTapSound("Sound.wav")
                      .onTap { sender in
                          print("🔴 Kingfisher@背景图 3 tapped, selected=\(sender.jobs_effectiveState == .selected)")
                          "点击了Kingfisher@背景图".toast
                      }
                      .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                          if gr.state == .began {
                              btn.byAlpha(0.6)
                              print("长按开始 on \(btn)")
                          } else if gr.state == .ended || gr.state == .cancelled {
                              btn.byAlpha(1.0)
                              print("长按结束")
                          }
                      },
              ])
              .byBackgroundColor(.randomColor)
              .byAddTo(self.scrollView) { [unowned self] make in
                  make.top.equalTo(self.sdWebImageButtonsMarquee.snp.bottom).offset(self.verticalSpacing)
                  make.left.right.height.equalTo(self.upContinuousMarquee)
                  // 🔚 最后一条封底，决定 scrollView.contentSize.height
                  if #available(iOS 11.0, *) {
                      make.bottom.equalTo(self.scrollView.contentLayoutGuide.snp.bottom).inset(20)
                  } else {
                      make.bottom.equalTo(self.scrollView.snp.bottom).inset(20)
                  }
              }
              .then { v in
  //                v.pageControlPosition = .bottomCenter   // 默认（不写也行）
  //                v.pageControlPosition = .leftBottom
                  v.pageControlPosition = .rightBottom
                  v.isPageControlEnabled = true
                  v.pageControl.jobs_setIndicatorImageURLs(
                      normalURL: URL(string: "https://picsum.photos/seed/dot_normal/18/18"),
                      currentURL: URL(string: "https://picsum.photos/seed/dot_current/18/18"),
                      fallbackNormal: "circle".sysImg,
                      fallbackCurrent: "circle.fill".sysImg
                  )
              }
      }()
  ```
