#import "EventParseMapper.h"

@implementation EventParseMapper

- (id)initWith:(PFObject*)parserObject
{
  self = [super init];
  
  if(self)
  {
    self.title = [parserObject objectForKey:@"title"];
    self.endDate = [parserObject objectForKey:@"endDate"];
    self.startDate = [parserObject objectForKey:@"startDate"];
    self.hashtag = [parserObject objectForKey:@"hashtag"];
    self.identifier = [parserObject objectForKey:@"objectId"];
  }
  
  return self;
}

@end
