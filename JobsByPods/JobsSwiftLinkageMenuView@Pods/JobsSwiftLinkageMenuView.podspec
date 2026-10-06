Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftLinkageMenuView'
  spec.version       = '0.0.1'
  spec.summary       = 'Swift linkage menu view component for Jobs projects.'
  spec.description   = <<-DESC
                         A local UIKit component that links a left scroll menu with right-side content views.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftLinkageMenuView'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = '*.swift'
  spec.frameworks    = ['UIKit']
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsByUIKit'
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

end
