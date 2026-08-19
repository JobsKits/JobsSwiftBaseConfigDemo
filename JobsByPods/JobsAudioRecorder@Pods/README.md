# JobsAudioRecorder

录音与本地音频管理组件。Core 分为录音引擎、文件仓库、播放器与按住录音按钮；圆形录音快门统一使用微信风格的白色内圆、留白间隔和白色外圈，按住后红色进度沿外圈推进，白色门槛刻度标记最短有效录音位置；达到门槛后松开保存、移出取消，长录音由单例引擎承接前后台录制。

- `JobsAudioRecordButton.minimumValidDuration` 默认 `3` 秒；不足时先走 `onCancel` 删除临时录音，再走 `onTooShort` 交给业务层提示。
- 导火索复用 `JobsFuseAnimation.byFusePressStart(...)` / `byFusePressStop(...)`；门槛位置按 `minimumValidDuration / duration` 自动换算。

## Jobs DSL 调用约定

Pod 内 Jobs 自维护代码统一采用“一镜到底”：同一配置语义的主对象只作为链起点出现一次；子对象通过宿主级 `byXxx` 或配置闭包继续收口。缺少链式入口时，先在低层补齐返回 `Self` 的 DSL，再改调用端。
