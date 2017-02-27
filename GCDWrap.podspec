Pod::Spec.new do |s|
  s.name         = "GCDWrap"
  s.version      = "0.1.0"
  s.summary      = "GCDWrap With Objective-C"
  s.description  = <<-DESC
  						A wrapper of Grand Central Dispatch written in Objective-C
                   DESC

  s.homepage     = "https://github.com/silence0201/GCDWrap"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Silence" => "374619540@qq.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/silence0201/GCDWrap.git", :tag => "0.1.0" }
  s.source_files  = "GCDWrap", "GCDWrap/**/*.{h,m}"
  s.exclude_files = "GCDWrap/Exclude"
  s.requires_arc = true

end
