#
#  Be sure to run `pod spec lint KeepCharts.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "KeepCharts"
  s.version      = "0.0.4"
  s.summary      = "A short description of KeepCharts."

  s.description  = <<-DESC
this framework is renamed from Charts
                   DESC

  s.homepage     = "https://github.com/whoyoung/KeepCharts"

  s.license      = "MIT"

  s.author             = { "yanghu" => "yanghu@gotokeep.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/whoyoung/KeepCharts.git", :tag => "#{s.version}" }

#s.source_files  = "KeepCharts/KeepCharts.framework/Headers/*.{h}"

#s.public_header_files = "KeepCharts/KeepCharts.framework/Headers/KeepCharts.h"
  s.frameworks = "Foundation", "UIKit"

  s.vendored_frameworks = 'KeepCharts/KeepCharts.framework'

end
