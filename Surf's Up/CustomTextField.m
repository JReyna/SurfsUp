//
//  CustomTextField.m
//  Surf's Up
//
//  Created by Steven Baranski on 9/16/11.
//  Copyright (c) 2011 komorka technology, llc. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
	return CGRectInset(bounds, 5, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
	return CGRectInset(bounds, 5, 0);	
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

@end
