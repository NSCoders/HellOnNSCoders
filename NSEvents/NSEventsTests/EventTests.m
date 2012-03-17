#import "EventTests.h"
#import "Session.h"

@implementation EventTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCanCreateIntanceOfEvent
{
  Event *instance = [[Event alloc] init];
  
  STAssertNotNil(instance, @"Cannot create instance of Event");
  
}

- (void)testHasAnIdentifier
{
  Event *instance = [[Event alloc] init];
  
  instance.identifier = 1;
  
  STAssertEquals(instance.identifier, 1, @"Cannot set an identifier for an event");
}

- (void)testHasATitle
{
  Event *instance = [[Event alloc] init];
  
  instance.title = @"Test";
  
  STAssertEquals(instance.title, @"Test", @"Cannot set a title for an event");
}

- (void)testHasAStartDate
{
  Event *instance = [[Event alloc] init];
  
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.startDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.startDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a start date for an event");
}

- (void)testtHasAEndDate
{
  Event *instance = [[Event alloc] init];
  
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.endDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.endDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a end date for an event");
}

- (void)testHasAHashtag
{
  Event *instance = [[Event alloc] init];
  
  instance.hashtag = @"#Evento";
  
  STAssertEquals(instance.hashtag, @"#Evento", @"Cannot set a Hashtag for an event");
}

- (void)testHasALocation
{
  Event *instance = [[Event alloc] init];
  Location *location = [[Location alloc] init];
  
  location.address = @"maresme14";
  instance.location = location;
  
  
  STAssertTrue(instance.location == location,  @"Cannot set a location for an event");
}

- (void)testHasCanAddSession
{
  Event *instance = [[Event alloc] init];
  Session *session = [[Session alloc] init];
  
  [instance addSession: session];
  
  STAssertTrue([instance.sessions count] == 1, @"Test", @"Cannot add a session for an event");
}



@end
