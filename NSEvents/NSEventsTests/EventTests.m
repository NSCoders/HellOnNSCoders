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
  instance.objectId = @"Identifier";
  
  STAssertEquals(instance.objectId, @"Identifier", @"Cannot set an identifier for an event");
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

- (void)testCanMapParseObject
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *object = [PFObject objectWithClassName:@"Event"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:end_date forKey:@"endDate"];
    [object setObject:start_date forKey:@"startDate"];
    [object setObject:@"#testhashtag" forKey:@"hashtag"];
    [object save];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    PFObject *eventFromParser = [query getObjectWithId:object.objectId];
    
    Event *mapedObject = [[Event alloc] init];
    [mapedObject mapParserObject:eventFromParser];
    
    BOOL assert_entity_mapping = [mapedObject.title isEqualToString:@"Test Title"]
    && [mapedObject.startDate isEqualToDate:start_date]
    && [mapedObject.endDate isEqualToDate:end_date]
    && [mapedObject.hashtag isEqualToString:@"#testhashtag"];
    
    [eventFromParser delete];
    
    STAssertTrue(assert_entity_mapping, @"Could not map events from parse object");
}

- (void)testCanFindAll
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *object = [PFObject objectWithClassName:@"Event"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:end_date forKey:@"endDate"];
    [object setObject:start_date forKey:@"startDate"];
    [object setObject:@"#testhashtag" forKey:@"hashtag"];
    [object save];
    
    NSArray *result = [Event findAll];
    
    [object delete];
    
    STAssertTrue([result count] > 0, @"Could not find events in parse");
}

- (void)testCanFindFirst
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *object = [PFObject objectWithClassName:@"Event"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:end_date forKey:@"endDate"];
    [object setObject:start_date forKey:@"startDate"];
    [object setObject:@"#testhashtag" forKey:@"hashtag"];
    [object save];
    
    Event*result = [Event findFirst];
    
    [object delete];
    
    STAssertTrue(result != nil, @"Could not find event in parse");
}

- (void)testCanFindById
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *object = [PFObject objectWithClassName:@"Event"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:end_date forKey:@"endDate"];
    [object setObject:start_date forKey:@"startDate"];
    [object setObject:@"#testhashtag" forKey:@"hashtag"];
    [object save];
    
    Event*result = [Event findById:object.objectId];
    
    [object delete];
    
    STAssertTrue(result != nil, @"Could not find event in parse");
}

- (void)testCanLazyLoadLocation
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *objectEvent = [PFObject objectWithClassName:@"Event"];
    [objectEvent setObject:@"Test Title" forKey:@"title"];
    [objectEvent setObject:end_date forKey:@"endDate"];
    [objectEvent setObject:start_date forKey:@"startDate"];
    [objectEvent setObject:@"#testhashtag" forKey:@"hashtag"];
    [objectEvent save];
    
    PFObject *objectLocation = [PFObject objectWithClassName:@"Location"];
    [objectLocation setObject:@"Test Title" forKey:@"title"];
    [objectLocation setObject:[NSNumber numberWithFloat:1.0f] forKey:@"longitud"];
    [objectLocation setObject:[NSNumber numberWithFloat:1.0f] forKey:@"latitud"];
    [objectLocation setObject:@"street name, 1" forKey:@"address"];
    [objectLocation setObject:@"city name" forKey:@"city"];
    [objectLocation setObject:@"country name" forKey:@"country"];
    [objectLocation setObject:objectEvent.objectId forKey:@"eventId"];
    [objectLocation save];
    
    Event *eventFromParse = [Event findById:objectEvent.objectId];
    Location *locationFromParse = eventFromParse.location; //Lazzy load location from parse
    
    [objectEvent delete];
    [objectLocation delete];
    
    STAssertTrue(locationFromParse != nil, @"Could not LazyLoadLocation in event");
}


- (void)testCanLazyLoadSessions
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *objectEvent = [PFObject objectWithClassName:@"Event"];
    [objectEvent setObject:@"Test Title" forKey:@"title"];
    [objectEvent setObject:end_date forKey:@"endDate"];
    [objectEvent setObject:start_date forKey:@"startDate"];
    [objectEvent setObject:@"#testhashtag" forKey:@"hashtag"];
    [objectEvent save];
    
    PFObject *objectSession = [PFObject objectWithClassName:@"Session"];
    [objectSession setObject:@"Test Title" forKey:@"title"];
    [objectSession setObject:end_date forKey:@"endDate"];
    [objectSession setObject:start_date forKey:@"startDate"];
    [objectSession setObject:@"room" forKey:@"room"];
    [objectSession setObject:@"brief" forKey:@"brief"];
    [objectSession setObject:@"track" forKey:@"track"];
    [objectSession setObject:@"track" forKey:@"track"];
    [objectSession setObject:objectEvent.objectId forKey:@"eventId"];
    [objectSession save];

    Event *eventFromParse = [Event findById:objectEvent.objectId];
    NSArray *sessionFromParse = eventFromParse.sessions; //Lazzy load sessions from parse
    
    [objectEvent delete];
    [objectSession delete];
    
    STAssertTrue([sessionFromParse count] != 0, @"Could not LazyLoadSessions in event");
}

@end
