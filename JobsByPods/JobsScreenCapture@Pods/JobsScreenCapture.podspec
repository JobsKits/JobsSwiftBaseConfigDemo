Pod::Spec.new do |spec|
  spec.name          = 'JobsScreenCapture'
  spec.version       = '1.0.0'
  spec.summary       = 'Screenshot capture, observation, saving, and sensitive-content protection for Jobs projects.'
  spec.description   = <<-DESC
                         Captures and saves screens, observes completed system screenshots, and hosts sensitive UIKit content in a secure rendering container.
                       DESC
  spec.homepage      = 'https://example.local/JobsScreenCapture'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['Photos', 'UIKit']

  spec.dependency 'SnapKit'
end
