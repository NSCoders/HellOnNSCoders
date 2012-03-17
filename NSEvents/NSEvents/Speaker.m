#import "Speaker.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Speaker

@synthesize firstName;
@synthesize lastName;
@synthesize email;
@synthesize twitter;
@synthesize bio;
@synthesize phoneNumber;

-(NSURL*)gravatarURL
{
    const char *cStr = [email UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5( cStr, strlen(cStr), result );
    
    return [NSURL URLWithString:[[NSString
             stringWithFormat:@"http://www.gravatar.com/avatar/%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1],
             result[2], result[3],
             result[4], result[5],
             result[6], result[7],
             result[8], result[9],
             result[10], result[11],
             result[12], result[13],
             result[14], result[15]
             ] lowercaseString]];
}

@end
