//
//  ListCustomAnimationView.m
//  iOS Demo
//
//  Created by lishutian on 2017/11/8.
//

#import "ListCustomAnimationView.h"
#import "ListPublic.h"

@interface ListCustomAnimationView()

@property (nonatomic, strong) UIImageView *animatedImage;

@end

@implementation ListCustomAnimationView

- (void)willMoveToSuperview:(UIView*)newSuperview {
    if (newSuperview) {
        [self layoutAnimatedLayer];
    } else {
        [_animatedImage removeFromSuperview];
        _animatedImage = nil;
    }
}

- (void)layoutAnimatedLayer {
    [self.animatedImage startAnimating];
    [self addSubview:self.animatedImage];
}

- (UIImageView*)animatedImage {
    if(!_animatedImage) {
        CGPoint arcCenter = CGPointMake(self.radius+self.strokeThickness/2+5, self.radius+self.strokeThickness/2+5);
        _animatedImage = [UIImageView new];
        _animatedImage.animationImages = ListAnimationImageAry;
        _animatedImage.frame = CGRectMake(0.0f, 0.0f, arcCenter.x*2, arcCenter.y*2);
        _animatedImage.animationDuration = 0.5;
    }
    return _animatedImage;
}

- (void)setFrame:(CGRect)frame {
    if(!CGRectEqualToRect(frame, super.frame)) {
        [super setFrame:frame];
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
    
}

- (void)setRadius:(CGFloat)radius {
    if(radius != _radius) {
        _radius = radius;
        [_animatedImage removeFromSuperview];
        _animatedImage = nil;
        if(self.superview) {
            [self layoutAnimatedLayer];
        }
    }
}
- (void)setStrokeColor:(UIColor*)strokeColor {
    _strokeColor = strokeColor;
}

- (void)setStrokeThickness:(CGFloat)strokeThickness {
    _strokeThickness = strokeThickness;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake((self.radius+self.strokeThickness/2+5)*2, (self.radius+self.strokeThickness/2+5)*2);
}
@end
