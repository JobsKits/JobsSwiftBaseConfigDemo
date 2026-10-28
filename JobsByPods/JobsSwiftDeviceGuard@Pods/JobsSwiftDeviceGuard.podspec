Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftDeviceGuard'
  spec.version       = '1.0.0'
  spec.summary       = 'Local iOS jailbreak risk signals with inspectable evidence.'
  spec.description   = 'Independent filesystem, loaded-image and optional sandbox-write checks; no automatic process termination or network upload.'
  spec.homepage      = 'https://example.local/JobsSwiftDeviceGuard'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.requires_arc = true
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.exclude_files = ['**/Tests/**/*', '**/Test/**/*', '**/Example/**/*', '**/Demo/**/*', '**/build/**/*', '**/DerivedData/**/*', '**/*.tmp.*']
  spec.frameworks    = ['Foundation']
  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
