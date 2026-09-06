//
//  BridgeTests.mm
//  JobsBluetoothLearningTests
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#import "BridgeTests.h"

int main() {
    @autoreleasepool {
        JobsCodecBridge *bridge = [[JobsCodecBridge alloc] init];
        uint8_t payload[] = {1};
        uint8_t encoded[11];
        size_t written = 0;
        assert(jobs_encode(0x10, 1, payload, 1, encoded, sizeof encoded, &written) == JOBS_CODEC_OK);
        NSError *error = nil;
        NSArray *first = [bridge consumeData:[NSData dataWithBytes:encoded length:5] error:&error];
        assert(first.count == 0 && error == nil);
        NSArray<NSDictionary *> *last = [bridge consumeData:[NSData dataWithBytes:encoded + 5 length:written - 5] error:&error];
        assert(last.count == 1 && error == nil);
        assert([last[0][@"opcode"] unsignedCharValue] == 0x10);
        assert([last[0][@"sequence"] unsignedShortValue] == 1);
        [bridge resetWithReason:@"new connection" log:NO];
        // reset 后返回的 NSData 仍独立持有 payload，不能依赖 C++ 内部缓冲区。
        NSData *ownedPayload = last[0][@"payload"];
        assert(ownedPayload.length == 1 && ((const uint8_t *)ownedPayload.bytes)[0] == 1);
        NSLog(@"PASS Objective-C++: fragmented input, C ABI, owned NSData, reset");
    };return 0;
}
