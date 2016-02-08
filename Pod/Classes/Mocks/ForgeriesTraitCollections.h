@import UIKit;

#define ExtendTraitEnvironment(specific_class) \
@interface specific_class (Forgeries) \
- (void)stubTraitCollection:(UITraitCollection *)traitCollection; \
\
- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass; \
\
- (void)stubVerticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass; \
\
- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass verticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass; \
@end

ExtendTraitEnvironment(UIViewController)
ExtendTraitEnvironment(UIView)
