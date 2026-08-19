# `JobsSwiftCountryCodeCtrl`

`JobsSwiftCountryCodeCtrl` 是 Swift 侧国家 / 地区代码选择器本地 Pod，对齐 OC 侧 `JobsOCCountryCodeCtrl` 的功能边界。

## 能力

- 二级页面展示国家 / 地区代码列表。
- 根据 `Jobsl10n` 当前语言选择 Pod 内中文或英文索引数据；中文使用中文表，其它语言使用英文表并由 Pod 按当前区域语言生成国家名，不读取宿主 App 的国家词条。
- 每个国家 / 地区显示对应 Unicode 旗帜；台湾固定使用 `🇹🇼`。
- 支持 delegate 和旧 closure 回传 `countryName`、`code`，也支持 `countrySelectionHandler` 回传包含 `flag`、`regionCode` 的完整选择结果。
- 选择结果由 Pod 持久化；`selectedCountry` 可供宿主读取，`localizedName` / `displayName` 会按当前语言实时计算国家名。
- 列表背景、Cell、文字、分割线和索引条使用动态系统色，可随调用页面的白天 / 黑夜主题切换。
- 依赖 `JobsSwiftBaseDefines`、`JobsSwiftDSL`、`JobsByUIKit`、`Jobsl10n`、`SnapKit`；动态系统色统一从 `JobsCor` 获取。

## 选择结果

```swift
let controller = JobsSwiftCountryCodeCtrl()
controller.countrySelectionHandler = { country in
    print(country.displayName, country.code, country.regionCode)
}

if let country = JobsSwiftCountryCodeCtrl.selectedCountry {
    print(country.displayName)
}
```

## 验证

```shell
ruby -c JobsSwiftCountryCodeCtrl.podspec
pod install --no-repo-update
```

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。
