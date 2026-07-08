Pod::Spec.new do |spec|
  spec.name          = 'JobsSwiftCalendar'
  spec.version       = '0.0.1'
  spec.summary       = 'Standalone Swift calendar view for Jobs projects.'
  spec.description   = <<-DESC
                         JobsSwiftCalendar provides a self-owned Swift calendar view aligned with JobsOCCalendar: month paging, date rendering, selection, appearance, and safe reload behavior without wrapping a third-party calendar view.
                       DESC
  spec.homepage      = 'https://example.local/JobsSwiftCalendar'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source        = { :path => '.' }
  spec.source_files  = 'Core/**/*.swift'
  spec.frameworks    = ['Foundation', 'UIKit']
end
