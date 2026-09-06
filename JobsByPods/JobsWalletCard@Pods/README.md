# JobsWalletCard

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 定位

`JobsWalletCard` 把钱包银行卡堆叠 UI、卡片 Cell、Header、添加银行卡入口、布局动画与开合状态统一封装为一个本地 Pod。业务层只负责传入卡片数据和响应点击回调。

## 开合模式

- `.individual`：缺省模式。只展开当前点击卡片与下一张卡片之间的间距；再次点击同一张卡片时收起。
- `.all`：点击任意银行卡都会在“全部展开”和“全部收起”之间切换。

```swift
import JobsWalletCard

let walletView = JobsWalletCardView()
    .byCards(cards)
    .byExpansionMode(.individual) // 可省略，缺省就是当前单卡模式
    .onSelectCard { card, index in
        print(card.bankName, index)
    }
    .onAddCard {
        print("添加银行卡")
    }
```

启用全部开合：

```swift
walletView.byExpansionMode(.all)
```

## 目录

```text
JobsWalletCard@Pods/
├── Core/
│   ├── JobsWalletAddCardCell/
│   ├── JobsWalletCardCell/
│   ├── JobsWalletCardExpansionMode/
│   ├── JobsWalletCardLayout/
│   ├── JobsWalletCardLayoutDelegate/
│   ├── JobsWalletCardModel/
│   ├── JobsWalletCardView/
│   └── JobsWalletSectionHeaderView/
├── JobsWalletCard.podspec
└── README.md
```

当前没有独立资源，不创建空 `Resource`。

## 验证

```shell
ruby -c JobsWalletCard.podspec
pod install --no-repo-update
xcodebuild -workspace JobsSwiftBaseConfigDemo.xcworkspace -scheme JobsWalletCard -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

以卡片模型、Cell、自定义 CollectionView 布局和外层视图组成钱包式层叠展示，附有添加卡片入口和分组标题。布局负责卡片开合，模型和 Cell 负责内容。

### 1.2、运行脉络

提供卡片数据 → 创建卡片及添加入口 → 布局层叠 → 点击切换开合 → 回调业务或刷新数据

### 1.3、关键设计与边界

- 单卡模式只展开当前卡片与下一张之间的间距，全部开合模式则由任意卡片统一切换；重建时应按实际枚举命名保留两种规则。
- 展开状态属于布局状态，模型内容变化与布局刷新需要协调，不能仅修改 Cell frame。
- 添加入口只是交互，不等于库内包含绑卡、支付或账户系统。
- 涉及卡号等敏感展示时由业务确定脱敏规则，不能把 Demo 数据当成生产存储方案。

### 1.4、阅读与重建顺序

先读 Model、ExpansionMode 和 Layout，再看 CardCell、AddCardCell，最后看 CardView 的数据和点击分发。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsWalletCardModel/JobsWalletCardModel.swift](<./Core/JobsWalletCardModel/JobsWalletCardModel.swift>)
- [Core/JobsWalletCardView/JobsWalletCardView.swift](<./Core/JobsWalletCardView/JobsWalletCardView.swift>)
- [Core/JobsWalletSectionHeaderView/JobsWalletSectionHeaderView.swift](<./Core/JobsWalletSectionHeaderView/JobsWalletSectionHeaderView.swift>)
- [Core/JobsWalletAddCardCell/JobsWalletAddCardCell.swift](<./Core/JobsWalletAddCardCell/JobsWalletAddCardCell.swift>)
- [Core/JobsWalletCardCell/JobsWalletCardCell.swift](<./Core/JobsWalletCardCell/JobsWalletCardCell.swift>)

依赖与编译入口：[JobsWalletCard.podspec](<./JobsWalletCard.podspec>)。其中显式依赖声明包括 `JobsByUIKit`、`JobsSwiftBaseDefines`、`JobsSwiftDSL`、`SnapKit`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
