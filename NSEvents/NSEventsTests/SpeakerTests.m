#import "SpeakerTests.h"

@implementation SpeakerTests

Speaker *instance;

- (void)setUp
{
  [super setUp];
  
  instance = [[Speaker alloc] init];
}

- (void)tearDown
{
  instance = nil;
  
  [super tearDown];
}

- (void)testHasAFirstName
{
  instance.firstName = @"TestFirstName";
  
  STAssertEquals(instance.firstName, @"TestFirstName", @"Cannot set a first name for a speaker");
}

- (void)testHasALastName
{
  instance.lastName = @"TestLastName";
  
  STAssertEquals(instance.lastName, @"TestLastName", @"Cannot set a name for a speaker");
}

- (void)testHasAnEmail
{
  instance.email = @"test@nscoders.org";
  
  STAssertEquals(instance.email, @"test@nscoders.org", @"Cannot set a email for a speaker");
}

- (void)testHasAPhoneNumber
{
  instance.phoneNumber = @"123456789";
  
  STAssertEquals(instance.phoneNumber, @"123456789", @"Cannot set a phone number for a speaker");
}

- (void)testHasATwitterAccount
{
  instance.twitter = @"@test";
  
  STAssertEquals(instance.twitter, @"@test", @"Cannot set a twitter account for a speaker");
}

- (void)testHasABio
{
  instance.bio = @"TestBio";
  
  STAssertEquals(instance.bio, @"TestBio", @"Cannot set a bio for a speaker");
}

- (void)testHasAGravatarURL
{
  instance.email = @"anonymous@nscoder.org";
  
  STAssertNotNil(instance.gravatarURL, @"Cannot set a URL for a speaker");
}

@end
