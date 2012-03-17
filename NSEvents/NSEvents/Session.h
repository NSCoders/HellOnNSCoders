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

@property (copy) NSString *title;
@property (readonly) NSArray *speakers;

-(void) addSpeaker:(Speaker*)speaker;


@end
