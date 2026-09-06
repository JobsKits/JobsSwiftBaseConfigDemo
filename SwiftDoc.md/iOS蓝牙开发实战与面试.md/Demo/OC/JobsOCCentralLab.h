//
//  JobsOCCentralLab.h
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#include "JobsBLECodec.h"

NS_ASSUME_NONNULL_BEGIN
/// 原生 Transport 内核；主线程调用。一次扫描、写入和 ACK 完成后断开。
@interface JobsOCCentralLab : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>
- (void)beginWithLog:(void (^)(NSString *message))log timeout:(NSTimeInterval)timeout;
- (void)endWithReason:(NSString *)reason report:(BOOL)report;
@end
NS_ASSUME_NONNULL_END
