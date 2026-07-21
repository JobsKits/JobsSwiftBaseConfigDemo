Pod::Spec.new do |spec|
  spec.name          = 'JobsAppIconRibbon'
  spec.version       = '1.0.0'
  spec.summary       = 'Build-time AppIcon environment ribbon generator.'
  spec.description   = <<-DESC
                         Generates derived AppIcon sets with Debug, Release or custom environment ribbons.
                       DESC
  spec.homepage      = 'https://example.local/JobsAppIconRibbon'
  spec.license       = { :type => 'MIT' }
  spec.author        = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform      = :ios, '12.0'
  spec.source        = { :path => '.' }
  spec.preserve_paths = 'Scripts/**/*'
  spec.script_phase = {
    :name => 'Generate AppIcon Environment Ribbon',
    :script => 'JOBS_APP_ICON_RIBBON_NONINTERACTIVE=1 /bin/zsh "${PODS_TARGET_SRCROOT}/Scripts/JobsAppIconRibbon.sh"',
    :execution_position => :before_compile
  }
end
