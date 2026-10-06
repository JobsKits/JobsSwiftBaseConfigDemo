Pod::Spec.new do |s|
  s.name         = 'JobsSwiftTools'          # Pod 名
  s.version      = '0.1.1'
  s.summary      = 'Swift中关于Foundation的拓展'
  s.description  = <<-DESC
                      JobsSwiftTools
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsSwiftTools'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  # 你的源码从 Git 仓库下载
  s.source       = { :git => 'https://github.com/JobsKits/JobsSwiftTools.git',
                     :tag => s.version.to_s }

  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'Resource/icon.png',
    'LICENSE',
    'UnityManager.swift'
  ]
  
  # 递归匹配当前目录下所有子目录里的 .swift 文件
  s.default_subspecs = 'Core', 'Flutter'
  s.subspec 'Core' do |core|
    core.source_files = '**/*.{swift,h,m,mm}'
    core.exclude_files = 'FlutterBridge.swift', 'UnityManager.swift'
    core.resource_bundles = { 'JobsSwiftToolsPrivacy' => ['Resource/PrivacyInfo.xcprivacy'] }
  end
  s.subspec 'Flutter' do |flutter|
    flutter.source_files = 'FlutterBridge.swift'
    flutter.dependency 'JobsSwiftTools/Core'
    flutter.dependency 'Flutter'
    flutter.dependency 'FlutterPluginRegistrant'
  end
  s.ios.frameworks = 'UIKit',
                     'Photos',
                     'PhotosUI',
                     'AVFAudio',
                     'AVFoundation',
                     'CoreLocation',
                     'CoreBluetooth',
                     'CoreText'
  
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsSwiftBlock'
  s.dependency 'JobsByPhotosUI'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsToast'
    s.dependency 'JobsSwiftDSL'

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

  # Explicit subspec consumers do not inherit the root's file exclusions.
  s.recursive_subspecs.each do |subspec|
    subspec.exclude_files = Array(subspec.attributes_hash['exclude_files']) + Array(s.attributes_hash['exclude_files'])
  end

end
