#define ForgeriesIncludesOCMock __has_include(<OCMock/OCMock.h>)

NS_ASSUME_NONNULL_BEGIN

@interface ForgeryFile : NSObject
@property (nonatomic, copy) NSString *path;
@property (nonatomic, strong) NSData *data;
@end

/// Provides a NSUserDefault compatible API but is
/// much simpler, and allows for easier introspection.

@interface ForgeriesFileManager : NSFileManager

#if ForgeriesIncludesOCMock
/// Replaces the NSUserDefault standardUserDefaults method with a ForgeriesUserDefaults
+ (id)replaceDefaultFileManager;
/// The returned method when the above is called
+ (instancetype)defaultManager;
#endif

/// This will generate a file mapping where it will generate the `ForgeryFile`s for you
/// based on the mapping dict you provide. Values can be NSString or NSDictionaries.

/// The filemap supports shortcuts, to make it easier to deal with paths:
/// - App Bundle     : @"/app/thing.txt"
/// - User Documents : @"/docs/thing.txt"
///
+ (instancetype)withFileStringMap:(NSDictionary <NSString *, id>*)dictionary;

/// Just offering up the full dictionary of the underlying file mapping data,
/// as this is for testing, more introspective power is a priority
@property (nonatomic, strong) NSMutableDictionary<NSString *, ForgeryFile *> *fileMap;

@end

NS_ASSUME_NONNULL_END