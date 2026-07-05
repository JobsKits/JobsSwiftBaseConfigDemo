Pod::Spec.new do |s|
  s.name         = 'JobsProgressBar'          # Pod 名
  s.version      = '0.1.14'
  s.summary      = 'Swift@基础工具集'
  s.description  = <<-DESC
                      关于Swift语言下的基础工具集
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsProgressBar'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'

  s.source = {
    :git => 'https://github.com/JobsKits/JobsProgressBar.git',
    :tag => s.version.to_s
  }

  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'Resource/icon.png',
    'LICENSE',
  ]

  s.source_files = '**/*.{swift,h,m,mm}'

  # ====================== 系统库依赖：所有代码共享 ======================
  s.ios.frameworks = 'UIKit'

  s.dependency 'SnapKit'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsSwiftTimer'
  s.dependency 'JobsSwiftBaseDefines'
    s.dependency 'JobsSwiftDSL'

end
