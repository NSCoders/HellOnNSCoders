//
//  Sponsor.m
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//

#import "ParseActiveRecord.h"

@interface Sponsor : ParseActiveRecord <ParseActiveRecordProtocol>

@property (copy) NSString   *name;
@property (copy) NSString   *email;
@property (copy) NSString   *twitter;
@property (copy) NSString   *bio;
@property (copy) NSString   *logoURL;
@property (copy) NSString   *webURL;
@property (copy) NSString   *phoneNumber;

@end
