Pod::Spec.new do |s|
  s.name         = 'JobsImageTools'          # Pod 名
  s.version      = '0.1.14'
  s.summary      = 'TODO'
  s.description  = <<-DESC
                     TODO
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsImageTools'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'
  
  # 全局排除脚本 / 图标
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'Resource/icon.png',
    'LICENSE',
  ]

  s.source = {
    :git => 'https://github.com/JobsKits/JobsImageTools.git',
    :tag => s.version.to_s
  }

  s.source_files = '**/*.{swift,h,m,mm}'
  s.ios.frameworks = [
    'UIKit',
    'AVFoundation'
  ]
  
  s.dependency 'Kingfisher'
  s.dependency 'SDWebImage'
  s.dependency 'JobsSwiftBlock'
  s.dependency 'JobsSwiftBaseDefines'
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

  # Stability 单独编译 Tests；保留生产源码的测试排除规则。
  s.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*Tests.swift'
    test_spec.exclude_files = []
    test_spec.frameworks = 'XCTest'
    test_spec.ios.deployment_target = '15.6'
  end

end
