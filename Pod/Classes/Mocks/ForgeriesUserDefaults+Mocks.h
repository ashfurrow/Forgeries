#import "ForgeriesUserDefaults.h"

/// Provides a NSUserDefault compatible API but is
/// much simpler, and allows for easier introspection

@interface ForgeriesUserDefaults (Mocks)

/// Replaces the NSUserDefault standardUserDefaults method with a ForgeriesUserDefaults
+ (id)replaceStandardUserDefaultsWith:(NSDictionary *)dictionary;
/// The returned method when the above is called
+ (instancetype)standardUserDefaults;

@end
