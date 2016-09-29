Pod::Spec.new do |s|
  s.name             = "Forgeries"
  s.version          = "1.0.0"
  s.summary          = "Smart subclasses for testing UIKit code."
  s.description      = <<-DESC
					   Forgeries is a library that makes unit testing iOS applications easier. UIKit has lots of limitations
					   that make sense in production code, but make testing difficult. Forgeries fixes that problem. Currently
					   it includes subclasses for UIGestureRecognizers, NSUserDefaults and NSFileManager.
                       DESC
  s.homepage         = "https://github.com/ashfurrow/Forgeries"
  s.license          = 'MIT'
  s.authors          = { "Ash Furrow" => "ash@ashfurrow.com",
                         "Orta Therox" => "orta.therox@gmail.com" }
  s.source           = { :git => "https://github.com/ashfurrow/Forgeries.git", :tag => s.version }
  s.social_media_url = 'https://twitter.com/ashfurrow'
  s.platform     = :ios, '8.0'
  s.default_subspec = "Core"

  # To ensure that it isn't called in App code
  s.frameworks = 'Foundation', 'XCTest'

  s.subspec "Core" do |ss|
    ss.source_files = 'Pod/Classes/*'
    ss.public_header_files = 'Pod/Classes/*.h'
  end

  s.subspec "Mocks" do |ss|
    # Allow CP frameworks to specifically connect the two:
    ss.dependency "OCMock"
    ss.dependency "Forgeries/Core"
    ss.source_files = 'Pod/Classes/Mocks/*'
    ss.public_header_files = 'Pod/Classes/Mocks/*.h'
  end

end
