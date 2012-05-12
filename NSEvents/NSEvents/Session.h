//
//  Session.m
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//
//

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
@property (copy) NSString*      eventId;

-(void) addSpeaker:(Speaker*)speaker;

+ (NSArray*)findByEventObjectId:(NSString*)objectId;

@end
