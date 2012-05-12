//
//  ParseActiveRecord.m
//  NSEvents
//
//  Created by "Asociación NSCoders ESP" on 17/03/12.
//  Copyright (c) 2012 NSCodersESP. All rights reserved.
//
//


#import "ParseActiveRecordProtocol.h"

@interface ParseActiveRecord : NSObject

@property (copy)    NSString*   objectId;

- (void)mapParserObject:(PFObject*)parserObject;

+ (id) findById:(NSString*)objectId entityName:(NSString*)entityName;
+ (id) findFirstRecord:(NSString*)entityName;
+ (id) findAllRecords:(NSString*)entityName;

@end
