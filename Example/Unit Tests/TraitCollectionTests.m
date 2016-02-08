@import UIKit;
@import Specta;
@import Expecta;
@import Forgeries;

@interface Test_UIViewController : UIViewController

@property (nonatomic, assign) BOOL calledDidChange;

@end

SpecBegin(TraitCollection)

it(@"calls traitCollectionDidChange:", ^{
    Test_UIViewController *subject = [Test_UIViewController new];

    [subject stubTraitCollection:[UITraitCollection traitCollectionWithTraitsFromCollections:@[]]];

    expect(subject.calledDidChange).to.beTruthy();
});

it(@"calls stubs horizontal size class", ^{
    UIViewController *subject = [UIViewController new];

    [subject stubHorizontalSizeClass:UIUserInterfaceSizeClassRegular];

    expect(subject.traitCollection.horizontalSizeClass).to.equal(UIUserInterfaceSizeClassRegular);

});

it(@"calls stubs vertical size class", ^{
    UIViewController *subject = [UIViewController new];

    [subject stubVerticalSizeClass:UIUserInterfaceSizeClassRegular];

    expect(subject.traitCollection.verticalSizeClass).to.equal(UIUserInterfaceSizeClassRegular);

});

it(@"calls stubs horizontal and vertical size classes", ^{
    UIViewController *subject = [UIViewController new];

    [subject stubHorizontalSizeClass:UIUserInterfaceSizeClassCompact verticalSizeClass: UIUserInterfaceSizeClassRegular];

    expect(subject.traitCollection.horizontalSizeClass).to.equal(UIUserInterfaceSizeClassCompact);
    expect(subject.traitCollection.verticalSizeClass).to.equal(UIUserInterfaceSizeClassRegular);

});

SpecEnd


@implementation Test_UIViewController

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    self.calledDidChange = YES;
}

@end
