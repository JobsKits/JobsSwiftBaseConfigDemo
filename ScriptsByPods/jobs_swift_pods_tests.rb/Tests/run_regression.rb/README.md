# <span id="前言">Swift Pod 测试入口隔离回归</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [一、运行](#jobs-toc-heading-1)
- [二、验证范围](#jobs-toc-heading-2)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">一、运行 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

在项目根目录运行，使用 [**Ruby**](https://www.ruby-lang.org/) 标准库及随系统提供的 Minitest：

```shell
ruby ScriptsByPods/jobs_swift_pods_tests.rb/Tests/run_regression.rb/run_regression.rb
```

入口以脚本自身位置加载[被测模块](../../jobs_swift_pods_tests.rb)，不依赖启动工作目录。夹具只创建系统临时目录和属于自身的 Ruby 进程组；结束后清理，不安装依赖、不调用真实 [**Xcode**](https://developer.apple.com/xcode) 构建或测试。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">二、验证范围 <a href="#前言">🔼</a> <a href="#🔚">🔽</a></span><!-- jobs-toc:heading-end -->

| 夹具 | 检查内容 |
| --- | --- |
| 普通成功／非零退出 | 日志保留、真实退出码、主进程回收与最终成功标志 |
| 存活主进程超时 | 到期终止本次进程组，不能把强停算成功 |
| 主进程退出而后代持有管道 | 超时仍然生效；主进程原退出码保留，剩余子进程终止 |
| 后代忽略 TERM | 主进程退出后仍补发 KILL；另起的无关进程保持运行 |
| 长预算下的管道排空 | 主进程已退出时，管道排空独立限时，不等待完整阶段预算 |
| 官方结果树结构夹具 | 每个选中 Pod 必须唯一匹配；缺 bundle、零测试、重复 bundle、失败、跳过和预期失败均拒绝通过 |

每次运行子进程夹具外层另设 8 秒看门狗，防止被测超时逻辑回退导致回归本身挂起。测试树是结构夹具，不能替代真实 `.xcresult` 解析或 64 个 Pod 的实际测试执行；后两项由主测试入口单独验证。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
