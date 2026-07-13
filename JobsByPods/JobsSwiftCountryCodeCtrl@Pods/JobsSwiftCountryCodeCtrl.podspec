Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftCountryCodeCtrl'
  spec.version       = '0.0.1'
  spec.summary       = 'Swift country code selector controller for Jobs projects.'
  spec.description   = <<-DESC
                         JobsSwiftCountryCodeCtrl provides a Swift country-code selector controller with localized title text and bundled country-code plist resources.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftCountryCodeCtrl'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = '*.swift'
  spec.resources     = 'Resources/**/*.{plist,strings,stringsdict}'
  spec.frameworks    = ['Foundation', 'UIKit']

  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsByUIKit'
  spec.dependency 'Jobsl10n'
  spec.dependency 'SnapKit'
end
