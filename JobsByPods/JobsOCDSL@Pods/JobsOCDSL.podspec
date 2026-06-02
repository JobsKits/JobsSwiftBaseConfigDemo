require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCDSL.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCDSL'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C chainable DSL categories for Jobs projects.'
  spec.description      = <<-DESC
JobsOCDSL collects Objective-C chainable DSL categories extracted from local Jobs pods.
It keeps DSL syntax independent from the feature pods that consume it.
  DESC

  spec.homepage         = 'https://example.local/JobsOCDSL'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  spec.source_files        = 'JobsOCDSL.h'
  spec.public_header_files = 'JobsOCDSL.h'
  spec.header_dir          = 'JobsOCDSL'

  JobsPodspecKitForJobsOCDSL.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    JobsPodspecKitForJobsOCDSL.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.header_dir          = 'JobsOCDSL'
  end

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'MJRefresh'
  spec.dependency 'Texture'

  JobsPodspecKitForJobsOCDSL.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCDSL.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

end
