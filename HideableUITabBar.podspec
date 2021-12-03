Pod::Spec.new do |s|
  s.name             = 'HideableUITabBar'
  s.version          = '1.0.0'
  s.summary          = 'UITabBar animated hidding.'

  s.description      = <<-DESC
The library provides the ability to hide UITabBar with animation.
                       DESC

  s.homepage         = 'https://github.com/dmytriigolovanov/hideable-uitabbar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dmytrii Golovanov' => 'dmyrii.golovanov@google.com' }

  s.source           = {
    :git => 'https://github.com/dmytriigolovanov/hideable-uitabbar.git',
    :tag => 'v' + s.version.to_s
  }

  s.preserve_paths = [
    "README.md",
    "CHANGELOG.md"
  ]

  s.ios.deployment_target = "11.0"

  s.swift_version = "5.0"

  s.source_files  = "HideableUITabBar/Sources/**/*"
end
