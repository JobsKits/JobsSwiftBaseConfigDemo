# <span id="前言">my_app</span>

A new Flutter project.

## Getting Started <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 一、<span id="iphone-duo-layout">iPhone Duo 与宿主窗口变化</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[`lib/main.dart`](./lib/main.dart) 的 `FlutterPage` 使用逐边 `SafeArea` 与可滚动表单，窗口变窄、变矮或键盘出现时，参数、输入和回传按钮仍可滚动到达；保留原 TextEditingController、requestId、原生通信与返回流程。没有缓存首次屏幕尺寸，没有按机型或方向选择布局。

测试为 [`test/iphone_duo_layout_test.dart`](./test/iphone_duo_layout_test.dart)，覆盖 `880 × 600` 到 `320 × 360` 的原页面 resize、左右不同 inset、键盘避让、输入保留与回传按钮可达。2026-10-23 源码测试用宿主仓所用的 [**Flutter**](https://flutter.dev/) `3.47.7` / Dart `3.13.5` 执行通过；本模块现存 `.dart_tool` 仍引用旧 stable SDK，直接使用当前 Flutter 执行 `--no-pub` 会出现 `FlutterView.displayCornerRadii` 不匹配。验证使用临时测试入口和当前 SDK 依赖映射，没有修改生成配置或安装依赖。`dart analyze` 的唯一提示为原有注释中的 HTML 尖括号，无 error / warning。

独立运行前，使用与原生宿主一致的 Flutter SDK 重新执行 `flutter pub get` 生成匹配的本地依赖映射，再运行：

```shell
flutter test --no-pub test/iphone_duo_layout_test.dart
```

`ios/Runner` 为模板工程，只读核对已有 LaunchScreen、iPad 四方向且无全屏退出项；未修改模板 AppDelegate、`.ios`、Pods 或其它生成文件。集成运行使用原生主工程宿主的 scene 与尺寸生命周期。该模块尚未接入 Duo 的原生保留区 / 铰链桥，Duo 模拟器、半折姿态及真实原生回传仍须在宿主内验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
