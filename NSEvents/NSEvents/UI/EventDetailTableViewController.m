//
//  EventDetailTableViewController.m
//  NSEvents
//
//  Created by Ivan Leider on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "EventDetailTableViewController.h"
#import "Event.h"
#import "TimeAndPlaceViewController.h"

@protocol EventDetailViewControllerProtocol <NSObject>

- (void)setEvent:(Event*)event;

@end

@interface EventDetailTableViewController ()

@end

@implementation EventDetailTableViewController
@synthesize event;
@synthesize eventTitleCell;

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.eventTitleCell.textLabel.text = event.title;
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
  [self setEventTitleCell:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view delegate


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
  id<EventDetailViewControllerProtocol> controller = segue.destinationViewController;
  [controller setEvent:self.event];
    
    
}


@end


