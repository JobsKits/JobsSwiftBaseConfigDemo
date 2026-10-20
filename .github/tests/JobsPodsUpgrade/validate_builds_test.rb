#!/usr/bin/env ruby
# Isolated command/coverage regressions; fake tools never compile or modify the installed Pods project.
require 'json'
require 'open3'
require 'tmpdir'
require 'fileutils'
require 'rbconfig'
require 'rexml/document'
require 'digest'

SOURCE = File.expand_path('validate_builds.rb', __dir__)
POD_NAMES = (0...63).map { |index| format('Pod%03d', index) } + ['JobsAppIconRibbon']

def assert(condition, message)
  raise message unless condition
  $assertions += 1
end

def fixture(directory, names = POD_NAMES)
  root = File.join(directory, 'repository & fixtures')
  script = File.join(root, '.github/tests/JobsPodsUpgrade/validate_builds.rb')
  FileUtils.mkdir_p(File.dirname(script))
  FileUtils.cp(SOURCE, script)
  objects = {
    'PROJECT' => { 'isa' => 'PBXProject', 'targets' => [] },
    'CONFIGS' => { 'buildConfigurations' => ['DEBUG', 'RELEASE'] },
    'DEBUG' => { 'name' => 'Debug' }, 'RELEASE' => { 'name' => 'Release' }
  }
  names.each_with_index do |name, index|
    spec = File.join(root, 'JobsByPods', "#{name}@Pods", "#{name}.podspec")
    FileUtils.mkdir_p(File.dirname(spec))
    File.write(spec, "Pod::Spec.new { |s| s.name = '#{name}' }\n")
    uuid = format('TARGET%04d', index)
    objects['PROJECT']['targets'] << uuid
    target = { 'isa' => name == 'JobsAppIconRibbon' ? 'PBXAggregateTarget' : 'PBXNativeTarget',
               'name' => name, 'buildConfigurationList' => 'CONFIGS' }
    unless name == 'JobsAppIconRibbon'
      target['productType'] = 'com.apple.product-type.framework'
      target['productReference'] = "PRODUCT#{index}"
      objects["PRODUCT#{index}"] = { 'path' => "#{name}-actual.framework" }
    end
    objects[uuid] = target
  end
  # An unrelated installed target must not expand the owned roots selected for the Scheme.
  objects['PROJECT']['targets'] << 'VENDOR'
  objects['VENDOR'] = { 'isa' => 'PBXNativeTarget', 'name' => 'VendorUnused' }
  project = File.join(root, 'Pods/Pods.xcodeproj/project.pbxproj')
  FileUtils.mkdir_p(File.dirname(project))
  File.write(project, JSON.generate('rootObject' => 'PROJECT', 'objects' => objects))
  File.write(File.join(root, 'names.json'), JSON.generate(names))
  bin = File.join(root, 'fake-bin')
  FileUtils.mkdir_p(bin)
  tools = {
    'plutil' => "puts File.read(ARGV.last)\n",
    'xcrun' => <<~'RUBY',
      # Apple Ruby's SDK discovery is not the generator compilation under test.
      exit 0 unless ARGV.first == 'swiftc'
      if ENV['FAKE_GENERATOR_PARENT_INTERRUPT'] == '1'
        Process.kill('INT', Process.ppid)
        sleep 0.05
      end
      exit(ENV['FAKE_GENERATOR_FAILURE'] == '1' ? 66 : 0)
    RUBY
    'xcodebuild' => <<~'RUBY'
      if ARGV.include?('-list')
        puts JSON.generate('project' => { 'schemes' => JSON.parse(File.read('names.json')) })
        exit 0
      end
      case ENV['FAKE_BUILD_OUTCOME']
      when 'failure'
        exit 65
      when 'signal'
        Process.kill('TERM', Process.pid)
      when 'parent-interrupt'
        Process.kill('INT', Process.ppid)
        sleep 0.05
      end
      puts 'Fixture build completed.'
    RUBY
  }
  tools.each do |tool, body|
    path = File.join(bin, tool)
    # Apple Ruby 的 Gem 初始化会调用 xcrun；禁用自动加载，避免递归进入假工具。
    File.write(path, "#!#{RbConfig.ruby} --disable-gems\nrequire 'json'\nFile.open(ENV.fetch('FAKE_TRACE'), 'a') { |file| file.puts(JSON.generate(tool: '#{tool}', arguments: ARGV)) }\n#{body}")
    FileUtils.chmod(0755, path)
  end
  root
