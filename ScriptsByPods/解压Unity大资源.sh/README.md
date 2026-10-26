# `解压Unity大资源.sh`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、适用场景](#jobs-toc-heading-2)
- [二、运行方式](#jobs-toc-heading-3)
- [三、执行前检查](#jobs-toc-heading-4)
- [四、流程图](#jobs-toc-heading-5)
- [五、风险说明](#jobs-toc-heading-6)
- [六、日志文件](#jobs-toc-heading-7)
- [七、验证与限制](#jobs-toc-heading-8)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

- 本目录包含同名脚本 `解压Unity大资源.sh` 和当前 `README.md`。
- 使用 `zsh` 入口、运行时内置说明、回车确认和日志落盘。
- 用途：在工程内查找 [**Unity**](https://unity.com) 导出资源合并脚本，并按 non-blocking 方式尝试执行。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `pod install` 前后需要补齐 Unity 大资源时。
- `Unity/xcode_effectTest/Libraries/【MacOS】🧩子卷➤合而为一源文件.command` 已存在时。
- 希望目标脚本失败时只提示、不阻断主流程时。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 在当前目录执行：

  ```shell
  zsh './解压Unity大资源.sh'
  ```

- 默认 `interactive`：每次展示固定内置说明并等待回车；`Ctrl+C` 取消，EOF 或无 TTY 在初始化日志和业务前停止。`JOBS_SKIP_README`、`JOBS_POD_INSTALL_HOOK` 不代替确认。
- `JOBS_POD_INSTALL_INTERACTION=check-only` 或 `skip`：只展示说明并跳过整个任务，不清空日志、不执行资源合并脚本；其它模式值报错退出。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 默认目录布局：

  ```text
  工程根目录/
  └── ScriptsByPods/
      └── 解压Unity大资源.sh/
          ├── 解压Unity大资源.sh
          └── README.md
  ```

- 自动从脚本位置解析工程根目录；保留旧的 `工程根目录/解压Unity大资源.sh/脚本本体` 单层布局兼容，不要求拖入目录。
- 需要明确跳过写入任务时：

  ```shell
  JOBS_POD_INSTALL_INTERACTION=skip zsh './解压Unity大资源.sh'
  ```

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 执行流程：

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["内置说明与模式检查"]
    B -->|"check-only / skip"| X["不写日志、不执行目标"]
    B -->|"interactive 回车确认"| C["初始化日志与工程根目录"]
    C --> D["检查目标 Unity 合并脚本"]
    D --> D1["目标不存在：提示后结束"]
    D --> D2["目标存在：识别 shebang"]
    D2 --> E["选择 bash 或 zsh 执行"]
    E --> F["输出执行结果"]
    D1 --> Z["写入日志并结束"]
    F --> Z
  ```

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 目标脚本本身可能有副作用，本脚本只负责定位并执行它；目标失败时只记录警告，不中断外层流程。
- 涉及安装、更新、升级类动作时，交互统一为“直接回车跳过；输入任意字符后回车执行”。
- 涉及危险删除动作时，必须输入 `YES` 才会继续。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 日志会同步写入：

  ```text
  /tmp/解压Unity大资源.log
  ```

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">七、验证与限制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `zsh -n` 静态检查及[四脚本入口隔离回归](../配置Flutter环境.sh/Tests/interaction_regression.rb)通过；伪终端验证回车与 EOF，业务函数替换为临时标记，没有执行真实 Unity 资源合并。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
