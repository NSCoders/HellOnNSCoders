//
//  ParseActiveRecord.m
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//
//


#import "ParseActiveRecordProtocol.h"

@interface ParseActiveRecord : NSObject <ParseActiveRecordProtocol>

@property (copy)    NSString*   objectId;

- (void)mapParseObject:(PFObject*)parseObject;
- (PFObject*)mapToParseObject;

- (void)save;
- (void)delete;

@end
