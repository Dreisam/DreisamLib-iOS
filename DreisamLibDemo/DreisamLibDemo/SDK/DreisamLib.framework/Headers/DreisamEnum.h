//
//  DreisamEnum.h
//  DreisamLib
//
//  Created by List on 2025/12/24.
//

#ifndef DreisamEnum_h
#define DreisamEnum_h

/// SDK and device Bluetooth state enumeration
typedef NS_ENUM(NSInteger, DreisamEnumState) {
    DreisamEnumStateUnknown  = 0,
    DreisamEnumStateAuthenticationFailure,          //Error（设备鉴权失败）
    DreisamEnumStateDisconnect,                     //loading（连接断开，可转圈）
    DreisamEnumStateConnecting,                     //Connecting
    DreisamEnumStateConnected,                      //Loaded（已连接）
    DreisamEnumStateIndicateLoading,                //loading，The last data report is greater than 3 minutes（最近一次数据上报大于3分钟，可转圈）
    DreisamEnumBleStatePoweredOn,                   //Bluetooth has been turned on（手机蓝牙已打开）
    DreisamEnumBleStatePoweredOff,                  //Bluetooth has been turned off（手机蓝牙已关闭）
    DreisamEnumBleStateUnauthorized,                //Bluetooth no permissions（APP蓝牙无权限）
    
    DreisamEnumStateUnDeviceAvailable,              //An unavailable device,Device binding is required（无可用设备，先绑定）
    DreisamEnumStateUnDeviceExpire,                 //Expiration of device（设备已到期）
    
    DreisamEnumStateLoginSucceed,                   //login successfully（登录SDK成功）
    DreisamEnumStateLoginFailure,                   //login failure（登录SDK失败）
    DreisamEnumStateLoginNotLoggedOn,               //not logged on（未登录）
    
    DreisamEnumStateTokenExpiration,                //token expiration（token过期）
    DreisamEnumStateTokenInvalid,                   //token invalid（无效的token）
    
    DreisamEnumStateExistSensorStartTime,           //私有，SDK内部使用
};


/// Binding process progress
typedef NS_ENUM(NSInteger, DreisamBindingProcessState) {
    DreisamBindingProcessStateCheacking,                    //Cheacking（检查设备是否可绑定）
    DreisamBindingProcessStateScanning,                     //scanning（蓝牙扫描中）
    DreisamBindingProcessStateConnecting,                   //Bluetooth connecting（蓝牙连接中）
    DreisamBindingProcessStateInBinding,                    //in binding（设备绑定中）
    DreisamBindingProcessStateBindingSuccessful,            //Binding Successful（绑定成功）
};

#endif /* DreisamEnum_h */

