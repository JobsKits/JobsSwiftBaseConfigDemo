# `拉取Flutter侧三方资源.sh`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

- 本目录包含同名脚本 `拉取Flutter侧三方资源.sh` 和当前 `README.md`。
- 用途：当 `podhelper.rb` 不存在时，复用健康 [**Flutter**](https://flutter.dev/) 或 [**fvm**](https://fvm.app)，扫描工程并执行 `flutter pub get`。
- 本脚本只发现并复用工具；FVM 的安装及 Homebrew 到官方来源的回退由[配置 Flutter 环境脚本](../配置Flutter环境.sh/README.md)负责。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- [**Flutter**](https://flutter.dev/) module 的 `.ios/Flutter/podhelper.rb` 缺失时。
- 工程根目录下存在 `my_flutter` 或其它包含 `pubspec.yaml` 的 Flutter 工程时。
- 希望依赖拉取失败时只提示、不阻断外层流程时。

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在当前目录执行：

  ```shell
  zsh './拉取Flutter侧三方资源.sh'
  ```

- 独立运行先打印固定内置自述，按回车继续，按 `Ctrl+C` 取消；没有可交互输入时退出并提示改用终端。
- [工程 Podfile](../../Podfile) 在默认 Flutter podhelper 未就绪时同步调用本脚本，统一确认后传入 `JOBS_SKIP_README=1`，只跳过子脚本重复回车等待；内置自述仍会打印。

## 三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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

## 四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 执行流程：

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["打印内置自述并按入口确认"]
    B --> C["识别工程根目录"]
    C --> D["检查默认 podhelper"]
    D --> D1["podhelper 存在：直接结束"]
    D --> D2{"podhelper 不存在：有健康 Flutter 或 FVM?"}
    D2 -->|是| E["扫描 Flutter 工程候选目录"]
    D2 -->|否| Z
    E --> F["找到候选后逐个执行 flutter pub get"]
    D1 --> Z["写入日志并结束"]
    F --> Z
  ```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 脚本会执行 `flutter pub get`，可能改动 Flutter 依赖缓存和生成目录。它不安装或升级 FVM，也不修改 shell profile。
- 默认 podhelper 已存在时直接结束；没有可用工具、没有候选工程或依赖拉取失败时记录警告，按 non-blocking 规则继续。Podfile 按 `required: false` 保留辅助任务不阻断安装的行为。

## 六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 日志同步写入系统临时目录中的 `拉取Flutter侧三方资源.log`；每次确认运行后覆盖上次日志。

## 七、验证与限制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- [隔离回归脚本](./Tests/run_regression.zsh)覆盖候选优先级、损坏工具回退、官方 / Pub / Homebrew 路径、交互防误触、依赖失败后继续和生成 podhelper，16 项全部通过。复跑命令：

  ```shell
  JOBS_SKIP_README=1 zsh './Tests/run_regression.zsh'
  ```

- 未执行真实 `flutter pub get` 或 `pod install`；实际依赖下载仍需要 Flutter 下载来源的网络可用。
- FVM / Flutter 缺失时，先通过[配置脚本](../配置Flutter环境.sh/README.md)按需安装。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
