Pod::Spec.new do |s|
  s.name         = 'JobsLocalNotification'          # Pod 名
  s.version      = '0.0.1'
  s.summary      = 'Swift中，对UIKit进行的拓展（持续更新中）'
  s.description  = <<-DESC
                      本地通知
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsLocalNotification'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  # 你的源码从 Git 仓库下载
  s.source       = { :git => 'https://github.com/JobsKits/JobsLocalNotification.git',
                     :tag => s.version.to_s }
                     
  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'Resource/icon.png',
    'LICENSE',
  ]
  
  s.ios.frameworks = 'UIKit',
                     'UserNotifications'
  # 递归匹配当前目录下所有子目录里的 .swift 文件
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'JobsSwiftTools'
  s.dependency 'JobsByUIKit'
  
  # Jobs production boundary: keep validation and temporary sources out of release targets.
  s.exclude_files = Array(s.attributes_hash['exclude_files']) + [
    '**/Tests/**/*',
    '**/Test/**/*',
    '**/Example/**/*',
    '**/Examples/**/*',
    '**/Demo/**/*',
    '**/Demos/**/*',
    '**/build/**/*',
    '**/DerivedData/**/*',
    '**/*Tests.swift',
    '**/*UITests.swift',
    '**/*.tmp.*',
  ]

  # Stability 单独编译 Tests；保留生产源码的测试排除规则。
  s.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*Tests.swift'
    test_spec.exclude_files = []
    test_spec.frameworks = 'XCTest'
    test_spec.ios.deployment_target = '15.6'
    # 独立模拟器测试继承 Flutter helper 动态提供的 SDK 搜索路径。
    test_spec.pod_target_xcconfig = {
      'LD_RUNPATH_SEARCH_PATHS[sdk=iphonesimulator*]' => '$(inherited) $(FRAMEWORK_SEARCH_PATHS)'
    }
    test_spec.dependency 'JobsByUIKit'
  end

end
