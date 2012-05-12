#import "Event.h"

@interface Event()

@property (strong) NSMutableArray *internalSessions;

@end

@implementation Event

@synthesize title;
@synthesize startDate;
@synthesize endDate;
@synthesize hashtag;
@synthesize location = _location;
@synthesize internalSessions;

-(NSArray*) sessions 
{
    if(internalSessions == nil)
    {
        internalSessions = (NSMutableArray*)[Session findByEventObjectId:self.objectId];
    }
    
    return internalSessions;
}

-(void) addSession:(Session*)session 
{
    if(internalSessions == nil) 
    {
        internalSessions = [[NSMutableArray alloc] init]; 
    }
    
    [internalSessions addObject:session];
}

- (Location*)location
{
    if(_location == nil)
    {
        return [Location findByEventObjectId:self.objectId];
    }
    
    return _location;
}

- (void) setLocation:(Location*)location
{
    _location = location;
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