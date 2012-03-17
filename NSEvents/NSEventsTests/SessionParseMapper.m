#import "SessionParseMapper.h"

#import <UIKit/UIKit.h>
//#import "application_headers" as required

@implementation SessionParseMapper

// All code under test is in the iOS Application
- (void)test
{
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
}

@end
