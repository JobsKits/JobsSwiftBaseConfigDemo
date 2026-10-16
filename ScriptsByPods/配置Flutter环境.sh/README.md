# `配置Flutter环境.sh`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

- 本目录包含同名脚本 `配置Flutter环境.sh` 和当前 `README.md`。
- 用途：检查 [**fvm**](https://fvm.app) 与 [**Flutter**](https://flutter.dev/) `stable`，按需补齐 SDK、iOS 引擎缓存和模块依赖。
- 优先复用健康 FVM；需要安装时先尝试已有的 [**Homebrew**](https://brew.sh/)，不可用、安装失败或安装后复检失败时，自动回退 [FVM 官方安装器](https://fvm.app/install.sh)。不为安装 FVM 强制安装或更新 Homebrew。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 新机器首次准备 [**Flutter**](https://flutter.dev/) iOS 构建环境时。
- 需要通过 [**fvm**](https://fvm.app) 管理 `stable` 版本时。
- 需要执行 `flutter precache --ios` 和 `flutter pub get` 时。

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在当前目录执行：

  ```shell
  zsh './配置Flutter环境.sh'
  ```

- 独立运行先打印脚本内置自述，按回车继续，按 `Ctrl+C` 取消；后续安装 / 更新动作仍按各自提示确认。
- 非交互独立运行须显式设置 `JOBS_FLUTTER_AUTO_SETUP=1`，否则退出并提示在终端运行。该开关允许自动补齐缺失环境、执行 `flutter precache --ios` 和 `flutter pub get`；已有 FVM / Flutter 的可选升级仍默认跳过。
- [工程 Podfile](../../Podfile) 在安装准备阶段同步调用本脚本，统一确认后传入 `JOBS_SKIP_README=1`，避免重复自述确认；该变量不代表授权全部安装动作。脚本失败会报告退出码，Podfile 按 `required: false` 记录警告并继续依赖安装。

## 三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 确认脚本目录位于工程根目录的 `ScriptsByPods` 下：

  ```text
  工程根目录/
  └── ScriptsByPods/
      └── 配置Flutter环境.sh/
          ├── 配置Flutter环境.sh
          └── README.md
  ```

- 脚本会兼容包裹目录：当上级目录是 `ScriptsByPods` 时，把 `ScriptsByPods/..` 识别为工程根目录。
- 已由外层入口完成用途与影响确认时，可跳过重复回车等待；内置自述仍会打印：

  ```shell
  JOBS_SKIP_README=1 zsh './配置Flutter环境.sh'
  ```

- [**GitHub**](https://github.com) Actions 等非交互环境需要自动补齐 [**Flutter**](https://flutter.dev/) 环境时，可显式设置：

  ```shell
  JOBS_SKIP_README=1 JOBS_FLUTTER_AUTO_SETUP=1 zsh './配置Flutter环境.sh'
  ```

- FVM 候选路径依次包括当前 `PATH`、官方安装目录、用户 `fvm/bin`、Pub 缓存及两种 Homebrew 前缀；候选必须实际通过 `fvm --version`，残缺 shim 会被跳过。
- 官方安装目录由 `FVM_INSTALL_DIR` 指定，默认是用户主目录下的 `fvm`，支持 `~/` 前缀。它只决定 FVM 二进制位置；现有 `FVM_HOME` 与 Flutter `versions` 缓存继续按原规则使用。

## 四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 执行流程：

  ```mermaid
  flowchart TD
    A["打印内置自述并按入口确认"] --> B{"FVM 健康且跳过升级?"}
    B -->|是| F["按需安装或更新 Flutter stable"]
    B -->|否| C{"确认安装或升级 FVM?"}
    C -->|执行| D{"已有官方安装?"}
    C -->|跳过| X["报错或取消并停止 Flutter 操作"]
    D -->|是| O["运行官方 install.sh"]
    D -->|否| E{"已有健康 Homebrew?"}
    E -->|是| I["brew install 或 upgrade fvm"]
    E -->|否| O
    I --> J{"命令及 FVM 复检成功?"}
    J -->|否| O
    J -->|是| P["激活当前进程 PATH"]
    O --> K{"安装及指定路径复检成功?"}
    K -->|是| P
    K -->|否| X
    P --> F
    F --> G["按需执行 flutter precache --ios"]
    G --> H["按需执行 flutter pub get"]
    H --> Z["写入日志并结束"]
  ```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 脚本涉及工具安装、网络下载、Flutter 缓存与模块生成文件；交互环境安装 / 更新动作均为“直接回车跳过；输入任意字符后回车执行”。确认一次 FVM 安装后，Homebrew 到官方来源的回退不重复确认。
- Homebrew 只复用已有健康安装，使用 `brew install fvm` 或用户选择的 `brew upgrade fvm`，不自动更新 Homebrew。官方安装采用先下载临时脚本、再执行、最后检查指定二进制的方式；两种来源均失败时停止后续 Flutter 操作。
- 官方安装器可能迁移旧 `.fvm_flutter` 和旧系统目录中的 `fvm` 链接，保留 `versions` 缓存。当前脚本不写 shell profile；成功后只刷新本进程 `PATH`，后续拉取脚本会独立探测官方路径。
- 下载官方 `install.sh` 使用 15 秒连接超时、120 秒单次下载上限和一次重试；这些设置不约束官方安装器内部下载 FVM 发布文件的耗时。安装仍依赖 `fvm.app`、[**GitHub**](https://github.com) Releases 与 Flutter 下载来源的网络和目录写权限。

## 六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 日志同步写入系统临时目录中的 `配置Flutter环境.log`；每次确认运行后覆盖上次日志。

## 七、验证与限制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- [隔离回归脚本](./Tests/run_regression.zsh)覆盖 Homebrew / 官方安装成功与失败、损坏工具、空下载、自定义目录、PATH 生效、缓存保留和下游停止边界，14 项全部通过。复跑命令：

  ```shell
  zsh './Tests/run_regression.zsh' --run
  ```

- 未在真实环境中安装或升级 FVM / Flutter，未执行真实 `pod install`。安装来源与失败处理以脚本日志为排查依据。
- 官方安装方式参见 [FVM 安装文档](https://fvm.app/documentation/getting-started/installation)。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
