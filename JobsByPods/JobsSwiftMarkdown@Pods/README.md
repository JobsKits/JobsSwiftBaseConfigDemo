# JobsSwiftMarkdown

[toc]

---

## 一、能力

`JobsSwiftMarkdown` 是面向 Jobs Swift 工程的本地 Markdown 渲染 Pod。它使用
`WKWebView` 承载成熟的 Web 解析内核，支持：

- CommonMark / GFM、表格、删除线、任务列表；
- `[toc]`、标题锚点、文档内跳转；
- Objective-C、Swift、Shell 等代码高亮与复制；
- Mermaid、KaTeX；
- 原始 HTML、项目相对图片和其它本地资源；
- 浅色、深色、跟随系统与自定义 CSS；
- UTF-8 文本在原生层与 JavaScript 运行时之间安全传输；
- 构建期文档清单，以及 Markdown 文件之间的链接。

## 二、接入

```ruby
pod 'JobsSwiftMarkdown', :path => 'JobsByPods/JobsSwiftMarkdown@Pods'
```

宿主 App 还需要在构建阶段调用 `Support/JobsMarkdownPackager.rb`，把当前仓库的
Markdown 和被引用的本地资源写入 App 内的 `JobsMarkdownDocuments.bundle`。
脚本只允许把该固定名称 Bundle 写入构建产物目录，并默认跳过 `.git`、`Pods`、
手工第三方、Unity、构建目录和生成报告。

## 三、读取与渲染

```swift
let catalog = try JobsMarkdownCatalog.bundled()
let document = catalog.documents[0]
let markdownView = JobsMarkdownView()
markdownView.load(document)
```

文档列表属于宿主 Demo；Pod 只负责清单模型、文件读取与渲染。宿主 Demo 的
详情导航标题跟随当前文档标题，列表点按态使用主题语义背景色。

## 四、第三方内核

资源包内原样包含 `markdown-it`、`highlight.js`、`Mermaid`、`KaTeX` 和
`DOMPurify` 的浏览器发行文件。版本与许可证见 `ThirdPartyLicenses`，Jobs 自有
代码不修改这些第三方文件。
