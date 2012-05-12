#import "Sponsor.h"

@implementation Sponsor

@synthesize name;
@synthesize email;
@synthesize twitter;
@synthesize bio;
@synthesize logoURL;
@synthesize webURL;
@synthesize phoneNumber;

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
