Pod::Spec.new do |spec|
  spec.name = 'JobsOCDSL'
  spec.version = '1.0.1'
  spec.summary = 'Capability-aware Objective-C DSL compatibility entry for the Swift checkout.'
  spec.description = 'Buildable compatibility entry. Optional categories are exported only when their source is present in this Pod.'
  spec.homepage = 'https://github.com/JobsKits/JobsBaseConfig'
  spec.license = { :type => 'MIT' }
  spec.author = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform = :ios, '12.0'
  spec.requires_arc = true
  spec.source = { :path => '.' }
  spec.default_subspecs = 'Core'
  spec.subspec 'Core' do |core|
    core.source_files = 'JobsOCDSL.{h,m}', 'Core/**/*.{h,m,mm}'
    core.public_header_files = 'JobsOCDSL.h', 'Core/**/*.h'
    core.header_dir = 'JobsOCDSL'
  end
  spec.frameworks = 'Foundation', 'UIKit'
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

  # Explicit subspec consumers do not inherit the root's file exclusions.
  spec.recursive_subspecs.each do |subspec|
    subspec.exclude_files = Array(subspec.attributes_hash['exclude_files']) + Array(spec.attributes_hash['exclude_files'])
  end

end
