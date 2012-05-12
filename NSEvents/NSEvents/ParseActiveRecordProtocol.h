//
//  ParseActiveRecordProtocol.m
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@protocol ParseActiveRecordProtocol <NSObject>

+ (id) findById:(NSString*)objectId;
+ (NSArray*) findAll;
+ (id) findFirst;

@end
