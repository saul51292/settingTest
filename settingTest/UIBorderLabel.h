//
//  UIBorderLabel.h
//  Butter
//
//  Created by Saul Hamadani on 6/21/14.
//  Copyright (c) 2014 Alex Livenson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBorderLabel : UILabel
{
    CGFloat topInset;
    CGFloat leftInset;
    CGFloat bottomInset;
    CGFloat rightInset;
}

@property (nonatomic) CGFloat topInset;
@property (nonatomic) CGFloat leftInset;
@property (nonatomic) CGFloat bottomInset;
@property (nonatomic) CGFloat rightInset;

@end