//
//  JobsCodecBridge.h
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// .h 不暴露 STL，Swift / .m 使用者不需要知道 C++ 实现。
@interface JobsCodecBridge : NSObject
- (nullable NSArray<NSDictionary<NSString *, id> *> *)consumeData:(NSData *)data
                                                         error:(NSError * _Nullable * _Nullable)error;
- (void)resetWithReason:(NSString *)reason log:(BOOL)log;
@end
NS_ASSUME_NONNULL_END
