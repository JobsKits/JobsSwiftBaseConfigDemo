# 倒计时按钮

* 并非继承，而是利用分类对`UIButton`能力的补充

* 倒计时内核利用`JobsSwiftTimer`

* ```swift
  /// 是否正在倒计时这个状态除了本页使用以外，也要防止App闪退，所以需要实时记录在UserDefaults
  /// 倒计时剩余的时间，也需要用UserDefaults进行存取，防止App闪退
  /// 只有倒计时正在进行中的状态时，有剩余的时间（数据来源：UserDefaults存取，如果为0，则用默认值）
  private let countdownTimeKey = "com.BSports.countdownTimeKey"
  private let isCountdownTimeKey = "com.BSports.isCountdownTimeKey"
  
  private let defaultCountdownTime = 15 * 60
  /// 为真则正在跑计时器
  var isCountdownTime: Bool {
      get {
          UserDefaults.standard.bool(forKey: isCountdownTimeKey)
      }
      set {
          UserDefaults.standard.set(newValue, forKey: isCountdownTimeKey)
      }
  }
  
  var countdownTime: Int {
      get {
          // 不在倒计时，直接返回默认值
          guard isCountdownTime else {
              return defaultCountdownTime
          }
          let value = UserDefaults.standard.integer(forKey: countdownTimeKey)
          // 如果 UserDefaults 里是 0，说明异常或未存储，用默认值
          return value > 0 ? value : defaultCountdownTime
      }
      set {
          UserDefaults.standard.set(newValue, forKey: countdownTimeKey)
      }
  }
  ```

* 方案 1
  
  ```swift
  import JobsByUIKit
  import JobsSwiftBaseDefines
  
  private lazy var countdownButton: UIButton = {
      UIButton.sys()
          /// 普通@点按事件触发
          .onTap { [weak self] sender in
              guard let self else { return }
              self.点击事件()
          }
          .onCountdownTick { [weak self] btn, remain, total, kind in
              guard let self else { return }
              /// 正在倒计时
              isCountdownTime = YES
          }
          .onCountdownFinish { [unowned self] _, kind in
              print("✅ [\(kind.displayName)] 倒计时完成")
              isCountdownTime = NO
          }
          .byAddTo(self) { [unowned self] make in
  						/// TODO
          }
  }()
  ```
  
  ```swift
  import JobsSwiftBaseDefines

  /// 启动倒计时
  private func countDown () {
      guard isCountdownTime else {
          countdownButton.startTimer(
              total: 60,
              interval: 1,
              kind: nil) { [weak self] btn in
                  guard let self else { return }
                  isCountdownTime = YES
  								/// TODO
              };return
      }
  }
  ```
  
* 方案 2
  
  ```swift
  import JobsCountdownButton
  import JobsByUIKit
  import JobsSwiftBaseDefines
  
  private lazy var countdownButton: UIButton = {
      UIButton.sys()
          /// 倒计时按钮核心配置
          .byCountdown { cfg in
              cfg.mode = .down(from: 12)
              cfg.clickableWhileRunning = true
              cfg.onTapWhileRunning = { btn, _ in
                  "运行中被点击！".toast
              }
              cfg.renderConfiguration = { sec, base in
                  var c = base
                  c.title = "可点 \(sec)s"
                  return c
              }
          }
          /// 把「点击按钮」和「启动倒计时」自动绑定起来
          //.byCountdownOnTapAuto()
          .onTap { [weak self] sender in
              guard let self = self,
                    let ctrl = sender.jobsCountdownController
              else { return }
  
              if ctrl.isRunning {
                  // 正在跑
                  if ctrl.config.clickableWhileRunning {
                      ctrl.config.onTapWhileRunning?(sender, ctrl.config)
                  } else {
                      // 不可点就直接吞掉点击
                  }
              } else {
                  // 未运行 -> 开始
                  ctrl.start()
              }
          }
      
          .byAddTo(self) { [unowned self] make in
              /// TODO
          }
          .byBorderColor(JobsCor.cyan)
          .byBorderWidth(0.5)
          .byMasksToBounds(YES)
          .byClipsToBounds(YES)
          /// 切角@平面四个角全切
          .byCornerRadius(8.h)
          /// 切角@切固定角，iOS11及其以后可用。需要再配合layer.cornerRadius以生效
          .byMaskedCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner])
          /// 切角@切固定角，兼容旧版本iOS系统
          .byCornerRaduis(corner: [.bottomLeft, .bottomRight], raduis: 4)
  }()
  ```
  
  


