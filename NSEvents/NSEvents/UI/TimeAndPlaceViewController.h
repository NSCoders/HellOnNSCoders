//
//  TimeAndPlaceViewControllerViewController.h
//  NSEvents
//
//  Created by Joan Guerrero Estrada on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "LocationPoint.h"

@interface TimeAndPlaceViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) Event *eventSelected;
@property (nonatomic, strong) LocationPoint *locationPoint;

@property (nonatomic,strong) IBOutlet UILabel *lblTitle;
@property (nonatomic,strong) IBOutlet UILabel *lblStartDate;
@property (nonatomic,strong) IBOutlet UILabel *lblEndDate;
@property (nonatomic,strong) IBOutlet UILabel *lblHashtag;


@end
