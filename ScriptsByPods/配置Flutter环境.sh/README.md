# `配置Flutter环境.sh`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

- 本目录包含同名脚本 `配置Flutter环境.sh` 和当前 `README.md`。
- 脚本已按 Jobs 的 [**Markdown**](https://markdown.cn) / Shell 约束整理：`zsh` 入口、结构化函数、彩色日志、`README.md` 启动展示、防误触确认、日志落盘。
- 用途：检查并按需安装 / 更新 Homebrew、FVM、Flutter stable，并为 iOS 预缓存 Flutter 引擎。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 新机器首次准备 [**Flutter**](https://flutter.dev/) iOS 构建环境时。
- 需要通过 [**fvm**](https://fvm.app) 管理 `stable` 版本时。
- 需要执行 `flutter precache --ios` 和 `flutter pub get` 时。

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在当前目录执行：

  ```shell
  zsh './配置Flutter环境.sh'
  ```

- 交互环境下，脚本会先展示本 `README.md`，按回车继续，按 `Ctrl+C` 取消。
- 非交互环境下，脚本会跳过 `README.md` 阻塞展示，避免影响自动化流程。

## 三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 确认脚本目录位于工程根目录的下一层：

  ```text
  工程根目录/
  └── 配置Flutter环境.sh/
      ├── 配置Flutter环境.sh
      └── README.md
  ```

- 脚本会把 `配置Flutter环境.sh/..` 识别为工程根目录。
- 如需跳过启动时的 `README.md` 展示，可临时设置：

  ```shell
  JOBS_SKIP_README=1 zsh './配置Flutter环境.sh'
  ```

## 四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 执行流程：

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["展示 README.md"]
    B --> C["识别工程根目录"]
    C --> D["检查 Homebrew"]
    D --> E["按需安装或更新 FVM"]
    E --> F["按需安装或更新 Flutter stable"]
    F --> G["按需执行 flutter precache --ios"]
    G --> H["按需执行 flutter pub get"]
    H --> Z["写入日志并结束"]
  ```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 脚本涉及安装、升级、网络下载和写入 shell profile；所有安装 / 更新 / 升级动作默认回车跳过，输入任意字符后才执行。
- 涉及安装、更新、升级类动作时，交互统一为“直接回车跳过；输入任意字符后回车执行”。
- 涉及危险删除动作时，必须输入 `YES` 才会继续。

## 六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 日志会同步写入：

  ```text
  /tmp/配置Flutter环境.log
  ```

## 七、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本次整理只做脚本结构升级、静态语法检查和目录检查；没有在你的 [**MacOS**](https://www.apple.com/macos/) 环境里实际执行脚本。
- 依赖 [**Homebrew**](https://brew.sh/)、[**fvm**](https://fvm.app)、[**Flutter**](https://flutter.dev/) 的网络可用性。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
