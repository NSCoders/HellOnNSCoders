#import <Foundation/Foundation.h>
#import "Location.h"
#import "Session.h"
#import "ParseActiveRecord.h"

@interface Event : ParseActiveRecord

@property (copy)    NSString*   title;
@property (strong)  NSDate*     startDate;
@property (strong)  NSDate*     endDate;
@property (copy)    NSString*   hashtag;
@property (strong)  Location*   location;
@property (readonly) NSArray*    sessions;
@property (readonly) NSArray*    speakers;

-(void) addSession:(Session*)session;

@end
