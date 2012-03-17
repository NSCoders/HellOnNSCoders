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
  
  STAssertTrue([[instance.gravatarURL absoluteString] isEqualToString:@"http://www.gravatar.com/avatar/be61b488c391f8e496bfb214367039d7"], @"Cannot set a URL for a speaker");
}

- (void)testCanMapParseObject
{
    PFObject *object = [PFObject objectWithClassName:@"Speaker"];
    [object setObject:@"FirstName" forKey:@"firstName"];
    [object setObject:@"LastName" forKey:@"lastName"];
    [object setObject:@"email@nscoders.org" forKey:@"email"];
    [object setObject:@"@anonymous" forKey:@"twitter"];
    [object setObject:@"Bio" forKey:@"bio"];
    [object setObject:@"555555555" forKey:@"phoneNumber"];
    [object save];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Speaker"];
    PFObject *objectFromParser = [query getObjectWithId:object.objectId];
    
    Speaker *mapedObject = [[Speaker alloc] init];
    [mapedObject mapParserObject:objectFromParser];
    
    BOOL assert_entity_mapping = 
    [mapedObject.firstName isEqualToString:@"FirstName"]
    && [mapedObject.lastName isEqualToString:@"LastName"]
    && [mapedObject.email isEqualToString:@"email@nscoders.org"]
    && [mapedObject.twitter isEqualToString:@"@anonymous"]
    && [mapedObject.bio isEqualToString:@"Bio"]
    && [mapedObject.phoneNumber isEqualToString:@"555555555"];
    
    STAssertTrue(assert_entity_mapping, @"Could not map speaker from parse object");
    
    [objectFromParser delete];
}

@end
