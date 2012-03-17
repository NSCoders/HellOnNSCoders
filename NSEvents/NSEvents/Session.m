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

@end
