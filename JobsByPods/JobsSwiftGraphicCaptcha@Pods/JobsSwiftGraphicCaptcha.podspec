Pod::Spec.new do |s|
  s.name          = 'JobsSwiftGraphicCaptcha'
  s.version       = '1.0.0'
  s.summary       = 'Swift graphic captcha generator and view for Jobs projects.'
  s.description   = <<-DESC
JobsSwiftGraphicCaptcha provides configurable captcha text generation and a
UIKit drawing view for Jobs Swift projects.
                   DESC

  s.homepage      = 'https://example.local/JobsSwiftGraphicCaptcha'
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'
  s.source        = { :path => '.' }

  s.source_files  = 'Core/**/*.{swift,h,m,mm}'
  s.ios.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]
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
