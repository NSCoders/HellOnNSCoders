//
//  SessionTest.m
//  NSEvents
//
//  Created by Rubén Bernal Verneda on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "SessionTest.h"
#import "Speaker.h"

@implementation SessionTest

Session *instance;

- (void)setUp
{
  [super setUp];
  
  instance = [[Session alloc] init];
}

- (void)tearDown
{
  instance = nil;
  
  [super tearDown];
}

- (void)testHasATitle
{
  instance.title = @"TestTitle";
  
  STAssertEquals(instance.title, @"TestTitle", @"Cannot set a title for a session");
}

- (void)testHasCanAddSpeaker
{
  Speaker *speaker = [[Speaker alloc] init];
  
  speaker.firstName = @"firstName";
  speaker.email = @"mail";
  
  
  [instance addSpeaker: speaker];
  
  STAssertTrue([instance.speakers count] == 1, @"Cannot set a title for a session");
}

- (void)testHasAStartDate
{
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.startDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.startDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a start date for a session");
}

- (void)testtHasAEndDate
{
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.endDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.endDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a end date for a session");
}

- (void)testHasARoom
{
  instance.room = @"TestRoom";
  
  STAssertEquals(instance.room, @"TestRoom", @"Cannot set a room for a session");
}

- (void)testHasATrack
{
  instance.track = @"TestTrack";
  
  STAssertEquals(instance.track, @"TestTrack", @"Cannot set a track for a session");
}

- (void)testHasABrief
{
  instance.brief = @"TestBrief";
  
  STAssertEquals(instance.brief, @"TestBrief", @"Cannot set a brief for a session");
}

- (void)testCanMapParseObject
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *object = [PFObject objectWithClassName:@"Session"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:end_date forKey:@"endDate"];
    [object setObject:start_date forKey:@"startDate"];
    [object setObject:@"room" forKey:@"room"];
    [object setObject:@"brief" forKey:@"brief"];
    [object setObject:@"track" forKey:@"track"];
    [object save];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Session"];
    PFObject *fromParser = [query getObjectWithId:object.objectId];
    
    Session *mappedSession = [[Session alloc] init];
    [mappedSession mapParseObject:fromParser];
    
    BOOL assert_entity_mapping = [mappedSession.title isEqualToString:@"Test Title"]
    && [mappedSession.startDate isEqualToDate:start_date]
    && [mappedSession.endDate isEqualToDate:end_date]
    && [mappedSession.room isEqualToString:@"room"]
    && [mappedSession.brief isEqualToString:@"brief"]
    && [mappedSession.track isEqualToString:@"track"];
    
    [object delete];
    
    STAssertTrue(assert_entity_mapping, @"Could not map sessions from parse object");
}

- (void)testCanfindByEventObjectId
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
    NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
    
    PFObject *object = [PFObject objectWithClassName:@"Session"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:end_date forKey:@"endDate"];
    [object setObject:start_date forKey:@"startDate"];
    [object setObject:@"room" forKey:@"room"];
    [object setObject:@"brief" forKey:@"brief"];
    [object setObject:@"track" forKey:@"track"];
    [object setObject:@"track" forKey:@"track"];
    [object setObject:@"eventId" forKey:@"eventId"];
    [object save];
    
    NSArray  *result = [Session findByEventObjectId:@"eventId"];
    
    [object delete];
    
    STAssertTrue([result count] != 0, @"Could not find by event");
}

@end
