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
  instance.logoURL = @"http://www.url.com";
  
  STAssertTrue(instance.logoURL == @"http://www.url.com", @"Cannot set a logo URL for a sponsor");
}

- (void)testHasAURL
{
  instance.webURL = @"http://www.url.com";
    
  STAssertTrue(instance.webURL == @"http://www.url.com", @"Cannot set a URL for a sponsor");
}

- (void)testCanMapParseObject
{
    PFObject *object = [PFObject objectWithClassName:@"Sponsor"];
    [object setObject:@"name" forKey:@"name"];
    [object setObject:@"email@nscoders.org" forKey:@"email"];
    [object setObject:@"@anonymous" forKey:@"twitter"];
    [object setObject:@"Bio" forKey:@"bio"];
    [object setObject:@"http://www.nscoders.org/logo.png" forKey:@"logoURL"];
    [object setObject:@"http://www.nscoders.org" forKey:@"webURL"];
    [object setObject:@"555555555" forKey:@"phoneNumber"];
    [object save];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Sponsor"];
    PFObject *objectFromParser = [query getObjectWithId:object.objectId];
    
    Sponsor *mapedObject = [[Sponsor alloc] init];
    [mapedObject mapParserObject:objectFromParser];
    
    BOOL assert_entity_mapping = 
    [mapedObject.name isEqualToString:@"name"]
    && [mapedObject.email isEqualToString:@"email@nscoders.org"]
    && [mapedObject.twitter isEqualToString:@"@anonymous"]
    && [mapedObject.bio isEqualToString:@"Bio"]
    && [mapedObject.logoURL isEqualToString:@"http://www.nscoders.org/logo.png"]
    && [mapedObject.webURL isEqualToString:@"http://www.nscoders.org"]
    && [mapedObject.phoneNumber isEqualToString:@"555555555"];

    STAssertTrue(assert_entity_mapping, @"Could not map sponsor from parse object");
    
    [objectFromParser delete];
}

@end
