//
//  UIBorderLabel.m
//  Butter
//
//  Created by Saul Hamadani on 6/21/14.
//  Copyright (c) 2014 Alex Livenson. All rights reserved.
//

#import "UIBorderLabel.h"
@implementation UIBorderLabel

@synthesize topInset, leftInset, bottomInset, rightInset;

- (void)drawTextInRect:(CGRect)rect
{
    UIEdgeInsets insets = {self.topInset, self.leftInset,
        self.bottomInset, self.rightInset};
    
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end