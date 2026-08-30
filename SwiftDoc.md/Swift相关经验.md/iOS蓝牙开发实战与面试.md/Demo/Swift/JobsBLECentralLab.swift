//
//  JobsBLECentralLab.swift
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

import CoreBluetooth
import Foundation

/// 独立教学 Transport 内核：系统 API 只出现在这一层，不修改业务工程 DSL。
@MainActor
final class JobsBLECentralLab: NSObject {
    private let serviceID = CBUUID(string: "78F10000-7D85-4B27-9C36-89A650C9B912")
    private let writeID = CBUUID(string: "78F10001-7D85-4B27-9C36-89A650C9B912")
    private let notifyID = CBUUID(string: "78F10002-7D85-4B27-9C36-89A650C9B912")
    private var central: CBCentralManager?
    private var peer: CBPeripheral?
    private var writeCharacteristic: CBCharacteristic?
    private var notifyCharacteristic: CBCharacteristic?
    private var wantsScan = false
    private var running = false
    private var ready = false
    private var attBusy = false
    private var sequence: UInt16 = 0
    private var pendingSequence: UInt16?
    private var timeoutGeneration = 0
    var onLog: (String) -> Void = { print($0) }

    func start() {
        guard peer == nil, !wantsScan else { return }
        wantsScan = true
        running = true
        if let central {
            if central.state == .poweredOn { beginScan() }
            else { onLog("等待蓝牙可用；请检查权限与系统开关") }
        } else {
            central = CBCentralManager(delegate: self, queue: .main)
        }
    }

    func stop() {
        wantsScan = false
        running = false
        ready = false
        pendingSequence = nil
        attBusy = false
        timeoutGeneration += 1
        central?.stopScan()
        if let peer, let central { central.cancelPeripheralConnection(peer) }
        else { clearConnection() }
    }

    func setLED(_ enabled: Bool) {
        guard ready, !attBusy, pendingSequence == nil,
              let peer, let characteristic = writeCharacteristic else {
            onLog("尚未 ready 或上一条命令未结束")
            return
        }
        guard sequence < UInt16.max else {
            fail("教学会话序号已耗尽，请重新连接")
            return
        }
        sequence += 1
        do {
            let data = try JobsLabFrame(opcode: 0x10, sequence: sequence,
                                        payload: [enabled ? 1 : 0]).encoded()
            guard data.count <= peer.maximumWriteValueLength(for: .withResponse) else {
                fail("超出本次写入上限；Demo 不做隐式拆包")
                return
            }
            pendingSequence = sequence
            attBusy = true
            armTimeout(seconds: 5, reason: "写入/业务应答整体超时；不自动重试")
            peer.writeValue(data, for: characteristic, type: .withResponse)
            onLog("TX seq=\(sequence) setLED=\(enabled)")
        } catch { fail("编码失败：\(error)") }
    }

    private func beginScan() {
        guard running, wantsScan, peer == nil, let central, !central.isScanning else { return }
        onLog("开始扫描教学 Service；实验环境只开启一个外设")
        central.scanForPeripherals(withServices: [serviceID])
        armTimeout(seconds: 10, reason: "扫描超时")
    }

    private func armTimeout(seconds: Double, reason: String) {
        timeoutGeneration += 1
        let token = timeoutGeneration
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [weak self] in
            guard let self, self.timeoutGeneration == token else { return }
            self.fail(reason)
        }
    }

    private func fail(_ message: String) {
        onLog(message)
        stop()
    }

    private func clearConnection() {
        timeoutGeneration += 1
        peer = nil
        writeCharacteristic = nil
        notifyCharacteristic = nil
        pendingSequence = nil
        sequence = 0
        attBusy = false
        ready = false
    }
}

extension JobsBLECentralLab: @preconcurrency CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        onLog("系统蓝牙 state=\(central.state.rawValue)")
        if central.state == .poweredOn {
            beginScan()
        } else {
            clearConnection()
            if central.state == .unauthorized || central.state == .unsupported { wantsScan = false }
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String: Any], rssi RSSI: NSNumber) {
        guard running, wantsScan, peer == nil else { return }
        wantsScan = false
        central.stopScan()
        peer = peripheral
        peripheral.delegate = self
        armTimeout(seconds: 12, reason: "连接超时")
        central.connect(peripheral)
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        guard running, peripheral === peer else { return }
        armTimeout(seconds: 10, reason: "服务发现超时")
        peripheral.discoverServices([serviceID])
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        guard peripheral === peer else { return }
        onLog("连接失败：\(String(describing: error))")
        clearConnection()
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        guard peripheral === peer else { return }
        onLog("断开：\(String(describing: error))；重新 start 前会清空旧会话")
        clearConnection()
    }
}

extension JobsBLECentralLab: @preconcurrency CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard running, peripheral === peer else { return }
        guard error == nil, let service = peripheral.services?.first(where: { $0.uuid == serviceID }) else {
            fail("发现服务失败：\(String(describing: error))")
            return
        }
        armTimeout(seconds: 10, reason: "特征发现超时")
        peripheral.discoverCharacteristics([writeID, notifyID], for: service)
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard running, peripheral === peer, service.uuid == serviceID else { return }
        guard error == nil,
              let tx = service.characteristics?.first(where: { $0.uuid == writeID }), tx.properties.contains(.write),
              let rx = service.characteristics?.first(where: { $0.uuid == notifyID }), rx.properties.contains(.notify) else {
            fail("缺少必要特征或 properties 不匹配")
            return
        }
        writeCharacteristic = tx
        notifyCharacteristic = rx
        armTimeout(seconds: 5, reason: "订阅超时")
        peripheral.setNotifyValue(true, for: rx)
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        guard running, peripheral === peer, characteristic === notifyCharacteristic else { return }
        guard error == nil, characteristic.isNotifying else {
            fail("订阅未成功：\(String(describing: error))")
            return
        }
        timeoutGeneration += 1
        ready = true
        onLog("ready：通知已开启，现在可以调用 setLED(true)")
    }

    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        guard running, peripheral === peer, characteristic === writeCharacteristic else { return }
        attBusy = false
        if let error { fail("ATT 写入失败：\(error)") }
        else {
            if pendingSequence == nil { timeoutGeneration += 1 }
            onLog("ATT write response 收到；不等于设备业务执行成功")
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        guard running, peripheral === peer, characteristic === notifyCharacteristic else { return }
        guard error == nil, let data = characteristic.value else { fail("通知读取失败"); return }
        do {
            let frame = try JobsLabFrame.decode(data)
            guard frame.opcode == 0x90, frame.sequence == pendingSequence,
                  frame.payload.count == 2, frame.payload[1] <= 1 else {
                onLog("忽略不匹配的帧；不提前结束等待")
                return
            }
            guard frame.payload[0] == 0 else { fail("设备拒绝命令"); return }
            pendingSequence = nil
            if !attBusy { timeoutGeneration += 1 }
            onLog("业务 ACK 成功：LED=\(frame.payload[1])，seq=\(frame.sequence)")
        } catch { fail("收到坏帧：\(error)") }
    }

    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        guard peripheral === peer else { return }
        if invalidatedServices.contains(where: { $0.uuid == serviceID }) { fail("服务已失效，请重新连接发现") }
    }
}
