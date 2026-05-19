# `解压Unity大资源.sh`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

- 本目录包含同名脚本 `解压Unity大资源.sh` 和当前 `README.md`。
- 脚本已按 Jobs 的 [**Markdown**](https://markdown.cn) / Shell 约束整理：`zsh` 入口、结构化函数、彩色日志、`README.md` 启动展示、防误触确认、日志落盘。
- 用途：在工程内查找 Unity 导出资源合并脚本，并按 non-blocking 方式尝试执行。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `pod install` 前后需要补齐 Unity 大资源时。
- `Unity/xcode_effectTest/Libraries/【MacOS】🧩子卷➤合而为一源文件.command` 已存在时。
- 希望目标脚本失败时只提示、不阻断主流程时。

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在当前目录执行：

  ```shell
  zsh './解压Unity大资源.sh'
  ```

- 交互环境下，脚本会先展示本 `README.md`，按回车继续，按 `Ctrl+C` 取消。
- 非交互环境下，脚本会跳过 `README.md` 阻塞展示，避免影响自动化流程。

## 三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 确认脚本目录位于工程根目录的下一层：

  ```text
  工程根目录/
  └── 解压Unity大资源.sh/
      ├── 解压Unity大资源.sh
      └── README.md
  ```

- 脚本会把 `解压Unity大资源.sh/..` 识别为工程根目录。
- 如需跳过启动时的 `README.md` 展示，可临时设置：

  ```shell
  JOBS_SKIP_README=1 zsh './解压Unity大资源.sh'
  ```

## 四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 执行流程：

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["展示 README.md"]
    B --> C["识别工程根目录"]
    C --> D["检查目标 Unity 合并脚本"]
    D --> D1["目标不存在：提示后结束"]
    D --> D2["目标存在：识别 shebang"]
    D2 --> E["选择 bash 或 zsh 执行"]
    E --> F["输出执行结果"]
    D1 --> Z["写入日志并结束"]
    F --> Z
  ```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 目标脚本本身可能有副作用，本脚本只负责定位并执行它；目标失败时只记录警告，不中断外层流程。
- 涉及安装、更新、升级类动作时，交互统一为“直接回车跳过；输入任意字符后回车执行”。
- 涉及危险删除动作时，必须输入 `YES` 才会继续。

## 六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 日志会同步写入：

  ```text
  /tmp/解压Unity大资源.log
  ```

## 七、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本次整理只做脚本结构升级、静态语法检查和目录检查；没有在你的 [**MacOS**](https://www.apple.com/macos/) 环境里实际执行脚本。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
