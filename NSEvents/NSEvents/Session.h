//
//  Session.h
//  NSEvents
//
//  Created by Rubén Bernal Verneda on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Speaker.h"

@interface Session : NSObject

@property (copy) NSString*      title;
@property (readonly) NSArray*   speakers;
@property (strong)  NSDate*     startDate;
@property (strong)  NSDate*     endDate;
@property (copy) NSString*      room;
@property (copy) NSString*      track;
@property (copy) NSString*      brief;
@property (copy) NSString*      sessionId;
@property (copy) NSString*      eventId;


-(void) addSpeaker:(Speaker*)speaker;


@end
