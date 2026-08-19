# JobsWalletCard

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
