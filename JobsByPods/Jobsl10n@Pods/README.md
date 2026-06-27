# 多语言国际化

[toc]

## 一、使用说明

* 必要时，需要在启动时注册

  ```swift
  func application(_ application: UIApplication, didFinishLaunchingWithOptions
                   launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
      // MARK: - 语言跟随系统
      LanguageManager.shared.followSystemLanguage()
    
      // MARK: - 语言切换成固定的
      Bundle.enableLanguageOverride()
      /// 先切语言（会更新 localizedBundle）
      LanguageManager.shared.switchTo("vi")
      /// 再把 Bundle.main 指到你的语言 bundle（让 storyboard/xib 也变）
      Bundle.setLanguageBundle(LanguageManager.shared.localizedBundle)
    
      print("✅ currentLanguageCode =", LanguageManager.shared.currentLanguageCode)
      print("✅ preferredLanguages =", Locale.preferredLanguages)
      print("✅ bundlePath =", Bundle.main.path(forResource: LanguageManager.shared.currentLanguageCode, ofType: "lproj") ?? "nil")
  }
  ```
  
* 字符映射文件（默认）➤ `Localizable.strings`

* **应用层的调用方式**

  ```swift
  let to = (LanguageManager.shared.currentLanguageCode == "zh-Hans") ? "en" : "zh-Hans"
  LanguageManager.shared.switchTo(to)// zh-Hans、en
  ```

* 【基础】拿到当前语言字符串

  ```swift
  let s = "user.menu.fundDet".tr
  print(s)
  ```

* 【基础】短写本地化忽略大小写包含判断

  ```swift
  if "AppIcon".inStr(key) {
      print("hit")
  }
  ```

* 自动刷新**UI** ➤ 必须满足 2 个条件（否则不会自动在当前页面刷新**UI**）

  * **语言变化能触发刷新**（通知）且 **翻译来源 bundle 正确**（`TRLang.bundleProvider` 指向当前语言 bundle）
  * **UI 文案设置时走 TRBind/tr_setXXX 形成绑定注册**（而不是直接赋值/提前缓存翻译结果）

## 二、✅ UI 统一调用规范示例

### 1、`UILabel`

* 普通文本

  ```swift
  UILabel().tr_setText("KEY".tr)
  ```

* 富文本

  ```swift
  TRBind.bind(titleLabel, translated: "KEY".tr) { label, text in
      UILabel().attributedText = NSAttributedString(
          string: text,
          attributes: [
              .font: UIFont.boldSystemFont(ofSize: 18),
              .foregroundColor: UIColor.systemBlue
          ]
      )
  }
  ```

### 2、`UIButton`

* 普通文本

  ```swift
  UIButton(type: .system).tr_setTitle("KEY".tr, for: .normal)
  ```

* 富文本

  ```swift
  TRBind.bind(payButton, translated: "KEY".tr) { btn, text in
      UIButton(type: .system)
          .setAttributedTitle(NSAttributedString(
              string: text,
              attributes: [
                  .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                  .underlineStyle: NSUnderlineStyle.single.rawValue
              ]
          ), for: .normal)
  }
  ```

### 3、`UITextField`

* `placeholder`

  * 普通文本

    ```swift
    UITextField().tr_setPlaceholder("KEY".tr)
    ```

  * 富文本

    ```swift
    TRBind.bind(phoneField, translated: "KEY".tr) { tf, text in
        tf.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 14)
            ]
        )
    }
    ```

* `text`

  * 普通文本

    ```swift
    UITextField().tr_setText("KEY".tr)
    ```

  * 富文本

    ```swift
    TRBind.bind(phoneField, translated: "KEY".tr) { tf, text in
        UITextField().attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 14)
            ]
        )
    }
    ```

### 4、`UITextView`

> 原生的**UIKit**并不存在`UITextView.placeholder`

* 普通文本

  ```swift
  UITextView().tr_setText("KEY".tr)
  ```

* 富文本

  ```swift
  TRBind.bind(descView, translated: "KEY".tr) { tv, text in
      UITextView().attributedText = NSAttributedString(
          string: text,
          attributes: [
              .font: UIFont.systemFont(ofSize: 15),
              .foregroundColor: UIColor.secondaryLabel
          ]
      )
  }
  ```

### 5、`UIBarButtonItem`

* ```swift
  navigationItem.tr_setTitle("KEY".tr)          /// 主标题（中间大字）
  navigationItem.tr_setPrompt("KEY".tr)         /// 主标题上方的一行小字
  navigationItem.tr_setBackButtonTitle("KEY".tr)/// 返回按钮文字
  ```

* ```swift
  navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
  navigationItem.rightBarButtonItem?.tr_setTitle("KEY".tr)
  ```

### 6、`UITabBarItem`

```swift
tabBarItem.tr_setTitle("KEY".tr)
```

### 7、`UISegmentedControl`

```swift
let seg = UISegmentedControl(items: ["", ""])

seg.tr_setTitle("KEY".tr, forSegmentAt: 0)
seg.tr_setTitle("KEY".tr, forSegmentAt: 1)
```

### 8、`UISearchBar`

```swift
let searchBar = UISearchBar()

searchBar.tr_setPlaceholder("KEY".tr)
searchBar.tr_setPrompt("KEY".tr)
```

### 9、`UIAlertController`

```swift
let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)

alert
    .tr_setAlertTitle("KEY".tr)
    .tr_setMessage("KEY".tr)

alert.addAction(UIAlertAction(title: "KEY".tr, style: .default))
present(alert, animated: true)
```

### 10、`UIView`（无障碍 `accessibilityLabel` / `Hint`）

```swift
UIView()
    .tr_setA11yLabel("KEY".tr)
    .tr_setA11yHint("KEY".tr)
```

### 11、`UIViewController`.`title`

```swift
TRBind.bind(self, translated: "KEY".tr) { vc, text in
    UIViewController().title = text
}
```






















