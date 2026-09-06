//
//  JobsOCCentralLab.m
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

#import "JobsOCCentralLab.h"

@implementation JobsOCCentralLab {
    CBCentralManager *_central;
    CBPeripheral *_peer;
    CBCharacteristic *_tx;
    CBCharacteristic *_rx;
    CBUUID *_serviceID;
    CBUUID *_writeID;
    CBUUID *_notifyID;
    void (^_log)(NSString *);
    BOOL _running;
    NSUInteger _generation;
}

- (void)beginWithLog:(void (^)(NSString *))log timeout:(NSTimeInterval)timeout {
    NSAssert(NSThread.isMainThread, @"Main queue only");
    if (_running || _peer) return;
    _log = [log copy];
    _running = YES;
    _serviceID = [CBUUID UUIDWithString:@"78F10000-7D85-4B27-9C36-89A650C9B912"];
    _writeID = [CBUUID UUIDWithString:@"78F10001-7D85-4B27-9C36-89A650C9B912"];
    _notifyID = [CBUUID UUIDWithString:@"78F10002-7D85-4B27-9C36-89A650C9B912"];
    if (!_central) _central = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
    else if (_central.state == CBManagerStatePoweredOn) [_central scanForPeripheralsWithServices:@[_serviceID] options:nil];
    NSUInteger token = ++_generation;
    // 有界的整体超时；Block 有意暂时保活本实验对象，不是无限后台任务。
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MAX(1, MIN(timeout, 60)) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self->_generation == token && self->_running) [self endWithReason:@"整体超时，结果未知" report:YES];
    });
}

- (void)endWithReason:(NSString *)reason report:(BOOL)report {
    NSAssert(NSThread.isMainThread, @"Main queue only");
    _running = NO;
    ++_generation;
    _tx = nil;
    _rx = nil;
    [_central stopScan];
    if (_peer) [_central cancelPeripheralConnection:_peer];
    if (report && _log) _log(reason);
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if (_running && central.state == CBManagerStatePoweredOn && !_peer) {
        [central scanForPeripheralsWithServices:@[_serviceID] options:nil];
    } else if (central.state != CBManagerStatePoweredOn) {
        _peer = nil;
        _tx = nil;
        _rx = nil;
        if (_log) _log(@"蓝牙尚不可用；等待授权/开关或整体超时");
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral
    advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI {
    if (!_running || _peer) return;
    [central stopScan];
    _peer = peripheral;
    peripheral.delegate = self;
    [central connectPeripheral:peripheral options:nil];
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    if (_running && peripheral == _peer) [peripheral discoverServices:@[_serviceID]];
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    if (peripheral != _peer) return;
    _peer = nil;
    [self endWithReason:error.localizedDescription ?: @"连接失败" report:YES];
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    if (peripheral != _peer) return;
    _peer = nil;
    [self endWithReason:error.localizedDescription ?: @"已断开" report:YES];
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    if (!_running || peripheral != _peer) return;
    CBService *target = nil;
    for (CBService *service in peripheral.services) if ([service.UUID isEqual:_serviceID]) target = service;
    if (error || !target) { [self endWithReason:@"缺少 Service" report:YES]; return; }
    [peripheral discoverCharacteristics:@[_writeID, _notifyID] forService:target];
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    if (!_running || peripheral != _peer || ![service.UUID isEqual:_serviceID]) return;
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([characteristic.UUID isEqual:_writeID]) _tx = characteristic;
        if ([characteristic.UUID isEqual:_notifyID]) _rx = characteristic;
    }
    if (error || !_tx || !_rx || !(_tx.properties & CBCharacteristicPropertyWrite) || !(_rx.properties & CBCharacteristicPropertyNotify)) {
        [self endWithReason:@"缺特征或 properties 不匹配" report:YES]; return;
    }
    [peripheral setNotifyValue:YES forCharacteristic:_rx];
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (!_running || peripheral != _peer || characteristic != _rx) return;
    if (error || !characteristic.isNotifying) { [self endWithReason:@"订阅失败" report:YES]; return; }
    uint8_t payload[] = {1};
    uint8_t bytes[11];
    size_t length = 0;
    JobsCodecStatus result = jobs_encode(0x10, 1, payload, 1, bytes, sizeof bytes, &length);
    if (result != JOBS_CODEC_OK || length > [peripheral maximumWriteValueLengthForType:CBCharacteristicWriteWithResponse]) {
        [self endWithReason:@"编码或写入长度失败" report:YES]; return;
    }
    [peripheral writeValue:[NSData dataWithBytes:bytes length:length] forCharacteristic:_tx type:CBCharacteristicWriteWithResponse];
}

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (!_running || peripheral != _peer || characteristic != _tx) return;
    if (error) [self endWithReason:error.localizedDescription report:YES];
    else if (_log) _log(@"ATT 写入完成，继续等待业务 ACK");
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (!_running || peripheral != _peer || characteristic != _rx) return;
    NSData *data = characteristic.value;
    JobsFrameView frame = {0};
    if (error || jobs_decode(data.bytes, data.length, &frame) != JOBS_CODEC_OK) {
        [self endWithReason:@"通知错误或坏帧" report:YES]; return;
    }
    if (frame.opcode != 0x90 || frame.sequence != 1 || frame.length != 2) return;
    BOOL success = frame.payload[0] == 0 && frame.payload[1] == 1;
    [self endWithReason:success ? @"业务 ACK 成功：LED=1" : @"设备拒绝命令" report:YES];
}

- (void)peripheral:(CBPeripheral *)peripheral didModifyServices:(NSArray<CBService *> *)invalidatedServices {
    if (peripheral != _peer) return;
    [self endWithReason:@"服务失效，请重新连接" report:YES];
}

@end
