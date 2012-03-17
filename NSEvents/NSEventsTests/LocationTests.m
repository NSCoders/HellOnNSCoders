#import "LocationTests.h"

@implementation LocationTests

Location *instance;

- (void)setUp
{
  [super setUp];
  
  instance = [[Location alloc] init];
}

- (void)tearDown
{
  instance = nil;
  
  [super tearDown];
}

- (void)testCanCreateIntanceOfLocation
{  
  STAssertNotNil(instance, @"Cannot create instance of Event");
}

- (void)tesHasATitle
{
  instance.title = @"TestTitle";
  
  STAssertEquals(instance.title, @"TestTitle", @"Cannot set a title for an event");
}

- (void)testHasAnAddress
{
  instance.address = @"TestAddress";
  
  STAssertEquals(instance.address, @"TestAddress", @"Cannot set an address for a location");
}

- (void)testHasACity
{
  instance.city = @"TestCity";
  
  STAssertEquals(instance.city, @"TestCity", @"Cannot set a city for a location");
}

- (void)testHasACountry
{
  instance.country = @"TestCountry";
  
  STAssertEquals(instance.country, @"TestCountry", @"Cannot set a country for a location");
}

- (void)testLocationHasLongitude
{
  instance.longitud = 1.0f;
  
  STAssertEquals(instance.longitud, 1.0f, @"Cannot set longitude for a location");
}

- (void)testLocationHasLatidud
{
  instance.latitud = 1.0f;
  
  STAssertEquals(instance.latitud, 1.0f, @"Cannot set latidud for a location");
}

@end
