//
//  NewsCell.m
//  NSEvents
//
//  Created by Ivan Leider on 17/03/12.
//  Copyright (c) 2012 Atípic software. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
@synthesize text;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
