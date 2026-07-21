# `JobsSwiftCountryCodeCtrl`

`JobsSwiftCountryCodeCtrl` 是 Swift 侧国家 / 地区代码选择器本地 Pod，对齐 OC 侧 `JobsOCCountryCodeCtrl` 的功能边界。

## 能力

- 二级页面展示国家 / 地区代码列表。
- 根据系统首选语言选择中文或英文 plist 数据。
- 每个国家 / 地区显示对应 Unicode 旗帜；台湾固定使用 `🇹🇼`。
- 支持 delegate 和旧 closure 回传 `countryName`、`code`，也支持 `countrySelectionHandler` 回传包含 `flag`、`regionCode` 的完整选择结果。
- 列表背景、Cell、文字、分割线和索引条使用动态系统色，可随调用页面的白天 / 黑夜主题切换。
- 依赖 `JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsByUIKit`、`Jobsl10n`、`SnapKit`；动态系统色统一从 `JobsCor` 获取。

## 选择结果

```swift
let controller = JobsSwiftCountryCodeCtrl()
controller.countrySelectionHandler = { country in
    print(country.displayName, country.code, country.regionCode)
}
```

## 验证

```shell
ruby -c JobsSwiftCountryCodeCtrl.podspec
pod install --no-repo-update
```
