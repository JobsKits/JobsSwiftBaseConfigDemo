Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftNumberStepper'
  spec.version       = '1.0.0'
  spec.summary       = 'Reusable bounded integer stepper input for Jobs Swift projects.'
  spec.description   = <<-DESC
JobsSwiftNumberStepper combines decrement and increment buttons with an integer-only
text field, optional minimum and maximum values, and automatic boundary availability.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftNumberStepper'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['UIKit']

  spec.dependency 'JobsByUIKit'
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'SnapKit'
end
