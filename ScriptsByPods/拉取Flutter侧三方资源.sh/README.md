# `拉取Flutter侧三方资源.sh`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

- 本目录包含同名脚本 `拉取Flutter侧三方资源.sh` 和当前 `README.md`。
- 脚本已按 Jobs 的 [**Markdown**](https://markdown.cn) / Shell 约束整理：`zsh` 入口、结构化函数、彩色日志、`README.md` 启动展示、防误触确认、日志落盘。
- 用途：当 `podhelper.rb` 不存在时，扫描 Flutter 工程并执行 `flutter pub get`。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- [**Flutter**](https://flutter.dev/) module 的 `.ios/Flutter/podhelper.rb` 缺失时。
- 工程根目录下存在 `my_flutter` 或其它包含 `pubspec.yaml` 的 Flutter 工程时。
- 希望依赖拉取失败时只提示、不阻断外层流程时。

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在当前目录执行：

  ```shell
  zsh './拉取Flutter侧三方资源.sh'
  ```

- 交互环境下，脚本会先展示本 `README.md`，按回车继续，按 `Ctrl+C` 取消。
- 非交互环境下，脚本会跳过 `README.md` 阻塞展示，避免影响自动化流程。

## 三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 确认脚本目录位于工程根目录的下一层：

  ```text
  工程根目录/
  └── 拉取Flutter侧三方资源.sh/
      ├── 拉取Flutter侧三方资源.sh
      └── README.md
  ```

- 脚本会把 `拉取Flutter侧三方资源.sh/..` 识别为工程根目录。
- 如需跳过启动时的 `README.md` 展示，可临时设置：

  ```shell
  JOBS_SKIP_README=1 zsh './拉取Flutter侧三方资源.sh'
  ```

## 四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 执行流程：

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["展示 README.md"]
    B --> C["识别工程根目录"]
    C --> D["检查默认 podhelper"]
    D --> D1["podhelper 存在：直接结束"]
    D --> D2["podhelper 不存在：探测 flutter 或 fvm"]
    D2 --> E["扫描 Flutter 工程候选目录"]
    E --> F["逐个执行 flutter pub get"]
    D1 --> Z["写入日志并结束"]
    F --> Z
  ```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 脚本会执行 `flutter pub get`，可能改动 Flutter 依赖缓存和生成目录；失败时按 non-blocking 规则继续。
- 涉及安装、更新、升级类动作时，交互统一为“直接回车跳过；输入任意字符后回车执行”。
- 涉及危险删除动作时，必须输入 `YES` 才会继续。

## 六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 日志会同步写入：

  ```text
  $TMPDIR/拉取Flutter侧三方资源.log
  ```

## 七、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本次整理只做脚本结构升级、静态语法检查和目录检查；没有在你的 [**MacOS**](https://www.apple.com/macos/) 环境里实际执行脚本。
- 依赖 [**Flutter**](https://flutter.dev/) 或 [**fvm**](https://fvm.app) 已存在于当前环境。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
