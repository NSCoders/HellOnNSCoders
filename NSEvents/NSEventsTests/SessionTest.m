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

- (void)testHasATitle
{
  Session *instance = [[Session alloc] init];
  
  instance.title = @"Test";
  
  STAssertEquals(instance.title, @"Test", @"Cannot set a title for a session");
}

- (void)testHasCanAddSpeaker
{
  Session *instance = [[Session alloc] init];
  Speaker *speaker = [[Speaker alloc] init];
  
  speaker.firstName = @"firstName";
  speaker.email = @"mail";
  
  
  [instance addSpeaker: speaker];
  
  STAssertTrue([instance.speakers count] == 1, @"Test", @"Cannot set a title for a session");
}

- (void)testHasAStartDate
{
  Session *instance = [[Session alloc] init];
  
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.startDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.startDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a start date for a session");
}

- (void)testtHasAEndDate
{
  Session *instance = [[Session alloc] init];
  
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  
  instance.endDate = [dateFormater dateFromString:@"01/01/2012"];
  
  STAssertEquals(instance.endDate,[dateFormater dateFromString:@"01/01/2012"], @"Cannot set a end date for a session");
}

- (void)testHasARoom
{
  Session *instance = [[Session alloc] init];
  
  instance.room = @"Test";
  
  STAssertEquals(instance.room, @"Test", @"Cannot set a room for a session");
}

- (void)testHasATrack
{
  Session *instance = [[Session alloc] init];
  
  instance.track = @"Test";
  
  STAssertEquals(instance.track, @"Test", @"Cannot set a track for a session");
}

- (void)testHasABrief
{
  Session *instance = [[Session alloc] init];
  
  instance.brief = @"Test";
  
  STAssertEquals(instance.brief, @"Test", @"Cannot set a brief for a session");
}


@end
