//
//  JobsBLEPeripheralLab.swift
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

import CoreBluetooth
import Foundation

/// 第二台 iPhone 扮演实验外设，LED 是内存值，不驱动任何真实硬件。
@MainActor
final class JobsBLEPeripheralLab: NSObject {
    private let serviceID = CBUUID(string: "78F10000-7D85-4B27-9C36-89A650C9B912")
    private let writeID = CBUUID(string: "78F10001-7D85-4B27-9C36-89A650C9B912")
    private let notifyID = CBUUID(string: "78F10002-7D85-4B27-9C36-89A650C9B912")
    private var manager: CBPeripheralManager?
    private var notifyCharacteristic: CBMutableCharacteristic?
    private var subscriber: CBCentral?
    private var pending: [Data] = []
    private var enabled = false
    private var installing = false
    private var serviceInstalled = false
    private var led: UInt8 = 0
    var onLog: (String) -> Void = { print($0) }

    func start() {
        enabled = true
        if manager == nil { manager = CBPeripheralManager(delegate: self, queue: .main) }
        else { installOrAdvertise() }
    }

    func stop() {
        enabled = false
        manager?.stopAdvertising()
        pending.removeAll()
        onLog("停止广播并拒绝后续写入；停止广播本身不会主动断开已有 Central")
    }

    private func installOrAdvertise() {
        guard enabled, let manager, manager.state == .poweredOn else { return }
        if serviceInstalled {
            if !manager.isAdvertising {
                manager.startAdvertising([CBAdvertisementDataServiceUUIDsKey: [serviceID],
                                          CBAdvertisementDataLocalNameKey: "Jobs BLE Lab"])
            }
        } else if !installing {
            installing = true
            let service = CBMutableService(type: serviceID, primary: true)
            let tx = CBMutableCharacteristic(type: writeID, properties: [.write], value: nil, permissions: [.writeable])
            let rx = CBMutableCharacteristic(type: notifyID, properties: [.notify], value: nil, permissions: [])
            notifyCharacteristic = rx
            service.characteristics = [tx, rx]
            manager.add(service)
        }
    }

    private func flushNotifications() {
        guard enabled, let manager, let rx = notifyCharacteristic, let subscriber else { return }
        while let next = pending.first {
            guard next.count <= subscriber.maximumUpdateValueLength else {
                pending.removeAll()
                onLog("通知超过对端上限，拒绝截断")
                return
            }
            guard manager.updateValue(next, for: rx, onSubscribedCentrals: [subscriber]) else {
                onLog("通知队列背压，保留数据等待 ready 回调")
                return
            }
            pending.removeFirst()
        }
    }
}

extension JobsBLEPeripheralLab: @preconcurrency CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn { installOrAdvertise() }
        else {
            installing = false
            serviceInstalled = false
            notifyCharacteristic = nil
            subscriber = nil
            pending.removeAll()
        }
    }

    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        guard service.uuid == serviceID else { return }
        installing = false
        guard error == nil else { onLog("服务发布失败：\(String(describing: error))"); return }
        serviceInstalled = true
        installOrAdvertise()
    }

    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        onLog(error == nil ? "广播已开始" : "广播失败：\(String(describing: error))")
    }

    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        guard characteristic.uuid == notifyID else { return }
        if let subscriber, subscriber.identifier != central.identifier {
            onLog("Demo 只服务第一个订阅者；第二个 Central 的写入将被拒绝")
            return
        }
        subscriber = central
        pending.removeAll()
        onLog("Central 已订阅")
    }

    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        guard central.identifier == subscriber?.identifier, characteristic.uuid == notifyID else { return }
        subscriber = nil
        pending.removeAll()
    }

    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        guard let request = requests.first else { return }
        // 教学协议一条 ATT write 对应一帧，不支持 Prepare/Execute Write 或批量事务。
        guard enabled, requests.count == 1, request.offset == 0,
              request.characteristic.uuid == writeID,
              request.central.identifier == subscriber?.identifier else {
            peripheral.respond(to: request, withResult: .requestNotSupported)
            return
        }
        guard pending.count < 16 else { peripheral.respond(to: request, withResult: .insufficientResources); return }
        do {
            guard let data = request.value else { throw JobsLabFrame.CodecError.malformed }
            let frame = try JobsLabFrame.decode(data)
            guard frame.opcode == 0x10, frame.payload.count == 1, frame.payload[0] <= 1 else {
                peripheral.respond(to: request, withResult: .requestNotSupported)
                return
            }
            let ack = try JobsLabFrame(opcode: 0x90, sequence: frame.sequence,
                                       payload: [0, frame.payload[0]]).encoded()
            guard ack.count <= request.central.maximumUpdateValueLength else {
                peripheral.respond(to: request, withResult: .invalidAttributeValueLength)
                return
            }
            led = frame.payload[0]
            pending.append(ack)
            peripheral.respond(to: request, withResult: .success)
            onLog("执行 setLED=\(led)，准备业务 ACK seq=\(frame.sequence)")
            flushNotifications()
        } catch { peripheral.respond(to: request, withResult: .invalidAttributeValueLength) }
    }

    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
        flushNotifications()
    }
}
