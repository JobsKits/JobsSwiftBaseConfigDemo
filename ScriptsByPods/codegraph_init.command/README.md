# codegraph_init.command

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

用于在 `pod install` 完成并进入 `post_integrate` 收尾阶段后，按需生成 CodeGraph。

默认行为：

- `pod install` 结束阶段会弹出提示；
- 直接回车：自检 Homebrew、npm、CodeGraph，并执行 `codegraph init -i`；
- 输入 `n` / `no` / `skip`：跳过；
- 非交互式终端默认跳过，避免 CI 或脚本化执行被卡住；
- 如需非交互式强制执行，可使用：`CODEGRAPH_AUTO_INIT=1 pod install`。

自检链路：

1. Homebrew：存在则加载 `brew shellenv`；不存在则尝试安装 Homebrew。
2. npm：存在则直接使用；不存在则通过 `brew install node` 安装。
3. CodeGraph：存在则用 `npm i -g @colbymchenry/codegraph` 升级；不存在则用同一命令安装。
4. 最后执行：`codegraph init -i`。
