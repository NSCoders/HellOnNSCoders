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
  instance.title = @"Test";
  
  STAssertEquals(instance.title, @"Test", @"Cannot set a title for an event");
}

- (void)testHasAnAddress
{
  instance.address = @"Test";
  
  STAssertEquals(instance.address, @"Test", @"Cannot set an address for a location");
}

- (void)testHasACity
{
  instance.city = @"Test";
  
  STAssertEquals(instance.city, @"Test", @"Cannot set a city for a location");
}

- (void)testHasACountry
{
  instance.country = @"Test";
  
  STAssertEquals(instance.country, @"Test", @"Cannot set a country for a location");
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
