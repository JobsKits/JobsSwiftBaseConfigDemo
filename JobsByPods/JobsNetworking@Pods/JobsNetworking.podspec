Pod::Spec.new do |s|
  s.name         = 'JobsNetworking'          # Pod 名
  s.version      = '0.0.1'
  s.summary      = '以Alamofire基础，进行二次封装的网络框架'
  s.description  = <<-DESC
                        JobsNetworking
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsNetworking'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  # 你的源码从 Git 仓库下载
  s.source       = { :git => 'https://github.com/JobsKits/JobsNetworking.git',
                     :tag => s.version.to_s }
                     
  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]
  
  s.ios.frameworks = 'UIKit'
  # 递归匹配当前目录下所有子目录里的 .swift 文件
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'Alamofire'
  
end
