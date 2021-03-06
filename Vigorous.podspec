Pod::Spec.new do |s|
  s.name         = 'Vigorous'
  s.version      = '0.0.3'
  s.summary      = 'Simple and easy control of iOS animations'
  s.description  = 'The Vigorous is a library to control iOS animations in a simpler and easier way.'
  s.homepage     = 'https://github.com/sanghapark/Vigorous'
  s.license      = 'MIT'
  s.author       = { 'Sang-Ha Park' => 'sanghapark1021@gmail.com' }
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/sanghapark/Vigorous.git', :tag => s.version.to_s }
  s.source_files = 'Vigorous/*.swift'
  s.requires_arc = true
end