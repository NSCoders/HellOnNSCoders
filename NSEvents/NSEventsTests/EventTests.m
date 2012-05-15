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

- (void)testHasAEndDate
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

- (void)testCanMapToParseObject
{
    Event* event = [[Event alloc] init];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    event.title = @"Test title";
    event.endDate = end_date;
    event.startDate = start_date;
    event.hashtag = @"#testhashtag";
    
    PFObject* parseObject = [event mapToParseObject];
    
    BOOL assert_entity_mapping = [[parseObject valueForKey:@"title"] isEqualToString:@"Test title"]
    && [[parseObject valueForKey:@"startDate"] isEqualToDate:start_date]
    && [[parseObject valueForKey:@"endDate"] isEqualToDate:end_date]
    && [[parseObject valueForKey:@"hashtag"] isEqualToString:@"#testhashtag"];
    
    STAssertTrue(assert_entity_mapping, @"Could not map events to parse object");
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
    
    Event *mapedObject = [[Event alloc] init];
    [mapedObject mapParseObject:object];
    
    BOOL assert_entity_mapping = [mapedObject.title isEqualToString:@"Test Title"]
    && [mapedObject.startDate isEqualToDate:start_date]
    && [mapedObject.endDate isEqualToDate:end_date]
    && [mapedObject.hashtag isEqualToString:@"#testhashtag"];
    
    STAssertTrue(assert_entity_mapping, @"Could not map events from parse object");
}

- (void)testCanFindAll
{
    Event* event = [[Event alloc] init];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    event.title = @"Test title";
    event.endDate = end_date;
    event.startDate = start_date;
    event.hashtag = @"#testhashtag";
    [event save];
    
    NSArray *result = [Event findAll];
    
    [event delete];
    
    STAssertTrue([result count] > 0, @"Could not find events in parse");
}

- (void)testCanFindFirst
{
    Event* event = [[Event alloc] init];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    event.title = @"Test title";
    event.endDate = end_date;
    event.startDate = start_date;
    event.hashtag = @"#testhashtag";
    [event save];
    
    Event* result = [Event findFirst];
    
    [event delete];
    
    STAssertTrue([result.title isEqualToString:@"Test title"], @"Could not find event in parse");
}

- (void)testCanFindById
{
    Event* event = [[Event alloc] init];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    event.title = @"Test title";
    event.endDate = end_date;
    event.startDate = start_date;
    event.hashtag = @"#testhashtag";
    [event save];
    
    Event*result = [Event findById:event.objectId];
    
    [event delete];
    
    STAssertTrue([result.title isEqualToString:@"Test title"], @"Could not find event in parse");
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
    
    STAssertTrue([locationFromParse.title isEqualToString:@"Test Title"], @"Could not LazyLoadLocation in event");
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

- (void)testCanGetSpeakers
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
    [objectSession setObject:objectEvent.objectId forKey:@"eventId"];
    [objectSession save];

    PFObject *objectSession2 = [PFObject objectWithClassName:@"Session"];
    [objectSession2 setObject:@"Test Title2" forKey:@"title"];
    [objectSession2 setObject:end_date forKey:@"endDate"];
    [objectSession2 setObject:start_date forKey:@"startDate"];
    [objectSession2 setObject:@"room2" forKey:@"room"];
    [objectSession2 setObject:@"brief2" forKey:@"brief"];
    [objectSession2 setObject:@"track2" forKey:@"track"];
    [objectSession2 setObject:objectEvent.objectId forKey:@"eventId"];
    [objectSession2 save];

    PFObject *objectSpeaker1 = [PFObject objectWithClassName:@"Speaker"];
    [objectSpeaker1 setObject:@"Speaker1" forKey:@"firstName"];
    [objectSpeaker1 save];

    PFObject *objectSpeaker2 = [PFObject objectWithClassName:@"Speaker"];
    [objectSpeaker2 setObject:@"Speaker2" forKey:@"firstName"];
    [objectSpeaker2 save];

    PFObject *objectSpeaker3 = [PFObject objectWithClassName:@"Speaker"];
    [objectSpeaker3 setObject:@"Speaker3" forKey:@"firstName"];
    [objectSpeaker3 save];

    PFObject *objectSessionSpeaker1 = [PFObject objectWithClassName:@"SessionSpeaker"];
    [objectSessionSpeaker1 setObject:objectSession.objectId forKey:@"sessionId"];
    [objectSessionSpeaker1 setObject:objectEvent.objectId forKey:@"eventId"];
    [objectSessionSpeaker1 setObject:objectSpeaker1.objectId forKey:@"speakerId"];
    [objectSessionSpeaker1 save];

    PFObject *objectSessionSpeaker12 = [PFObject objectWithClassName:@"SessionSpeaker"];
    [objectSessionSpeaker12 setObject:objectSession.objectId forKey:@"sessionId"];
    [objectSessionSpeaker12 setObject:objectEvent.objectId forKey:@"eventId"];
    [objectSessionSpeaker12 setObject:objectSpeaker3.objectId forKey:@"speakerId"];
    [objectSessionSpeaker12 save];

    PFObject *objectSessionSpeaker2 = [PFObject objectWithClassName:@"SessionSpeaker"];
    [objectSessionSpeaker2 setObject:objectSession2.objectId forKey:@"sessionId"];
    [objectSessionSpeaker2 setObject:objectEvent.objectId forKey:@"eventId"];
    [objectSessionSpeaker2 setObject:objectSpeaker2.objectId forKey:@"speakerId"];
    [objectSessionSpeaker2 save];
    
    PFObject *objectSessionSpeaker22 = [PFObject objectWithClassName:@"SessionSpeaker"];
    [objectSessionSpeaker22 setObject:objectSession2.objectId forKey:@"sessionId"];
    [objectSessionSpeaker22 setObject:objectEvent.objectId forKey:@"eventId"];
    [objectSessionSpeaker22 setObject:objectSpeaker3.objectId forKey:@"speakerId"];
    [objectSessionSpeaker22 save];

    Event *eventFromParse = [Event findById:objectEvent.objectId];
    NSArray *sessionFromParse = eventFromParse.speakers; //Lazzy load sessions from parse
    
    [objectEvent delete];
    [objectSession delete];
    [objectSpeaker1 delete];
    [objectSpeaker2 delete];
    [objectSpeaker3 delete];
    [objectSessionSpeaker1 delete];
    [objectSessionSpeaker2 delete];
    
    STAssertTrue([sessionFromParse count] == 3, @"Could not LazyLoadSessions in event");
}

@end
