//
//  DreisamGlucoseModel.h
//  DreisamLib
//
//  Created by List on 2025/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DreisamDeviceInfoModel : NSObject

@property (nonatomic, copy) NSString *deviceSn;                 //sn
@property (nonatomic, copy) NSString *deviceActivationTime;     //Device activation time（设备激活时间）

@end

@interface DreisamGlucoseModel : NSObject

@property (nonatomic, copy) NSString *glucose;                  //Blood glucose, "mmol/L"（血糖值，"mmol/L"）
@property (nonatomic, copy) NSString *createTime;               //The time when blood sugar is produced（血糖产生的时间）
@property (nonatomic, copy) NSString *trend;                    //Blood glucose trend 1 is stable, 5 is slope rise, 10 is slope fall, 15 is straight rise, and 20 is straight fall（血糖趋势 1为平稳 5为斜升 10为斜降 15为直升 20为为直降）
@property (nonatomic, copy) NSString *packageNum;               //Packet sequence number（数据包序列号）
@property (nonatomic, copy) NSString *type;                     //1 Initialize data 2 Normal data（1初始化数据 2 正常数据）
@property (nonatomic, copy) NSString *saveTime;                 //Blood glucose data receiving time（血糖数据接收时间）
@property (nonatomic, copy) NSString *targetLevel;              //Up to standard status（达标状态），5=high，0=normal，-5=low

@end

NS_ASSUME_NONNULL_END
