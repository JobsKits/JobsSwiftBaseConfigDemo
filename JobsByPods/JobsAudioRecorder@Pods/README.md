# JobsAudioRecorder

录音与本地音频管理组件。Core 分为录音引擎、文件仓库、播放器与按住录音按钮；短录音按住即录、达到最短有效时长后松开保存、移出取消，长录音由单例引擎承接前后台录制。

- `JobsAudioRecordButton.minimumValidDuration` 默认 `3` 秒；不足时先走 `onCancel` 删除临时录音，再走 `onTooShort` 交给业务层提示。
