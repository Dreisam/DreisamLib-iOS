//
//  BleManage.h
//  DreisamLib
//
//  Created by List on 2025/12/18.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <DreisamLib/DreisamEnum.h>
#import <DreisamLib/DreisamGlucoseModel.h>

@protocol BleManage <NSObject>

@property (nonatomic, assign, readonly) DreisamEnumState state;

/// Connect the device with the device name
/// - Parameters:
///   - deviceName: deviceName
///   - callback: callback
- (void)connectBleDeviceName:(NSString *)deviceName callback:(void(^)(DreisamEnumState state))callback;


/// Actively disconnect the Bluetooth connection
- (void)disconnect;


/// Callback to listen for Bluetooth status
- (void)connectBleStateCallback:(void(^)(DreisamEnumState state))callback;


/// Data synchronization starts
- (void)dataSyncStartCallback:(void(^)(int totalCount))callback;


/// Data synchronization progress
- (void)dataSyncProgressCallback:(void(^)(int progress))callback;


/// Data synchronization complete
- (void)dataSyncCompleteCallback:(void(^)(NSArray <DreisamGlucoseModel*> *glucoseModelAry))callback;


/// Three minutes of real-time data
- (void)realTimeDataCallBack:(void(^)(DreisamGlucoseModel *glucoseModel))callback;


///  Fetching historical data
- (void)getHistoryDataStartTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime callBack:(void(^)(NSArray <DreisamGlucoseModel*> *glucoseModelAry))callback;


/// Get the signal value of the Bluetooth device
/// - Parameter callback: callback
- (void)getRSSICallback:(void(^)(NSNumber *rssi))callback;


/// Get information about the device
/// - Parameter callback: callback
- (void)getDeviceInfoCallback:(void(^)(DreisamDeviceInfoModel *info))callback;

@end
