#
#  Be sure to run `pod spec lint Vigorous.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Vigorous"
  s.version      = "0.0.1"
  s.summary      = "Simple and easy control of iOS animations"
  s.description  = "The Vigorous is a library to controll iOS animations in a simpler and easier way."
  s.homepage     = "https://github.com/sanghapark/Vigorous"
  s.license      = "MIT"
  s.author             = { "Sang-Ha Park" => "sanghapark1021@gmail.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "git@github.com:sanghapark/Vigorous.git", :tag => s.version.to_s }
  s.source_files  = "Vigorous", "Vigorous/**/*.{h,m,swift}"
  s.requires_arc = true

end
