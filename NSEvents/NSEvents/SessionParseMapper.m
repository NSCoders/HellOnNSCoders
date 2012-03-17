#import "SessionParseMapper.h"

@implementation SessionParseMapper

- (id)initWith:(PFObject*)parserObject
{
    self = [super init];
    
    if(self)
    {
        self.title = [parserObject objectForKey:@"title"];
        self.endDate = [parserObject objectForKey:@"endDate"];
        self.startDate = [parserObject objectForKey:@"startDate"];
        self.room = [parserObject objectForKey:@"room"];
        self.brief = [parserObject objectForKey:@"brief"];
        self.track = [parserObject objectForKey:@"track"];
        self.eventId = [parserObject objectForKey:@"eventId"];
        self.sessionId = [parserObject objectForKey:@"sessionId"];
    }
    
    return self;
}


@end
