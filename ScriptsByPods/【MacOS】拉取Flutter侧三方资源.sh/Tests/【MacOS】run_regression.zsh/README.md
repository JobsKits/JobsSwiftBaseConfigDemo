# `【MacOS】run_regression.zsh`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、用途与依赖](#jobs-toc-heading-2)
- [二、运行与验证](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

用临时目录和假命令验证所属 Flutter 工具的确认、发现与失败恢复边界。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、用途与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 运行时：zsh；命名按实际解释器区分，Ruby 不加 `【MacOS】`，系统 zsh 使用 `【MacOS】`。
- zsh 隔离回归入口；--run 明确执行测试，失败返回非零状态。
- 本脚本用于隔离回归；测试数据与替身命令由实现创建，不作为真实安装或构建入口。先阅读脚本中的夹具与断言，再按下列命令运行。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本目录执行：

```shell
/bin/zsh './【MacOS】run_regression.zsh' --run
```

本目录与脚本同名并保留 `.zsh` 后缀。复制时保留所属工具的完整目录及相对依赖；本说明不替代上级工具对输入、输出和副作用的约定。

**终端配色保护：** 独立运行时，在支持完整保存与恢复配色的交互终端中临时使用黑底白字及统一强调色；正常结束、失败或可捕获中断后恢复进入前的配色，不修改终端全局偏好或 Shell 启动配置。不支持完整保护、无交互终端、`NO_COLOR`、既有纯文本模式和 Sourcetree 场景不切换配色，并沿用纯文本输出约定。强制终止（如 `kill -9`）无法由脚本自身保证恢复，请使用运行时显示的独立恢复入口。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
