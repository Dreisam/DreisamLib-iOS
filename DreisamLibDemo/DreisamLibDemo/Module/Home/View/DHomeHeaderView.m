//
//  DHomeHeaderView.m
//  DreisamLibDemo
//
//  Created by List on 2025/12/23.
//

#import "DHomeHeaderView.h"

@implementation DHomeHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.glucoseLabel.superview.layer.masksToBounds = YES;
    self.glucoseLabel.superview.layer.cornerRadius = 15;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"DHomeHeaderView" owner:self options:nil] firstObject];
        
        NSMutableArray *arr = [NSMutableArray new];
        for (int i = 1 ; i<=16; i++) {
            NSString *name = [NSString stringWithFormat:@"device_scan_%d",i];
            [arr addObject:[UIImage imageNamed:name]];
        }
        self.animationImgView.animationImages = arr;
        self.animationImgView.animationRepeatCount = 0;
        self.animationImgView.animationDuration = 1.5;
        
    }
    return self;
}


//设置蓝牙链接状态
-(void)setShowloading:(BOOL)showLoading{
    self.animationImgView.hidden = !showLoading;
    self.dotView.hidden = showLoading;
    
    NSString *deviceName = [[NSUserDefaults standardUserDefaults] objectForKey:BLE_My_DeviceName_Key];

    if(showLoading){
        [self.animationImgView startAnimating];
        self.connectStateLabel.text = [NSString stringWithFormat:@"%@ %@",@"Connecting",deviceName];
    }else{
        [self.animationImgView stopAnimating];
        self.connectStateLabel.text = [NSString stringWithFormat:@"%@ %@",@"Connected",deviceName];
    }
    
}

- (void)setBleRealConditionLabelState:(DreisamEnumState)state{
    NSString *deviceName = [[NSUserDefaults standardUserDefaults] objectForKey:BLE_My_DeviceName_Key];

    if (state==DreisamEnumStateIndicateLoading) {
        self.bleRealConditionLabel.text = @"Bluetooth status：Connecting";
    }else if(state==DreisamEnumStateConnected){
        self.bleRealConditionLabel.text = @"Bluetooth status：Connected";
    }else if(state==DreisamEnumStateDisconnect || state==DreisamEnumStateUnknown){
        self.bleRealConditionLabel.text = @"Bluetooth status：Disconnect";
    }else if(state==DreisamEnumBleStatePoweredOff){
        self.bleRealConditionLabel.text = @"Bluetooth status：Off";
    }else if(state==DreisamEnumStateAuthenticationFailure){
        self.connectStateLabel.text = [NSString stringWithFormat:@"%@ %@",@"Verification failed：",deviceName];
        [self.animationImgView stopAnimating];
        self.dotView.hidden = NO;
        self.dotView.backgroundColor = UIColor.redColor;
    }
}

@end
