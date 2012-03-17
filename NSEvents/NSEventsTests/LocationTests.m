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
