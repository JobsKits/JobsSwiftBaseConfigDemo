# Flutter 资源脚本的 SDK 初始化验证

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

用 Python 标准库运行真实脚本定义和随包适配器，只替换网络探测及 SDK 执行文件。不下载真实 SDK、不运行 CocoaPods，不修改系统环境。

## 一、运行

`python3 -B <本目录>/test_sdk_network.py`。临时中文空格目录覆盖首次 SDK 失败重试、健康探测取消不进其它候选、pub 准备取消原码、原 pub 业务失败只执行一次，以及健康 module 零探测跳过。配置备份及显式重生成流程沿用原逻辑。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
