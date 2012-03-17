#import "SessionParseMapperTests.h"
#import "SessionParseMapper.h"

#import <UIKit/UIKit.h>
//#import "application_headers" as required

@implementation SessionParseMapperTests

- (void)testCanMapParserSession
{
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  [dateFormater setDateFormat:@"dd/mm/yyyy"];
  
  NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
  NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
  
  PFObject *object = [PFObject objectWithClassName:@"Session"];
  [object setObject:@"Test Title" forKey:@"title"];
  [object setObject:end_date forKey:@"endDate"];
  [object setObject:start_date forKey:@"startDate"];
  [object setObject:@"room" forKey:@"room"];
  [object setObject:@"brief" forKey:@"brief"];
  [object setObject:@"track" forKey:@"track"];
  [object save];
  
  PFQuery *query = [PFQuery queryWithClassName:@"Session"];
  PFObject *fromParser = [query getObjectWithId:object.objectId];
  
  SessionParseMapper *mapper = [[SessionParseMapper alloc] initWith:fromParser];
  
  BOOL assert_entity_mapping = [mapper.title isEqualToString:@"Test Title"]
  && [mapper.startDate isEqualToDate:start_date]
  && [mapper.endDate isEqualToDate:end_date]
  && [mapper.room isEqualToString:@"room"]
  && [mapper.brief isEqualToString:@"brief"]
  && [mapper.track isEqualToString:@"track"];
  
  STAssertTrue(assert_entity_mapping, @"Could not map sessions from parse object");
  
  [object delete];
}

@end
