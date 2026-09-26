# 语言学习 Demo

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

Demo 根列表的“语言学习”分类收纳独立语种入口。俄语先在 [**Swift**](https://www.swift.org/) 工程验证体验；朝鲜语、日语可按相同分类扩展，暂不迁移 Objective-C 新旧工程。

## 一、使用方式

- 进入“语言学习 → 俄语点读”。分组模式显示一个辅音与十个元音的组合，两列五行排列为 а/я、о/ё、у/ю、ы/и、э/е。
- 每张卡片左侧读元音、右侧读组合。“单读”读当前辅音；“辅音”按钮打开选择面板，上一组、下一组循环切换。
- “切换全表”展示 21 × 10 个组合。顶部元音与左侧辅音固定并同步滚动，表头同样可以点读。
- 辅音选择固定在第一排，其余操作位于点读区下方。单读辅音后对应按钮高亮。支持本组连读、慢速/正常、每项 1～3 遍；播放期间连读按钮显示“停止”，停止、完成或失败后恢复“本组连读”，再次点击字母或组合即可重听。新点读打断旧队列；离开页面、锁屏或应用失去活跃状态时停止。
- 右上角菜单沿用工程主题切换机制，并提供学习说明。

## 二、发音边界

使用系统 [**AVSpeechSynthesizer**](https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer) 的 ru-RU 声音，不需要麦克风权限。不提供专业音素录音；单独辅音可能被朗读为字母名称，组合的合成效果也受系统声音影响。

没有可用俄语声音时显示说明，可在系统辅助功能的朗读声音设置中下载后重试。声音可用性、首次下载与音质以实际设备为准。带“·”的是少见或非标准拼写组合，仍可试听，但不应当作常规拼写范例。ъ、ь 是符号，未列入辅音表。

## 三、结构与扩展

| 文件 | 职责 |
| --- | --- |
| [JobsRussianLesson](./JobsRussianLesson/JobsRussianLesson.swift) | 字母、组合顺序、学习提示 |
| [JobsLanguageSpeechPlayer](./JobsLanguageSpeechPlayer/JobsLanguageSpeechPlayer.swift) | 声音选择、队列、重复、取消与回调过滤 |
| [JobsLanguageLearningStyle](./JobsLanguageLearningStyle/JobsLanguageLearningStyle.swift) | 公共按钮样式 |
| [JobsRussianReadingDemoVC](./JobsRussianReadingDemoVC/JobsRussianReadingDemoVC.swift) | 页面状态与交互编排 |
| [JobsRussianPairView](./JobsRussianPairView/JobsRussianPairView.swift) | 元音与组合双点击区域 |
| [JobsRussianTableView](./JobsRussianTableView/JobsRussianTableView.swift) | 全表与固定表头 |
| [JobsRussianConsonantPickerVC](./JobsRussianConsonantPickerVC/JobsRussianConsonantPickerVC.swift) | 辅音选择面板 |

新增语种创建独立数据与 DemoVC，并加入同一 Section；不要假定日语、朝鲜语与俄语拥有相同拼读矩阵。播放器接收语言标记与文本序列，可复用；若引入专业录音，可替换发音实现而保留课程和交互。

入口图标来自 [**iconfont**](https://www.iconfont.cn/)，搜索“语言”，图标 ID `577386`、作者 ID `2607`、库 ID `4955`；原始 SVG 存入应用的 `JobsRussianReadingIcon` 资源，由模板渲染适配主题。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
