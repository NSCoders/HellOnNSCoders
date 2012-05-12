//
//  LocationPoint.h
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//

//

#import "Location.h"

@interface LocationPoint : NSObject <MKAnnotation>

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

-(id)initWithTitle:(NSString*)_title address:(NSString*)_address city:(NSString*)_city latitud:(float)_latitud longitud:(float)_longitud;

@end
