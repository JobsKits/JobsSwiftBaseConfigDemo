Pod::Spec.new do |spec|
  spec.name         = 'JobsSwiftUILabelScrolling'
  spec.version      = '1.0.0'
  spec.summary      = 'Four fixed-size text display strategies for UILabel.'
  spec.description  = <<-DESC
                        使用 CoreText + CALayer 绘制 UILabel 长文本，
                        并由 JobsSwiftTimer 驱动连续循环和边界往返滚动。
                      DESC

  spec.homepage     = 'https://example.local/JobsSwiftUILabelScrolling'
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

  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsSwiftTimer'
end
