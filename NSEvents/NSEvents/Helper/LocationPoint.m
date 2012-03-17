//
//  LocationPoint.m
//  NSEvents
//
//  Created by Joan Guerrero Estrada on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "LocationPoint.h"

@implementation LocationPoint

@synthesize title,subtitle,coordinate;

-(id)initWithTitle:(NSString*)_title address:(NSString*)_address city:(NSString*)_city latitud:(float)_latitud longitud:(float)_longitud{
    
    if (self==[super init]) {
        
        self.title=_title;
        
        NSString *tempSubtitle = [NSString stringWithFormat:@"%@ %@",_address,_city];
        self.subtitle=tempSubtitle;
        self.coordinate=CLLocationCoordinate2DMake(_latitud, _longitud);
    }
    
    return self;
}


@end
