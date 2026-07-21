# `JobsSwiftDebugTools`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

## 一、介绍

* 用**Toast**的方式来<font color=red>检验目标 **`UIViewController`** 是否释放</font>

* 利用协议挂载，没有入侵性

* 文案有默认值，亦可以在当前**`UIViewController`**中自定义文案

* 不占用当前的 `deinit{/// TODO}`方法

* 只在**Debug**环境下生效，能在**Release**环境下打包

* `VCDebugDeallocDebug.showsDeinitTips` 持久化控制销毁 Toast 是否显示，默认开启；关闭后仍保留控制器销毁与日志清理流程

* 第三方引用

  ```ruby
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsToast'
  ```

## 二、使用方式

* 引入框架 **`JobsSwiftDebugTools`**

  ```swift
  #if DEBUG
  import JobsSwiftDebugTools
  #endif
  ```

* App入口处进行调用 **➤**  **`AppDelegate.swift`**

  ```swift
  #if DEBUG
  VCDebugDeallocDebug.install()
  #endif
  ```

* 在应用设置页或调试面板中切换销毁提示

  ```swift
  VCDebugDeallocDebug.showsDeinitTips.toggle()
  ```
