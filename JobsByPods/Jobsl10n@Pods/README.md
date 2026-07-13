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

调用方应引入 `JobsByUIKit`；按钮创建以及 UIKit 配置继续遵守 `JobsByUIKit` / `JobsSwiftDSL` 规范。

### 1、`UILabel`

* 普通文本

  ```swift
  titleLabel.tr_setText("KEY".tr)
  ```

* 富文本

  ```swift
  import JobsSwiftBaseDefines

  TRBind.bind(titleLabel, translated: "KEY".tr) { label, text in
      label.byAttributedText(
          NSAttributedString(
              string: text,
              attributes: [
                  .font: JobsFont.boldSystemFont(ofSize: 18),
                  .foregroundColor: JobsCor.systemBlue
              ]
          )
      )
  }
  ```

### 2、`UIButton`

* 普通文本

  ```swift
  UIButton.sys().tr_setTitle("KEY".tr, for: .normal)
  ```

* 富文本

  ```swift
  import JobsSwiftBaseDefines

  TRBind.bind(payButton, translated: "KEY".tr) { btn, text in
      btn.byAttributedTitle(
          NSAttributedString(
              string: text,
              attributes: [
                  .font: JobsFont.systemFont(ofSize: 16, weight: .medium),
                  .underlineStyle: NSUnderlineStyle.single.rawValue
              ]
          ),
          for: .normal
      )
  }
  ```

### 3、`UITextField`

* `placeholder`

  * 普通文本

    ```swift
    phoneField.tr_setPlaceholder("KEY".tr)
    ```

  * 富文本

    ```swift
    import JobsSwiftBaseDefines

    TRBind.bind(phoneField, translated: "KEY".tr) { tf, text in
        tf.byAttributedPlaceholder(
            NSAttributedString(
                string: text,
                attributes: [
                    .foregroundColor: JobsCor.gray,
                    .font: JobsFont.systemFont(ofSize: 14)
                ]
            )
        )
    }
    ```

* `text`

  * 普通文本

    ```swift
    phoneField.tr_setText("KEY".tr)
    ```

  * 富文本

    ```swift
    import JobsSwiftBaseDefines

    TRBind.bind(phoneField, translated: "KEY".tr) { tf, text in
        tf.byAttributedText(
            NSAttributedString(
                string: text,
                attributes: [
                    .foregroundColor: JobsCor.gray,
                    .font: JobsFont.systemFont(ofSize: 14)
                ]
            )
        )
    }
    ```

### 4、`UITextView`

> 原生的**UIKit**并不存在`UITextView.placeholder`

* 普通文本

  ```swift
  textView.tr_setText("KEY".tr)
  ```

* 富文本

  ```swift
  import JobsSwiftBaseDefines

  TRBind.bind(descView, translated: "KEY".tr) { tv, text in
      tv.byAttributedText(
          NSAttributedString(
              string: text,
              attributes: [
                  .font: JobsFont.systemFont(ofSize: 15),
                  .foregroundColor: JobsCor.secondaryLabel
              ]
          )
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
  navigationItem.rightBarButtonItem = UIBarButtonItem.make(title: nil)
  navigationItem.rightBarButtonItem?.tr_setTitle("KEY".tr)
  ```

### 6、`UITabBarItem`

```swift
tabBarItem.tr_setTitle("KEY".tr)
```

### 7、`UISegmentedControl`

```swift
segmentedControl.tr_setTitle("KEY".tr, forSegmentAt: 0)
segmentedControl.tr_setTitle("KEY".tr, forSegmentAt: 1)
```

### 8、`UISearchBar`

```swift
searchBar.tr_setPlaceholder("KEY".tr)
searchBar.tr_setPrompt("KEY".tr)
```

### 9、`UIAlertController`

```swift
let alert = UIAlertController.makeAlert()

alert
    .tr_setAlertTitle("KEY".tr)
    .tr_setMessage("KEY".tr)

alert.byAddAction(title: "KEY".tr)
present(alert, animated: true)
```

### 10、`UIView`（无障碍 `accessibilityLabel` / `Hint`）

```swift
contentView
    .tr_setA11yLabel("KEY".tr)
    .tr_setA11yHint("KEY".tr)
```

### 11、`UIViewController`.`title`

```swift
TRBind.bind(self, translated: "KEY".tr) { vc, text in
    vc.byTitle(text)
}
```




















