//
//  CustomCell.m
//  Surf's Up
//
//  Created by James Reyna on 1/26/12.
//  Copyright (c) 2012 komorka technology, llc. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize tripName, tripPhoto;

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
