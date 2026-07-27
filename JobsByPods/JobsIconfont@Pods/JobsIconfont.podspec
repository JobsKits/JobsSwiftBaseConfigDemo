Pod::Spec.new do |spec|
  spec.name         = 'JobsIconfont'
  spec.version      = '1.0.0'
  spec.summary      = 'A typed iOS facade for iconfont image, icon-font and text-font assets.'
  spec.description  = <<-DESC
    JobsIconfont hides iconfont URLs, Unicode values, font registration, image
    loading, cache details and fallback rendering behind one typed API.
  DESC
  spec.homepage     = 'https://github.com/JobsKits/JobsIconfont'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source       = { :path => '.' }

  spec.platform     = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.requires_arc = true
  spec.module_name  = 'JobsIconfont'

  spec.source_files = 'Core/**/*.swift'
  spec.resource_bundles = {
    'JobsIconfontAssets' => ['Resource/**/*']
  }
  spec.frameworks = [
    'CoreText',
    'UIKit'
  ]

  spec.dependency 'JobsImageTools'
end
