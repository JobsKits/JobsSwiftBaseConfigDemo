Pod::Spec.new do |s|
  s.name         = 'JobsFuseAnimation'
  s.version      = '0.2.0'
  s.summary      = 'Reusable UIView animations and pluggable refresh renderers for Swift.'
  s.description  = <<-DESC
                    JobsFuseAnimation provides chainable UIView animations for
                    long-press fuse ring growth, press-scale feedback, reusable bubble emission,
                    segmented charging indicators, tap sound and protocol-driven refresh
                    renderers for image sequences, GIF, Lottie, Today News and Douyin styles.
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsFuseAnimation'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'

  # 本地 Pod：和你现有 JobsSwiftDSL 一样使用 :path
  s.source = { :path => '.' }

  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]

  s.source_files = '**/*.{swift,h,m,mm}'
  s.ios.frameworks = 'UIKit', 'QuartzCore', 'AudioToolbox', 'ImageIO'

  s.dependency 'SnapKit'
  s.dependency 'JobsSwiftTimer'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsSwiftDSL'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'lottie-ios'
end
