# `JobsIconfont`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">JobsIconfont</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsIconfont` 是面向 iOS 业务层的 iconfont 全功能门面。业务代码只引用框架提供的类型化资源 ID，不直接维护 iconfont URL、Unicode、字体文件名、缓存框架或失败兜底逻辑。

## 能力边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 远程图片：加载前立即显示本地 icon font 占位图，成功后替换，URL 错误时继续保留兜底图。
- 加载内核：复用 `JobsImageTools`，自动选择 SDWebImage、Kingfisher 或 URLSession。
- 列表复用：每个 `UIImageView` 自动取消上一次任务，并用独立绑定代次防止异步回调串图。
- 缓存：统一清理 SDWebImage、Kingfisher 与 URLSession 内存缓存。
- 图标字体：框架内部注册 `.ttf`，业务只使用 `JobsIconfontGlyph`。
- 文字字体：框架内部注册阿里妈妈数智体，业务不接触 PostScript 名称。
- UIImage / UILabel / UIButton：统一由框架生成图片或配置字体。

## 适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 项目需要把 iconfont 上选定的远程图片作为运行时资源，并保留本地首帧占位和错误兜底。
- 多个页面共享同一套图标字体、文字字体和缓存策略。
- 业务代码不希望持有 CDN 地址、Unicode、PostScript 名称或具体图片加载框架。

## 目录与职责 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsIconfont@Pods
├── Core/JobsIconfont.swift        # 公开门面、语义类型、加载与 UIKit 链式入口
├── Resource/                     # 本地字体、资源来源与校验信息
├── JobsIconfont.podspec          # 源码、资源 bundle 和依赖声明
└── README.md
```

- `Core` 是唯一代码入口；公开层只暴露语义枚举、字体 / 图片输出与加载事件。
- `Resource` 只保存框架内置资源和治理清单，不由业务层直接读取。
- URL、Unicode、字体内部名称、资源 bundle 查找与加载器映射均为私有实现。

## 依赖与引用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 直接依赖 `JobsImageTools`；由它按运行环境自动选择 SDWebImage、Kingfisher 或 URLSession。
- 通过 `Podfile.deps` 的本地路径接入，安装后使用 `import JobsIconfont`。
- Pod 内动态注册字体，无需在业务工程的 `Info.plist` 维护 `UIAppFonts`。

## 最小使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
imageView.byJobsIconfont(.logo) { event in
    print(event)
}

titleLabel.byJobsIconfont(.verified, size: 28, color: .systemBlue)
copyLabel.byJobsIconfontText(size: 24)

JobsIconfont.shared.clearImageCache()
```

## 资源治理 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

内置 Demo 目录使用 iconfont 官方公开静态资源。来源和字体转换记录位于 `Resource/JobsIconfontCatalog.json`。框架不在 App 运行时抓取 iconfont 网页，也不依赖登录态或未公开接口。

实际业务接入新的 iconfont 项目时，应在框架内部更新资源清单和类型化枚举；业务调用保持不变。

## 验证与风险 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 修改 podspec 或资源后执行 `pod ipc spec JobsIconfont.podspec`、`pod install --no-repo-update`，并检查 `PodspecDependencyReport`。
- 远程资源仍受网络与 CDN 可用性影响；框架保证失败时保留本地兜底，不保证第三方地址永久有效。
- 字体授权、商用范围与再分发条件必须以资源清单记录的官方来源为准；替换资源时同步更新清单和 Demo。

## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

通过图标语义枚举和远程资源枚举组织字体与图像资源。JobsIconfont 负责字体注册、字形转图片及远程加载，LoadToken 支持取消，UIKit 扩展提供使用入口。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

选择字形或资源 → 注册字体或发起加载 → 交付图像及加载事件 → 更新控件 → 按需取消或清缓存

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 字形枚举、字符编码和字体文件必须配套，字体注册失败不能靠枚举名称弥补。
- 远程加载可以选择不同加载器，应保留事件和取消令牌，防止复用控件收到旧资源。
- 本地字体图标与远程图片的加载路径不同，不能全部按网络图片处理。
- 资源清单中的官方来源和许可证需保留，文档重建不改变素材授权。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Glyph/RemoteAsset 与资源对应，再看字体注册、load 和 Token，最后看 UILabel、UIImageView、UIButton 的入口。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsIconfont.swift](<./Core/JobsIconfont.swift>)

依赖与编译入口：[JobsIconfont.podspec](<./JobsIconfont.podspec>)。其中显式依赖声明包括 `JobsImageTools`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

每次向 UIImageView 绑定资源都生成独立代次，包括重复加载同一个素材；旧请求即使迟到也不能回填新绑定。取消令牌采用线程安全的一次性取消。加载先显示本地字体图标，失败继续保留本地兜底；业务根据 event 区分 placeholder、success 和 failure。

目标尺寸需有限且大于零；非法值回退为 96×96，字体图标画布上限 1024×1024 点。UI 绑定、取消与图标渲染在主线程；字体和素材 ID 仍使用 Pod 随包资源，不依赖运行时外链补齐。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsIconfont --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