end

def run_fixture(root, arguments = [], environment = {})
  output = File.join(root, 'validation output')
  trace = File.join(root, 'trace.jsonl')
  File.write(trace, '')
  env = {
    'PATH' => "#{root}/fake-bin:#{ENV.fetch('PATH')}", 'FAKE_TRACE' => trace,
    'RUBYLIB' => $LOAD_PATH.join(File::PATH_SEPARATOR)
  }.merge(environment)
  stdout, stderr, status = Open3.capture3(env, RbConfig.ruby, '--disable-gems',
    File.join(root, '.github/tests/JobsPodsUpgrade/validate_builds.rb'),
    '--output-dir', output, '--derived-data', File.join(root, 'Shared DerivedData'), *arguments,
    chdir: root)
  result = JSON.parse(File.read(File.join(output, 'results.json')))
  calls = File.readlines(trace).map { |line| JSON.parse(line) }
  [result, calls, status, stdout + stderr]
end

def builds(calls)
  calls.select { |call| call['tool'] == 'xcodebuild' && call['arguments'].last == 'build' }
end

def generators(calls)
  calls.select { |call| call['tool'] == 'xcrun' && call['arguments'].first == 'swiftc' }
end

def change_project(root)
  path = File.join(root, 'Pods/Pods.xcodeproj/project.pbxproj')
  project = JSON.parse(File.read(path))
  yield project.fetch('objects')
  File.write(path, JSON.generate(project))
end

