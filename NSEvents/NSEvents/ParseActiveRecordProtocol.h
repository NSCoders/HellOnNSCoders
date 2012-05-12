#import <Foundation/Foundation.h>

@protocol ParseActiveRecordProtocol <NSObject>

+ (id) findById:(NSString*)objectId;
+ (NSArray*) findAll;
+ (id) findFirst;

@end
