Pod::Spec.new do |s|
  s.name          = 'JobsSwiftGraphicCaptcha'
  s.version       = '1.0.0'
  s.summary       = 'Swift graphic captcha generator and view for Jobs projects.'
  s.description   = <<-DESC
JobsSwiftGraphicCaptcha provides configurable captcha text generation and a
UIKit drawing view for Jobs Swift projects.
                   DESC

  s.homepage      = 'https://example.local/JobsSwiftGraphicCaptcha'
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'
  s.source        = { :path => '.' }

  s.source_files  = 'Core/**/*.{swift,h,m,mm}'
  s.ios.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsSwiftDSL'
end
