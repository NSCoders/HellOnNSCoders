#import "ParseActiveRecord.h"

@implementation ParseActiveRecord

- (void)mapParserObject:(PFObject*)parserObject
{
    // Map parse objects by convention
    // ParseActiveRecord childs should have properties
    // with name matching parse objects
    for (NSString* key in parserObject.allKeys) 
    {
        [self setValue:[parserObject objectForKey:key] forKey:key];
    }
}

- (id) loadById
{
    @throw  @"Not implemented on base class";
}

- (NSArray*) loadAll
{
    @throw  @"Not implemented on base class";
}

@end
