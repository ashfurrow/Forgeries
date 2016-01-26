#import "ForgeriesFileManager.h"

#if ForgeriesIncludesOCMock
#import <OCMock/OCMock.h>
#endif

@implementation ForgeryFile
@end

@implementation ForgeriesFileManager

#if ForgeriesIncludesOCMock
+ (id)replaceDefaultFileManager
{
    OCMockObject *mockClass = [OCMockObject niceMockForClass:NSFileManager.class];
    ForgeriesUserDefaults *defaults = [ForgeriesFileManager defaults:dictionary];
    [[[mockClass stub] andReturn:defaults] defaultManager];
    return mockClass;
}

+ (instancetype)defaultManager
{
    return (id)[NSFileManager defaltManagere];
}
#endif

+ (instancetype)withFileStringMap:(NSDictionary <NSString *, NSString *>*)dictionary
{
    ForgeriesFileManager *fileManager = [[ForgeriesFileManager alloc] init];

    NSMutableDictionary *fileMap = [NSMutableDictionary dictionary];
    for (NSString *key in dictionary.allKeys) {
        ForgeryFile *file = [[ForgeryFile alloc] init];
        file.path = key;
        file.data = [dictionary[key] dataUsingEncoding:NSUTF8StringEncoding];
        fileMap[key] = file;
    }
    fileManager.fileMap = fileMap;
    return fileManager;
}

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    _fileMap = [NSMutableDictionary dictionary];

    return self;
}


@end
