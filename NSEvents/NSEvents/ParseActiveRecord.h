#import "ParseActiveRecordProtocol.h"

@interface ParseActiveRecord : NSObject

@property (copy)    NSString*   objectId;

- (void)mapParserObject:(PFObject*)parserObject;

+ (id) findById:(NSString*)objectId entityName:(NSString*)entityName;
+ (id) findFirstRecord:(NSString*)entityName;
+ (id) findAllRecords:(NSString*)entityName;

@end
