Pod::Spec.new do |s|
  s.name         = 'JobsSwiftTimerMgr'
  s.version      = '0.1.0'
  s.summary      = 'Jobs timer manager for multiple JobsSwiftTimer instances.'
  s.description  = <<-DESC
                     JobsSwiftTimerMgr manages multiple JobsSwiftTimer instances by identifier.
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsSwiftTimerMgr'
  s.license      = { :type => 'MIT' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform      = :ios, '12.0'
  s.swift_version = '5.0'

  s.source = {
    :git => 'https://github.com/JobsKits/JobsSwiftTimerMgr.git',
    :tag => s.version.to_s
  }
  
  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE',
  ]

  s.source_files = '**/*.{swift,h,m,mm}'
  s.ios.frameworks = 'UIKit'
  s.dependency 'JobsSwiftTimer'
  
end
