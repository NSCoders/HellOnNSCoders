//
//  TimeAndPlaceViewControllerViewController.m
//  NSEvents
//
//  Created by Joan Guerrero Estrada on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "TimeAndPlaceViewController.h"


@interface TimeAndPlaceViewController ()

@end

@implementation TimeAndPlaceViewController
@synthesize mapView,event,locationPoint;
@synthesize lblTitle,lblEndDate,lblHashtag,lblStartDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Evento %@",event.title);
    
    self.event.location=[[Location alloc]init];
    
    
    self.event.location.title = event.title;
    self.event.location.address = @"Direccion";
    self.event.location.city = @"Ciudad";
    self.event.location.country = @"Country";
    self.event.location.latitud = [NSNumber numberWithFloat:41.408943];
    self.event.location.longitud = [NSNumber numberWithFloat:2.126601];
    
    self.locationPoint= [[LocationPoint alloc]initWithTitle:event.location.title address:event.location.address city:event.location.city latitud:[event.location.latitud floatValue] longitud:[event.location.longitud floatValue]];
    
    [self.mapView addAnnotation:locationPoint];
   
    MKCoordinateSpan span=MKCoordinateSpanMake(0.1, 0.1);

    MKCoordinateRegion region;

    region.span = span;
    region.center = locationPoint.coordinate;
    [mapView setRegion:region animated:TRUE];
    
    //rellenamos datos en labels superiores
    
    NSDateFormatter *start=[[NSDateFormatter alloc]init];
    NSDateFormatter *end =[[NSDateFormatter alloc]init];
    start.dateStyle=NSDateFormatterFullStyle;
    end.dateStyle=NSDateFormatterFullStyle;
    
    self.lblTitle.text=event.title;
    self.lblStartDate.text=[start stringFromDate:event.startDate];
    self.lblEndDate.text=[end stringFromDate:event.startDate];
    self.lblHashtag.text= event.hashtag;
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)selectPoint{
    //selecciona el punto del evento y muestra algun detalle
    [self.mapView selectAnnotation:locationPoint animated:TRUE];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation{
    [self performSelector:@selector(selectPoint) withObject:nil afterDelay:0.3];
    
    return nil;
}



@end
