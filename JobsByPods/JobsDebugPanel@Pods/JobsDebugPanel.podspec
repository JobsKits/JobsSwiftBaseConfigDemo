Pod::Spec.new do |spec|
  spec.name          = 'JobsDebugPanel'
  spec.version       = '1.0.0'
  spec.summary       = 'Debug-only floating menu and environment switching for Jobs apps.'
  spec.description   = 'A scene-aware floating button opens configurable debug actions and URL environments.'
  spec.homepage      = 'https://github.com/JobsKits/JobsSwiftBaseConfigDemo'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '15.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.resource_bundles = {
    'JobsDebugPanelResources' => ['Resource/*.png', 'Resource/*LICENSE*']
  }
  spec.exclude_files = ['**/.DS_Store', '**/Tests/**', '**/Examples/**', '**/build/**']
  spec.frameworks    = ['UIKit']

  spec.dependency 'JobsInheritance'
  spec.dependency 'JobsByUIKit'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'SnapKit'
  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
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
  spec.resource_bundles = (spec.attributes_hash['resource_bundles'] || {}).merge('JobsDebugPanelPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])

end
