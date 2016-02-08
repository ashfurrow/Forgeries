
#import "ForgeriesFileManager.h"

NS_ASSUME_NONNULL_BEGIN

/// Provides a NSFileManager compatible API but allows you to have an
/// in-memory lookup store with a simple dictionary based file system API

@interface ForgeriesFileManager (Mocks)

/// Replaces the NSUserDefault standardUserDefaults method with a ForgeriesUserDefaults
+ (id)replaceDefaultFileManager;
/// The returned method when the above is called
+ (instancetype)defaultManager;

@end

NS_ASSUME_NONNULL_END
