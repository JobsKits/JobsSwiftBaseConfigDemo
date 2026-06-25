Pod::Spec.new do |s|
  s.name         = 'JobsSwiftWorker'
  s.version      = '0.1.0'
  s.summary      = 'Jobs 系列的 Worker / Observable / GetX-like watcher 层，基于 JobsSwiftTaskCenter 与 JobsSwiftTimer'
  s.description  = <<-DESC
                      JobsSwiftWorker 提供 GetX Worker 风格的监听器能力：ever / once / debounce / interval / everAll，
                      同时补充 skip / take / distinctUntilChanged / combineLatest / map / filter 等工业级扩展，
                      用于在 Jobs 体系内构建轻响应式层，而不强依赖 RxSwift / Combine。
                   DESC

  s.homepage     = 'https://github.com/JobsKits/JobsSwiftWorker'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  s.source       = { :git => 'https://github.com/JobsKits/JobsSwiftWorker.git',
                     :tag => s.version.to_s }

  s.exclude_files = [
    '【MacOS】🫘JobsPublishPods.command',
    'icon.png',
    'LICENSE'
  ]

  s.ios.frameworks = 'UIKit'
  s.source_files = '**/*.{swift,h,m,mm}'
  s.dependency 'SnapKit'
  s.dependency 'Jobsl10n'
  s.dependency 'JobsByUIKit'
  s.dependency 'JobsSwiftRefresher'
  s.dependency 'JobsSwiftTimer'
  s.dependency 'JobsSwiftTaskCenter'
  s.dependency 'JobsSwiftBaseDefines'

end
