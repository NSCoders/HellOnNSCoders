//
//  Event.h
//  NSEvents
//
//  Created by Rubén Bernal Verneda on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface Event : NSObject

@property (copy)    NSString*   title;
@property (strong)  NSDate*     startDate;
@property (strong)  NSDate*     endDate;
@property (assign)  int         identifier;
@property (copy)    NSString*   hashtag;
@property (strong)  Location*   location;

@end
