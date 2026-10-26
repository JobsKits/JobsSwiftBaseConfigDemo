# `清理Unity缓存.sh`

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

- 本目录包含同名脚本 `清理Unity缓存.sh` 和当前 `README.md`。
- 使用 `zsh` 入口、运行时内置说明、回车确认、业务选择和日志落盘。
- 用途：清理 [**Unity**](https://unity.com) `Library` 下常见构建缓存，并可独立选择执行 [**Homebrew**](https://brew.sh/) 的 `brew cleanup`。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- Unity Bee / Tundra / Il2cppBuildCache 缓存导致跨机器或路径编译异常时。
- 需要清理 `Library/BuildCache`、`Library/ScriptAssemblies` 等缓存时。
- 需要保留危险删除的 `YES` 二次确认时。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 在当前目录执行：

  ```shell
  zsh './清理Unity缓存.sh'
  ```

- 默认 `interactive`：每次展示固定内置说明并等待回车；`Ctrl+C` 取消，EOF 或无 TTY 在初始化日志和业务前停止。`JOBS_SKIP_README`、`JOBS_POD_INSTALL_HOOK` 不代替确认。
- `JOBS_POD_INSTALL_INTERACTION=check-only` 或 `skip`：只展示说明并跳过整个清理任务，不清空日志、不删除缓存、不执行 `brew cleanup`；其它模式值报错退出。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 默认目录布局：

  ```text
  工程根目录/
  └── ScriptsByPods/
      └── 清理Unity缓存.sh/
          ├── 清理Unity缓存.sh
          └── README.md
  ```

- 自动从脚本位置解析工程根目录；保留旧的 `工程根目录/清理Unity缓存.sh/脚本本体` 单层布局兼容，不要求拖入目录。
- 需要明确跳过写入任务时：

  ```shell
  JOBS_POD_INSTALL_INTERACTION=skip zsh './清理Unity缓存.sh'
  ```

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 执行流程：

  ```mermaid
  flowchart TD
    A["启动脚本"] --> B["内置说明与模式检查"]
    B -->|"check-only / skip"| X["不写日志、不执行业务"]
    B -->|"interactive 回车确认"| C["初始化日志与工程根目录"]
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

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 脚本包含 `rm -rf` 删除缓存目录，必须输入 `YES` 才会执行删除；非交互环境默认取消删除。
- 涉及安装、更新、升级类动作时，交互统一为“直接回车跳过；输入任意字符后回车执行”。
- 涉及危险删除动作时，必须输入 `YES` 才会继续。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 日志会同步写入：

  ```text
  /tmp/清理Unity缓存.log
  ```

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">七、验证与限制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `zsh -n` 静态检查及[四脚本入口隔离回归](../配置Flutter环境.sh/Tests/interaction_regression.rb)通过；伪终端验证回车与 EOF，业务函数替换为临时标记，没有删除真实缓存或执行 Homebrew。
- 如检测到 [**Homebrew**](https://brew.sh/)，可按提示执行 `brew cleanup` 清理旧版本包和缓存。


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
