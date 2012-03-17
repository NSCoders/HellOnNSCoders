#import "SpeakerTests.h"

@implementation SpeakerTests

- (void)testHasAFirstName
{
  Speaker *instance = [[Speaker alloc] init];
  
  instance.firstName = @"Test";
  
  STAssertEquals(instance.firstName, @"Test", @"Cannot set a first name for a speaker");
}

- (void)testHasALastName
{
  Speaker *instance = [[Speaker alloc] init];
  
  instance.lastName = @"Test";
  
  STAssertEquals(instance.lastName, @"Test", @"Cannot set a name for a speaker");
}

- (void)testHasAnEmail
{
  Speaker *instance = [[Speaker alloc] init];
  
  instance.email = @"test@nscoders.org";
  
  STAssertEquals(instance.email, @"test@nscoders.org", @"Cannot set a email for a speaker");
}

- (void)testHasAPhoneNumber
{
  Speaker *instance = [[Speaker alloc] init];
  
  instance.phoneNumber = @"123456789";
  
  STAssertEquals(instance.phoneNumber, @"123456789", @"Cannot set a phone number for a speaker");
}

- (void)testHasATwitterAccount
{
  Speaker *instance = [[Speaker alloc] init];
  
  instance.twitter = @"@test";
  
  STAssertEquals(instance.twitter, @"@test", @"Cannot set a twitter account for a speaker");
}

- (void)testHasABio
{
  Speaker *instance = [[Speaker alloc] init];
  
  instance.bio = @"@test";
  
  STAssertEquals(instance.bio, @"@test", @"Cannot set a bio for a speaker");
}

- (void)testHasAGravatarURL
{
  Speaker *instance = [[Speaker alloc] init];
  
  instance.gravatarURL = @"@test";
  
  STAssertEquals(instance.gravatarURL, @"@test", @"Cannot set a name for a speaker");
}

@end
