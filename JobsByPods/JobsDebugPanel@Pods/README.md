# `JobsDebugPanel`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

<u>[**Swift**](https://www.swift.org/)</u> 调试工具：屏幕前方的圆形按钮 push 出功能列表，再次点击退出本次调试页面并返回打开前的宿主页面，默认功能为 App 网络环境切换。长按按钮只隐藏到本进程结束，下次启动自动恢复。

## 一、接入与配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- [**CocoaPods**](https://cocoapods.org/) 仅在 Debug 依赖，并且所有源码均有 `#if DEBUG`；Release 不初始化、不链接此 Pod，也不展示 Demo 入口。

  ```ruby
  pod 'JobsDebugPanel', :path => 'JobsByPods/JobsDebugPanel@Pods', :configurations => ['Debug']
  ```

- 在 `AppDelegate` 的 Debug 启动路径配置 URL 与备注，再注册自定义功能。默认环境项排在第一行，自定义项按 `byAddAction` 的调用顺序排列。图片可不配置，点击闭包得到当前功能列表 VC，可继续 push 或执行操作。

  ```swift
  #if DEBUG
  import JobsDebugPanel
  import JobsNetworking
  import JobsByUIKit

  JobsDebugPanel.shared
      .byEnvironments([
          JobsDebugEnvironment()
              .byIdentifier("local")
              .byTitle("本地 Mock")
              .byBaseURL("http://127.0.0.1:18080"),
          JobsDebugEnvironment()
              .byIdentifier("httpbin")
              .byTitle("公共测试")
              .byBaseURL("https://httpbin.org")
      ])
      .byEnvironmentDidChange { environment in
          JobsNetworkingDebugEnvironment.shared.byBaseURL(environment.baseURL)
      }
      .byAddAction(
          JobsDebugAction()
              .byTitle("我的自定义功能")
              .byImage(nil)
              .byAction { sourceVC in
                  sourceVC.navigationController?.pushViewControllerByAnimated(MyDemoVC())
              }
      )
      .byStart()
  #endif
  ```

## 二、环境与窗口行为 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 环境只接受带有效 host 的 HTTP / HTTPS URL。无效条目自动过滤；保存的 URL 不在当前配置中时回退到首个有效环境。持久化键为 `JobsDebugPanel.Debug.SelectedEnvironmentURL`，只由 Debug 代码读取与写入。
- 切换后立即调用 `byEnvironmentDidChange`，并发出 `environmentDidChangeNotification`。`JobsNetworkingDebugEnvironment` 作用于既有 agent 的后续相对路径请求与上传；已发出的请求、重试和明确的绝对 URL 保持原目标，缓存仍按最终 URL 隔离。其它网络栈需在该回调中更新各自配置。
- 各前台活跃 Scene 都有独立的透明 UIWindow；未启用 Scene 的宿主从 AppDelegate 的 window 接入。它不抢宿主 keyWindow，圆按钮之外的触摸穿透；按钮点击使用其所属 Scene 的宿主窗口导航栈，并沿抽屉等自定义容器的可见子控制器解析。无导航栈时先展示临时导航容器，在展示完成后 push 功能列表；返回会关闭临时容器。
- 业务 `UIAlertController` 显示期间也能点击圆按钮；面板尚未打开时先安全关闭该弹窗，再解析当前宿主并 push 工具列表。面板已打开时先关闭工具弹窗，再退出菜单、环境页及本次自定义工具页面；均不执行弹窗的业务 action。
- 悬浮按钮按所属窗口切换打开 / 关闭；返回到菜单之前的宿主页面，无宿主导航栈时关闭临时导航容器。转场期间重复点击不会叠加导航，宿主重建根页面后以实际导航栈和窗口为准。无障碍文案同步描述下一次点击的动作；`open(from:)` 仍作为显式打开入口。
- 从自定义功能再次打开面板时，优先返回导航栈内已有的功能列表，避免重复创建与宿主的安全 push 去重冲突。
- 面板、环境列表及宿主 Demo 跟随 `JobsThemeCenter` 的有效主题；页面背景、单元格、文字、选中态和原生附件同步更新，App 外观与系统外观不同时也保持一致。已打开的页面随主题切换即时更新。
- 圆按钮可单指拖动，位置限定在当前窗口安全区域内；旋转或窗口尺寸变化时重新限制位置。拖动不会打开菜单或触发长按隐藏，拖动后仍可点击打开；位置仅在当前 Scene 的本次启动内保留。
- 圆按钮的长按隐藏状态只存在内存中，不写入持久化配置。背景图来自打包资源，无文字、无运行时网络图片。

## 三、Demo 与离线预览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 宿主的“实用工具集”中有 `JobsDebugPanel Demo`；`AppDelegate+JobsDebugPanel.swift` 展示完整配置与两个自定义入口。
- 默认三环境是 `http://127.0.0.1:18080` 本地 Mock、`https://httpbin.org` 公共测试和 `https://postman-echo.com` 联调测试。
- Demo 每次进入、切换环境或点击重新请求都会通过 `JobsNetworking` 请求当前环境的 `/get`，超时为 3 秒且不自动重试。请求成功后展示解析后的真实响应，失败、超时或无法解析则保留本地演示说明；接口恢复后下一次成功响应自动替换。
- 未启动本地服务时直接以 Debug 运行即可预览；切到公共测试环境可验证真实网络请求。环境列表未配置数据时显示 `JobsEmptyAuto` 按钮空态与重新加载入口。

## 四、弱网边界与资源来源 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 不提供“全 App 弱网”开关：普通 [**iOS**](https://developer.apple.com/ios/) App 无法通过公开 API 全局控制系统网络带宽、延迟和丢包；只延迟某个请求回调无法覆盖 WebSocket、媒体流和其它请求栈。需要真实弱网测试时，开发者可手动使用系统 [**Network Link Conditioner**](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/On_Demand_Resources_Guide/TestingPerformance.html)。[**URLProtocol**](https://developer.apple.com/documentation/foundation/urlsessionconfiguration/protocolclasses) 的局部拦截也不适用于后台 URLSession，不能据此宣称完整弱网覆盖。
- 素材先检索 [**iconfont**](https://www.iconfont.cn/)，未能确认匹配图标的作者许可，改用 [**Ant Design Icons**](https://github.com/ant-design/ant-design-icons) 官方 `filled/bug.svg`，MIT 许可。
- `Resource/JobsDebugPanelButton.svg` 使用官方图形路径配合圆底本地渲染为 `Resource/JobsDebugPanelButton.png`；PNG 是实际打包背景图，SVG 为可追溯源文件。许可证为 `Resource/AntDesignIcons-LICENSE`。宿主 Debug Demo 入口通过只读 `JobsDebugPanel.buttonImage` 复用 Pod 图片，无宿主 Asset Catalog 副本，Release 不打包该图标。
- 官方源：[bug.svg](https://github.com/ant-design/ant-design-icons/blob/master/packages/icons-svg/svg/filled/bug.svg)。

## 五、运行合同与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

所有调试面板实现由 DEBUG 条件控制，Release 不暴露调试窗口。面板按当前 UIWindowScene 创建独立 overlay；关闭后恢复原窗口，后台或 scene 断开时由宿主隐藏/释放。回归包含多 Scene、主题、面板打开后切页及 Release 构建；调试环境选择不应泄露凭据。


## 六、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

隐私清单通过独立资源 bundle 交付。当前所需理由 API：`UserDefaults`（CA92.1）。理由对应本库实际用途；宿主仍需核对业务数据收集、App Group / 用户授权文件等实际使用场景，资源声明与最终 App 内 bundle 都应验收。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsDebugPanel --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