$assertions = 0
Dir.mktmpdir('JobsOwnedPodsBatch-') do |temporary|
  root = fixture(File.join(temporary, 'all'))
  project = File.join(root, 'Pods/Pods.xcodeproj/project.pbxproj')
  original = Digest::SHA256.file(project).hexdigest
  result, calls, status, log = run_fixture(root, ['--batch-pods', '--skip-host'])
  assert(status.success?, "Batch failed: #{log}")
  assert(builds(calls).length == 1, 'All 64 owned roots must share exactly one Xcode build')
  assert(result['units'].length == 64 && result['units'].all? { |unit| unit['success'] }, 'Lost owned target coverage')
  assert(result['units'].all? { |unit| unit['seconds'].nil? && unit['batch'] == 'OwnedPodsBatch' }, 'Members must reference shared timing/evidence')
  assert(result['batch']['exit_code'] == 0 && result['batch']['status'] == 'passed', 'Missing completed batch evidence')
  assert(result['batch']['members'].count { |member| member['type'] == 'PBXAggregateTarget' } == 1, 'Aggregate Pod was excluded')
  assert(generators(calls).length == 1, 'AppIconRibbon generator must still be compiled')
  scheme = REXML::Document.new(File.read(result['batch']['scheme_path']))
  references = REXML::XPath.match(scheme, '//BuildableReference')
  assert(references.map { |reference| reference.attributes['BlueprintName'] }.sort == POD_NAMES.sort, 'Scheme roots must match selected owned Pods exactly')
  references.each do |reference|
    name = reference.attributes['BlueprintName']
    assert(reference.attributes['BlueprintIdentifier'] == format('TARGET%04d', POD_NAMES.index(name)), "Wrong real target UUID for #{name}")
    assert(reference.attributes['ReferencedContainer'] == "container:#{File.realpath(File.dirname(project))}", 'Pods project reference must be absolute and XML-safe')
  end
  assert(references.find { |reference| reference.attributes['BlueprintName'] == 'Pod001' }.attributes['BuildableName'] == 'Pod001-actual.framework', 'Use actual product references instead of inferred names')
  workspace = REXML::Document.new(File.read(File.join(result['batch']['workspace'], 'contents.xcworkspacedata')))
  assert(workspace.root.elements['FileRef'].attributes['location'] == "absolute:#{File.realpath(File.dirname(project))}", 'Workspace must refer to existing project')
  assert(Digest::SHA256.file(project).hexdigest == original, 'Validation mutated the installed Pods project')
  command = builds(calls).first.fetch('arguments')
  assert(command.count('-scheme') == 1 && command[command.index('-scheme') + 1] == 'JobsOwnedPodsValidation', 'Duplicate or incorrect batch Scheme')
  %w[-workspace -derivedDataPath -destination -configuration -sdk -jobs].each do |flag|
    assert(command.include?(flag), "Lost existing build argument #{flag}")
  end
  %w[ARCHS=arm64 ONLY_ACTIVE_ARCH=YES IPHONEOS_DEPLOYMENT_TARGET=15.6 CODE_SIGNING_ALLOWED=NO].each do |flag|
    assert(command.include?(flag), "Lost existing build setting #{flag}")
  end
  assert(command.any? { |flag| flag.start_with?('SYMROOT=') } && command.any? { |flag| flag.start_with?('OBJROOT=') }, 'Lost shared host output paths')

  root = fixture(File.join(temporary, 'subset'))
  result, calls, status, log = run_fixture(root, ['--batch-pods', '--skip-host', '--pods', 'Pod002,Pod001'])
  assert(status.success?, "Subset batch failed: #{log}")
  assert(result['units'].map { |unit| unit['name'] }.sort == %w[Pod001 Pod002], 'Focused batch expanded or lost roots')
  assert(builds(calls).length == 1 && generators(calls).empty?, 'Focused batch ran extra builds')

  %w[failure signal parent-interrupt].each do |outcome|
    root = fixture(File.join(temporary, outcome))
    result, calls, status, _log = run_fixture(root, ['--batch-pods'], 'FAKE_BUILD_OUTCOME' => outcome)
    assert(!status.success? && result['success'] == false, "#{outcome} incorrectly succeeded")
    assert(result['units'].length == 64 && result['units'].none? { |unit| unit['success'] }, "#{outcome} falsely verified members")
    assert(builds(calls).length == 1 && generators(calls).empty?, "#{outcome} continued to host or generator")
    assert(result['batch']['signal'] == 15, 'Lost child termination evidence') if outcome == 'signal'
  end

  %w[missing duplicate configuration product-type].each do |invalid|
    root = fixture(File.join(temporary, invalid))
    change_project(root) do |objects|
      case invalid
      when 'missing'
        objects['PROJECT']['targets'].delete('TARGET0001')
      when 'duplicate'
        objects['DUPLICATE'] = objects['TARGET0001'].dup
        objects['PROJECT']['targets'] << 'DUPLICATE'
      when 'configuration'
        objects['DEBUG']['name'] = 'Other'
      when 'product-type'
        objects['TARGET0001']['productType'] = 'com.apple.product-type.bundle.unit-test'
      end
    end
    result, calls, status, _log = run_fixture(root, ['--batch-pods', '--skip-host'])
    assert(!status.success? && result['success'] == false, "#{invalid} project incorrectly succeeded")
    assert(builds(calls).empty?, "#{invalid} project started incomplete coverage")
  end

  root = fixture(File.join(temporary, 'generator-failure'))
  result, calls, status, _log = run_fixture(root, ['--batch-pods'], 'FAKE_GENERATOR_FAILURE' => '1')
  assert(!status.success? && result['batch']['success'], 'Generator failure must preserve successful iOS batch evidence but fail validation')
  ribbon = result['units'].find { |unit| unit['name'] == 'JobsAppIconRibbon' }
  assert(!ribbon['success'] && ribbon['generator']['exit_code'] == 66, 'Generator failure was ignored')
  assert(builds(calls).length == 1 && result['host']['skipped'], 'Generator failure must block host validation')

  root = fixture(File.join(temporary, 'generator-interrupt'))
  result, calls, status, _log = run_fixture(root, ['--batch-pods'], 'FAKE_GENERATOR_PARENT_INTERRUPT' => '1')
  assert(!status.success? && !result['success'] && result['batch']['success'], 'Interrupted generator must preserve iOS batch evidence and fail validation')
  ribbon = result['units'].find { |unit| unit['name'] == 'JobsAppIconRibbon' }
  assert(ribbon['success'] == false && ribbon['status'] == 'not_verified', 'Interrupted generator falsely verified Ribbon')
  assert(result['units'].count { |unit| unit['success'] } == 63, 'Generator interruption must preserve the other completed targets')
  assert(builds(calls).length == 1 && result['host'].nil?, 'Interrupted generator must not start host validation')

  root = fixture(File.join(temporary, 'legacy'))
  result, calls, status, log = run_fixture(root, ['--skip-host', '--pods', 'Pod001,Pod002'])
  assert(status.success?, "Default mode regressed: #{log}")
  assert(builds(calls).length == 2 && !result.key?('batch'), 'Default mode must remain one build per selected Pod')
  assert(builds(calls).map { |call| call['arguments'][call['arguments'].index('-scheme') + 1] }.sort == %w[Pod001 Pod002], 'Default focused selection regressed')
end
puts "PASS owned Pod batch validation: #{$assertions} assertions; no real Xcode builds."
