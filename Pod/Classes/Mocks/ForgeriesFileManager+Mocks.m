#import "Forgeries-Macros.h"
#import "ForgeriesFileManager+Mocks.h"
#import <OCMock/OCMock.h>

@implementation ForgeriesFileManager (Mocks)

+ (id)replaceDefaultFileManager
{
    OCMockObject *mockClass = [OCMockObject niceMockForClass:NSFileManager.class];
    ForgeriesFileManager *manager = [ForgeriesFileManager withFileStringMap:@{}];
    [[[mockClass stub] andReturn:manager] defaultManager];
    return mockClass;
}

+ (instancetype)defaultManager
{
    return (id)[NSFileManager defaultManager];
}

@end
