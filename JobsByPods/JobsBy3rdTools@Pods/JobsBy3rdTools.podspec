Pod::Spec.new do |s|
  s.name         = 'JobsBy3rdTools'          # Pod 名
  s.version      = '0.0.1'
  s.summary      = 'Swift中的一些手搓工具（持续更新）'
  s.description  = <<-DESC
                      Swift.Foundation.Extensions
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsBy3rdTools'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  # 你的源码从 Git 仓库下载
  s.source       = { :git => 'https://github.com/JobsKits/JobsBy3rdTools.git',
                     :tag => s.version.to_s }

  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
#    'BMPlayer+DSL.swift'
  ]

  # 递归匹配当前目录下所有子目录里的 .swift 文件
  s.source_files = '**/*.{swift,h,m,mm}'
  
  s.dependency 'SwiftEntryKit'
  s.dependency 'YTKNetwork'
  s.dependency 'MJRefresh'
  s.dependency 'JXSegmentedView'
  s.dependency 'SDWebImage'
  s.dependency 'GKNavigationBarSwift'
  s.dependency 'SnapKit'
  s.dependency 'JobsInheritance'
  s.dependency 'JobsTextTools'
  s.dependency 'JobsSwiftBaseTools'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsScale'
  s.dependency 'JobsSwiftTools'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsSwiftStandardLibrary_extension'
  s.dependency 'JobsSwiftMetalKit_extensions'
  s.dependency 'BMPlayer'
  
end
