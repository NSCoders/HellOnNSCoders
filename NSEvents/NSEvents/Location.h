#import "ParseActiveRecord.h"

@interface Location : ParseActiveRecord

@property (copy)    NSString  *objectId;
@property (strong)  NSNumber  *longitud;
@property (strong)  NSNumber  *latitud;
@property (copy)    NSString  *title;
@property (copy)    NSString  *address;
@property (copy)    NSString  *city;
@property (copy)    NSString  *country;

@end
