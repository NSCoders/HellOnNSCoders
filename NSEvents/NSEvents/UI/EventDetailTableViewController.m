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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if ([cell.reuseIdentifier isEqualToString: @"AddEventCell"]) {
        EKEventStore *eventStore=[[EKEventStore alloc]init];
        
        EKEvent *eventToAdd=[EKEvent eventWithEventStore:eventStore];
  
        eventToAdd.startDate=self.event.startDate;
        eventToAdd.endDate=self.event.endDate;
        eventToAdd.title=self.event.title;
        eventToAdd.calendar=[eventStore defaultCalendarForNewEvents];
        if ([self.event.startDate isEqualToDate:self.event.endDate]) {
            eventToAdd.allDay=TRUE;
        }
//        
//        if ([[self.event.endDate earlierDate:self.event.startDate] isEqualToDate:self.event.endDate]) {
//            NSLog(@"Test");
//        }
//
//        
//        
        NSError* error = nil;
        [eventStore saveEvent:eventToAdd span:EKSpanThisEvent error:&error];
        UIAlertView *alertView;
        if (error==nil) {
            alertView=[[UIAlertView alloc]initWithTitle:@"Añadido Evento" message:@"Se ha añadido el evento en tu Agenda" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }else {
            alertView=[[UIAlertView alloc]initWithTitle:@"Evento no añadido" message:@"No se ha podido añadidir el evento en tu Agenda" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }
        
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
  id<EventDetailViewControllerProtocol> controller = segue.destinationViewController;
  [controller setEvent:self.event];
    
    
}


@end


