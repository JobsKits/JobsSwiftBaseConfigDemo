Pod::Spec.new do |spec|
  spec.name          = 'JobsWalletCard'
  spec.version       = '1.0.0'
  spec.summary       = 'Reusable wallet card stack with individual and all-card expansion modes.'
  spec.description   = <<-DESC
                         JobsWalletCard renders a configurable bank-card stack and keeps its layout, selection, add-card entry, and expansion state inside one reusable UIKit component.
                       DESC
  spec.homepage      = 'https://example.local/JobsWalletCard'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.requires_arc  = true
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['QuartzCore', 'UIKit']

  spec.dependency 'JobsByUIKit'
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'SnapKit'
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
