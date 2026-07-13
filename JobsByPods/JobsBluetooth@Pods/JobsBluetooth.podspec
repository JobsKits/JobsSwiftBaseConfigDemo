Pod::Spec.new do |spec|
  spec.name = 'JobsBluetooth'
  spec.version = '1.0.0'
  spec.summary = '面向多设备、多协议并支持 DSL 的通用 BLE 基础设施。'
  spec.description = 'JobsBluetooth 封装扫描、连接、服务发现、读写、通知、Mock、设备 Profile 与命令模型。'
  spec.homepage = 'https://github.com/JobsKits'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.source = { :path => '.' }
  spec.source_files = 'Core/**/*.swift'
  spec.frameworks = ['Foundation', 'CoreBluetooth']
  spec.resource_bundles = { 'JobsBluetoothPrivacy' => ['Resource/*.xcprivacy'] }
  spec.exclude_files = ['README.md']
end
