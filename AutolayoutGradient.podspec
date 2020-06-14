#
# Be sure to run `pod lib lint AutolayoutGradient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AutolayoutGradient'
  s.version          = '1.0.0'
  s.summary          = 'Gradient views that respect autolayout'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Problem: Applying a color gradient as the background of a UIView WITHOUT replacing the view's layer means that as soon as the view's bounds change (because of autolayout) the gradient DOES NOT update accordingly.
  Solution: This lib adds a simple way to ensure the applied gradient updates as expected when a view's bounds are changed.
                       DESC

    s.homepage         = 'https://github.com/janakmshah/AutolayoutGradient'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Janak Shah' => 'janak.shah@cuvva.com' }
    s.source           = { :git => 'https://github.com/janakmshah/AutolayoutGradient.git', :tag => s.version.to_s }

    s.ios.deployment_target = '8.0'
    s.source_files = 'AutolayoutGradient/Classes/**/*'
    s.frameworks = 'UIKit'
     if s.respond_to? 'swift_version'
       s.swift_version = '5.0'
     end
  end
