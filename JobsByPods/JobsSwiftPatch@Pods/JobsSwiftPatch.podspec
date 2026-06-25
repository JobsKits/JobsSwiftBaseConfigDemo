Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftPatch'
  spec.version       = '0.0.1'
  spec.summary       = 'Swift runtime payload patch engine for Jobs projects.'
  spec.description   = <<-DESC
                         JobsSwiftPatch provides a small Swift runtime patch manager that can temporarily replace a method implementation with a local payload provider and roll it back.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftPatch'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = '*.swift'
  spec.frameworks    = ['Foundation', 'UIKit']
end
