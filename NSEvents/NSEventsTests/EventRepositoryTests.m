#import "EventRepositoryTests.h"

@implementation EventRepositoryTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testCanLoadEvents
{
  PFObject *event = [PFObject objectWithClassName:@"Event"];
  [event setObject:@"Test Title" forKey:@"title"];
  [event save];
  
  PFQuery *query = [PFQuery queryWithClassName:@"Event"];
  PFObject *eventFromParser = [query getObjectWithId:event.objectId];
  
  STAssertTrue([[eventFromParser objectForKey:@"title"] isEqualToString:@"Test Title"], @"Could not retrieve events from parse");
  
  [eventFromParser delete];
}


@end
