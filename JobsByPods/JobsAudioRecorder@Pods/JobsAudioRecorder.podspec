Pod::Spec.new do |s|
  s.name = 'JobsAudioRecorder'
  s.version = '0.1.0'
  s.summary = 'Decoupled audio recording and local audio management.'
  s.homepage = 'https://github.com/JobsKits/JobsAudioRecorder'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Jobs' => 'lg295060456@gmail.com' }
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'
  s.source = { :git => 'https://github.com/JobsKits/JobsAudioRecorder.git', :tag => s.version.to_s }
  s.source_files = 'Core/**/*.swift'
  s.frameworks = 'AVFoundation', 'UIKit'
  s.dependency 'JobsFuseAnimation'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsSwiftDSL'
  s.dependency 'JobsByUIKit'
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
  s.resource_bundles = (s.attributes_hash['resource_bundles'] || {}).merge('JobsAudioRecorderPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])

  # Stability 单独编译 Tests；保留生产源码的测试排除规则。
  s.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*Tests.swift'
    test_spec.exclude_files = []
    test_spec.frameworks = 'XCTest'
    test_spec.ios.deployment_target = '15.6'
  end

end
