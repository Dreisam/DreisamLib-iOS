//
//  ListProgressAnimatedView.h
//  ListProgressHUD
//
//  Created by 猫哈 on 2017/11/8.
//  Copyright © 2017年 lishutian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListProgressAnimatedView : UIView
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat strokeThickness;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeEnd;
@end
