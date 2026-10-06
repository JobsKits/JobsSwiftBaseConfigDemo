Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftWebSocket'
  spec.version       = '1.0.0'
  spec.summary       = 'Lightweight WebSocket lifecycle client for Jobs Swift projects.'
  spec.description   = <<-DESC
                         Wraps URLSessionWebSocketTask receive loops, heartbeat pings, exponential reconnects and main-thread callbacks.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftWebSocket'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '13.0'
  spec.swift_version = '5.0'
  spec.requires_arc  = true
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['Foundation']
  # Jobs production boundary: keep validation and temporary sources out of release targets.
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']) + [
    '**/Tests/**/*',
    '**/Test/**/*',
    '**/Example/**/*',
    '**/Examples/**/*',
    '**/Demo/**/*',
    '**/Demos/**/*',
    '**/build/**/*',
    '**/DerivedData/**/*',
    '**/*Tests.swift',
    '**/*UITests.swift',
    '**/*.tmp.*',
  ]

end
