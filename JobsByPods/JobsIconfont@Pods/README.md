# JobsIconfont

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsIconfont` 是面向 iOS 业务层的 iconfont 全功能门面。业务代码只引用框架提供的类型化资源 ID，不直接维护 iconfont URL、Unicode、字体文件名、缓存框架或失败兜底逻辑。

## 能力边界

- 远程图片：加载前立即显示本地 icon font 占位图，成功后替换，URL 错误时继续保留兜底图。
- 加载内核：复用 `JobsImageTools`，自动选择 SDWebImage、Kingfisher 或 URLSession。
- 列表复用：每个 `UIImageView` 自动取消上一次任务，并用资源 ID 防止异步回调串图。
- 缓存：统一清理 SDWebImage、Kingfisher 与 URLSession 内存缓存。
- 图标字体：框架内部注册 `.ttf`，业务只使用 `JobsIconfontGlyph`。
- 文字字体：框架内部注册阿里妈妈数智体，业务不接触 PostScript 名称。
- UIImage / UILabel / UIButton：统一由框架生成图片或配置字体。

## 适用场景

- 项目需要把 iconfont 上选定的远程图片作为运行时资源，并保留本地首帧占位和错误兜底。
- 多个页面共享同一套图标字体、文字字体和缓存策略。
- 业务代码不希望持有 CDN 地址、Unicode、PostScript 名称或具体图片加载框架。

## 目录与职责

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

## 依赖与引用

- 直接依赖 `JobsImageTools`；由它按运行环境自动选择 SDWebImage、Kingfisher 或 URLSession。
- 通过 `Podfile.deps` 的本地路径接入，安装后使用 `import JobsIconfont`。
- Pod 内动态注册字体，无需在业务工程的 `Info.plist` 维护 `UIAppFonts`。

## 最小使用

```swift
imageView.byJobsIconfont(.logo) { event in
    print(event)
}

titleLabel.byJobsIconfont(.verified, size: 28, color: .systemBlue)
copyLabel.byJobsIconfontText(size: 24)

JobsIconfont.shared.clearImageCache()
```

## 资源治理

内置 Demo 目录使用 iconfont 官方公开静态资源。来源和字体转换记录位于 `Resource/JobsIconfontCatalog.json`。框架不在 App 运行时抓取 iconfont 网页，也不依赖登录态或未公开接口。

实际业务接入新的 iconfont 项目时，应在框架内部更新资源清单和类型化枚举；业务调用保持不变。

## 验证与风险

- 修改 podspec 或资源后执行 `pod ipc spec JobsIconfont.podspec`、`pod install --no-repo-update`，并检查 `PodspecDependencyReport`。
- 远程资源仍受网络与 CDN 可用性影响；框架保证失败时保留本地兜底，不保证第三方地址永久有效。
- 字体授权、商用范围与再分发条件必须以资源清单记录的官方来源为准；替换资源时同步更新清单和 Demo。

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

通过图标语义枚举和远程资源枚举组织字体与图像资源。JobsIconfont 负责字体注册、字形转图片及远程加载，LoadToken 支持取消，UIKit 扩展提供使用入口。

### 1.2、运行脉络

选择字形或资源 → 注册字体或发起加载 → 交付图像及加载事件 → 更新控件 → 按需取消或清缓存

### 1.3、关键设计与边界

- 字形枚举、字符编码和字体文件必须配套，字体注册失败不能靠枚举名称弥补。
- 远程加载可以选择不同加载器，应保留事件和取消令牌，防止复用控件收到旧资源。
- 本地字体图标与远程图片的加载路径不同，不能全部按网络图片处理。
- 资源清单中的官方来源和许可证需保留，文档重建不改变素材授权。

### 1.4、阅读与重建顺序

先看 Glyph/RemoteAsset 与资源对应，再看字体注册、load 和 Token，最后看 UILabel、UIImageView、UIButton 的入口。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsIconfont.swift](<./Core/JobsIconfont.swift>)

依赖与编译入口：[JobsIconfont.podspec](<./JobsIconfont.podspec>)。其中显式依赖声明包括 `JobsImageTools`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
