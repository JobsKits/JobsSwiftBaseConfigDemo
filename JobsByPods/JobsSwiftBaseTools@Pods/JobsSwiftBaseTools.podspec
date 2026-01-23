Pod::Spec.new do |s|
  s.name         = 'JobsSwiftBaseTools'          # Pod 名
  s.version      = '0.1.14'
  s.summary      = 'Swift@基础工具集'
  s.description  = <<-DESC
                      关于Swift语言下的基础工具集
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsSwiftBaseTools'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'

  s.source = {
    :git => 'https://github.com/JobsKits/JobsSwiftBaseTools.git',
    :tag => s.version.to_s
  }

  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]

  s.source_files = '**/*.{swift,h,m,mm}'

  # ====================== 系统库依赖：所有代码共享 ======================
  s.ios.frameworks = 'UIKit',
                     'QuartzCore',
                     'Network',
                     'CoreTelephony',
                     'Photos',
                     'PhotosUI',
                     'AVFoundation',
                     'CoreLocation',
                     'CoreBluetooth',
                     'UniformTypeIdentifiers'

  # ====================== 第三方依赖：所有代码共享 ======================
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'NSObject+Rx'
  s.dependency 'SnapKit'
  s.dependency 'Alamofire'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsSwiftBlock'
  s.dependency 'JobsByUIKit'

  # ====================== 🛜 网络流量监控（中文目录） ======================
  s.subspec '🛜网络流量监控' do |ss|
    # 目录：🛜网络流量监控/JobsNetWorkTools.swift
    ss.source_files = '🛜网络流量监控/**/*.swift'
  end
  
  # ====================== ⏰ JobsSwiftTimer ======================
  s.subspec 'JobsSwiftTimer' do |ss|
    ss.source_files = 'JobsSwiftTimer/**/*.swift'
  end
end
