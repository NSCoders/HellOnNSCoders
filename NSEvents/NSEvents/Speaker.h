#import "ParseActiveRecord.h"

@interface Speaker : ParseActiveRecord <ParseActiveRecordProtocol>

@property (copy) NSString   *firstName;
@property (copy) NSString   *lastName;
@property (copy) NSString   *email;
@property (copy) NSString   *twitter;
@property (copy) NSString   *bio;
@property (readonly) NSURL  *gravatarURL;
@property (copy) NSString   *phoneNumber;

@end
