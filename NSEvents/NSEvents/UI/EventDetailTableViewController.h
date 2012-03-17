//
//  EventDetailTableViewController.h
//  NSEvents
//
//  Created by Ivan Leider on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Event;
@interface EventDetailTableViewController : UITableViewController
@property (nonatomic, strong) Event *event;
@end
