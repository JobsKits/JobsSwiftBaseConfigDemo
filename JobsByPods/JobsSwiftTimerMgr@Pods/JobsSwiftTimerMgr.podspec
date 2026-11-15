Pod::Spec.new do |s|
  s.name         = 'JobsSwiftTimerMgr'
  s.version      = '0.1.0'
  s.summary      = 'Jobs timer manager for multiple JobsSwiftTimer instances.'
  s.description  = <<-DESC
                     JobsSwiftTimerMgr manages multiple JobsSwiftTimer instances by identifier.
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsSwiftTimerMgr'
  s.license      = { :type => 'MIT' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'

  s.source = {
    :git => 'https://github.com/JobsKits/JobsSwiftTimerMgr.git',
    :tag => s.version.to_s
  }
  
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]

  s.source_files = '**/*.{swift,h,m,mm}'
  s.ios.frameworks = 'UIKit'
  s.dependency 'JobsSwiftTimer'
  
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
    test_spec.dependency 'JobsSwiftTimer'
  end

end
