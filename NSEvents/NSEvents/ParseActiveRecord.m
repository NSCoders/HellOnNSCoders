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

+ (id) findById:(NSString*)objectId
{
    PFQuery *query = [PFQuery queryWithClassName:NSStringFromClass([self class])];
    PFObject *parseObject = [query getObjectWithId:objectId];
    
    id mapedObject = [[[self class] alloc] init];
    [mapedObject mapParserObject:parseObject];
    
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
        [mapedObject mapParserObject:object];
        [result addObject:mapedObject];
    }
    
    return result;
}

+ (id) findFirst
{
    PFQuery *query = [PFQuery queryWithClassName:NSStringFromClass([self class])];
    PFObject *parseObject = [query getFirstObject];
    
    id mapedObject = [[[self class] alloc] init];
    [mapedObject mapParserObject:parseObject];
    
    return mapedObject;
}

@end
