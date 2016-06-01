#import "Forgeries-Macros.h"
#import "ForgeriesApplication.h"

@interface ForgeriesApplication()
@property(nonatomic,getter=isStatusBarHidden) BOOL statusBarHidden;
@end

@implementation ForgeriesApplication

@synthesize statusBarHidden=ourStatusBarHidden;

/// We can't call the super init function
/// or it will raise

- (instancetype)init
{
    return self;
}

- (BOOL)statusBarHidden
{
    return ourStatusBarHidden;
}

- (BOOL)isStatusBarHidden
{
    return ourStatusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)statusBarHidden
{
    ourStatusBarHidden = statusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)hidden withAnimation:(UIStatusBarAnimation)animation
{
    self.statusBarHidden = hidden;
}

@end
