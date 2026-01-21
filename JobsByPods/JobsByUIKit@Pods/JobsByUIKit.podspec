Pod::Spec.new do |s|
  s.name         = 'JobsByUIKit'          # Pod 名
  s.version      = '0.0.1'
  s.summary      = 'Swift中，对UIKit进行的拓展（持续更新中）'
  s.description  = <<-DESC
                      Swift.Foundation.Extensions
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsByUIKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '15.0'
  s.swift_version = '5.0'

  # 你的源码从 Git 仓库下载
  s.source       = { :git => 'https://github.com/JobsKits/JobsByUIKit.git',
                     :tag => s.version.to_s }
                     
  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]
  
  s.ios.frameworks = 'UIKit',
                     'WebKit',
                     'CoreImage'
  # 递归匹配当前目录下所有子目录里的 .swift 文件
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'NSObject+Rx'
  s.dependency 'SDWebImage'
  s.dependency 'Kingfisher'
  s.dependency 'GKNavigationBarSwift'
  s.dependency 'SnapKit'
  s.dependency 'SVGKit'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'RxRelay'
  s.dependency 'BMPlayer'
  s.dependency 'SwiftEntryKit'
  s.dependency 'MJRefresh'
  s.dependency 'JXSegmentedView'
  s.dependency 'SkeletonView'
  s.dependency 'lottie-ios'
  s.dependency 'JobsSwiftBlock'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'Jobsl10n'
  s.dependency 'JobsSwiftTimer'
  s.dependency 'JobsNavBar'
  s.dependency 'JobsTextTools'
  s.dependency 'JobsImageTools'
  s.dependency 'Jobsl10n'
  s.dependency 'JobsScale'

end
