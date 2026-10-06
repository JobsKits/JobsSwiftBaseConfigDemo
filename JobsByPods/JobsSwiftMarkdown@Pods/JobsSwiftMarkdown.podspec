Pod::Spec.new do |spec|
  spec.name             = 'JobsSwiftMarkdown'
  spec.version          = '1.0.0'
  spec.summary          = 'Full local Markdown rendering for Jobs Swift projects.'
  spec.description      = <<-DESC
JobsSwiftMarkdown renders trusted local Markdown through WKWebView. It supports
CommonMark/GFM content, raw HTML, project-relative resources, [toc], syntax
highlighting, Mermaid, KaTeX, task lists, callouts, dark mode and document links.
  DESC

  spec.homepage         = 'https://example.local/JobsSwiftMarkdown'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '15.0'
  spec.swift_version    = '5.9'
  spec.source           = { :path => '.' }

  spec.source_files = [
    'Core/**/*.swift',
    'Support/Native/**/*.swift'
  ]
  spec.resource_bundles = {
    'JobsSwiftMarkdownResources' => ['Resource/**/*']
  }
  spec.preserve_paths = [
    'Support/JobsMarkdownPackager.rb',
    'ThirdPartyLicenses/*'
  ]
  spec.frameworks = [
    'Foundation',
    'UIKit',
    'WebKit'
  ]
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'SnapKit'
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
