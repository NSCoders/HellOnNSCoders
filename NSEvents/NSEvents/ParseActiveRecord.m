#import "ParseActiveRecord.h"

@implementation ParseActiveRecord

@synthesize objectId;

- (void)mapParserObject:(PFObject*)parserObject
{
    // Map parse objects by convention
    // ParseActiveRecord childs should have properties
    // with name matching parse object properties
    for (NSString* key in parserObject.allKeys) 
    {
        if([key isEqualToString:@"location"])
            {
                NSLog(@"aqui");
            }
        
        [self setValue:[parserObject objectForKey:key] forKey:key];
    }
    
    self.objectId = parserObject.objectId;
}

+ (id) findById:(NSString*)objectId entityName:(NSString*)entityName
{
    NSMutableArray* result = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:entityName];
    NSArray *parseObjects = [query findObjects];
    
    for (PFObject *object in parseObjects) 
    {
        id mapedObject = [[NSClassFromString(entityName) alloc] init];
        [mapedObject mapParserObject:object];
        [result addObject:mapedObject];
    }
    
    return result;
}

+ (NSArray*) findAllRecords:(NSString*)entityName
{
    NSMutableArray* result = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:entityName];
    NSArray *parseObjects = [query findObjects];
    
    for (PFObject *object in parseObjects) 
    {
        id mapedObject = [[NSClassFromString(entityName) alloc] init];
        [mapedObject mapParserObject:object];
        [result addObject:mapedObject];
    }
    
    return result;
}

+ (id) findFirstRecord:(NSString*)entityName
{
    PFQuery *query = [PFQuery queryWithClassName:entityName];
    PFObject *parseObject = [query getFirstObject];
    
    id mapedObject = [[NSClassFromString(entityName) alloc] init];
    [mapedObject mapParserObject:parseObject];
    
    return mapedObject;
}

@end
