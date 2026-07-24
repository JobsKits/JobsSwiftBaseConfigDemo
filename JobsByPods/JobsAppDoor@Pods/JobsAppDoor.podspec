Pod::Spec.new do |spec|
  spec.name          = 'JobsAppDoor'
  spec.version       = '1.0.0'
  spec.summary       = 'Jobs Swift authentication templates with two motion styles.'
  spec.description   = <<-DESC
                         JobsAppDoor provides reusable Swift login, registration,
                         password recovery, captcha, country code, image background,
                         video background and two authentication transition styles.
                       DESC
  spec.homepage      = 'https://example.local/JobsAppDoor'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '15.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.default_subspecs = 'Core', 'Resource'

  spec.subspec 'Core' do |ss|
    ss.source_files = 'Core/**/*.swift'
  end

  spec.subspec 'Resource' do |ss|
    ss.resource_bundles = {
      'JobsAppDoorResources' => [
        'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'
      ]
    }
  end
  spec.frameworks = ['UIKit', 'AVFoundation', 'QuartzCore']

  spec.dependency 'JobsInheritance'
  spec.dependency 'JobsByUIKit'
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsCountdownButton'
  spec.dependency 'JobsSwiftGraphicCaptcha'
  spec.dependency 'JobsSwiftCountryCodeCtrl'
  spec.dependency 'SnapKit'
end
