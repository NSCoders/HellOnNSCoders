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

- (void)testHasAName
{
  Sponsor *instance = [[Sponsor alloc] init];
  
  instance.name = @"Test";
  
  STAssertEquals(instance.name, @"Test", @"Cannot set a name for a sponsor");
}

- (void)testHasAnEmail
{
  Sponsor *instance = [[Sponsor alloc] init];
  
  instance.email = @"test@nscoders.org";
  
  STAssertEquals(instance.email, @"test@nscoders.org", @"Cannot set a email for a sponsor");
}

- (void)testHasAPhoneNumber
{
  Sponsor *instance = [[Sponsor alloc] init];
  
  instance.phoneNumber = @"123456789";
  
  STAssertEquals(instance.phoneNumber, @"123456789", @"Cannot set a phone number for a sponsor");
}

- (void)testHasATwitterAccount
{
  Sponsor *instance = [[Sponsor alloc] init];
  
  instance.twitter = @"@test";
  
  STAssertEquals(instance.twitter, @"@test", @"Cannot set a twitter account for a sponsor");
}

- (void)testHasABio
{
  Sponsor *instance = [[Sponsor alloc] init];
  
  instance.bio = @"@test";
  
  STAssertEquals(instance.bio, @"@test", @"Cannot set a bio for a sponsor");
}

- (void)testHasALogoURL
{
  Sponsor *instance = [[Sponsor alloc] init];
  
  NSURL *internalURL = [NSURL URLWithString:@"http://www.url.com"];
  instance.logoURL = internalURL;
  
  STAssertTrue(instance.logoURL == internalURL, @"Cannot set a logo URL for a sponsor");
}

- (void)testHasAURL
{
  Sponsor *instance = [[Sponsor alloc] init];
  
  NSURL *internalURL = [NSURL URLWithString:@"http://www.url.com"];
  instance.webURL = internalURL;
    
  STAssertTrue(instance.webURL == internalURL, @"Cannot set a URL for a sponsor");
}

@end
