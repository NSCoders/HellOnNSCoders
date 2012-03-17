//
//  SponsorTests.m
//  NSEvents
//
//  Created by Rubén Bernal Verneda on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "SponsorTests.h"
#import "Sponsor.h"

@implementation SponsorTests

Sponsor *instance;

- (void)setUp
{
  [super setUp];
  
  instance = [[Sponsor alloc] init];
}

- (void)tearDown
{
  instance = nil;
  
  [super tearDown];
}

- (void)testHasAName
{
  instance.name = @"Test";
  
  STAssertEquals(instance.name, @"Test", @"Cannot set a name for a sponsor");
}

- (void)testHasAnEmail
{
  instance.email = @"test@nscoders.org";
  
  STAssertEquals(instance.email, @"test@nscoders.org", @"Cannot set a email for a sponsor");
}

- (void)testHasAPhoneNumber
{
  instance.phoneNumber = @"123456789";
  
  STAssertEquals(instance.phoneNumber, @"123456789", @"Cannot set a phone number for a sponsor");
}

- (void)testHasATwitterAccount
{
  instance.twitter = @"@test";
  
  STAssertEquals(instance.twitter, @"@test", @"Cannot set a twitter account for a sponsor");
}

- (void)testHasABio
{
  instance.bio = @"@test";
  
  STAssertEquals(instance.bio, @"@test", @"Cannot set a bio for a sponsor");
}

- (void)testHasALogoURL
{
  NSURL *internalURL = [NSURL URLWithString:@"http://www.url.com"];
  instance.logoURL = internalURL;
  
  STAssertTrue(instance.logoURL == internalURL, @"Cannot set a logo URL for a sponsor");
}

- (void)testHasAURL
{
  NSURL *internalURL = [NSURL URLWithString:@"http://www.url.com"];
  instance.webURL = internalURL;
    
  STAssertTrue(instance.webURL == internalURL, @"Cannot set a URL for a sponsor");
}

@end
