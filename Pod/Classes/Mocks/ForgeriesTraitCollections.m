#import "ForgeriesTraitCollections.h"
#import <OCMock/OCMock.h>

@implementation UIViewController (Forgeries)

- (void)stubTraitCollection:(UITraitCollection *)traitCollection
{
    id partialMock = [OCMockObject partialMockForObject:self];
    [[[partialMock stub] andReturn:traitCollection] traitCollection];
    [self traitCollectionDidChange:nil];
}

- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass
{
    [self stubTraitCollection:[UITraitCollection traitCollectionWithHorizontalSizeClass:horizontalSizeClass]];
}

- (void)stubVerticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass
{
    [self stubTraitCollection:[UITraitCollection traitCollectionWithVerticalSizeClass:verticalSizeClass]];
}

- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass verticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass
{
    UITraitCollection *traitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[
        [UITraitCollection traitCollectionWithHorizontalSizeClass:horizontalSizeClass],
        [UITraitCollection traitCollectionWithVerticalSizeClass:verticalSizeClass]
    ]];
    [self stubTraitCollection:traitCollection];
}

@end
