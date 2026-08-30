//
//  JobsCodecBridge.mm
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#import "JobsCodecBridge.h"
#include "JobsFrameStream.hpp"

@implementation JobsCodecBridge {
    jobs::FrameStream _stream;
}

- (NSArray<NSDictionary<NSString *, id> *> *)consumeData:(NSData *)data error:(NSError **)error {
    if (error) *error = nil;
    @try {
        try {
            NSMutableArray *frames = [NSMutableArray array];
            _stream.feed(static_cast<const uint8_t *>(data.bytes), data.length,
                         [&](const jobs::Frame &frame) {
                [frames addObject:@{@"opcode": @(frame.opcode),
                                    @"sequence": @(frame.sequence),
                                    @"payload": [NSData dataWithBytes:frame.payload.data()
                                                              length:frame.payload.size()]}];
            });
            return frames;
        } catch (const std::exception &exception) {
            _stream.reset();
            if (error) *error = [NSError errorWithDomain:@"JobsBluetoothLearning" code:1
                                               userInfo:@{NSLocalizedDescriptionKey:
                                                              [NSString stringWithUTF8String:exception.what()]}];
        } catch (...) {
            _stream.reset();
            if (error) *error = [NSError errorWithDomain:@"JobsBluetoothLearning" code:2 userInfo:nil];
        }
    } @catch (NSException *exception) {
        // Foundation 异常不是普通通信错误；重抛，不伪装为成功。
        _stream.reset();
        @throw exception;
    };return nil;
}

- (void)resetWithReason:(NSString *)reason log:(BOOL)log {
    _stream.reset();
    if (log) NSLog(@"Decoder reset: %@", reason);
}

@end
