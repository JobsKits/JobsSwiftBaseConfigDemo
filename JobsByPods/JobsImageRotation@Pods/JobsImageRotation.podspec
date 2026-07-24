Pod::Spec.new do |spec|
  spec.name          = 'JobsImageRotation'
  spec.version       = '1.0.0'
  spec.summary       = 'Timer-driven clockwise and counterclockwise image rotation for Jobs projects.'
  spec.description   = <<-DESC
                         Rotates any UIKit view with a configurable direction and timer interval.
                       DESC
  spec.homepage      = 'https://example.local/JobsImageRotation'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['UIKit']

  spec.dependency 'JobsSwiftTimer'
end
