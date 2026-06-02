# `JobsSwiftDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsSwiftDSL` 用于集中管理 Swift 工程里的点语法 / 链式语法糖，例如 `byTitle(...)`、`byFrame(...)`、`dsl { ... }`。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 从 `JobsByPods` 内各个本地管理 Pod 抽出的系统 SDK / 第三方 SDK 二次封装。
- 使用者认可 Jobs DSL 时，显式 `import JobsSwiftDSL` 后继续使用点语法。
- 使用者不认可 Jobs DSL 时，可以不引入本 Pod，回到系统原生 API。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 目录 | 内容 |
| ---- | ---- |
| `UIKit/` | `UIView`、`UIButton`、`UILabel`、`UITableView` 等 UIKit DSL |
| `QuartzCore/` | `CALayer`、`CAAnimation`、`CATransform3D` 等链式封装 |
| `WebKit/` | `WKWebView`、`WKWebViewConfiguration` 等链式封装 |
| `PDFKit/` | `PDFView`、`PDFThumbnailView` 链式封装 |
| `PhotosUI/` | `PHPickerConfiguration`、`PHPickerViewController` 链式封装 |
| `MetalKit/` | `MTKView`、`MTL*Descriptor` 链式封装 |
| `Foundation/` | `JSONDecoder`、`NSMutableAttributedString` 等 Foundation DSL |
| `ThirdParty/` | `SnapKit`、`BMPlayer`、`YTKNetwork`、`GKNavigationBarSwift` 等第三方 DSL |

## 三、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsSwiftDSL

let label = UILabel()
  .byText("Jobs")
  .byTextAlignment(.center)
```

## 四、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本 Pod 是语法糖层，不应该承载业务状态。
- 后续新增 DSL 时，优先放在这里，不再散落到各个功能 Pod。
- 原 Pod 暂时保留薄桥接文件，便于老代码平滑迁移。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
