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


@end
