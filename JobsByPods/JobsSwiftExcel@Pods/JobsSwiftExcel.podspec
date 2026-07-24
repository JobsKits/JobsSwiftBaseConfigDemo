Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftExcel'
  spec.version       = '1.0.0'
  spec.summary       = 'Reusable spreadsheet UI with arbitrary frozen columns for Jobs Swift projects.'
  spec.description   = <<-DESC
                         JobsSwiftExcel renders fixed-size cells, freezes every column through a caller-selected index, and scrolls the remaining columns horizontally. Every cell supports shrink, single-line truncation, multi-line truncation, or scrolling text.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftExcel'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['UIKit']
  spec.dependency 'JobsByUIKit'
  spec.dependency 'JobsSwiftBaseDefines'
  spec.dependency 'JobsSwiftDSL'
  spec.dependency 'JobsSwiftUILabelScrolling'
  spec.dependency 'SnapKit'
end
