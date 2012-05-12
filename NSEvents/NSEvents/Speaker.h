//
//  Speaker.m
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//
//

#import "ParseActiveRecord.h"

@interface Speaker : ParseActiveRecord

@property (copy) NSString   *firstName;
@property (copy) NSString   *lastName;
@property (copy) NSString   *email;
@property (copy) NSString   *twitter;
@property (copy) NSString   *bio;
@property (readonly) NSURL  *gravatarURL;
@property (copy) NSString   *phoneNumber;

@end
