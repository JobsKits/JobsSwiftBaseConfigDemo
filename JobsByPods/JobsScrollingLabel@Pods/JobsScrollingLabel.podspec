Pod::Spec.new do |spec|
  spec.name         = 'JobsScrollingLabel'
  spec.version      = '0.0.1'
  spec.summary      = 'CoreText-powered scrolling support for UILabel.'
  spec.description  = <<-DESC
                        使用 CoreText + CALayer 绘制 UILabel 长文本，
                        并由 JobsSwiftTimer 驱动连续循环和边界往返滚动。
                      DESC

  spec.homepage     = 'https://github.com/JobsKits/JobsScrollingLabel'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform     = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source       = { :path => '.' }
  spec.source_files = 'Core/**/*.swift'

  spec.ios.frameworks = [
    'UIKit',
    'CoreText',
    'QuartzCore'
  ]

  spec.dependency 'JobsSwiftTimer'
end
