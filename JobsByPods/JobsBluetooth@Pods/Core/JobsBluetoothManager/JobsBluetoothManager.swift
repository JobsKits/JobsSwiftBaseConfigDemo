//
//  JobsBluetoothManager.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

import CoreBluetooth
import Foundation

/// 统一管理扫描、连接、服务发现、读写、通知和 Mock 数据。
public final class JobsBluetoothManager: NSObject {
    public private(set) var state: JobsBluetoothState = .unknown
    public private(set) var discoveredPeripherals: [JobsBluetoothPeripheral] = []
    public private(set) var profile: JobsBluetoothProfile
    public private(set) var mockTransport: JobsBluetoothMockTransport
    public private(set) var callbackQueue = DispatchQueue.main
    public var stateChanged: ((JobsBluetoothState) -> Void)?
    public var peripheralDiscovered: ((JobsBluetoothPeripheral) -> Void)?
    public var dataReceived: ((Data, Any?) -> Void)?
    public var logReceived: ((String) -> Void)?

    private lazy var central = CBCentralManager(delegate: self, queue: .main, options: [CBCentralManagerOptionShowPowerAlertKey: false])
    private var nativePeripherals: [UUID: CBPeripheral] = [:]
    private var connectedPeripheral: CBPeripheral?
    private var writeCharacteristic: CBCharacteristic?
    private var notifyCharacteristic: CBCharacteristic?
    private var readCharacteristic: CBCharacteristic?

    public init(profile: JobsBluetoothProfile = JobsBluetoothProfile(),
                mockTransport: JobsBluetoothMockTransport = JobsBluetoothMockTransport()) {
        self.profile = profile
        self.mockTransport = mockTransport
        super.init()
        _ = central
    }

    @discardableResult public func byCallbackQueue(_ value: DispatchQueue) -> Self { callbackQueue = value;return self }
    @discardableResult public func byProfile(_ value: JobsBluetoothProfile) -> Self { profile = value;return self }
    @discardableResult public func byMockTransport(_ value: JobsBluetoothMockTransport) -> Self { mockTransport = value;return self }
    @discardableResult public func onStateChanged(_ value: @escaping (JobsBluetoothState) -> Void) -> Self { stateChanged = value;return self }
    @discardableResult public func onPeripheralDiscovered(_ value: @escaping (JobsBluetoothPeripheral) -> Void) -> Self { peripheralDiscovered = value;return self }
    @discardableResult public func onDataReceived(_ value: @escaping (Data, Any?) -> Void) -> Self { dataReceived = value;return self }
    @discardableResult public func onLog(_ value: @escaping (String) -> Void) -> Self { logReceived = value;return self }

    public func startScan() {
        discoveredPeripherals.removeAll()
        transition(.scanning, message: "开始扫描")
        if mockTransport.enabled {
            mockTransport.advertisements().forEach { peripheral in
                discoveredPeripherals.append(peripheral)
                callback { [weak self] in self?.peripheralDiscovered?(peripheral) }
            };return
        }
        guard central.state == .poweredOn else { transition(.unavailable, message: "系统蓝牙不可用");return }
        central.scanForPeripherals(withServices: profile.serviceUUIDs.isEmpty ? nil : profile.serviceUUIDs,
                                   options: [CBCentralManagerScanOptionAllowDuplicatesKey: profile.allowDuplicates])
        if profile.scanTimeout > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + profile.scanTimeout) { [weak self] in self?.stopScan() }
        }
    }

    public func stopScan() { central.stopScan();if state == .scanning { transition(.idle, message: "停止扫描") } }

    public func connect(identifier: UUID) {
        transition(.connecting, message: "连接 \(identifier.uuidString)")
        if mockTransport.enabled { transition(.ready, message: "Mock 设备已就绪");return }
        guard let peripheral = nativePeripherals[identifier] else { transition(.failed, message: JobsBluetoothError.peripheralNotFound.localizedDescription);return }
        connectedPeripheral = peripheral
        peripheral.delegate = self
        central.connect(peripheral)
    }

    public func disconnect() {
        transition(.disconnecting, message: "主动断开")
        if let connectedPeripheral { central.cancelPeripheralConnection(connectedPeripheral) } else { transition(.idle, message: "已断开") }
    }

    public func read() { if let connectedPeripheral, let readCharacteristic { connectedPeripheral.readValue(for: readCharacteristic) } }
    public func setNotifyEnabled(_ enabled: Bool) { if let connectedPeripheral, let notifyCharacteristic { connectedPeripheral.setNotifyValue(enabled, for: notifyCharacteristic) } }

    public func send(_ command: JobsBluetoothCommand, completion: @escaping (Result<Data, Error>) -> Void) {
        if mockTransport.enabled {
            mockTransport.echo(command.payload) { [weak self] response in completion(.success(response));self?.dataReceived?(response, response) };return
        }
        guard let connectedPeripheral, let writeCharacteristic else { completion(.failure(JobsBluetoothError.characteristicNotFound));return }
        let type: CBCharacteristicWriteType = writeCharacteristic.properties.contains(.writeWithoutResponse) ? .withoutResponse : .withResponse
        connectedPeripheral.writeValue(command.payload, for: writeCharacteristic, type: type)
        completion(.success(Data()))
    }

    private func transition(_ value: JobsBluetoothState, message: String) { state = value;callback { [weak self] in self?.logReceived?(message);self?.stateChanged?(value) } }
    private func callback(_ block: @escaping () -> Void) { callbackQueue.async(execute: block) }
}

extension JobsBluetoothManager: CBCentralManagerDelegate {
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn, state == .unknown { transition(.idle, message: "系统蓝牙已开启") }
        else if central.state != .poweredOn, !mockTransport.enabled { transition(.unavailable, message: "系统蓝牙不可用") }
    }

    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        nativePeripherals[peripheral.identifier] = peripheral
        let strings = advertisementData.reduce(into: [String: String]()) { $0[$1.key] = String(describing: $1.value) }
        let snapshot = JobsBluetoothPeripheral(identifier: peripheral.identifier, name: peripheral.name ?? "未命名设备", RSSI: RSSI.intValue, advertisementData: strings)
        discoveredPeripherals.removeAll { $0.identifier == snapshot.identifier }
        discoveredPeripherals.append(snapshot)
        callback { [weak self] in self?.peripheralDiscovered?(snapshot) }
    }

    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) { transition(.discovering, message: "发现服务");peripheral.discoverServices(profile.serviceUUIDs.isEmpty ? nil : profile.serviceUUIDs) }
    public func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) { transition(.failed, message: error?.localizedDescription ?? "连接失败") }
    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) { connectedPeripheral = nil;transition(.idle, message: error?.localizedDescription ?? "连接已断开") }
}

extension JobsBluetoothManager: CBPeripheralDelegate {
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error { transition(.failed, message: error.localizedDescription);return }
        peripheral.services?.forEach { peripheral.discoverCharacteristics(nil, for: $0) }
    }

    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error { transition(.failed, message: error.localizedDescription);return }
        service.characteristics?.forEach {
            if $0.uuid == profile.writeCharacteristicUUID { writeCharacteristic = $0 }
            if $0.uuid == profile.notifyCharacteristicUUID { notifyCharacteristic = $0 }
            if $0.uuid == profile.readCharacteristicUUID { readCharacteristic = $0 }
        }
        transition(.ready, message: "设备已就绪")
    }

    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        guard error == nil, let data = characteristic.value else { return }
        let decoded = try? profile.decoder?(data)
        callback { [weak self] in self?.dataReceived?(data, decoded as Any?) }
    }
}
