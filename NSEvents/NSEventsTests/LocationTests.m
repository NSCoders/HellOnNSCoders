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
    instance.longitud = [NSNumber numberWithFloat:1.0f];
    
    STAssertEquals([instance.longitud floatValue], 1.0f, @"Cannot set longitude for a location");
}

- (void)testLocationHasLatidud
{
    instance.latitud = [NSNumber numberWithFloat:1.0f];
    
    STAssertEquals([instance.latitud floatValue], 1.0f, @"Cannot set latidud for a location");
}

- (void)testCanMapParseObject
{
    PFObject *object = [PFObject objectWithClassName:@"Location"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:[NSNumber numberWithFloat:1.0f] forKey:@"longitud"];
    [object setObject:[NSNumber numberWithFloat:1.0f] forKey:@"latitud"];
    [object setObject:@"street name, 1" forKey:@"address"];
    [object setObject:@"city name" forKey:@"city"];
    [object setObject:@"country name" forKey:@"country"];
    [object setObject:@"eventId" forKey:@"eventId"];
    [object save];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    PFObject *objectFromParser = [query getObjectWithId:object.objectId];
    
    Location *mapedObject = [[Location alloc] init];
    [mapedObject mapParseObject:objectFromParser];
    
    BOOL assert_entity_mapping = [mapedObject.title isEqualToString:@"Test Title"]
    && [mapedObject.longitud floatValue] == 1.0
    && [mapedObject.latitud floatValue] == 1.0
    && [mapedObject.address isEqualToString:@"street name, 1"]
    && [mapedObject.city isEqualToString:@"city name"]
    && [mapedObject.country isEqualToString:@"country name"];
    
    [object delete];
    
    STAssertTrue(assert_entity_mapping, @"Could not map location from parse object");
}

- (void)testCanfindByEventObjectId
{
    PFObject *object = [PFObject objectWithClassName:@"Location"];
    [object setObject:@"Test Title" forKey:@"title"];
    [object setObject:[NSNumber numberWithFloat:1.0f] forKey:@"longitud"];
    [object setObject:[NSNumber numberWithFloat:1.0f] forKey:@"latitud"];
    [object setObject:@"street name, 1" forKey:@"address"];
    [object setObject:@"city name" forKey:@"city"];
    [object setObject:@"country name" forKey:@"country"];
    [object setObject:@"eventId" forKey:@"eventId"];
    [object save];
    
    Location *result = [Location findByEventObjectId:@"eventId"];
    
    [object delete];
    
    STAssertTrue(result != nil, @"Could not map location from parse object");
}

@end
