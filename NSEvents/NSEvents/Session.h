#import <Foundation/Foundation.h>
#import "Speaker.h"
#import "ParseActiveRecord.h"

@interface Session : ParseActiveRecord

@property (copy) NSString*      title;
@property (readonly) NSArray*   speakers;
@property (strong)  NSDate*     startDate;
@property (strong)  NSDate*     endDate;
@property (copy) NSString*      room;
@property (copy) NSString*      track;
@property (copy) NSString*      brief;
@property (copy) NSString*      objectId;
@property (copy) NSString*      eventId;

-(void) addSpeaker:(Speaker*)speaker;

@end
