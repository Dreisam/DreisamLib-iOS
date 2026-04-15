//
//  DHomeHeaderView.h
//  DreisamLibDemo
//
//  Created by List on 2025/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHomeHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *glucoseLabel;
@property (weak, nonatomic) IBOutlet UIImageView *animationImgView;
@property (weak, nonatomic) IBOutlet UIView *dotView;
@property (weak, nonatomic) IBOutlet UILabel *connectStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataSyncLabel;
@property (weak, nonatomic) IBOutlet UILabel *bleRealConditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *rssiLabel;

//设置蓝牙链接状态
-(void)setShowloading:(BOOL)showLoading;

- (void)setBleRealConditionLabelState:(DreisamEnumState)state;

@end

NS_ASSUME_NONNULL_END
