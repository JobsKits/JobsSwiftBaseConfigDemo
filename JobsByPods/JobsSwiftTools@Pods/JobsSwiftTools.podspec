Pod::Spec.new do |s|
  s.name         = 'JobsSwiftTools'
  s.version      = '0.1.1'
  s.summary      = 'Swift中关于Foundation的拓展'
  s.description  = <<-DESC
                      JobsSwiftTools
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsSwiftTools'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'

  s.source       = { :git => 'https://github.com/JobsKits/JobsSwiftTools.git', :tag => s.version.to_s }

  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
    'UnityManager.swift'
  ]

  s.ios.frameworks = 'UIKit',
                     'Photos',
                     'PhotosUI',
                     'AVFAudio',
                     'AVFoundation',
                     'CoreLocation',
                     'CoreBluetooth',
                     'CoreText'

  # ============================== Core（默认） ==============================
  s.subspec 'Core' do |core|
    core.source_files = '**/*.{swift,h,m,mm}'
    core.dependency 'JobsSwiftBaseDefines'
    core.dependency 'JobsSwiftBlock'
    core.dependency 'JobsByUIKit'
    core.dependency 'JobsToast'
    # 如果你有 Flutter 相关源码，务必放到 Flutter 子目录里，并在 Core 排除
    core.exclude_files = [
      'Flutter/**/*',
      '**/*Flutter*.*'
    ]
  end

  # ============================== Flutter（可选） ==============================
  s.subspec 'Flutter' do |f|
    f.source_files = 'Flutter/**/*.{swift,h,m,mm}'
    f.dependency 'JobsSwiftTools/Core'
    f.dependency 'Flutter'
    f.dependency 'FlutterPluginRegistrant'
  end

  s.default_subspecs = 'Core'
end
