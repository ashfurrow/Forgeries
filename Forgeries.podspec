Pod::Spec.new do |s|
  s.name             = "Forgeries"
  s.version          = "0.2.0"
  s.summary          = "Helper methods for testing iOS code."
  s.description      = <<-DESC
                       Some helper methods for writing unit tests against iOS code. Currently:

                       - UIGestureRecognizer subclasses.
                       DESC
  s.homepage         = "https://github.com/ashfurrow/Forgeries"
  s.license          = 'MIT'
  s.authors          = { "Ash Furrow" => "ash@ashfurrow.com" 
                         "Orta Therox" => "orta.therox@gmail.com" }
  s.source           = { :git => "https://github.com/ashfurrow/Forgeries.git", :tag => s.version }
  s.social_media_url = 'https://twitter.com/ashfurrow'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
