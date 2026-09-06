# `JobsAppDoor`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsAppDoor` 是 [**Swift**](https://www.swift.org/) 登录、注册与找回密码模板 Pod，与 OC 侧成熟版保持同一功能语义和动效语言。

## 一、能力边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 提供登录、注册、找回密码三种模式。
- 注册支持可选手机号、国家区号、短信倒计时和图形验证码。
- 背景支持静态图与本地循环视频；视频页右上角可展开竖向音量滑杆，显示实时百分比并支持上下拖动。
- 登录态的“记住我 / 忘记密码”固定横排单行显示，在线客服按钮使用胶囊圆角与独立客服图标。
- `JobsAppDoorVC` 是单面板左右换轨风格，切换时长为 `0.7s`。
- `JobsAppDoorStyle2VC` 是独立卡片横向弹簧风格，切换时长为 `2s`。
- 页面全屏隐藏导航栏，键盘弹出时会自动上移表单。

## 二、快速接入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```ruby
pod 'JobsAppDoor', :path => 'JobsByPods/JobsAppDoor@Pods'
```

```swift
import JobsAppDoor

let controller = JobsAppDoorVC(configuration: .fullConfig)
controller.submitHandler = { mode, values in
    print(mode, values)
}
controller.byPush(self)
```

Style2 只需替换控制器类型：

```swift
let controller = JobsAppDoorStyle2VC(configuration: .fullConfig)
controller.byPush(self)
```

## 三、配置与回调 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsAppDoorConfig.defaultConfig` 使用图片背景与基础注册字段；`JobsAppDoorConfig.fullConfig` 使用视频背景，并开启手机绑定与图形验证码。

```swift
controller.submitHandler = { mode, values in }
controller.homeHandler = { }
controller.customerServiceHandler = { }
controller.verificationCodeHandler = { values in }
```

`JobsAppDoorFormValues` 一次性返回用户名、密码、手机号、国码、短信码、图形验证码和“记住我”状态。

## 四、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsAppDoor@Pods
├── Core
│   ├── 登录注册模块公共件
│   ├── JobsAppDoorStyle1
│   └── JobsAppDoorStyle2
├── Resource
│   ├── AppDoor.xcassets
│   ├── Images
│   ├── Videos
│   └── *.lproj
├── JobsAppDoor.podspec
└── README.md
```

## 五、资源与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`Resource` 复用 JobsAppDoor OC 版已确认的图标、Logo、背景和双机型视频，并提供中文简体、英文和塔加洛语本地化。依赖更新后应分别编译 `JobsAppDoor` Scheme 和主工程 Scheme。

`JobsAppDoor.podspec` 通过同名 `Core`、`Resource` subspec 映射真实目录，确保 Swift 与 OC 在 Xcode 的 `Development Pods` 中都按 `Core / Resource / Pod / Support Files` 展开，不再把资源和源码平铺到 Pod 根层。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsCor.systemBackground` / `JobsCor.secondarySystemBackground`，正文、说明和占位文字使用 `JobsCor.label` / `JobsCor.secondaryLabel` / `JobsCor.placeholderText`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer` 或自绘上下文时，需要在主题 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分

将登录、注册、找回密码分成公共表单能力和两种页面样式。公共层维护字段、表单值、模式与资源；Style1 通过侧轨和面板切换，Style2 通过独立表单卡片切换，组合倒计时、图形验证码和国家区号组件。

### 6.2、运行脉络

选择页面样式 → 配置表单与事件 → 输入或切换模式 → 交付表单值 → 宿主完成认证并更新界面

下图用于说明主要关系；异常、退出与线程边界结合下一节阅读。

```mermaid
flowchart LR
    A["配置与公共表单"] --> B{"选择样式"}
    B --> C["Style1 侧轨面板"]
    B --> D["Style2 独立卡片"]
    C --> E["登录、注册、找回密码模式"]
    D --> E
    E --> F["收集输入并分发动作"]
    F --> G["宿主执行认证业务"]
```

### 6.3、关键设计与边界

- 两种样式的布局和切换过程不同，不能仅以换色代替。
- 键盘抬升、Logo 显隐和模式切换需要共同服从当前页面状态，不能让上一次动画结束回调覆盖新状态。
- 组件负责输入与交互，账号校验接口、短信发送和会话保存由宿主接入。
- 资源由公共 Resource 入口定位，复建时要连同字体、图片及文案接入关系一起理解。

### 6.4、阅读与重建顺序

先读 Mode、Field、FormValues 与 BaseVC，再分别看两个样式的 switchMode 和公共 FormView。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift](<./Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift>)
- [Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift](<./Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift>)
- [Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift](<./Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift>)
- [Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift](<./Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift>)
- [Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.swift](<./Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.swift>)

依赖与编译入口：[JobsAppDoor.podspec](<./JobsAppDoor.podspec>)。其中显式依赖声明包括 `JobsInheritance`、`JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsCountdownButton`、`JobsSwiftGraphicCaptcha`、`JobsSwiftCountryCodeCtrl`、`SnapKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
