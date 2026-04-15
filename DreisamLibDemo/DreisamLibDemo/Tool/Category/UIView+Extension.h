//
//  UIView+Extension.h
//  ACE
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

// 兼容RTL的布局属性
@property (nonatomic) CGFloat leading;
@property (nonatomic) CGFloat trailing;
@property (nonatomic, readonly) CGFloat rightToLeftX;

@property (nonatomic, readonly) CGFloat maxX;
@property (nonatomic, readonly) CGFloat maxY;
 
@end
