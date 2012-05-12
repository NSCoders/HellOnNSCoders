#import "Location.h"

@implementation Location

@synthesize longitud;
@synthesize latitud;
@synthesize title;
@synthesize address;
@synthesize city;
@synthesize country;
@synthesize eventId;

+ (Location*)findByEventObjectId:(NSString*)objectId
{
    PFQuery *query = [PFQuery queryWithClassName:NSStringFromClass([self class])];
    [query whereKey:@"eventId" equalTo:objectId];
    PFObject *parseObject = [query getFirstObject];
    
    Location *result = [[Location alloc] init];
    [result mapParserObject:parseObject];
    
    return result;
}

+ (NSArray*) findAll
{
    return [ParseActiveRecord findAllRecords:NSStringFromClass([self class])];
}

+ (id) findFirst
{
    return [ParseActiveRecord findFirstRecord:NSStringFromClass([self class])];
}

+ (id) findById:(NSString*)objectId
{
    return [ParseActiveRecord findById:objectId entityName:NSStringFromClass([self class])];
}

@end
