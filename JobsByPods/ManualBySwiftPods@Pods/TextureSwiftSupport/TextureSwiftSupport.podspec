Pod::Spec.new do |spec|
  spec.name             = 'TextureSwiftSupport'
  spec.version          = '3.19.0'
  spec.summary          = 'A tool kit for Texture'
  spec.description      = 'A library that gains Texture more power in Swift.'
  spec.homepage         = 'https://github.com/TextureCommunity/TextureSwiftSupport'
  spec.license          = 'MIT'
  spec.author           = { 'Muukii' => 'muukii.app@gmail.com' }
  spec.source           = { :path => '.' }

  spec.platform         = :ios, '11.0'
  spec.swift_versions   = ['5.6']
  spec.weak_frameworks  = ['Combine', 'SwiftUI']
  spec.default_subspecs = 'LayoutSpecBuilders', 'Components', 'Extensions', 'Experiments'

  spec.subspec 'LayoutSpecBuilders' do |ss|
    ss.source_files = 'Sources/LayoutSpecBuilders/**/*.swift'
    ss.dependency 'Texture/Core'
  end

  spec.subspec 'Components' do |ss|
    ss.source_files = 'Sources/Components/**/*.swift'
    ss.dependency 'TextureSwiftSupport/LayoutSpecBuilders'
    ss.dependency 'Descriptors', '>= 0.2.1'
    ss.dependency 'Texture/Core'
  end

  spec.subspec 'Extensions' do |ss|
    ss.source_files = 'Sources/Extensions/**/*.swift'
    ss.dependency 'Texture/Core'
  end

  spec.subspec 'Experiments' do |ss|
    ss.source_files = 'Sources/Experiments/**/*.swift'
    ss.dependency 'Texture/Core'
  end
end
