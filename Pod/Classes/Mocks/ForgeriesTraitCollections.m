#import "ForgeriesTraitCollections.h"
#import <OCMock/OCMock.h>

void stubTraitCollectionInEnvironment(UITraitCollection *traitCollection, id<UITraitEnvironment> environment) {
    id partialMock = [OCMockObject partialMockForObject:environment];
    [[[partialMock stub] andReturn:traitCollection] traitCollection];
    [environment traitCollectionDidChange:nil];
}

#define ExtendTraitEnvironmentImplementation(specific_class) \
@implementation specific_class (Forgeries) \
- (void)stubTraitCollection:(UITraitCollection *)traitCollection \
{ \
    stubTraitCollectionInEnvironment(traitCollection, self); \
} \
- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass \
{ \
    [self stubTraitCollection:[UITraitCollection traitCollectionWithHorizontalSizeClass:horizontalSizeClass]]; \
} \
- (void)stubVerticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass \
{ \
    [self stubTraitCollection:[UITraitCollection traitCollectionWithVerticalSizeClass:verticalSizeClass]]; \
} \
- (void)stubHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass verticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass \
{ \
    UITraitCollection *traitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[ \
                                                                                                       [UITraitCollection traitCollectionWithHorizontalSizeClass:horizontalSizeClass], \
                                                                                                       [UITraitCollection traitCollectionWithVerticalSizeClass:verticalSizeClass] \
                                                                                                       ]]; \
    [self stubTraitCollection:traitCollection]; \
} \
@end

ExtendTraitEnvironmentImplementation(UIViewController)
ExtendTraitEnvironmentImplementation(UIView)
