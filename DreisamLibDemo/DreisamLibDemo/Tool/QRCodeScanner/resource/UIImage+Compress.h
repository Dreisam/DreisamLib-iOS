//
//  UIImage+Compress.h
//  jingchangzhidekan
//
//  Created by yanyueya on 16/5/26.
//  Copyright © 2016年 maco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

+ (UIImage*)CompressImage:(UIImage*)image;
+(UIImage*)getSubImage:(UIImage*)image rect:(CGRect)rect;
+(UIImage*)imageRotatedByDegrees:(UIImage*)image degress:(CGFloat)degrees;
+(UIImage *)imageFromSampleBuffer:(CVImageBufferRef) imageBuffer;
+(UIImage *)convertViewToImage:(UIView*)view;

@end
