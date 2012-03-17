#import "ParseActiveRecord.h"

@interface Location : ParseActiveRecord

@property (assign)  float     longitud;
@property (assign)  float     latitud;
@property (copy)    NSString  *title;
@property (copy)    NSString  *address;
@property (copy)    NSString  *city;
@property (copy)    NSString  *country;

@end
