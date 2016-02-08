#import "ForgeriesUserDefaults+Mocks.h"
#import <OCMock/OCMock.h>

@implementation ForgeriesUserDefaults (Mocks)

+ (id)replaceStandardUserDefaultsWith:(NSDictionary *)dictionary
{
    OCMockObject *mockClass = [OCMockObject niceMockForClass:NSUserDefaults.class];
    ForgeriesUserDefaults *defaults = [ForgeriesUserDefaults defaults:dictionary];
    [[[mockClass stub] andReturn:defaults] standardUserDefaults];
    return mockClass;
}

+ (instancetype)standardUserDefaults
{
    return (id)[NSUserDefaults standardUserDefaults];
}

@end
