#
# Be sure to run `pod lib lint HSCenterSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HSCenterSlider'
  s.version          = '0.1.2'
  s.summary          = 'Easy to use double side center slider, that can show value in (A,B) Range.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Easy to use double side center slider, that can show value in (A,B) Range.
  Where center of the slider is (A+B)/2.
  E.g.
  1. If your range if (-100,100) then center point of slider will be 0.
  1. If your range if (-80,100) then center point of slider will be 10.
                       DESC

  s.homepage         = 'https://github.com/hitendradeveloper/HSCenterSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hitendradeveloper' => 'hitendra.developer@gmail.com' }
  s.source           = { :git => 'https://github.com/hitendradeveloper/HSCenterSlider.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hitendrahckr'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HSCenterSlider/Classes/**/*'
  
  s.resource_bundles = {
    'HSCenterSlider' => ['HSCenterSlider/Assets/**/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'HSRange', '1.1'
end
