# `JobsSwiftGraphicCaptcha`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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

- `JobsSwiftGraphicCaptchaConfig`：配置验证码长度、字符单元、大小写校验策略、自定义字符池和混合字符组数，内置 `twoMixedConfig`、`threeMixedConfig`、`fullMixedConfig`。
- `JobsSwiftGraphicCaptchaGenerator`：提供数字、小写英文、大写英文、汉字四个独立字符池，并按指定混合组数生成随机文本。
- `JobsSwiftGraphicCaptchaView`：绘制验证码文本、干扰线和噪点，支持点击刷新和输入校验。

混合模式说明：

- 两两混合：大写英文 + 小写英文、大写英文 + 数字、小写英文 + 数字、大写英文 + 汉字、小写英文 + 汉字、汉字 + 数字。
- 三三混合：大写英文 + 小写英文 + 数字、大写英文 + 小写英文 + 汉字、大写英文 + 数字 + 汉字、小写英文 + 数字 + 汉字。
- 全部混合：大写英文 + 小写英文 + 数字 + 汉字。

## 四、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsSwiftGraphicCaptcha

let captchaView = JobsSwiftGraphicCaptchaView()
captchaView.config = .fullMixedConfig
captchaView.refreshCaptcha()
let passed = captchaView.validateInput("Ab3中")
```

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsSwiftGraphicCaptcha.podspec
```

```shell
pod install --no-repo-update
```

- 改动 `Core`、podspec、依赖或公开 API 后，需要重新执行 [**CocoaPods**](https://cocoapods.org/) 集成验证。
- 汉字池使用 `0x4E00...0x9FA5` 的 CJK 常用汉字区间；如需要扩展到补充平面，可在 `JobsSwiftGraphicCaptchaGenerator` 中统一扩展。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
