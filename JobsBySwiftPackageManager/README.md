# `JobsBySwiftPackageManager`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

这里保存 `JobsSwiftBaseConfigDemo` 的本地 [**Swift Package Manager**](https://www.swift.org/package-manager/) 综合演示与验证脚本。

## 一、目录

| 路径 | 职责 |
| --- | --- |
| `JobsSPMDemoPackage/` | 可直接被 Xcode 引用、且没有远程依赖的本地 Library Package。 |
| `JobsSPMDemoPackage/MacroDemo/` | 独立承载 `swift-syntax`、Macro、Client 与宏测试。 |
| `SwiftPackageDependence使用指南🧭.md/` | 集成、验证、移除和故障排查文档。 |
| `【MacOS】🧠编译通过方可集成进SPM.command` | 依次执行解析、构建、测试和 Client 演示。 |
| `【MacOS】⏬双击下载swift-syntax.command` | 只为独立 Macro Demo 预解析官方 `swift-syntax`。 |

## 二、验证入口

- 独立运行：双击脚本，或在项目根目录执行：

  ```shell
  JOBS_SKIP_README=1 './JobsBySwiftPackageManager/【MacOS】🧠编译通过方可集成进SPM.command'
  ```

- `pod install` 唤起：`pre_install` 会询问是否执行。直接回车执行，输入任意字符后回车跳过。
- 脚本缺失或用户选择跳过时不影响 `pod install`；一旦选择执行，编译或测试失败会停止集成。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
