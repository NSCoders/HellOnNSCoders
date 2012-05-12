//
//  EventDetailTableViewController.h
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@class Event;
@interface EventDetailTableViewController : UITableViewController
@property (nonatomic, strong) Event *event;
@property (strong, nonatomic) IBOutlet UITableViewCell *eventTitleCell;
@end
