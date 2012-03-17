#import <Foundation/Foundation.h>

@protocol ParseActiveRecordProtocol <NSObject>

- (void)mapParserObject:(PFObject*)parserObject;
- (id) loadById;
- (NSArray*) loadAll;

@end
