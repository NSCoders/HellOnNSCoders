//
//  Location.m
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//
//

#import "ParseActiveRecord.h"

@interface Location : ParseActiveRecord <ParseActiveRecordProtocol>

@property (strong)  NSNumber  *longitud;
@property (strong)  NSNumber  *latitud;
@property (copy)    NSString  *title;
@property (copy)    NSString  *address;
@property (copy)    NSString  *city;
@property (copy)    NSString  *country;
@property (copy)    NSString  *eventId;

+ (Location*)findByEventObjectId:(NSString*)objectId;

@end
