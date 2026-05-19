# `清理Unity缓存.sh`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

- 本目录包含同名脚本 `清理Unity缓存.sh` 和当前 `README.md`。
- 脚本已按 Jobs 的 [**Markdown**](https://markdown.cn) / Shell 约束整理：`zsh` 入口、结构化函数、彩色日志、`README.md` 启动展示、防误触确认、日志落盘。
- 用途：清理 Unity `Library` 下常见构建缓存，并可顺手执行 `brew cleanup`。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Unity Bee / Tundra / Il2cppBuildCache 缓存导致跨机器或路径编译异常时。
- 需要清理 `Library/BuildCache`、`Library/ScriptAssemblies` 等缓存时。
- 需要保留危险删除的 `YES` 二次确认时。

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在当前目录执行：

  ```shell
  zsh './清理Unity缓存.sh'
  ```

- 交互环境下，脚本会先展示本 `README.md`，按回车继续，按 `Ctrl+C` 取消。
- 非交互环境下，脚本会跳过 `README.md` 阻塞展示，避免影响自动化流程。

## 三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 确认脚本目录位于工程根目录的下一层：

  ```text
  工程根目录/
  └── 清理Unity缓存.sh/
      ├── 清理Unity缓存.sh
      └── README.md
  ```

- 脚本会把 `清理Unity缓存.sh/..` 识别为工程根目录。
- 如需跳过启动时的 `README.md` 展示，可临时设置：

  ```shell
  JOBS_SKIP_README=1 zsh './清理Unity缓存.sh'
  ```

## 四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 执行流程：

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["展示 README.md"]
    B --> C["识别工程根目录"]
    C --> D["检查 Unity 目录"]
    D --> D1["目录不存在：跳到清理收尾"]
    D --> D2["目录存在：收集 Unity 缓存目录"]
    D2 --> E["要求输入 YES"]
    E --> E1["未输入 YES：取消删除"]
    E --> E2["已输入 YES：删除指定缓存目录"]
    D1 --> H["按需执行 brew cleanup"]
    E1 --> H
    E2 --> H
    H --> Z["写入日志并结束"]
  ```

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 脚本包含 `rm -rf` 删除缓存目录，必须输入 `YES` 才会执行删除；非交互环境默认取消删除。
- 涉及安装、更新、升级类动作时，交互统一为“直接回车跳过；输入任意字符后回车执行”。
- 涉及危险删除动作时，必须输入 `YES` 才会继续。

## 六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 日志会同步写入：

  ```text
  /tmp/清理Unity缓存.log
  ```

## 七、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本次整理只做脚本结构升级、静态语法检查和目录检查；没有在你的 [**MacOS**](https://www.apple.com/macos/) 环境里实际执行脚本。
- 如检测到 [**Homebrew**](https://brew.sh/)，可按提示执行 `brew cleanup` 清理旧版本包和缓存。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
