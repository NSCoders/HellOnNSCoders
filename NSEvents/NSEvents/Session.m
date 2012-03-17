//
//  Session.m
//  NSEvents
//
//  Created by Rubén Bernal Verneda on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "Session.h"

@interface Session()
@property (strong) NSMutableArray *internalSpeakers;
@end

@implementation Session

@synthesize title;
@synthesize internalSpeakers;
@synthesize startDate;
@synthesize endDate;
@synthesize room;
@synthesize track;
@synthesize brief;

-(NSArray*) speakers {
  return internalSpeakers;
}

-(void) addSpeaker:(Speaker*)speaker{
  if(internalSpeakers == nil) internalSpeakers = [[NSMutableArray alloc] init];
  [internalSpeakers addObject:speaker];
}

@end
