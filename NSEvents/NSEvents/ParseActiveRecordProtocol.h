#import <Foundation/Foundation.h>

@protocol ParseActiveRecordProtocol <NSObject>

- (void)mapParserObject:(PFObject*)parserObject;
- (id) findById:(NSString*)objectId;
- (NSArray*) findAll;

@end
