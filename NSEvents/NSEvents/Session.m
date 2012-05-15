#import "Session.h"

@interface Session()
@property (strong) NSMutableArray *internalSpeakers;
@end

@implementation Session

@synthesize title;
@synthesize internalSpeakers;
@synthesize startDate;
@synthesize endDate;
@synthesize room;
@synthesize track;
@synthesize brief;
@synthesize eventId;

-(NSArray*) speakers {
  return internalSpeakers;
}

-(void) addSpeaker:(Speaker*)speaker{
  if(internalSpeakers == nil) internalSpeakers = [[NSMutableArray alloc] init];
  [internalSpeakers addObject:speaker];
}

+ (NSArray*)findByEventObjectId:(NSString*)objectId
{
    NSMutableArray* result = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Session"];
    [query whereKey:@"eventId" equalTo:objectId];
    NSArray *parseObjects = [query findObjects];
    
    for (PFObject *object in parseObjects) 
    {
        Session *mapedObject = [[Session alloc] init];
        [mapedObject mapParseObject:object];
        [result addObject:mapedObject];
    }
    
    return result;
}

@end
