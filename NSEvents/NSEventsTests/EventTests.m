#import "EventTests.h"
#import "Session.h"

@implementation EventTests

Event *instance;

- (void)setUp
{
  [super setUp];
  instance = [[Event alloc] init];
}

- (void)tearDown
{
  instance = nil;
  
  [super tearDown];
}

- (void)testCanCreateIntanceOfEvent
{
  STAssertNotNil(instance, @"Cannot create instance of Event");
  
}

- (void)testHasAnIdentifier
{
  instance.identifier = 1;
  
  STAssertEquals(instance.identifier, 1, @"Cannot set an identifier for an event");
}

- (void)testHasATitle
{
  instance.title = @"TestTitle";
  
  STAssertEquals(instance.title, @"TestTitle", @"Cannot set a title for an event");
}

- (void)testHasAStartDate
{
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.startDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.startDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a start date for an event");
}

- (void)testtHasAEndDate
{
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.endDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.endDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a end date for an event");
}

- (void)testHasAHashtag
{
  instance.hashtag = @"#Evento";
  
  STAssertEquals(instance.hashtag, @"#Evento", @"Cannot set a Hashtag for an event");
}

- (void)testHasALocation
{
  Location *location = [[Location alloc] init];
  
  location.address = @"maresme14";
  instance.location = location;
  
  
  STAssertTrue(instance.location == location,  @"Cannot set a location for an event");
}

- (void)testHasCanAddSession
{
  Session *session = [[Session alloc] init];
  
  [instance addSession: session];
  
  STAssertTrue([instance.sessions count] == 1, @"Test", @"Cannot add a session for an event");
}



@end
