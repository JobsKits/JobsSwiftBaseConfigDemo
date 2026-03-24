Pod::Spec.new do |s|
  s.name         = 'JobsNetworking'
  s.version      = '0.0.1'
  s.summary      = '以 Alamofire 为基础的网络封装（iOS12 Core + iOS13+ Async）'
  s.description  = <<-DESC
  JobsNetworking
  DESC

  s.homepage     = 'https://github.com/JobsKits/JobsNetworking'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '12.0'
  s.swift_versions = ['5.7']

  s.source       = { :git => 'https://github.com/JobsKits/JobsNetworking.git',
                     :tag => s.version.to_s }

  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]

  s.ios.frameworks = 'UIKit'

  # 默认只装 Core（iOS 12 可用）
  s.default_subspec = ['Core', 'AF5', 'Async']

  # ------------------------------ Core (iOS 12) ------------------------------
  s.subspec 'Core' do |sp|
    sp.ios.deployment_target = '12.0'
    sp.dependency 'Alamofire'
    sp.dependency 'DatadogInternal'
    sp.dependency 'JobsSwiftFoundation'
    sp.source_files = [
      'Core/**/*.{swift,h,m,mm}',
      'Support/**/*.{swift,h,m,mm}',
      'Request/**/*.{swift,h,m,mm}',
      'RequestConfig/**/*.{swift,h,m,mm}',
      'Cache/**/*.{swift,h,m,mm}',
      'Agent/**/*.{swift,h,m,mm}',
      'Download/**/*.{swift,h,m,mm}',
      'Upload/**/*.{swift,h,m,mm}'
    ]
    # Core 里不包含 Async 目录
    sp.exclude_files = [
      'Async/**/*',
      'Adapters/AF4.x/**/*',
      'Adapters/AF5.x/**/*',
      'Agent/DefaultJobsAgent+Upload.swift',
    ]
  end
  
  s.subspec 'AF4' do |sp|
    sp.ios.deployment_target = '12.0'
    sp.source_files = 'Adapters/AF4.x/**/*.{swift}'
    sp.dependency 'JobsNetworking/Core'
    sp.dependency 'Alamofire', '~> 4.9'
  end

  s.subspec 'AF5' do |sp|
    sp.ios.deployment_target = '13.0'
    sp.source_files = 'Adapters/AF5.x/**/*.{swift}'
    sp.dependency 'JobsNetworking/Core'
    sp.dependency 'Alamofire'
  end

  # ------------------------------ Async (iOS 13+) -----------------------------
  s.subspec 'Async' do |sp|
    sp.ios.deployment_target = '13.0'
    sp.dependency 'JobsNetworking/Core'
    sp.source_files = [
      'Async/**/*.{swift,h,m,mm}'
      ]
  end
end
