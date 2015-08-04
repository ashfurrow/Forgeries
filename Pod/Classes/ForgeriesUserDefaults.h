
#define ForgeriesIncludesOCMock __has_include(<OCMock/OCMock.h>)

@interface ForgeriesUserDefaults : NSObject

#if ForgeriesIncludesOCMock
+ (id)replaceStandardUserDefaultsWith:(NSDictionary *)dictionary;
+ (instancetype)standardUserDefaults;
#endif

+ (instancetype)defaults:(NSDictionary *)dictionary;

- (void)setBool:(BOOL)value forKey:(id<NSCopying>)key;
- (void)setObject:(id<NSCopying>)object forKey:(id<NSCopying>)key;

- (BOOL)boolForKey:(id<NSCopying>)key;
- (NSArray *)stringArrayForKey:(id<NSCopying>)key;
- (NSString *)stringForKey:(id<NSCopying>)key;
- (id)objectForKey:(id<NSCopying>)key;
- (NSInteger)integerForKey:(NSString *)defaultName;

@property (nonatomic, copy) id<NSCopying> lastSetKey;
@property (nonatomic, copy) id<NSCopying> lastRequestedKey;
@property (nonatomic, strong) NSMutableDictionary *defaults;

- (void)synchronize;
@property (nonatomic, assign) BOOL hasSyncronised;

- (id)objectForKeyedSubscript:(id<NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key;

@end
