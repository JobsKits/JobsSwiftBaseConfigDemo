# `JobsProgressBar` 进度条

* 初始化

  ```swift
  import JobsSwiftBaseDefines

  /// 自定义进度条
  private lazy var progressView: JobsProgressBar = {
      JobsProgressBar()
          .byDirection(.leftToRight)
          .byValueMode(.countDown)           // 初始：显示为 100→0
          .byTrackColor(JobsCor.systemGray5) // 你外层灰条在父视图，这里清空即可
          .byTrackHorizontalInset(0)         // ✅ 不要内部留边
          .byTrackVerticalInset(0)           // ✅ 不要内部留边
          .byTrackThickness(nil)             // ✅ 厚度 = JobsProgressBar.height（也就是父视图高度）
          .byAutoHideLabel(true)             // ✅ 小高度自动隐藏 label（12 高会隐藏）
          .byLabelMinVisibleHeight(18)
          .byLabelBackgroundColor(JobsCor.secondarySystemBackground)
          .byLabelFont(JobsFont.monospacedDigitSystemFont(ofSize: 12, weight: .medium))
          .byAddTo(view) { [unowned self] make in
              make.top.equalTo(modeToggleButton.snp.bottom).offset(24.h)
              make.left.equalToSuperview().offset(40.w)
              make.right.equalToSuperview().inset(40.w)
              make.height.equalTo(20.h)
          }
  }()
  ```

* 进度设置（带动画效果）

  ```swift
  self.progressView.setDisplayPercent(text: "20", animated: true)
  ```
