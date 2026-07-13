# `JobsSwiftCountryCodeCtrl`

`JobsSwiftCountryCodeCtrl` 是 Swift 侧国家 / 地区代码选择器本地 Pod，对齐 OC 侧 `JobsOCCountryCodeCtrl` 的功能边界。

## 能力

- 二级页面展示国家 / 地区代码列表。
- 根据系统首选语言选择中文或英文 plist 数据。
- 支持 delegate 和 closure 回传 `countryName`、`code`。
- 依赖 `JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsByUIKit`、`Jobsl10n`、`SnapKit`；动态系统色统一从 `JobsCor` 获取。

## 验证

```shell
ruby -c JobsSwiftCountryCodeCtrl.podspec
pod install --no-repo-update
```
