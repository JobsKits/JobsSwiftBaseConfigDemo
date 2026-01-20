Pod::Spec.new do |s|
  s.name         = 'JobsRefresher'          # Pod 名
  s.version      = '0.0.1'
  s.summary      = 'Swift中，对UIKit进行的拓展（持续更新中）'
  s.description  = <<-DESC
                      JobsRefresher
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsRefresher'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '15.0'
  s.swift_version = '5.0'

  # 你的源码从 Git 仓库下载
  s.source       = { :git => 'https://github.com/JobsKits/JobsRefresher.git',
                     :tag => s.version.to_s }
                     
  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]
  
  s.ios.frameworks = 'UIKit',
                     'WebKit'
  # 递归匹配当前目录下所有子目录里的 .swift 文件
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'SnapKit'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsSwiftBlock'

end
