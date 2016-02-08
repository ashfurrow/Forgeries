@import UIKit;

@interface UIViewController (Forgeries)

/// Creates a partial mock of the receive that stubs its trait collection.
- (void)stubTraitCollection:(UITraitCollection *)traitCollection;

/// Creates a partial mock of the receiver that stubs its horizontal size class.
- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass;

/// Creates a partial mock of the receiver that stubs its vertical size class.
- (void)stubVerticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass;

/// Creates a partial mock of the receiver that stubs its size classes.
- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass verticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass;

@end
