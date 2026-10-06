# `JobsSwiftGraphicCaptcha`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftGraphicCaptcha` 是 Jobs Swift 侧本地图形验证码 Pod，负责字符池、随机验证码文本、大小写校验策略和验证码绘制视图。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsSwiftGraphicCaptcha` |
| Pod 类型 | 自建本地 Swift Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| podspec | `JobsByPods/JobsSwiftGraphicCaptcha@Pods/JobsSwiftGraphicCaptcha.podspec` |
| source | `{ :path => '.' }` |
| 直接依赖 | `JobsSwiftBaseDefines`（使用 `JobsFont` 系统字体工厂）、`JobsSwiftDSL`（使用 `UIColor(gray:alpha:)` / `UIColor(h:s:b:a:)`） |

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsSwiftGraphicCaptcha@Pods/
├── Core/
│   ├── JobsSwiftGraphicCaptchaConfig/
│   │   └── JobsSwiftGraphicCaptchaConfig.swift
│   ├── JobsSwiftGraphicCaptchaGenerator/
│   │   └── JobsSwiftGraphicCaptchaGenerator.swift
│   └── JobsSwiftGraphicCaptchaView/
│       └── JobsSwiftGraphicCaptchaView.swift
├── JobsSwiftGraphicCaptcha.podspec
├── LICENSE
└── README.md
```

## 三、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsSwiftGraphicCaptchaConfig`：配置验证码长度、字符单元、大小写校验策略、自定义字符池和混合字符组数，内置 `simplifiedChineseConfig`、`traditionalChineseConfig`、`twoMixedConfig`、`threeMixedConfig`、`fourMixedConfig`、`fullMixedConfig`。
- `JobsSwiftGraphicCaptchaGenerator`：提供数字、小写英文、大写英文、简体汉字、繁体汉字五个独立字符池，并按指定混合组数生成随机文本；`.chinese` 是简繁体合集。
- `JobsSwiftGraphicCaptchaView`：绘制验证码文本、干扰线和噪点，支持点击刷新和输入校验。

混合模式把英文大写、英文小写、阿拉伯数字、简体汉字、繁体汉字视为五个独立类别：

- 单个 / 两两 / 三三 / 四四 / 全部混合分别提供 `5 / 10 / 10 / 5 / 1` 种组合。
- `mixedGroupCount` 指定本次验证码必须覆盖的类别数；补位字符也只会从已选类别中产生。

## 四、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsSwiftGraphicCaptcha

let captchaView = JobsSwiftGraphicCaptchaView()
captchaView.config = .fourMixedConfig
captchaView.refreshCaptcha()
let passed = captchaView.validateInput("A8汉語")
```

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsSwiftGraphicCaptcha.podspec
```

```shell
pod install --no-repo-update
```

- 改动 `Core`、podspec、依赖或公开 API 后，需要重新执行 [**CocoaPods**](https://cocoapods.org/) 集成验证。
- `simplifiedChineseCharacters` 与 `traditionalChineseCharacters` 分别维护常用简体、繁体字符；兼容入口 `chineseCharacters` 和 `.chinese` 会合并两者。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

把字符集及比较策略、随机内容生成、图形绘制分开。Config 描述长度和字符单元，Generator 生成与校验，View 绘制验证码和干扰并提供刷新入口。

### 6.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置字符单元 → 生成随机文字 → 绘制内容与干扰 → 校验输入 → 刷新生成下一组

### 6.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 简体和繁体字符池分开，兼容中文入口将两者合并，不能误删其中一组。
- 混合字符组需要保证生成策略与配置相符，不能简单拼接字符后就宣称各组都有覆盖。
- 比较时大小写及输入归一化应与配置一致，View 不能另写一套不同校验规则。
- 本地验证码组件不替代服务端验证或完整防滥用机制。

### 6.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 CharacterUnit 与 Config，再读 Generator 的分组抽样和比较，最后读 View 的绘制与刷新。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsSwiftGraphicCaptchaConfig/JobsSwiftGraphicCaptchaConfig.swift](<./Core/JobsSwiftGraphicCaptchaConfig/JobsSwiftGraphicCaptchaConfig.swift>)
- [Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift](<./Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift>)
- [Core/JobsSwiftGraphicCaptchaGenerator/JobsSwiftGraphicCaptchaGenerator.swift](<./Core/JobsSwiftGraphicCaptchaGenerator/JobsSwiftGraphicCaptchaGenerator.swift>)

依赖与编译入口：[JobsSwiftGraphicCaptcha.podspec](<./JobsSwiftGraphicCaptcha.podspec>)。其中显式依赖声明包括 `JobsSwiftBaseDefines`、`JobsSwiftDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 七、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

默认是本地生成与同步比较，用于演示。生产接入先配置 `serverChallengeProvider` 和 `serverVerifier`，再设置 `usesServerValidation = true`；provider 返回不含答案的 `JobsGraphicCaptchaChallenge(identifier:image:expiresAt:)`，verifier 将 challenge id 和输入交给真实服务端。server 模式下 `validateInput` 始终返回 false，调用 `verifyInput(_:completion:)` 获取服务端判定；本地字符不能作为生产放行凭据。

默认请求超时 15 秒，非法值回退，最大 300 秒；刷新取消旧挑战及校验，代次拒绝旧回调，重复完成只处理一次。缺少服务、挑战失效、取消和超时都有明确 Error；服务端成功验证后清除当前挑战，避免本地复用。`onChallengeChanged` 交付挑战更新或清空，宿主可据此更新提交状态；验证终态先保存再通知挑战消费，因此通知内刷新下一题不会把已接受的成功改成取消。取消回调中重入发起的更新请求优先，旧调用不会覆盖新请求。provider / verifier 返回可选取消动作，`cancelPendingRequests()` 用于页面结束；回调交付在主线程。接口失败不会回退成“本地验证通过”，离线演示需明确切回本地模式。


## 八、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftGraphicCaptcha --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
