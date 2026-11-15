Pod::Spec.new do |spec|
  spec.name          = 'JobsViewPush'
  spec.version       = '0.0.1'
  spec.summary       = '支持 UIView 从上下左右推入并原路交互退出。'
  spec.description   = <<-DESC
                         UIView 级 Push 容器，支持方向、覆盖比例、拖拽退出和点击背景退出。
                       DESC
  spec.homepage      = 'https://example.local/JobsViewPush'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = ['JobsViewPush.swift', 'Core/**/*.swift']
  spec.frameworks    = ['UIKit']
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsSwiftBaseDefines'
  # Jobs production boundary: keep validation and temporary sources out of release targets.
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']) + [
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
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*Tests.swift'
    test_spec.exclude_files = []
    test_spec.frameworks = 'XCTest'
    test_spec.ios.deployment_target = '15.6'
  end

end
