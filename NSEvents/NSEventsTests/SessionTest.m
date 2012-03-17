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
  instance.title = @"Test";
  
  STAssertEquals(instance.title, @"Test", @"Cannot set a title for a session");
}

- (void)testHasCanAddSpeaker
{
  Speaker *speaker = [[Speaker alloc] init];
  
  speaker.firstName = @"firstName";
  speaker.email = @"mail";
  
  
  [instance addSpeaker: speaker];
  
  STAssertTrue([instance.speakers count] == 1, @"Test", @"Cannot set a title for a session");
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
  instance.room = @"Test";
  
  STAssertEquals(instance.room, @"Test", @"Cannot set a room for a session");
}

- (void)testHasATrack
{
  instance.track = @"Test";
  
  STAssertEquals(instance.track, @"Test", @"Cannot set a track for a session");
}

- (void)testHasABrief
{
  instance.brief = @"Test";
  
  STAssertEquals(instance.brief, @"Test", @"Cannot set a brief for a session");
}


@end
