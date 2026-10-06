Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftSearcher'
  spec.version       = '0.0.1'
  spec.summary       = 'Swift search component for Jobs projects.'
  spec.description   = <<-DESC
                         JobsSwiftSearcher provides a UIKit search panel with recommended keywords and persisted history.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftSearcher'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['UIKit']
  spec.dependency 'SnapKit'
  spec.dependency 'JobsByUIKit'
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'Jobsl10n'
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
  spec.resource_bundles = (spec.attributes_hash['resource_bundles'] || {}).merge('JobsSwiftSearcherPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])

end
