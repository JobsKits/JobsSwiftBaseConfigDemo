Pod::Spec.new do |s|
  s.name         = 'JobsSwiftRefresher'          # Pod 名
  s.version      = '0.0.1'
  s.summary      = 'Swift中，对UIKit进行的拓展（持续更新中）'
  s.description  = <<-DESC
                      JobsSwiftRefresher
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsSwiftRefresher'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  # 你的源码从 Git 仓库下载
  s.source       = { :git => 'https://github.com/JobsKits/JobsSwiftRefresher.git',
                     :tag => s.version.to_s }
                     
  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]
  
  s.ios.frameworks = 'UIKit',
                     'WebKit',
                     'ImageIO',
                     'AudioToolbox',
                     'AVFoundation'

  s.default_subspecs = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files = '**/*.{swift,h,m,mm}'
    ss.dependency 'SnapKit'
    ss.dependency 'JobsByUIKit'
    ss.dependency 'JobsSwiftBaseDefines'
    ss.dependency 'JobsSwiftBlock'
    ss.dependency 'JobsSwiftDSL'
  end

  s.subspec 'Lottie' do |ss|
    ss.dependency 'JobsSwiftRefresher/Core'
    ss.dependency 'lottie-ios'
    ss.pod_target_xcconfig = {
      'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => '$(inherited) JOBS_MODERN_LOTTIE'
    }
  end

  s.subspec 'SDWebImage' do |ss|
    ss.dependency 'JobsSwiftRefresher/Core'
    ss.dependency 'SDWebImage'
  end

end
