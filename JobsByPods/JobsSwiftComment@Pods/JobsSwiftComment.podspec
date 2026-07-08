Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftComment'
  spec.version       = '0.0.1'
  spec.summary       = 'Swift comment list component for Jobs projects.'
  spec.description   = <<-DESC
                         JobsSwiftComment provides NetEase, Toutiao and custom nested reply modes for UIKit comment lists.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftComment'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['UIKit']
end

