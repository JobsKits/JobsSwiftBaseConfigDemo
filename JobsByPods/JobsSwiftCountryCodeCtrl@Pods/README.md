# `JobsSwiftCountryCodeCtrl`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

# <span id="前言">`JobsSwiftCountryCodeCtrl`</span>

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsSwiftCountryCodeCtrl` 是 Swift 侧国家 / 地区代码选择器本地 Pod，对齐 OC 侧 `JobsOCCountryCodeCtrl` 的功能边界。

## 能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 二级页面展示国家 / 地区代码列表。
- 根据 `Jobsl10n` 当前语言选择 Pod 内中文或英文索引数据；中文使用中文表，其它语言使用英文表并由 Pod 按当前区域语言生成国家名，不读取宿主 App 的国家词条。
- 每个国家 / 地区显示对应 Unicode 旗帜；台湾固定使用 `🇹🇼`。
- 支持 delegate 和旧 closure 回传 `countryName`、`code`，也支持 `countrySelectionHandler` 回传包含 `flag`、`regionCode` 的完整选择结果。
- 选择结果由 Pod 持久化；`selectedCountry` 可供宿主读取，`localizedName` / `displayName` 会按当前语言实时计算国家名。
- 列表背景、Cell、文字、分割线和索引条使用动态系统色，可随调用页面的白天 / 黑夜主题切换。
- 依赖 `JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsByUIKit`、`Jobsl10n`、`SnapKit`；动态系统色统一从 `JobsCor` 获取。

## 选择结果 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
let controller = JobsSwiftCountryCodeCtrl()
controller.countrySelectionHandler = { country in
    print(country.displayName, country.code, country.regionCode)
}

if let country = JobsSwiftCountryCodeCtrl.selectedCountry {
    print(country.displayName)
}
```

## 验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsSwiftCountryCodeCtrl.podspec
pod install --no-repo-update
```

## Jobs DSL 调用约定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

从资源读取国家区号，组织分组列表与索引，将国家显示名称和拨号区号通过代理或闭包交回，同时记录当前选择供再次进入使用。

### 1.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

读取国家区号资源 → 按语言组织显示 → 浏览分组或使用索引 → 选择国家 → 保存选择并回调

### 1.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本地化显示名、地区编码和电话区号不是同一字段，不能用显示文字当稳定地区标识。
- 同一区号可对应多个地区，不能仅按区号反推唯一国家。
- 资源加载需通过正确 Bundle 定位，复制控制器而缺少国家数据会导致功能不完整。
- 代理与闭包的配置及关闭页面行为应按实际入口协调，业务仍负责电话号码校验。

### 1.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 Country 与资源读取，再看国家名归一化和 selectCountry，最后看选择持久化。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSwiftCountryCodeCtrl.swift](<./JobsSwiftCountryCodeCtrl.swift>)

依赖与编译入口：[JobsSwiftCountryCodeCtrl.podspec](<./JobsSwiftCountryCodeCtrl.podspec>)。其中显式依赖声明包括 `JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsByUIKit`、`Jobsl10n`、`SnapKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 二、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

国家 plist 从模块/主 Bundle 按资源名读取，目录组织由 Resource 和 Podspec 管理，调用方不拼绝对路径。展示名、regionCode、flag 和电话区号保持独立含义。回归语言切换、空数据、选择回传和返回导航；正式电话号码有效性由业务服务校验。


## 三、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单通过独立资源 bundle 交付。当前所需理由 API：`UserDefaults`（CA92.1）。理由对应本库实际用途；宿主仍需核对业务数据收集、App Group / 用户授权文件等实际使用场景，资源声明与最终 App 内 bundle 都应验收。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsSwiftCountryCodeCtrl --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
