#
# Be sure to run `pod lib lint SunSearchBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SunSearchBar'
  s.version          = '0.0.1'
  s.summary          = '自定义的searchBar'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

    一个自定义的searchBar
                       DESC

  s.homepage         = 'https://github.com/Sunbohong/SunSearchBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunbohong' => 'sunbohong@gmail.com' }
  s.source           = { :git => 'https://github.com/Sunbohong/SunSearchBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SunSearchBar/Classes/**/*'
  
  s.resource_bundles = {
    'SunSearchBar' => ['SunSearchBar/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Masonry','~> 1.0.1'
end
