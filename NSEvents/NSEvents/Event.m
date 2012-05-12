#import "Event.h"

@interface Event()

@property (strong) NSMutableArray *internalSessions;
@property (strong) NSMutableArray *internalSpeakers;

@end

@implementation Event

@synthesize title;
@synthesize startDate;
@synthesize endDate;
@synthesize hashtag;
@synthesize location = _location;
@synthesize internalSessions;
@synthesize internalSpeakers;

-(NSArray*)speakers
{
    if(internalSpeakers == nil)
    {
        internalSpeakers = [[NSMutableArray alloc] init];
        
        PFQuery *query = [PFQuery queryWithClassName:@"SessionSpeaker"];
        [query whereKey:@"eventId" equalTo:self.objectId];
        NSArray *parseObjects = [query findObjects];
        
        for (PFObject *object in parseObjects) 
        {            
            NSString *stringPredicate = [NSString stringWithFormat: @"objectId = '%@'", [object objectForKey:@"speakerId"]];
            NSPredicate *predicate = [NSPredicate predicateWithFormat: stringPredicate];
            NSArray *matching = [internalSpeakers filteredArrayUsingPredicate:predicate];
            
            if(![matching count])
            {
                Speaker *speaker = [Speaker findById:[object objectForKey:@"speakerId"]];
                
                [self.internalSpeakers addObject:speaker];
            }
        }
    }
    NSSortDescriptor *firstDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName"
                                                                     ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObjects:firstDescriptor, nil];

    NSArray *sortInternalSpeakers = [internalSpeakers sortedArrayUsingDescriptors:descriptors];
    
    return sortInternalSpeakers;
}

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

- (Location *)location
{
    if(_location == nil)
    {
        return [Location findByEventObjectId:self.objectId];
    }
    
    return _location;
}

@end