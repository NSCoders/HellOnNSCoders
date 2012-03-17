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
@synthesize mapView,eventSelected,locationPoint;
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
    NSLog(@"Evento %@",eventSelected.title);
    
    eventSelected.location=[[Location alloc]init];
    
    
    eventSelected.location.title = eventSelected.title;
    eventSelected.location.address = @"Direccion";
    eventSelected.location.city = @"Ciudad";
    eventSelected.location.country = @"Country";
    eventSelected.location.latitud = [NSNumber numberWithFloat:41.408943];
    eventSelected.location.longitud = [NSNumber numberWithFloat:2.126601];
    
    locationPoint= [[LocationPoint alloc]initWithTitle:eventSelected.location.title address:eventSelected.location.address city:eventSelected.location.city latitud:[eventSelected.location.latitud floatValue] longitud:[eventSelected.location.longitud floatValue]];
    
    [mapView addAnnotation:locationPoint];
   
    MKCoordinateSpan span=MKCoordinateSpanMake(9, 9);

    MKCoordinateRegion region;

    region.span = span;
    region.center = locationPoint.coordinate;
    [mapView setRegion:region animated:TRUE];
    
    //rellenamos datos en labels superiores
    
    NSDateFormatter *start=[[NSDateFormatter alloc]init];
    NSDateFormatter *end =[[NSDateFormatter alloc]init];
    
    lblTitle.text=eventSelected.title;
    lblStartDate.text=[start stringFromDate:eventSelected.startDate];
    lblEndDate.text=[end stringFromDate:eventSelected.startDate];
    lblHashtag.text= eventSelected.hashtag;
    
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
