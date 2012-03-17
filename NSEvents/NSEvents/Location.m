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
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    [query whereKey:@"eventId" equalTo:objectId];
    PFObject *parseObject = [query getFirstObject];
    
    Location *result = [[Location alloc] init];
    [result mapParserObject:parseObject];
    
    return result;
}

@end
