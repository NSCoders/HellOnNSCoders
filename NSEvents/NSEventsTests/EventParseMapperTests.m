#import "EventParseMapperTests.h"

@implementation EventParseMapperTests

- (void)testCanMapParserEvent
{
  NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
  [dateFormater setDateFormat:@"dd/mm/yyyy"];
  
  NSDate *start_date = [dateFormater dateFromString:@"01/01/2012"];
  NSDate *end_date = [dateFormater dateFromString:@"02/01/2012"];
  
  PFObject *event = [PFObject objectWithClassName:@"Event"];
  [event setObject:@"Test Title" forKey:@"title"];
  [event setObject:end_date forKey:@"endDate"];
  [event setObject:start_date forKey:@"startDate"];
  [event setObject:@"#testhashtag" forKey:@"hashtag"];
  [event save];
  
  PFQuery *query = [PFQuery queryWithClassName:@"Event"];
  PFObject *eventFromParser = [query getObjectWithId:event.objectId];
  
  EventParseMapper *mapper = [[EventParseMapper alloc] initWith:eventFromParser];
  
  BOOL assert_entity_mapping = [mapper.title isEqualToString:@"Test Title"]
  && [mapper.startDate isEqualToDate:start_date]
  && [mapper.endDate isEqualToDate:end_date]
  && [mapper.hashtag isEqualToString:@"#testhashtag"];
  
  STAssertTrue(assert_entity_mapping, @"Could not retrieve events from parse");
  
  [eventFromParser delete];
}

@end
