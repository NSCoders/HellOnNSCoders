#import "ParseActiveRecord.h"
#import <objc/runtime.h>

@implementation ParseActiveRecord

@synthesize objectId;

- (void)mapParseObject:(PFObject*)parseObject
{
    // Map parse objects by convention
    // ParseActiveRecord childs should have properties
    // with name matching parse object properties
    for (NSString* key in parseObject.allKeys) 
    {
        if([key isEqualToString:@"location"])
            {
                NSLog(@"aqui");
            }
        
        [self setValue:[parseObject objectForKey:key] forKey:key];
    }
    
    self.objectId = parseObject.objectId;
}

- (PFObject*)mapToParseObject
{
    PFObject *parseObject = [PFObject objectWithClassName:NSStringFromClass([self class])];
    
    u_int count;
    objc_property_t* properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count ; i++)
    {
        NSString* propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
        
        @try
        {
            if(property_readonly(properties[i]) != 1 && ![propertyName hasPrefix:@"internal"])
            {
                id propertyValue = [self valueForKey:propertyName];
                [parseObject setObject:propertyValue forKey:propertyName];
            }
        }
        @catch (NSException* e)
        {
        }
    }
    
    free(properties);
    
    return parseObject;
}

+ (id) findById:(NSString*)objectId
{
    PFQuery *query = [PFQuery queryWithClassName:NSStringFromClass([self class])];
    PFObject *parseObject = [query getObjectWithId:objectId];
    
    id mapedObject = [[[self class] alloc] init];
    [mapedObject mapParseObject:parseObject];
    
    return mapedObject;
}

+ (NSArray*) findAll
{
    NSMutableArray* result = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:NSStringFromClass([self class])];
    NSArray *parseObjects = [query findObjects];
    
    for (PFObject *object in parseObjects) 
    {
        id mapedObject = [[[self class] alloc] init];
        [mapedObject mapParseObject:object];
        [result addObject:mapedObject];
    }
    
    return result;
}

+ (id) findFirst
{
    PFQuery *query = [PFQuery queryWithClassName:NSStringFromClass([self class])];
    PFObject *parseObject = [query getFirstObject];
    
    id mapedObject = [[[self class] alloc] init];
    [mapedObject mapParseObject:parseObject];
    
    return mapedObject;
}

- (void)save
{
    PFObject *parseObject = [self mapToParseObject];
    
    [parseObject save];
    
    self.objectId = parseObject.objectId;
}

- (void)delete
{
    PFObject *parseObject = [self mapToParseObject];
    [parseObject delete];
}

bool property_readonly( objc_property_t property )
{
	const char * attrs = property_getAttributes( property );
	if ( attrs == NULL )
		return ( 0 );
    
	const char * p = strstr( attrs, ",R" );
	if ( p == NULL )
		return ( 0 );
    
	return ( 1 );
}

@end
