@import UIKit;
@import Specta;
@import Expecta;
@import Forgeries;

@interface Test_UIViewController : UIViewController
@property (nonatomic, assign) BOOL calledDidChange;
@end

@interface Test_UIView : UIView
@property (nonatomic, assign) BOOL calledDidChange;
@end

SharedExamplesBegin(TraitCollection)
// Global shared examples are shared across all spec files.

sharedExamplesFor(@"trait collection", ^(NSDictionary *data) {
    __block Class class;

    beforeEach(^{
        class = data[@"class"];
    });

    it(@"calls traitCollectionDidChange:", ^{
        id subject = [class new];

        [subject stubTraitCollection:[UITraitCollection traitCollectionWithTraitsFromCollections:@[]]];

        expect([subject calledDidChange]).to.beTruthy();
    });

    it(@"calls stubs horizontal size class", ^{
        id subject = [class new];

        [subject stubHorizontalSizeClass:UIUserInterfaceSizeClassRegular];

        expect([[subject traitCollection] horizontalSizeClass]).to.equal(UIUserInterfaceSizeClassRegular);

    });

    it(@"calls stubs vertical size class", ^{
        id subject = [class new];

        [subject stubVerticalSizeClass:UIUserInterfaceSizeClassRegular];

        expect([[subject traitCollection] verticalSizeClass]).to.equal(UIUserInterfaceSizeClassRegular);

    });

    it(@"calls stubs horizontal and vertical size classes", ^{
        id subject = [class new];

        [subject stubHorizontalSizeClass:UIUserInterfaceSizeClassCompact verticalSizeClass: UIUserInterfaceSizeClassRegular];

        expect([[subject traitCollection] horizontalSizeClass]).to.equal(UIUserInterfaceSizeClassCompact);
        expect([[subject traitCollection] verticalSizeClass]).to.equal(UIUserInterfaceSizeClassRegular);
        
    });
});

SharedExamplesEnd

SpecBegin(TraitCollection)

itShouldBehaveLike(@"trait collection", @{@"class" : [Test_UIViewController class]});
itShouldBehaveLike(@"trait collection", @{@"class" : [Test_UIView class]});

SpecEnd


@implementation Test_UIViewController

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    self.calledDidChange = YES;
}

@end

@implementation Test_UIView

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    self.calledDidChange = YES;
}

@end
