#import "Event.h"

@interface Event()

@property (strong) NSMutableArray *internalSessions;

@end

@implementation Event

@synthesize objectId;
@synthesize title;
@synthesize startDate;
@synthesize endDate;
@synthesize hashtag;
@synthesize location;
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

@end