# `JobsSwiftOpen`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsSwiftOpen` 是 [**Swift**](https://www.swift.org/) URL 打开组件，统一管理应用内网页和系统默认浏览器两种打开方式。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认 URL：`http://www.baidu.com`。
- 默认模式：`.inApp`，使用应用内 `WKWebView` 页面。
- 外部模式：`.externalBrowser`，交给系统默认浏览器。
- 应用内打开时优先压入当前导航栈；没有导航栈时使用全屏导航控制器承载。
- 应用内网页统一显示返回按钮：存在网页浏览历史时优先网页后退，否则退出当前 Web 页面；同时支持导航栈和模态导航容器。

## 二、接入示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```swift
import JobsSwiftOpen

JobsOpen.shared.open(
    JobsOpenConfiguration()
        .byURL(URL(string: "https://www.baidu.com")!)
        .byMode(.inApp),
    from: self
)
```

将 `mode` 设为 `.externalBrowser` 时，改用系统默认浏览器打开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
