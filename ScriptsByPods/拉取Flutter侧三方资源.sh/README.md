# `拉取Flutter侧三方资源.sh`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、适用场景](#jobs-toc-heading-2)
- [二、运行方式](#jobs-toc-heading-3)
- [三、执行前检查](#jobs-toc-heading-4)
- [四、健康检查与修复流程](#jobs-toc-heading-5)
- [五、风险说明](#jobs-toc-heading-6)
- [六、日志文件](#jobs-toc-heading-7)
- [七、验证与限制](#jobs-toc-heading-8)
- [八、换电脑排查](#machine-migration)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

- 本目录包含同名脚本 `拉取Flutter侧三方资源.sh` 和当前 `README.md`。
- 用途：当 Flutter iOS 生成配置缺失、路径已迁移或 SDK 根 helper 不可用时，复用健康 [**Flutter**](https://flutter.dev/) 或 [**fvm**](https://fvm.app)，扫描工程并执行 `flutter pub get`，复检后按需重建过期的本机路径配置。
- 本脚本只发现并复用工具；FVM 的安装及 Homebrew 到官方来源的回退由[配置 Flutter 环境脚本](../配置Flutter环境.sh/README.md)负责。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- Flutter module 的 `.ios/Flutter/podhelper.rb`、`Generated.xcconfig` 或 `flutter_export_environment.sh` 缺失时。
- 从其它电脑复制工程后，生成配置仍指向原电脑的 Flutter SDK 或 module 路径时。
- module helper 虽然存在，但其引用的 SDK 根 helper 已不存在，或两份生成配置记录的路径不一致时。
- 工程根目录下存在 `my_flutter` 或其它包含 `pubspec.yaml` 的 Flutter 工程时。
- 希望依赖拉取失败时只提示、不阻断外层流程时。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 在当前目录执行：

  ```shell
  zsh './拉取Flutter侧三方资源.sh'
  ```

- 独立运行先打印固定内置自述，按回车继续，按 `Ctrl+C` 取消；没有可交互输入时退出并提示改用终端。
- [工程 Podfile](../../Podfile) 在默认 Flutter 生成配置未通过完整健康检查时同步调用本脚本，统一确认后传入 `JOBS_SKIP_README=1`，只跳过子脚本重复回车等待；内置自述仍会打印。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 确认脚本目录位于工程根目录的 `ScriptsByPods` 下：

  ```text
  工程根目录/
  └── ScriptsByPods/
      └── 拉取Flutter侧三方资源.sh/
          ├── 拉取Flutter侧三方资源.sh
          └── README.md
  ```

- 脚本会兼容包裹目录：当上级目录是 `ScriptsByPods` 时，把 `ScriptsByPods/..` 识别为工程根目录。
- 已由外层入口确认用途与影响时，可使用：

  ```shell
  JOBS_SKIP_README=1 zsh './拉取Flutter侧三方资源.sh'
  ```

- Flutter 候选依次是当前 `PATH`、用户 `fvm/versions/stable` 和 `.fvm/versions/stable` 下的 SDK；随后检查 `PATH` 中的 FVM、`FVM_INSTALL_DIR` 指定的官方目录、默认用户 `fvm/bin`、Pub 缓存及 Apple Silicon / Intel 的 Homebrew 常见位置。每个候选执行 `--version` 检查，失败后继续其它来源。
- 配置脚本对子进程 `PATH` 的刷新不会传回 Podfile；这里独立探测官方 FVM 路径，确保同一次 `pod install` 后续仍能找到新安装工具。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、健康检查与修复流程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

默认 `my_flutter` 只有同时满足以下条件才跳过工具探测和依赖拉取：

- module 的 `.ios/Flutter/podhelper.rb` 存在。
- `Generated.xcconfig` 包含 `FLUTTER_ROOT` 和 `FLUTTER_APPLICATION_PATH`，前者指向含 `packages/flutter_tools/bin/podhelper.rb` 的真实 SDK，后者指向当前 module。
- `flutter_export_environment.sh` 存在，其中的 SDK、module 路径与上述配置一致；比较前归一化符号链接，允许同一目录的不同路径别名。

脚本只读取生成文件中的配置值，绝不执行或 `source` 其它电脑带来的环境脚本。配置不健康时，先复用所选 Flutter / FVM 执行一次 `flutter pub get`，然后完整复检；命令失败直接报告该候选失败，不重复同一下载请求。

首次命令成功但配置仍不健康时，才把现有 `Generated.xcconfig` 和 `flutter_export_environment.sh` 移到系统临时目录中的独立备份，再执行第二次 `flutter pub get`，交给 Flutter 官方生成流程重建本机路径。每个候选最多执行两次；成功后保留原配置备份，第二次命令或健康复检失败时尝试恢复原配置，并保留备份及失败尝试产物。恢复失败会明确报告需要手动恢复的备份位置。不手改生成文件中的路径，也不使用可能触发额外 CocoaPods 流程的 `flutter build ios --config-only`。

- 执行流程如下。图中的失败是当前候选失败，随后继续其它候选；最终仍需复检默认 `my_flutter`，不能用其它候选的成功替代默认 module 的健康状态。

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["打印内置自述并按入口确认"]
    B --> C["识别工程根目录"]
    C --> D{"默认生成配置完整且路径健康?"}
    D -->|是| Z["记录结果并结束"]
    D -->|否| E{"有健康工具和候选工程?"}
    E -->|否| W["记录未修复警告并跳过"]
    E -->|是| F["逐候选执行第一次 flutter pub get"]
    F --> G{"命令成功?"}
    G -->|否| X["该候选报告失败"]
    G -->|是| H{"生成配置健康?"}
    H -->|是| Z
    H -->|否| I["备份移出两份过期生成配置"]
    I --> J["第二次 flutter pub get"]
    J --> K{"命令及健康复检成功?"}
    K -->|是| Z
    K -->|否| L["恢复原配置并保留备份"]
    L --> X
    W --> Z
  ```

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 脚本会执行 `flutter pub get`，可能改动 Flutter 依赖缓存和生成目录。它不安装或升级 FVM，也不修改 shell profile。
- 默认配置完整健康时直接结束；仅有 module helper 文件不足以证明环境可用。没有可用工具或候选工程时告警并跳过，不声称完成修复。
- 修复失败返回失败状态，由 Podfile 的 `required: false` 调用记录警告并继续主安装流程；默认 module 仍不健康时，Podfile 使用已有占位 helper 跳过 Flutter Pods 集成，不把其它候选的成功当成默认 module 已修好。
- 脚本不手动删除 `Pods`、`Podfile.lock` 或整个 `.ios` 目录，不递归启动 `pod install`；修复分支仅移出指定的两份配置文件并保留备份。Flutter 官方 `pub get` 仍可能依据工具或 `pubspec.yaml` 的变更重新生成 `.ios`，正常生成行为由 Flutter 控制。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 日志同步写入系统临时目录中的 `拉取Flutter侧三方资源.log`；每次确认运行后覆盖上次日志。
- 需要重生成时，独立备份目录位于系统临时目录的 `jobs-flutter-config-backup.<随机后缀>`；目录位置与恢复结果写在同一日志中。成功和失败均保留原配置备份，失败尝试产物使用 `attempted.<原文件名>` 留存，不静默丢弃原配置。

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">七、验证与限制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- [隔离回归脚本](./Tests/run_regression.zsh)覆盖候选优先级、损坏工具回退、官方 / Pub / Homebrew 路径、交互防误触，以及生成配置健康、换机残留路径、重生成与失败恢复边界。测试使用假 Flutter / FVM 与临时工程；复跑命令：

  ```shell
  JOBS_SKIP_README=1 zsh './Tests/run_regression.zsh'
  ```

- [Podfile 健康检查回归](./Tests/podfile_readiness.rb)只提取当前 Podfile 的检查方法，在临时工程验证完整配置、旧 SDK / module 路径、导出文件缺失和符号链接；不加载 CocoaPods 或真实 SDK：

  ```shell
  ruby './Tests/podfile_readiness.rb'
  ```

- 未执行真实 `flutter pub get` 或 `pod install`；实际依赖下载仍需要 Flutter 下载来源的网络可用。
- FVM / Flutter 缺失时，先通过[配置脚本](../配置Flutter环境.sh/README.md)按需安装。

## 八、<span id="machine-migration">换电脑排查</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在工程根目录检查 Podfile 是否同时具备公共 Specs 选源入口和新版 Flutter 准备描述：

```shell
/usr/bin/grep \
  -nE 'JobsCocoaPodsSource|Prepare Flutter environment' \
  ./Podfile
```

应看到 `JobsCocoaPodsSource.apply!` 和 `Prepare Flutter environment (FVM with official fallback + flutter pub get)`。只复制新脚本无法更新旧 Podfile 的挂载和健康判断；迁移时同时保留最新 Podfile、选源模块整包、Flutter 配置脚本整包及本目录。

检查两份生成配置是否仍残留原电脑的路径：

```shell
/usr/bin/grep \
  -nE 'FLUTTER_ROOT|FLUTTER_APPLICATION_PATH' \
  ./my_flutter/.ios/Flutter/Generated.xcconfig \
  ./my_flutter/.ios/Flutter/flutter_export_environment.sh
```

先正常运行准备脚本或 `pod install` 触发健康检查；配置恢复健康后再使用根 README 中跳过可选准备的安装命令。保留锁文件，不用手工替换生成文件中的用户名。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
