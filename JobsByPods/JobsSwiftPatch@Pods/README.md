# `JobsSwiftPatch`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftPatch` 是 Jobs Swift 工程里的本地 Runtime Patch Pod。第一版只支持把 Objective-C runtime 可见的方法临时替换为本地 payload 返回方法，并提供 rollback 能力。

## 一、Pod 定位

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsSwiftPatch` |
| Pod 类型 | 自建本地 Swift Pod |
| 版本 | `0.0.1` |
| 平台 | `ios 12.0` |
| podspec | `JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.podspec` |

## 二、适用场景

- Swift Demo 演示 Runtime 热更新思想。
- 页面级临时 patch：进入页面安装，离开页面 rollback。
- 后续可扩展网络补丁、签名校验、白名单 selector 和脚本解释层。

## 三、公开能力

- `JobsSwiftPatchModel`：描述 patch 的 identifier、target class、selector 和 payload。
- `JobsSwiftPatchMgr`：安装、回滚、查询 patch。

## 四、风险说明

- 当前能力属于高风险 Runtime 演示能力，不建议提交 App Store。
- 第一版只支持 payload provider，不支持任意 Swift/ObjC 消息派发或 JS 脚本执行。
- 被替换方法必须暴露给 Objective-C runtime，且返回类型应与 payload block 一致。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
