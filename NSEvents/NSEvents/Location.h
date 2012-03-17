#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (assign)  float     longitud;
@property (assign)  float     latitud;
@property (copy)    NSString  *title;
@property (copy)    NSString  *address;
@property (copy)    NSString  *city;
@property (copy)    NSString  *country;

@end
