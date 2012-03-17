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
    NSMutableArray* result = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    NSArray *parseObjects = [query findObjects];
    
    for (PFObject *object in parseObjects) 
    {
        Event *mapedObject = [[Event alloc] init];
        [mapedObject mapParserObject:object];
        [result addObject:mapedObject];
    }
    
    return result;
}

+ (id) findFirst
{
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    PFObject *parseObject = [query getFirstObject];
    
    Event *result = [[Event alloc] init];
    [result mapParserObject:parseObject];
    
    return result;
}

+ (id) findById:(NSString*)objectId
{
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    PFObject *parseObject = [query getObjectWithId:objectId];
    
    Event *result = [[Event alloc] init];
    [result mapParserObject:parseObject];
    
    return result;
}

@end