# Swift App骨架功能盘点

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、资产矩阵](#matrix)
- [二、已知缺口与比对口径](#gaps)
- [三、验证边界与复测清单](#verification)
- [四、Core Data 专项接入资产](#coredata-assets)
- [五、报告目录](#reports)
- [六、世界时钟追加需求（2026-11-16）](#world-clock-assets)
- [当前时区卡片与制式标题合同（2026-11-16）](#jobs-toc-heading-8)
- [首页返回、侧栏与开屏浮控增量](#home-return-sidebar-20261116)
- [Rust OCR 独立 Demo 接线（2026-11-16）](#jobs-toc-heading-10)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

核查日期：2026-11-15，验证状态更新于2026-11-16。范围为 App 的启动、开屏、根容器、首页目录、导航、菜单、搜索、侧栏、设置、悬浮控件和全局生命周期。**不统计 Demo 子页面内的业务功能**；菜单目的页只核对是否真正路由进入。实际验证范围见第三节，实体交互尚待验收。

## 一、<span id="matrix">资产矩阵</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 编号 | 入口／资产 | 当前行为 | 默认／边界 | 持久化／状态键 | 状态 | 实际源码证据 |
| --- | --- | --- | --- | --- | --- | --- |
| SKEL-01 | 启动风险门禁 | App启动先设备风险判断；阻断时不初始化业务，Scene展示拦截页 | 按设备决策；实体风险效果待验 | `JobsDeviceLaunchGate` | 已核查接线 | [AppDelegate.swift](<../JobsSwiftBaseConfigDemo/启动入口/AppDelegate.swift>) 第 81 行（`evaluateAtLaunch`） |
| SKEL-02 | Scene／独立Window | 正常启动、恢复activity、巡检路由分别建根；每Scene持Window并转发Flutter生命周期 | 正常使用设置决定根入口；恢复分支跳过普通开屏 | `UISceneSession.persistentIdentifier / NSUserActivity` | 已核查接线 | [SceneDelegate.swift](<../JobsSwiftBaseConfigDemo/启动入口/SceneDelegate.swift>) 第 51 行（`willConnectTo`） |
| SKEL-03 | 根入口／TabBar | 直接Demo列表与TabBar可切；TabBar包含Demo、消息、我的三个导航容器 | 默认直接列表；设置返回后重建根 | `RootList.usesTabBarEntry` | 已实现 | [RootListSettingsVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootListSettingsVC.swift>) 第 142 行（`makeAppRootViewController`） |
| SKEL-04 | 开屏显示／退出 | 根容器上展示，倒计时5秒并可跳过；点／摇可打开配置链接；结束应移除开屏层 | 默认启用；本地图片／GIF／远程图片／本地视频／远程视频 | `JobsSwiftSplash.isEnabledForNextLaunch / com.jobs.splash.contentTypeForNextLaunch` | 宿主已接线；Presenter终态与离线缓存实体待验 | [SceneDelegate.swift](<../JobsSwiftBaseConfigDemo/启动入口/SceneDelegate.swift>) 第 112 行（`byCountdownSeconds(5)`） |
| SKEL-05 | 导航返回与目录连续性 | Root进入独立子页；返回可回顶部刷新或保持列表 | 默认回顶部并刷新 | `RootList.returnToTopAndRefresh` | 已实现 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`performDemoListAppearanceUpdate`） |
| SKEL-06 | 右上唯一菜单 | 32×32 ellipsis.circle／fill；圆角8的独立阴影卡片，宽度最小112按翻译测量、48行高、上下8内边距，无行分隔线；三项原动作保留 | 默认收起；真实button转换到内容view坐标锚定，safeArea内右对齐钳制；布局／语言／主题更新重定位，外点及离开首页收起 | `内存` | 最终隔离arm64构建及11.374秒实体菜单短链通过；3项菜单在触发按钮下方且不越屏，圆角／表面层次／阴影已实看；其它语言／主题菜单待验 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`functionMenuSurface / layoutFunctionMenuIfVisible`） |
| SKEL-07 | 搜索独占与取消恢复 | 菜单进入；隐藏导航／3浮控／Bug，禁侧缘手势；取消恢复滚动位置／展开组／显示状态；键盘收起不退出 | 首页无常驻搜索；空查询是历史落地页 | `com.BSports.JobsSwiftDemoSearchHistoryUserDefaultsKey` | 已实现 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`setSearchEnabled`） |
| SKEL-08 | 搜索匹配与空态 | 匹配标题／组名／VC类型，非空结果组展开；历史由Searcher保存；搜索空态与首页隔离 | 默认空查询；首组展开只属首页状态 | `历史key见07；查询内存` | 已核查入口；异常输入与视觉待验 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`applySearchKeyword`） |
| SKEL-09 | 侧栏入口与路由 | 左上及左缘打开JobsMeCenterVC；用户信息／崩溃日志／最近使用／设置／关于 | 用户信息／崩溃日志／最近使用进入页面，设置／关于仍为Toast | `侧栏选择无新存储` | 最近使用已接入；两项原占位保留 | [JobsMeCenterVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/临时项目页面/个人中心占位/JobsMeCenterVC.swift>)（`didSelectRowAt`） |
| SKEL-10 | 侧栏跟随／固定 | 配置following会连带主导航内容右移，fixed保持内容；设置切模式 | 默认following，根入口presentedRatio 0.5；首页无全宽比例选择器 | `RootList.sideDrawerContentMode` | 两模式接入；全宽选择缺失 | [RootListSettingsVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootListSettingsVC.swift>) 第 194 行（`presentedRatio: 0.5`） |
| SKEL-11 | 组展开／收缩 | 每组点按展开收起，菜单批量切；默认只展开第一组；搜索展开匹配组 | 展开集合内存，非跨启动记忆 | `expandedGroups（内存）` | 已实现 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`setAllDemoGroupsExpanded`） |
| SKEL-12 | 组拖放与记忆 | 组拖放后改顺序，同步展开集合；其他组固定最后；终点持久化恢复 | 有记忆，无“不记忆／重启还原”显式设置 | `com.BSports.JobsSwiftDemoListSectionOrderUserDefaultsKey` | 持久排序实现；记忆开关缺失 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`saveDemoSectionOrder`） |
| SKEL-13 | 功能项置顶／取消 | 顶部独立section，移出原组；取消回原组并展开；pin后滚到顶部 | 默认无置顶；稳定类名key | `com.BSports.JobsSwiftPinnedDemoUserDefaultsKey` | 已实现 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`pinDemoItem`） |
| SKEL-14 | 时间浮控 | `#1565C0`深蓝白字（白字对比约5.746）、圆角10；本地化标题＋等宽 `HH:mm:ss`，基准18pt粗体随系统字号；按实际字体测量，两侧各16／上下各10；可用安全区限制宽度，窄屏／大字换行增高，不缩字；全屏可拖、nearestEdge；短按push世界时钟、长按0.45秒后拖动吸边；设置显隐保留 | 默认显示；设置可恢复；秒值更新不改变宽度或拖后坐标；语言／字号／安全区变化重新测量并保留原吸附边、钳制到可用区域 | `com.jobs.demoList.showsSuspendTimeButton；坐标内存` | 源码已实现；语法通过；11项真实iOS字体／首布局／时区／12h回归与最终隔离arm64整包通过；首次UI导航遮挡失败后已修，中下部／导航区长按拖动及短tap push已实测通过；世界详情现代入口已修，46.677秒完整物理链通过；最后深蓝纯色版小构建与11.374秒初始钟／菜单截图短链通过；真实RGB #1565C0＋白字，对比5.746；实际多语／大字画面待验 | [RootListVC](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>) 的 `suspendBtn`／`layoutSuspendTimeButton`；[测量与边界](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootFloatingClockLayout.swift>) |
| SKEL-15 | 时间计时与显隐 | 首页24h每秒刷新；隐藏／离开首页暂停Timer，恢复显示resume；原长按隐藏弹窗已撤掉，显隐仅由既有设置管理 | 不影响其它悬浮按钮 | `com.jobs.demoList.showsSuspendTimeButton` | 已实现 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`refreshSuspendTimeButtonVisibility`） |
| SKEL-16 | 左下“按” | 紫50×50；短按声音＋切列表首尾；长按0.8秒触发1.2秒环进度及1.18缩放；结束／取消停止、吞冒出的短按 | 默认显示，可拖／吸边；按钮文字字体10 | `suspendFuseLongPressConsumed（内存）` | 已实现 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`private lazy var suspendFuseBtn`） |
| SKEL-17 | 右下旋转计时 | 橙50×50、22粗体秒数；每秒加1，点按同时启停旋转与计时＋触觉，长按Toast | 默认显示并运行；不跨启动保存秒数 | `RootListVC.suspendSpinBtn.timer（TimerID）` | 已实现 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`private lazy var suspendSpinBtn`） |
| SKEL-18 | Bug调试入口 | 独立overlay；56×56 Bug背景图，可拖；长按0.8秒隐藏，摇动恢复；再次点返回之前页面；搜索临时抑制 | Debug初始隐藏，摇动后显示；隐藏保留位置 | `显示与位置内存；选中环境见19` | 已核查组件；实体摇动待验 | [JobsDebugPanel.swift](<../JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift>) 第 327 行（`floatingEntryHidden`） |
| SKEL-19 | 调试环境与网络 | 注册local／httpbin／postman；选择回写JobsNetworking调试baseURL；查看当前环境等动作 | Debug默认首个有效local，优先恢复已存URL；Release不启动 | `JobsDebugPanel.Debug.SelectedEnvironmentURL` | 已实现；服务连通未验 | [AppDelegate+JobsDebugPanel.swift](<../JobsSwiftBaseConfigDemo/启动入口/AppDelegate+JobsDebugPanel.swift>) 第 19 行（`byEnvironments`） |
| SKEL-20 | 设置基础项 | 开屏、返回行为、时间显隐、主题、侧栏模式、启动入口、销毁提示；开屏内容／语言／文字策略分区展开 | 按各Preferences；入口切换返回后生效；开屏下次启动生效 | `RootList.*；其它key见对应行` | 已实现 | [RootListSettingsVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootListSettingsVC.swift>) 第 575 行（`GeneralSettingItem`） |
| SKEL-21 | 主题／语言 | 语言简繁藏英日法西德俄韩Tagalog；唯一全局主题入口与设置主题行提供白天／黑夜／跟随系统三选 | 新安装默认跟随系统；保留旧显式主题和自定义标识；Scene连接、trait变化和回前台更新system有效色；不强制Window外观；长菜单的可视区压缩到safeArea内并滚动完整内容 | `LanguageManager／JobsTheme.currentMode；旧JobsTheme.currentStyle迁移保留` | 2026-11-17源码完成；生产主题源真实iOS SDK编译与5项隔离XCTest通过；11词库检查通过；新SHA整包与系统热切换实屏待验 | [RootListSettingsVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootListSettingsVC.swift>)、[JobsTheme.swift](<../JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift>)、[SceneDelegate.swift](<../JobsSwiftBaseConfigDemo/启动入口/SceneDelegate.swift>) |
| SKEL-22 | 文字表现策略 | 一般／省略号／缩小字体／连续跑马灯／往返，设置回写并刷新 | 未配置默认continuous | `com.jobs.demoList.cellTextDisplayStrategy` | 已实现 | [RootListSettingsVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootListSettingsVC.swift>) 第 128 行（`cellTextDisplayStrategyKey`） |
| SKEL-23 | 刷新／空态／手势 | Window挂载后安装上下刷新；空列表提供空态；侧缘仅首页可开；搜索抑制其手势 | 本地目录，无服务端分页承诺；空结果由Searcher处理 | `刷新内存` | 已核查接线；取消竞态／无障碍待验 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`installTableRefreshControlsIfNeeded`） |
| SKEL-24 | 前后台／离屏计时 | Root销毁stop并移除Timer；Scene记录前后台；首页viewWillDisappear只显式pause进度图标Timer | 时间／旋转Timer后台及离屏策略需结合公共Timer实测 | `TimerID，无新偏好` | 部分核查，不能宣称已全停 | [Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)（`override func viewWillDisappear`） |
| SKEL-25 | 全局通知／日志／Flutter | App启用崩溃监控、主题资源、本地通知、语言、日志、Debug工具；Flutter条件导入创建引擎与桥 | 风险门禁放行后初始化；权限和服务单独验收 | `进程资源／本地通知与崩溃状态` | 宿主接线已核，实体未验 | [AppDelegate.swift](<../JobsSwiftBaseConfigDemo/启动入口/AppDelegate.swift>) 第 250 行（`func SA()`） |
| SKEL-26 | 最近使用 | 侧栏真实独立列表；普通组／置顶／搜索与最近列表打开真实Demo时记录；去重前插最多30个稳定类标识，按当前注册表过滤已移除项，重启恢复 | 默认空；重载动作与JobsEmptyAuto完整空态，返回列表保留视图与当前位置；全局主题／十语和原tl响应，目的页标题按当前语言解析 | `com.BSports.JobsSwiftRecentDemoUserDefaultsKey` | 存储隔离7项、11套文案解析与隔离副本arm64完整构建通过；实触待验 | [RootRecentDemoStore.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootRecentDemoStore.swift>)、[RootRecentDemosVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootRecentDemosVC.swift>) |
| SKEL-27 | `项目相关报告/` 的 [**Xcode**](https://developer.apple.com/xcode/) 物理目录入口 | 根导航使用蓝色 `PBXFileSystemSynchronizedRootGroup`，按磁盘自动发现文件与子目录，增删报告不需逐个维护引用 | 仅导航，不属于任何 target，不进入 Sources／Resources／Copy Files | `磁盘文件；无App偏好或运行时生命周期` | 同步组与无target归属已只读核对；实际Xcode已实看蓝色目录展开并显示5份物理报告；文件增删跟随未实测，不扩写为其它三工程界面已验 | [project.pbxproj](<../JobsSwiftBaseConfigDemo.xcodeproj/project.pbxproj>) 的 `项目相关报告` 同步组与根导航 |

## 二、<span id="gaps">已知缺口与比对口径</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 侧栏原“收藏”Toast占位已替换为真实“最近使用”；“设置／关于”仍为Toast。右上菜单设置确实进入RootListSettingsVC，两种入口不能混为一谈。
- 组排序记忆已实现，但未找到“不记忆”开关。根Drawer默认半宽，可配置比例不等于首页已提供全宽选择。
- 首页时间浮控必须全屏拖动，沿用最近边吸附；不得改成限制在头部的拖动范围。
- 2026-11-17三态主题源码与5项隔离回归通过；新SHA完整App的菜单、Settings取消／选择、重启恢复与真实系统外观热切换尚待实屏，所有十语与后台Timer行为仍需各自验证。
- 本批实际模块检查：当前15份`JobsSwiftBaseDefines`生产源已用iPhoneOS27.2 SDK重发模块，当前163份`JobsByUIKit`生产源（含三选菜单与滚动边界）消费该新模块后成功重发；当前完整Settings／Scene源再配实际宿主缓存模块、头映射与工程MainActor设置通过类型检查，没有接口桩。这里没有App链接、签名或整包运行，完整验收仍以新提交CI工件和实屏为准。隔离主题5项XCTest在专用iOS27.2模拟器执行，包含旧style迁移、自定义标识、system冷热持久化、手动模式、通知与弱绑定生命周期。证据保存在OCR仓`work/Validation/SwiftUIKitThemeMode`，首轮自动释放池夹具失败记录保留，修正夹具后第二轮全过。
- 与OC同一SKEL编号表达同类骨架资产；开屏倒计时、TabBar个数、时间按钮尺寸及侧栏占位情况属于实际实现差异，不能据此推导两套OC需求。

## 三、<span id="verification">验证边界与复测清单</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前已完成源码核查、四个改动Swift文件语法解析、最近使用独立存储7项断言，以及11套主工程本地化文件的`plutil -lint`。主App完整构建和模拟器实触状态如下，未全跑设备巡检。

- 原workspace的arm64构建被既有嵌入模块`my_flutter`阻断：依赖元数据由Flutter 3.41.6生成，但其`stable`路径已指向Flutter 3.50.0／Dart 3.14.0。原目录离线`pub get --enforce-lockfile`拒绝7项SDK传递依赖差异，原`pubspec.yaml`、`pubspec.lock`及4个生成元数据／环境文件的前后SHA-256均一致。
- 隔离验证副本的arm64完整构建已`BUILD SUCCEEDED`（exit0），正常执行Flutter、ObjectBox Sourcery、主App Swift编译与链接、Markdown打包、图标及嵌入阶段。工程／workspace复制到验证目录，Pods仍引用原工程；为支持Sourcery遍历，App原生源码采用495文件真实快照，复制时逐文件hash一致。最近使用约束闭包的两处显式`self`修正已进入成功产物；本轮4个责任源码在副本与原目录的hash一致。并发用户工作产生的Core Data两文件差异保持原状，本次构建不作为其当前专项版本验收。
- 原嵌入模块未改；仅验证副本离线解析SDK传递依赖，差异为clock `1.1.2→1.1.3`、新增listen `1.0.1`、matcher `0.12.19→0.12.20`、meta `1.17.0→1.19.0`、stack_trace `1.12.1→1.12.2`、test_api `0.7.10→0.7.14`、vector_math `2.2.0→2.4.4`。构建使用`ARCHS=arm64 ONLY_ACTIVE_ARCH=YES INDEX_ENABLE_DATA_STORE=NO COMPILER_INDEX_STORE_ENABLE=NO`，AppIconRibbon输出指向副本。原6个元数据文件的最终hash仍与快照一致，未改原Pods或手改生成环境。系统盘曾耗尽、验证目录symlink曾导致Sourcery无输入，均已在隔离验证中解除；原workspace的SDK依赖元数据问题仍需其维护流程处理。
- 当前构建命令、依赖差异、hash与日志位置保存在本次验证产物的`swift-uikit-validation-evidence.txt`，4个责任源码hash见`swift-uikit-source-snapshot-hashes.txt`。成功产物已在iPhone 18 Pro／iOS 27.2模拟器安装并正常进入主首页，截图可见左右导航按钮；自动化AX树未暴露其自定义按钮，尝试菜单时再次返回`noWindowsAvailable`，未取得菜单展开画面。菜单层次／点击／边界／最近入口、列表返回与重启恢复仍待实触，不能由首页启动、构建或存储单测替代。
- 文档普通Git差异检查当前受本机Node动态库缺失影响，目录过滤器无法执行；原生源码差异检查与本轮所改文档段落的原文空白检查单独执行，未因此修改Node、Homebrew或过滤器配置。
- 菜单表面明色`#E8EFEB`、暗色`#232C28`；外壳黑色柔影透明度0.18／0.42、偏移`(0, 4)`、半径8，0.5pt白色边线透明度0.6／0.1。文字沿用全局主文字角色；长翻译按16pt字体实际测量拓宽，按钮下4pt，safeArea内另留8pt边距。以上为源码参数，主题／横竖屏／长翻译及触点表现尚待模拟器实测。

文档迁移的巡检边界：Swift原有 `Coverage/routes.json`／`Flows.json` 仍冻结旧 `未尽事宜.md` 文档路径与ID；这些是生成输入，本次未手改或重生成，后续应通过相同Markdown打包规则更新文档路由，再执行计划验证。根Xcode工程中的文件引用已指向 `项目相关报告/未尽事宜.md`，报告与普通Markdown入链也已修正。后续逐项验证开屏移除和返回、搜索取消恢复、侧栏跟随与固定及手势取消、组拖动重启恢复、置顶归属、浮控长按／拖动／隐藏恢复、Bug摇动、多Scene、后台计时、空态和大字体。所有涉及系统权限、媒体下载、通知与外部服务的结果单列，不能由代码接线替代。

- 2026-11-15 菜单视觉与锚定需求：用户确认以 [**Flutter**](https://flutter.dev/) 首页菜单为参考，将三原生首页菜单整理为紧凑圆角卡片、柔和投影与可辨识的表面层次；保留唯一圆圈省略号触发、搜索／批量展开收缩／设置三项动作及外点关闭。菜单必须将真实按钮坐标转换到承载浮层后定位，核对右侧对齐、按钮下方间距、安全区与屏幕边界；明暗主题、长翻译及布局变化下避免偏位或裁切。本项为用户已确认合同；当前源码参数与实际验证边界已在上文回填，主App构建和模拟器表现继续据实更新。

## 四、<span id="coredata-assets">Core Data 专项接入资产</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

2026-11-16 用户明确要求现有模型“接入、使用”，本节仅为本轮新增的 [**Core Data**](https://developer.apple.com/documentation/coredata) 专项资产，不将其它 Demo 子页纳入原骨架盘点范围。原空模型已补为实际 `User` 实体并接入页面；下表记录当前源码，不以源码存在替代运行验收。

| 编号 | 入口／资产 | 当前行为与默认值 | 持久化／生命周期／差异 | 代码位置 | 验证状态 |
| --- | --- | --- | --- | --- | --- |
| CD-01 | 首页、搜索与最近使用 | “系统能力与硬件通信 → Core Data 用户数据库”真实路由到 `JobsCoreDataDemoVC`；沿用首页共同注册表 | 搜索／最近使用复用同一控制器；稳定路由 `JobsCoreDataDemoVC` | [首页注册](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)、[页面](<../JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@CoreData/JobsCoreDataDemoVC.swift>) | 最终同源隔离App安装／启动／重启成功；原workspace仍因既有Flutter冲突失败；普通入口点击未验 |
| CD-02 | `.xcdatamodeld` 模型 | `User(name: String, age: Int32)`；手动 `NSManagedObject`，不新增生成源码 | 原无实体模型已由此替代；姓名与年龄在写前验证 | [模型](<../JobsSwiftBaseConfigDemo/Resources/JobsSwiftBaseConfigDemo.xcdatamodeld/JobsSwiftBaseConfigDemo.xcdatamodel/contents>) | momd在最终隔离包，实际App自行创建Users.sqlite，模型已加载；原workspace未通过 |
| CD-03 | 实际数据库 | 默认空库、不自动插入示例；用户新增表单姓名为空、年龄默认18 | 沙盒 `Application Support/JobsSwiftBaseConfigDemo/Users.sqlite`，非缓存目录；按姓名、年龄升序查询 | [存储适配层](<../JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@CoreData/JobsCoreDataUserStore.swift>) 的 `init / fetchUsers` | 同源SQLite／跨进程／跨容器测试通过；实际App建库、同源程序seed、重启成功，Probe数量1；业务页显示读回未验 |
| CD-04 | 增删改查与失败处理 | 添加、点行编辑、左滑删除；清空须确认。姓名去两端空白后不能为空，年龄须为0～150整数 | 每次修改事务立即 `save`，失败 `rollback`；页面呈现错误，不清库掩盖加载错误 | [页面](<../JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@CoreData/JobsCoreDataDemoVC.swift>) 的 `showEditor / performMutation`、[存储层](<../JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@CoreData/JobsCoreDataUserStore.swift>) 的 `validatedInput / mutate` | 实际Store的CRUD／输入拒绝／持久化回归通过；iOS按钮CRUD、清空取消／确认未验，不由存储测试替代 |
| CD-05 | 加载与生命周期 | 进入页面创建存储，出现时读回，重载可重试初次加载失败 | `performAndWait`约束上下文队列；离页前操作已保存，不给 App 启动和退后台新增数据库副作用 | 同上 `reloadUsers / viewDidAppear / fetchUsers / mutate` | 最终Store刷新补测及隔离构建通过，VC按钮仅注册一次；实际App重启及Probe数量1已验，前后台／离页UI未验 |
| CD-06 | 空态、语言与主题 | `JobsEmptyAuto`完整空态含数据库图标、说明和重载；失败态含错误及重试；沿用全局语言、主题通知 | 不增加页内语言／外观开关；本页专门演示本地数据库，不请求业务API，不用假数据或网络图片 | [页面](<../JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@CoreData/JobsCoreDataDemoVC.swift>) 的 `makeEmptyButton / refreshAppearance` | App已启动；swift-readback.png仅见系统通知弹窗、未展示完整业务页，不计页面读回通过；完整按钮／十语三主题未验 |
| CD-07 | 本地图标与主词库 | `CoreDataDatabaseIcon`矢量模板图标；11份现有语言资源各增24键，共同32键完整 | 仅追加缺失键；旧字节前缀与全部旧字典值保留；`%@`占位符一致 | [图标](<../JobsSwiftBaseConfigDemo/Resources/xcassets/Assets.xcassets/CoreDataDatabaseIcon.imageset/Contents.json>)、主工程各语言 `Localizable.strings` | 最终App11份完整词典与当前源解析字典逐项一致，momd在包；隔离native490/490文件与真源SHA256一致（忽略.DS_Store）；图标UI待验 |

数据库图标于2026-11-16复用上一轮已取得的 [**iconfont**「迈鼎icon」集合](https://www.iconfont.cn/collections/detail?cid=51731)中 `charts_数据库_data`（ID `43964161`，作者 `G_G曉楠`）；取得时为原创、免费素材，使用依据见[平台法律声明第三节第4条](https://terms.alicdn.com/legal-agreement/terms/product/20220705100131999/20220705100131999.html)，不推断为开源许可证。从同一原始SVG重新导出44×44pt矢量PDF，仅调整逻辑页尺寸以适配UIKit按钮，不改变图形路径；原图与最终版同尺寸渲染已实看无差异、无裁切。保留矢量与模板渲染，随本工程既有Assets目录打包。

2026-11-16本轮验证：原workspace到主target后因既有内嵌Flutter依赖metadata与SDK冲突，在`kernel_snapshot_program`失败，原日志`coredata-native/swift-workspace-build.log`保留。复用此前已离线准备的Flutter隔离入口，将最新native源码／模型／资源作为同源物理快照参与整包构建，最终`swift-isolated-final-build.log`对应进程exit0；原项目Flutter锁文件与generated未修改，原workspace仍未构建通过。最后再次更新隔离副本的两份生产Swift文件：Store SHA-256为`ba091b8094368c697bd472e67041e745fd94d941ea32a97becf513c44c38fe14`（仅新增四条`///`分支注释，与已验3342版本去除注释后的代码逐字一致），VC为`7154ca8bdbc9e72d727acaa6bbddd3aa26a939a839717ef2667a31ba57cb414f`；分别包含跨容器查询刷新及按钮事件仅注册一次的修正。

同源Store的真实SQLite CRUD、输入拒绝、持久化／跨进程读回测试通过；再次使用另一容器修改同库字段后，原实例重新fetch能读到新值的补测也通过。最终同源隔离App已安装、启动并自行创建Application Support/JobsSwiftBaseConfigDemo/Users.sqlite；先停止App，再用最终生产Store与包内momd向该独立库写入Jobs Swift CoreData runtime／42，swift-runtime-probe.log写入后查询为数量1，随后重启成功。种子来自同源程序，未实际点击App新增按钮；swift-readback.png仅展示系统通知弹窗、未展示完整业务页，页面读回显示仍未验，不作为通过图。最终隔离native与真实主工程490/490文件SHA256一致（忽略.DS_Store），App内11份完整词典与当前源解析字典逐项一致，momd在包。实际菜单／按钮CRUD、清空取消／确认及十语三主题遍历仍未验，界面操作受Mac锁定影响。

## 五、<span id="reports">报告目录</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本目录归集根层报告与待办文档；根README仍为仓库入口，SwiftDoc与源码旁README保持原位，原报告正文仅迁移并修正相对链接。

## 六、<span id="world-clock-assets">世界时钟追加需求（2026-11-16）</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 编号 | 入口／行为 | 默认／生命周期与边界 | 状态 |
| --- | --- | --- | --- |
| SKEL-CLOCK-01 | 首页标题为“功能实验室”，保留项目来源副标题；短按时间浮控 push 世界时钟；长按后拖动并吸边 | 仍通过设置显隐；不计入Demo条目或最近使用；撤掉原长按隐藏弹窗 | 首页标题／来源副标题已实看；首布局／层级修正版最终隔离构建通过；全首页中下部／导航区拖动及短tap实际通过；标题、Back保浮钟位置、12↔24离屏回看和冷启恢复均已实测通过 |
| SKEL-CLOCK-02 | 当前本地时区独立圆角强调卡片置顶、大号时间；世界按当前有效UTC偏移每组1个知名代表，巴黎／纽约优先，保留与本地相同偏移的世界代表 | 系统IANA数据库包含30／45分钟偏移；Foundation knownIDs未列但可解析的 `Etc/GMT+12` 补贝克岛无人常住区，世界范围UTC−12…+14；城市按当前语言，行含IANA、UTC偏移、当地日期星期和HH:mm:ss；DST由系统计算 | 源码已实现；冬夏有效偏移／巴黎纽约／半及45分钟／本地独立4项回归通过；隔离arm64构建通过；实体world首测发现legacy副标题API导致IANA／日期／秒值未显示，已改现代secondaryText入口，单行修复后构建与46.677秒完整物理链通过，城市／IANA／日期星期／秒值已实看 |
| SKEL-CLOCK-03 | 页面可见且App active时每秒以同一绝对Date重算全部时区偏移、代表分组与时间；退出／后台停止，时区／日期事件也刷新；外地DST变化不依赖本地时区通知 | 复用JobsSwiftTimerMgr；无服务端数据和持久历史；全局十语与白天／黑夜／系统主题 | 源码已实现；生命周期实看待验 |
| SKEL-CLOCK-04 | 原生UISwitch左标题随当前值显示“24小时制／12小时制”，默认关为24h；开为12h并明确大写AM／PM，立即更新全部本地／世界行，保持滚动位置 | 独立键 `com.jobs.worldClock.uses12HourFormat`，退出重进／重启恢复；只影响世界页，首页仍24h | 源码已实现；十语午夜12AM／中午12PM及同formatter往返切换2项回归通过；开关到1已实触；world详情渲染修后12↔24／离屏回看／Back保位／冷启均已实测通过 |

本次世界页源码为 [RootWorldClockVC](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootWorldClockVC.swift>)、[有效偏移目录](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/WorldClockCatalog.swift>) 和 [12h格式／偏好](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/WorldClockDisplayFormat.swift>)。前版10项真实iOS字体／Foundation XCTest通过；首次UI回归发现浮钟初始中心被导航栏挡住，长按位移断言为0。已修为仅首次真实布局在导航下定位、浮钟位于导航之上，仍允许整个可见首页自由拖动；未改成内容区限制。新增第11项首布局／全屏边界回归已通过，修正版普通App最终构建通过，最终46.677秒完整物理链与11.374秒深蓝／菜单短链通过，原失败记录保留，末轮物理UI已通过；模型／语法结果与实际交互证据分别记录。Foundation已知ID列表实证不列 `Etc/GMT+12`，但可解析这一固定IANA时区；与优先canonical候选合并后，冬夏探针均为38组，系统版本变化可改变分组，未硬编码夏令时。城市用系统ICU exemplar-city按语言本地化；藏文城市名可能由系统回退英文，界面词条仍有完整藏文。新页次文字／日期／时区详情与自适应组头使用72%主文字；按标准light白底与dark卡片背景合成对比约9.23／9.30，dark页底组头约10.54，实际三主题画面仍待验，首页来源副标题不改。原嵌入Flutter模块6份pubspec／锁／生成metadata哈希未改，最终App只在既有artifact副本构建；原workspace旧SDK／锁不匹配边界继续保留。

2026-11-16环境中断说明：首共享设备 `3C312E15-FE8E-46E0-96DD-7EB3C9E4B10E` 及其它设备一度从device set消失，用户明确确认“模拟器我已经清理了，你需要重新建立”；该段记为用户清理环境中断，不算App或工具故障。按新授权仅重建唯一共享 `JobsWorldClockFinal2`（`609B5874-7F24-443E-9247-89E346EBA284`、iPhone18Pro／iOS27.2），各工程串行使用。本工程在Final2的首物理链已通过中下部／导航区长按移动、导航区短tap进入、正确世界标题与原生开关到1；随后真实截图确认legacy副标题入口未展示IANA／日期／秒值，已改当前现代 `bySecondaryText` 单行调用并重建，完整格式／返回／冷启在修正版46.677秒物理链中0失败通过。原失败及环境中断记录均保留。

最终限定验收：11项真实iOS XCTest零失败；完整世界时钟实体链1项、46.677秒零失败（中下部及导航区长按／不误push、导航区短tap、世界标题、12↔24全部行与离屏回看、Back保浮钟落点、再次进入与冷启偏好）；最后首页纯色／右上菜单实体链1项、11.374秒零失败。合计13项非零通过，两个UI结果独立保留；最终纯色版相对完整链仅首页背景色一处变化，有源码反向hash证明，未重跑无关gesture。首页初始钟、深蓝裁图、菜单展开及world完整IANA／日期星期／AMPM截图已导出；初始钟像素确认(21,101,192)和(255,255,255)，对比5.746，world次字／组头主笔画(71,71,71)对白底约9.29。UI限定iPhone18Pro／iOS27.2、当前简中浅色；大字和十语格式由真实字体／formatter小测覆盖，不扩写为十语三主题画面或真机穷举。后台停表为源码门禁与复用计时器边界，本批未做独立后台观测。console导出接口返回No console log available，不据此宣称运行时约束日志全无。共享Final2按用户要求保留，未关停／删除。


## <span id="jobs-toc-heading-8" data-jobs-toc="v2">当前时区卡片与制式标题合同（2026-11-16）</span><!-- jobs-toc:heading-end -->

用户明确要求原生世界页向Flutter学习：开关下方独立圆角当前时区卡片，以适配白天／黑夜的柔和强调底色、清晰主副文字和大号当前时间形成层级；卡内保留城市／IANA／UTC偏移、日期及星期，支持大字换行。全球列表仍在卡片之后。开关左侧标题反映已持久化的实际制式：ON为12小时制，OFF为24小时制，即时切换且十语完整。仅表现层增量，不改变偏好键、AM／PM、时区模型、生命周期、Demo注册或最近记录。

盘点：三个UIKit工程原为普通首分组行；SwiftUI虽为insetGrouped首分组，但没有独立强调底色与大号当前时间。实施前状态为待补齐；现四端生产源码已改，Swift语法通过，35份原生词典与SwiftUI十语言制式词条有效；实际UIKit字体／生产formatter小测1项0失败（160组合）通过。卡片主／副字浅色与深色四对对比均≥4.5。字体测量不代替实际AutoLayout接线；本工程当前合并普通arm64模拟器构建通过，23.557秒真实当前时区卡片用例1项0失败：独立卡片完整IANA／UTC／星期、大号时间、24／12小时标题即时变换与AM／PM、秒值推进不改卡片frame，已捕获两态并实看12h图；测试结束恢复原格式。当前实际画面限iPhone18Pro／iOS27.2简中浅色，其它语言／深色／极端字号仍待验。


## <span id="home-return-sidebar-20261116">首页返回、侧栏与开屏浮控增量</span>

2026-11-16用户新需求，先登记后实现：设置增加真实开关“返回首页时收缩分组”，默认开；只从具体Demo返回主首页时自动收缩，关闭后保留离开时展开与滚动位置，手动单组／批量收缩仍可用。选择持久保存，不能被既有“返回回顶部并刷新”间接覆盖；设置、搜索、最近列表和世界时钟返回不冒充具体Demo返回。首页分组展开与浮钟坐标仍属视图内存，不泛称所有状态均跨启动保存。

用户报告左上侧栏点击无反应，并补充Swift疑似异常、OC正常：优先核查Swift实际按钮事件、宿主查找与呈现链路，OC只回归既有路径；没有既有侧栏的工程不额外创造侧栏入口。用户还报告浮钟盖住开屏：实际开屏呈现期间隐藏且不接收触摸，真正结束且首页可交互后恢复；重播／根切换／多Scene以当前owner的生命周期为准，不使用固定延迟。

收口复核补充：三UIKit时间Timer原先使用全局固定注册ID，两个首页实例会共用同一个Timer，按ID暂停可能影响另一Scene。现仅时间Timer改为每首页实例唯一ID：两OC懒注册`ViewController_1.suspendTimeBtn.<实例地址>`，Swift为`RootListVC.suspendBtn.<UUID>`；恢复／暂停／销毁使用自己的ID，旋转Timer与手势不扩围。原单Scene首页／开屏真实用例证据保留。另以生产源码逐字提取的两个ID及实际JobsTimerMgr／JobsSwiftTimerMgr后端验证暂停、恢复与移除隔离，独立XCTest两项／零失败；OC新旧Manager源码哈希相同。收口ID增量先受并行RustOCR集成阻断，旧失败日志保留；OCRowner修复guarded调用方及旧target membership后，两OC final6普通arm64增量均构建通过，独立冻结App及逐文件哈希，在A3以冻结包完成最终开屏短验：新10.225秒／旧7.214秒，两项／零失败；两端倒计时画面均无浮钟，skip后恢复可命中，四张截图已实看。该包未集成OCR Apple SDK，不代表OCR识别已验。Swift隔离副本已同步guarded OCR类与适配，唯一ID普通增量构建通过，在新共享设备A3（JobsDemoSharedFinal3）真实开屏短验1项／零失败（13.072秒），倒计时画面无浮钟、skip后恢复可命中且截图实看通过。各阶段包和证据明确对应，实际多Scene窗口组合仍待验。

起始缺口：新返回收缩开关尚未提供；UIKit原有返回刷新可能重建展开集合；SwiftUI当前只有一个未提供收缩交互的“系统 UI Demo”分组、没有侧栏，也没有独立开屏。新增开关须在SwiftUI补齐该既有组的手动展开／收缩语义；不新增侧栏或开屏。三个UIKit工程的侧栏按钮及开屏期间浮控命中需要本轮复测。当前源码已接入新开关及具体Demo返回门禁：OC新旧键com.BSports.JobsOCDemoListCollapseOnDemoReturn、Swift键RootList.collapseOnDemoReturn、SwiftUI键JobsSwiftUIBaseConfigDemo.collapseOnDemoReturn，均NSUserDefaults／UserDefaults，缺值默认开。三个UIKit的开屏以当前宿主树呈现前抑制、真实finish移除后的下一主队列恢复，首页不可交互时仍隐藏并暂停；不缩小原全屏拖动范围。Swift左菜单改factory显式注入真实drawer owner，避免可选祖先查找静默无动作。HOME-04：两OC/SUI首页按Swift卡片圆角14／H10V8留白、组17/13与内行17/12、基准行56及多行标题测高对齐，保留目录稳定ID和交互。当前源码、构建与限定真实UI验证均已完成，范围见下表；完整矩阵继续单列待验。


| 资产 | 当前行为／存储 | 本轮验证与边界 |
| --- | --- | --- |
| HOME-01 返回收缩开关 | 设置的原生UISwitch／Toggle；缺值默认开，只在本首页实际推入具体Demo后返回时处理；关闭优先保留离开前展开和滚动，普通设置／世界页及最近列表返回不当作Demo。新键UserDefaults落盘；展开集合与浮钟位置仍内存 | 四端实际开关ON／OFF、普通设置返回、具体Demo返回、冷启动新键恢复通过；当前只简中浅色，不冒称所有历史设置都已重新冷启验证 |
| HOME-02 左上侧栏 | Swift由根工厂把实际JobsSideDrawerVC弱引用注入首页，点按不再只依赖可选祖先查找；两OC未改正常侧栏实现；SwiftUI本无侧栏，不新增 | 三UIKit实际按钮点击、首页平移及收回通过并留图；用户信息／最近／设置等其它侧栏目的页不借本次入口测试冒称全验 |
| HOME-03 开屏浮钟 | 当前开屏宿主树中逐个抑制首页时间控件；skip／倒计时实际finish移除后下一主队列恢复，首页未可交互仍隐藏并暂停；多Scene只作用于该owner，不以秒数硬延迟，不限制既有全屏拖动 | 三UIKit实际开屏倒计时画面中控件AX不存在、结束后真实恢复且可点击通过；SwiftUI无开屏。实际多Scene／重播／根切换组合未穷举，源码按同一宿主树门禁处理 |
| HOME-04 首页目录视觉 | 两OC/SUI参照Swift：圆角14、卡片左右10／上下8；组17/13、内行17/12、基准行56，动态字号／自然增高与明暗语义色；两OC标题支持多行，代理高度和点按命中阈值同步；稳定Demo ID、拖排／置顶／最近入口不变 | OC收缩页与SwiftUI展开页实际简中浅色实看；SUI副文字改显式Color.primary的72%以消除控件层级继承变浅，最后纯色包另跑1真实用例；完整语言／主题／设备矩阵待验 |

当前代码入口：[Demo@功能列表根目录.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/Demo@功能列表根目录.swift>)、[RootListSettingsVC.swift](<../JobsSwiftBaseConfigDemo/主业务流程/VC/Demo@功能列表根目录/RootListSettingsVC.swift>)、[SceneDelegate.swift](<../JobsSwiftBaseConfigDemo/启动入口/SceneDelegate.swift>)。

新增开关实际保存位置已逐App只读核验：App沙盒`Library/Preferences/<bundleID>.plist`核验时对应新键为true，未读取／展示其它偏好；CLI证据在本机任务产物`native-home-settings/preferences-on-disk.json`。UI通过的是正常主应用，没有`--jobs-coverage-route`或新测试探针；仅语言／旧开屏／旧入口／旧浮钟显隐使用临时launch arguments，新增收缩键没有用启动参数覆盖，冷启动读取的是实际落盘值。已恢复测试前该新开关选择；测试没有清空用户排序或最近记录。 这些四App落盘与冷启证据采自原609设备；随后用户授权的其它任务清理了整个设备集，原设备及其沙盒已不存在，历史证据继续保留。Root按原授权重建的A3为全新沙盒，本轮三UIKit最终开屏短验未改新增收缩键，也未用旧数据冒称新设备已保存；四App在A3的当前值均不由旧证据推断。 A3首次启动的Swift及两OC都在系统通知授权框选择了“不允许”（Runner记录Swift8.45秒、新OC6.62秒、旧OC3.71秒）；该测试选择仅属于新设备的通知许可，不能称所有偏好未变。未为恢复未询问状态而卸载或重置App。两OC短验后已恢复现装最终Flutter首页并截图确认，设备明确交还Root。

本工程bundle为`com.jobs.JobsSwiftBaseConfigDemo.JobsSwiftBaseConfigDemo`，新增键`RootList.collapseOnDemoReturn`。首页完整链45.385秒／1test／0失败；开屏8.947秒／1test／0失败；责任源码一致的隔离副本普通构建通过，原嵌入Flutter SDK／锁不匹配边界仍保留。

失败历史保留：外部Runner首轮误选离屏侧栏同名“设置”，改已有稳定菜单panel／cellID后真实补轮通过；早期Swift开屏夹具查询不存在控件的isHittable会自动等待，恰好跨过5秒开屏结束，已改为skip存在同帧检查clock.exists。末轮五用例批次共5项／0失败（105.043秒）。最后SUI颜色新增短case首Runner编译错误导致一次0tests，明确排除；修正坐标类型、确认非零后11.001秒通过。生产未因夹具修改而放宽门禁或修改开屏时长。



## <span id="jobs-toc-heading-10" data-jobs-toc="v2">Rust OCR 独立 Demo 接线（2026-11-16）</span><!-- jobs-toc:heading-end -->

入口为“系统能力与硬件通信 → Rust OCR 离线识别”，页面位于 `JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@RustOCR/JobsRustOCRDemoVC.swift`，核心本地 Pod 归 `JobsByPods/JobsRustOCR@Pods`。内置真实样例／选照片、识别／取消、结果与空态重试均已接线；图片和结果仅页面内存，离开取消并忽略过期回调，十语与宿主三主题同步。缺模块明确错误，不冒充识别成功。规范 SDK 已完整装配且纯 pod install 成功；原 workspace Debug arm64 模拟器构建通过。专用 iPhone 17 Pro／iOS 27.2 真实样例已识别 35 行、1326 字符，约 711 ms，JSON 和实看页面截图已保存；截图有宿主既有首启通知弹窗，不冒称无遮挡全交互。真机与完整十语三主题矩阵仍待验。详细入口、行为、默认、生命周期和验证状态见[OCR 接入盘点](./RustOCR接入盘点.md)。

<a id="🔚" href="#前言">返回首页</a>

