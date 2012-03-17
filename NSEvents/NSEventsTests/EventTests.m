#import "EventTests.h"

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

- (void)testEventHasAnIdentifier
{
  Event *instance = [[Event alloc] init];
  
  instance.identifier = 1;
  
  STAssertEquals(instance.identifier, 1, @"Cannot set an identifier for an event");
}

- (void)testEventHasATitle
{
  Event *instance = [[Event alloc] init];
  
  instance.title = @"Test";
  
  STAssertEquals(instance.title, @"Test", @"Cannot set a title for an event");
}

- (void)testEventHasAStartDate
{
  Event *instance = [[Event alloc] init];
  
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.startDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.startDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a start date for an event");
}

- (void)testEventHasAEndDate
{
  Event *instance = [[Event alloc] init];
  
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.endDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.endDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a end date for an event");
}

@end
