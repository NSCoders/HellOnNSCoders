#import "ParseActiveRecord.h"

@interface Sponsor : ParseActiveRecord <ParseActiveRecordProtocol>

@property (copy) NSString   *name;
@property (copy) NSString   *email;
@property (copy) NSString   *twitter;
@property (copy) NSString   *bio;
@property (copy) NSString   *logoURL;
@property (copy) NSString   *webURL;
@property (copy) NSString   *phoneNumber;

@end
