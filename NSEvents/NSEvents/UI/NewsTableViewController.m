//
//  NewsTableViewController.m
//  NSEvents
//
//  Created by Ivan Leider on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "NewsTableViewController.h"
#import <Twitter/Twitter.h>

@interface NewsTableViewController ()
@property (nonatomic, strong) NSArray *twitterResponse;
@property (nonatomic, strong) UIActivityIndicatorView *activity;
@end

@implementation NewsTableViewController
@synthesize twitterResponse;
@synthesize activity;

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

-(void)viewWillAppear:(BOOL)animated
{
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  TWRequest *twitterRequest = [[TWRequest alloc] initWithURL:
                               [NSURL URLWithString:@"http://search.twitter.com/search.json?q=%23nscoders_es"] 
                      parameters:[NSDictionary dictionary]
                   requestMethod:TWRequestMethodGET];
  [twitterRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
    if (!responseData) {
      NSLog(@"Error in Twitter request: %@", [error description]);
      return ;
    }
    NSError *jsonError = nil;
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData 
                                                         options:NSJSONReadingMutableLeaves 
                                                           error:&jsonError];
    NSLog(@"dict %@", dict);
        
    if (!dict) {
      NSLog(@"Error parsing JSON: %@", [jsonError description]);
      return ;
    } else {
      self.twitterResponse = [dict objectForKey:@"results"];
      NSLog(@"parsed OK: %@", self.twitterResponse);      
      if (![self.twitterResponse count]) {
        NSLog(@"NO RESULTS");
        self.twitterResponse = [NSArray arrayWithObject:[NSDictionary dictionaryWithObjectsAndKeys:@"No results", @"text", nil]];
      }
      
      [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:NULL waitUntilDone:NO];
      [self.activity  performSelectorOnMainThread:@selector(stopAnimating) withObject:NULL waitUntilDone:NO];
    }
  }];
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  self.activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.activity];
  [self.activity startAnimating];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
  self.activity = nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return [self.twitterResponse count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"TwitterCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  // Configure the cell...
  cell.textLabel.font = [UIFont systemFontOfSize:14.0];
  cell.textLabel.numberOfLines = 3;
  cell.textLabel.text = [[self.twitterResponse objectAtIndex:indexPath.row] objectForKey:@"text"];
  return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   */
}

@end
