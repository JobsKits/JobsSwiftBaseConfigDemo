Pod::Spec.new do |s|
  s.name = 'JobsAudioRecorder'
  s.version = '0.1.0'
  s.summary = 'Decoupled audio recording and local audio management.'
  s.homepage = 'https://github.com/JobsKits/JobsAudioRecorder'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Jobs' => 'lg295060456@gmail.com' }
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'
  s.source = { :git => 'https://github.com/JobsKits/JobsAudioRecorder.git', :tag => s.version.to_s }
  s.source_files = 'Core/**/*.swift'
  s.frameworks = 'AVFoundation', 'UIKit'
  s.dependency 'JobsFuseAnimation'
  s.dependency 'JobsSwiftBaseDefines'
  s.dependency 'JobsSwiftDSL'
  s.dependency 'JobsSwiftTimer'
end
