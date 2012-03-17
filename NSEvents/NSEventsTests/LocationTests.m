#import "LocationTests.h"

@implementation LocationTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testLocationHasATitle
{
  Location *instance = [[Location alloc] init];
  
  instance.title = @"Test";
  
  STAssertEquals(instance.title, @"Test", @"Cannot set a title for an event");
}

- (void)testLocationHasAnAddress
{
  Location *instance = [[Location alloc] init];
  
  instance.address = @"Test";
  
  STAssertEquals(instance.address, @"Test", @"Cannot set an address for a location");
}

- (void)testLocationHasACity
{
  Location *instance = [[Location alloc] init];
  
  instance.city = @"Test";
  
  STAssertEquals(instance.city, @"Test", @"Cannot set a city for a location");
}

- (void)testLocationHasACountry
{
  Location *instance = [[Location alloc] init];
  
  instance.country = @"Test";
  
  STAssertEquals(instance.country, @"Test", @"Cannot set a country for a location");
}

- (void)testCanCreateIntanceOfLocation
{
  Location *instance = [[Location alloc] init];
  
  STAssertNotNil(instance, @"Cannot create instance of Event");
}

- (void)testLocationHasLongitude
{
  Location *instance = [[Location alloc] init];
  
  instance.longitud = 1.0f;
  
  STAssertEquals(instance.longitud, 1.0f, @"Cannot set longitude for a location");
}

- (void)testLocationHasLatidud
{
  Location *instance = [[Location alloc] init];
  
  instance.latitud = 1.0f;
  
  STAssertEquals(instance.latitud, 1.0f, @"Cannot set latidud for a location");
}

@end
