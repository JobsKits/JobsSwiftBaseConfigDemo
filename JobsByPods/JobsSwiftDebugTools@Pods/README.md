# `JobsSwiftDebugTools`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

## 一、介绍

* 用**Toast**的方式来检验目标 `UIViewController` 是否释放

* 利用协议挂载，没有入侵性

* 文案有默认值，亦可以在当前`UIViewController`中自定义文案

* 不占用当前的 `deinit{/// TODO}`方法

* 只在**Debug**环境下生效

* 第三方引用

  ```ruby
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsToast'
  ```

## 二、使用方式

* 引入框架 <font color=red>**import**</font> `JobsSwiftDebugTools`
* 挂载协议 `JobsDebugDeinitProtocol`
* 在`UIViewController`的生命周期中进行注册 `enableDebugDeinitToast()`
