Pod::Spec.new do |s|
  s.name = "GCDWrap"
  s.version = "0.1.1"
  s.summary = "GCDWrap With Objective-C"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"Silence"=>"374619540@qq.com"}
  s.homepage = "https://github.com/silence0201/GCDWrap"
  s.description = "A wrapper of Grand Central Dispatch written in Objective-C"
  s.requires_arc = true
  s.source = { :path => '.' }

  s.ios.deployment_target    = '7.0'
  s.ios.vendored_framework   = 'ios/GCDWrap.framework'
end
