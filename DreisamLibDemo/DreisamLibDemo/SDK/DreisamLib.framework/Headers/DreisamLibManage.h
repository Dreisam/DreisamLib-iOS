//
//  DreisamLibManage.h
//  DreisamLib
//
//  Created by List on 2025/12/17.
//

#import <Foundation/Foundation.h>
#include <DreisamLib/BleManage.h>
#include <DreisamLib/DreisamBuilderParam.h>

NS_ASSUME_NONNULL_BEGIN

@interface DreisamLibManage : NSObject

@property (nonatomic, strong, readonly) DreisamBuilderParam *builderParm;

/*
 * BleManage module
 */
@property (nonatomic, strong) id<BleManage>bleManage;


/*
 * initialization
 */
+ (instancetype)shareLib;


/// initialization
- (void)initSDKBuilderParam:(DreisamBuilderParam *)builderParam;


/// release sdk
- (void)releaseUnInit;


///SDK version
- (NSString *)libVersion;

@end

NS_ASSUME_NONNULL_END
