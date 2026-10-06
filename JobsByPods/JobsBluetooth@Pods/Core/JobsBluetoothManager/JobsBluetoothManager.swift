//
//  JobsBluetoothManager.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

import CoreBluetooth
import Foundation

/// 内部状态统一在主线程；业务回调统一在 callbackQueue。
public final class JobsBluetoothManager: NSObject {
    private var storedState: JobsBluetoothState = .unknown
    private var storedDiscovered: [JobsBluetoothPeripheral] = []
    public var state: JobsBluetoothState {
        onMain {
            storedState
        }
    }
    public var discoveredPeripherals: [JobsBluetoothPeripheral] {
        onMain {
            storedDiscovered
        }
    }
    private var storedProfile: JobsBluetoothProfile
    private var storedMockTransport: JobsBluetoothMockTransport
    private var storedCallbackQueue = DispatchQueue.main
    public var profile: JobsBluetoothProfile {
        onMain {
            storedProfile
        }
    }
    public var mockTransport: JobsBluetoothMockTransport {
        onMain {
            storedMockTransport
        }
    }
    public var callbackQueue: DispatchQueue {
        onMain {
            storedCallbackQueue
        }
    }
    private var storedStateChanged: ((JobsBluetoothState) -> Void)?
    public var stateChanged: ((JobsBluetoothState) -> Void)? {
        get {
            onMain {
                storedStateChanged
            }
        }
        set {
            onMain {
                storedStateChanged = newValue
            }
        }
    }
    private var storedPeripheralDiscovered: ((JobsBluetoothPeripheral) -> Void)?
    public var peripheralDiscovered: ((JobsBluetoothPeripheral) -> Void)? {
        get {
            onMain {
                storedPeripheralDiscovered
            }
        }
        set {
            onMain {
                storedPeripheralDiscovered = newValue
            }
        }
    }
    private var storedDataReceived: ((Data, Any?) -> Void)?
    public var dataReceived: ((Data, Any?) -> Void)? {
        get {
            onMain {
                storedDataReceived
            }
        }
        set {
            onMain {
                storedDataReceived = newValue
            }
        }
    }
    private var storedLogReceived: ((String) -> Void)?
    public var logReceived: ((String) -> Void)? {
        get {
            onMain {
                storedLogReceived
            }
        }
        set {
            onMain {
                storedLogReceived = newValue
            }
        }
    }
    private var storedErrorReceived: ((Error) -> Void)?
    public var errorReceived: ((Error) -> Void)? {
        get {
            onMain {
                storedErrorReceived
            }
        }
        set {
            onMain {
                storedErrorReceived = newValue
            }
        }
    }

    private var centralStorage: CBCentralManager?
    private var central: CBCentralManager {
        if let value = centralStorage {
            return value
        }
        let value = CBCentralManager(
            delegate: self, queue: .main,
            options: [CBCentralManagerOptionShowPowerAlertKey: false])
        centralStorage = value
        return value
    }
    private var nativePeripherals: [UUID: CBPeripheral] = [:]
    private var connectedPeripheral: CBPeripheral?
    private var awaitingDisconnection: CBPeripheral?
    private var pendingIdentifier: UUID?
    private var targetIdentifier: UUID?
    private var manuallyDisconnected = false
    private var generation = UUID()
    private var scanGeneration = UUID()
    private var scanTimeoutItem: DispatchWorkItem?
    private var connectionTimeoutItem: DispatchWorkItem?
    private var reconnectItem: DispatchWorkItem?
    private var reconnectCount = 0
    private var pendingServices = Set<ObjectIdentifier>()
    private var writeCharacteristic: CBCharacteristic?
    private var notifyCharacteristic: CBCharacteristic?
    private var readCharacteristic: CBCharacteristic?
    private var notificationsRequested = false
    private var notificationDesired = true
    private var queue: [JobsBluetoothPendingCommand] = []
    private var activeCommand: JobsBluetoothPendingCommand?
    private var writeType: CBCharacteristicWriteType = .withResponse

    public init(
        profile: JobsBluetoothProfile = JobsBluetoothProfile(),
        mockTransport: JobsBluetoothMockTransport = JobsBluetoothMockTransport()
    ) {
        self.storedProfile = profile
        self.storedMockTransport = mockTransport
        super.init()
    }

    @discardableResult
    public func byCallbackQueue(_ value: DispatchQueue) -> Self {
        onMain {
            storedCallbackQueue = value
        }
        return self
    }

    @discardableResult
    public func byProfile(_ value: JobsBluetoothProfile) -> Self {
        onMain {
            disconnectInternal()
            storedProfile = value
        }
        return self
    }

    @discardableResult
    public func byMockTransport(_ value: JobsBluetoothMockTransport) -> Self {
        onMain {
            disconnectInternal()
            storedMockTransport = value
        }
        return self
    }

    @discardableResult
    public func onStateChanged(_ value: @escaping (JobsBluetoothState) -> Void) -> Self {
        onMain {
            stateChanged = value
        }
        return self
    }

    @discardableResult
    public func onPeripheralDiscovered(_ value: @escaping (JobsBluetoothPeripheral) -> Void) -> Self {
        onMain {
            peripheralDiscovered = value
        }
        return self
    }

    @discardableResult
    public func onDataReceived(_ value: @escaping (Data, Any?) -> Void) -> Self {
        onMain {
            dataReceived = value
        }
        return self
    }

    @discardableResult
    public func onLog(_ value: @escaping (String) -> Void) -> Self {
        onMain {
            logReceived = value
        }
        return self
    }

    @discardableResult
    public func onError(_ value: @escaping (Error) -> Void) -> Self {
        onMain {
            errorReceived = value
        }
        return self
    }

    public func startScan() {
        onMain {
            if connectedPeripheral != nil || storedState == .ready {
                disconnectInternal()
            }
            stopScanInternal()
            storedDiscovered.removeAll()
            scanGeneration = UUID()
            let current = scanGeneration
            transition(.scanning, message: "开始扫描")
            if mockTransport.enabled {
                for peripheral in mockTransport.advertisements() {
                    storedDiscovered.append(peripheral)
                    let handler = peripheralDiscovered
                    callback {
                        handler?(peripheral)
                    }
                }
            } else {
                guard central.state == .poweredOn else {
                    transition(.unavailable, message: "系统蓝牙不可用")
                    return
                }
                central.scanForPeripherals(
                    withServices: profile.serviceUUIDs.isEmpty ? nil : profile.serviceUUIDs,
                    options: [CBCentralManagerScanOptionAllowDuplicatesKey: profile.allowDuplicates])
            }
            let timeout = profile.scanTimeout
            if timeout.isFinite, timeout > 0 {
                let item = DispatchWorkItem { [weak self] in
                    guard let self, self.scanGeneration == current else {
                        return
                    }
                    self.stopScanInternal()
                }
                scanTimeoutItem = item
                DispatchQueue.main.asyncAfter(deadline: .now() + min(86_400, timeout), execute: item)
            }
        }
    }

    public func stopScan() {
        onMain {
            stopScanInternal()
        }
    }

    private func stopScanInternal() {
        scanGeneration = UUID()
        scanTimeoutItem?.cancel()
        scanTimeoutItem = nil
        centralStorage?.stopScan()
        if storedState == .scanning {
            transition(.idle, message: "停止扫描")
        }
    }

    public func connect(identifier: UUID) {
        onMain {
            stopScanInternal()
            reconnectItem?.cancel()
            reconnectItem = nil
            reconnectCount = 0
            manuallyDisconnected = false
            if mockTransport.enabled, storedState == .ready {
                if targetIdentifier == identifier {
                    return
                }
                clearConnection(error: JobsBluetoothError.cancelled)
            }
            targetIdentifier = identifier
            if let old = connectedPeripheral {
                if old.identifier == identifier, storedState == .ready {
                    return
                }
                pendingIdentifier = identifier
                clearConnection(error: JobsBluetoothError.cancelled)
                awaitingDisconnection = old
                central.cancelPeripheralConnection(old)
            } else if awaitingDisconnection != nil {
                pendingIdentifier = identifier
            } else {
                beginConnection(identifier)
            }
        }
    }

    private func beginConnection(_ identifier: UUID) {
        generation = UUID()
        let current = generation
        pendingIdentifier = nil
        transition(.connecting, message: "连接 \(identifier.uuidString)")
        if mockTransport.enabled {
            guard
                mockTransport.advertisements().contains(where: {
                    $0.identifier == identifier
                })
            else {
                transition(.failed, message: JobsBluetoothError.peripheralNotFound.localizedDescription)
                return
            }
            transition(.ready, message: "Mock 设备已就绪")
            return
        }
        guard central.state == .poweredOn, let peripheral = nativePeripherals[identifier] else {
            transition(.failed, message: JobsBluetoothError.peripheralNotFound.localizedDescription)
            return
        }
        connectedPeripheral = peripheral
        peripheral.delegate = self
        central.connect(peripheral)
        let configured = profile.connectTimeout
        let timeout = configured.isFinite && configured > 0 ? min(86_400, configured) : 12
        let item = DispatchWorkItem { [weak self, weak peripheral] in
            guard let self, let peripheral, self.generation == current,
                self.connectedPeripheral === peripheral, self.storedState != .ready
            else {
                return
            }
            self.failConnection(JobsBluetoothError.connectionTimeout)
        }
        connectionTimeoutItem = item
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout, execute: item)
    }

    public func disconnect() {
        onMain {
            disconnectInternal()
        }
    }

    private func disconnectInternal() {
        manuallyDisconnected = true
        targetIdentifier = nil
        pendingIdentifier = nil
        reconnectItem?.cancel()
        reconnectItem = nil
        stopScanInternal()
        let old = connectedPeripheral
        clearConnection(error: JobsBluetoothError.cancelled)
        if let old {
            awaitingDisconnection = old
            centralStorage?.cancelPeripheralConnection(old)
        }
        transition(.idle, message: "已断开")
    }

    private func clearConnection(error: Error) {
        generation = UUID()
        connectionTimeoutItem?.cancel()
        connectionTimeoutItem = nil
        connectedPeripheral?.delegate = nil
        connectedPeripheral = nil
        writeCharacteristic = nil
        readCharacteristic = nil
        notifyCharacteristic = nil
        pendingServices.removeAll()
        notificationsRequested = false
        notificationDesired = true
        failCommands(error)
    }

    private func failConnection(_ error: Error) {
        let old = connectedPeripheral
        clearConnection(error: error)
        report(error)
        transition(.failed, message: error.localizedDescription)
        if let old, old.state != .disconnected {
            awaitingDisconnection = old
            centralStorage?.cancelPeripheralConnection(old)
        } else {
            scheduleReconnect()
        }
    }

    private func scheduleReconnect() {
        guard !manuallyDisconnected, let identifier = targetIdentifier,
            reconnectCount < min(10, max(0, profile.maximumReconnectCount))
        else {
            return
        }
        reconnectCount += 1
        transition(.reconnecting, message: "等待第 \(reconnectCount) 次重连")
        let current = generation
        let item = DispatchWorkItem { [weak self] in
            guard let self, self.generation == current, !self.manuallyDisconnected else {
                return
            }
            self.beginConnection(identifier)
        }
        reconnectItem = item
        DispatchQueue.main.asyncAfter(deadline: .now() + min(16, pow(2, Double(reconnectCount - 1))), execute: item)
    }

    public func read() {
        onMain {
            guard let peripheral = connectedPeripheral, let characteristic = readCharacteristic,
                storedState == .ready
            else {
                report(JobsBluetoothError.characteristicNotFound)
                return
            }
            peripheral.readValue(for: characteristic)
        }
    }

    public func setNotifyEnabled(_ enabled: Bool) {
        onMain {
            guard let peripheral = connectedPeripheral, let characteristic = notifyCharacteristic else {
                report(JobsBluetoothError.characteristicNotFound)
                return
            }
            notificationDesired = enabled
            notificationsRequested = enabled
            if !enabled {
                failCommands(JobsBluetoothError.cancelled)
            }
            peripheral.setNotifyValue(enabled, for: characteristic)
        }
    }

    public func send(_ command: JobsBluetoothCommand, completion: @escaping (Result<Data, Error>) -> Void) {
        sendReliably(command) { result in
            completion(
                result.map {
                    $0.data
                })
        }
    }

    public func sendReliably(
        _ command: JobsBluetoothCommand,
        completion: @escaping (Result<JobsBluetoothCommandReceipt, Error>) -> Void
    ) {
        onMain {
            guard storedState == .ready else {
                callback {
                    completion(.failure(JobsBluetoothError.characteristicNotFound))
                }
                return
            }
            guard command.timeout.isFinite, command.timeout > 0, !command.payload.isEmpty else {
                callback {
                    completion(.failure(JobsBluetoothError.invalidPacket))
                }
                return
            }
            guard queue.count < 256 else {
                callback {
                    completion(.failure(JobsBluetoothError.invalidPacket))
                }
                return
            }
            let pending = JobsBluetoothPendingCommand(command, completion: completion)
            let index =
                queue.firstIndex {
                    $0.priority < pending.priority
                } ?? queue.endIndex
            queue.insert(pending, at: index)
            startNextCommand()
        }
    }

    private func startNextCommand() {
        guard activeCommand == nil, !queue.isEmpty, storedState == .ready else {
            return
        }
        activeCommand = queue.removeFirst()
        beginCommandAttempt()
    }

    private func beginCommandAttempt() {
        guard let command = activeCommand else {
            return
        }
        command.attemptID = UUID()
        let currentAttempt = command.attemptID
        let currentGeneration = generation
        command.nextChunk = 0
        command.awaitingWrite = false
        command.matchedResponse = nil
        command.timeoutItem?.cancel()
        let timeout = DispatchWorkItem { [weak self, weak command] in
            guard let self, let command, self.activeCommand === command, command.attemptID == currentAttempt else {
                return
            }
            if !self.mockTransport.enabled, command.awaitingWrite || command.nextChunk < command.chunks.count {
                self.failConnection(JobsBluetoothError.commandTimeout)
            } else {
                self.retryOrFinish(JobsBluetoothError.commandTimeout)
            }
        }
        command.timeoutItem = timeout
        DispatchQueue.main.asyncAfter(deadline: .now() + min(86_400, command.timeout), execute: timeout)
        if mockTransport.enabled {
            if let error = mockTransport.injectedError {
                retryOrFinish(error)
                return
            }
            guard !mockTransport.dropsResponses else {
                return
            }
            mockTransport.echo(command.payload) { [weak self, weak command] response in
                guard let self, let command, self.generation == currentGeneration,
                    self.activeCommand === command, command.attemptID == currentAttempt
                else {
                    return
                }
                self.receive(response)
                guard self.generation == currentGeneration, self.activeCommand === command,
                    command.attemptID == currentAttempt
                else {
                    return
                }
                if command.matcher == nil {
                    self.finishCommand(
                        .success(JobsBluetoothCommandReceipt(confirmation: .applicationResponse, data: response)))
                }
            }
            return
        }
        guard let peripheral = connectedPeripheral, let characteristic = writeCharacteristic else {
            finishCommand(.failure(JobsBluetoothError.characteristicNotFound))
            return
        }
        if command.matcher != nil, notifyCharacteristic?.isNotifying != true {
            finishCommand(.failure(JobsBluetoothError.characteristicNotFound))
            return
        }
        writeType = characteristic.properties.contains(.write) ? .withResponse : .withoutResponse
        let maximum = peripheral.maximumWriteValueLength(for: writeType)
        guard maximum > 0, command.payload.count <= maximum || command.allowsChunking else {
            finishCommand(.failure(JobsBluetoothError.invalidPacket))
            return
        }
        command.chunks = stride(from: 0, to: command.payload.count, by: maximum).map {
            command.payload.subdata(in: $0..<min(command.payload.count, $0 + maximum))
        }
        pumpWrites()
    }

    private func pumpWrites() {
        guard let command = activeCommand, let peripheral = connectedPeripheral,
            let characteristic = writeCharacteristic, !command.awaitingWrite
        else {
            return
        }
        while command.nextChunk < command.chunks.count {
            if writeType == .withoutResponse, !peripheral.canSendWriteWithoutResponse {
                return
            }
            let data = command.chunks[command.nextChunk]
            command.nextChunk += 1
            command.awaitingWrite = writeType == .withResponse
            peripheral.writeValue(data, for: characteristic, type: writeType)
            if command.awaitingWrite {
                return
            }
        }
        if let response = command.matchedResponse {
            finishCommand(.success(JobsBluetoothCommandReceipt(confirmation: .applicationResponse, data: response)))
        } else if command.matcher == nil {
            let confirmation: JobsBluetoothCommandReceipt.Confirmation =
                writeType == .withResponse ? .writeAcknowledged : .submitted
            finishCommand(.success(JobsBluetoothCommandReceipt(confirmation: confirmation, data: Data())))
        }
    }

    private func receive(_ data: Data) {
        let currentGeneration = generation
        let command = activeCommand
        let currentAttempt = command?.attemptID
        let decoder = profile.decoder
        let handler = dataReceived
        let decoded: Any?
        do {
            decoded = try decoder?(data)
        } catch {
            report(error)
            decoded = nil
        }
        guard generation == currentGeneration else {
            return
        }
        callback {
            handler?(data, decoded)
        }
        guard let command, activeCommand === command, command.attemptID == currentAttempt,
            let matcher = command.matcher
        else {
            return
        }
        let matches = matcher(data)
        // decoder / matcher 可同步重入连接与发送；旧响应只能结束原命令的原尝试。
        guard generation == currentGeneration, activeCommand === command,
            command.attemptID == currentAttempt, matches
        else {
            return
        }
        command.matchedResponse = data
        if mockTransport.enabled || !command.awaitingWrite && command.nextChunk == command.chunks.count {
            finishCommand(.success(JobsBluetoothCommandReceipt(confirmation: .applicationResponse, data: data)))
        }
    }

    private func retryOrFinish(_ error: Error) {
        guard let command = activeCommand else {
            return
        }
        if command.attempt < command.retryCount {
            command.attempt += 1
            beginCommandAttempt()
        } else {
            finishCommand(.failure(error))
        }
    }

    private func finishCommand(_ result: Result<JobsBluetoothCommandReceipt, Error>) {
        guard let command = activeCommand else {
            return
        }
        activeCommand = nil
        command.timeoutItem?.cancel()
        command.timeoutItem = nil
        callback {
            command.completion(result)
        }
        startNextCommand()
    }

    private func failCommands(_ error: Error) {
        let pending =
            (activeCommand.map {
                [$0]
            } ?? []) + queue
        activeCommand = nil
        queue.removeAll()
        for command in pending {
            command.timeoutItem?.cancel()
            command.timeoutItem = nil
            callback {
                command.completion(.failure(error))
            }
        }
    }

    private func readyIfComplete() {
        guard pendingServices.isEmpty else {
            return
        }
        guard profile.writeCharacteristicUUID == nil || writeCharacteristic != nil,
            profile.readCharacteristicUUID == nil || readCharacteristic != nil,
            profile.notifyCharacteristicUUID == nil || notifyCharacteristic != nil
        else {
            failConnection(JobsBluetoothError.characteristicNotFound)
            return
        }
        if notificationDesired, let characteristic = notifyCharacteristic, !characteristic.isNotifying {
            if !notificationsRequested {
                notificationsRequested = true
                connectedPeripheral?.setNotifyValue(true, for: characteristic)
            }
            return
        }
        connectionTimeoutItem?.cancel()
        connectionTimeoutItem = nil
        reconnectCount = 0
        transition(.ready, message: "必需服务与特征已就绪")
        startNextCommand()
    }

    private func transition(_ value: JobsBluetoothState, message: String) {
        storedState = value
        let log = logReceived
        let state = stateChanged
        callback {
            log?(message)
            state?(value)
        }
    }

    private func report(_ error: Error) {
        let handler = errorReceived
        callback {
            handler?(error)
        }
    }

    private func callback(_ block: @escaping () -> Void) {
        callbackQueue.async(execute: block)
    }

    private func onMain<T>(_ action: () -> T) -> T {
        if Thread.isMainThread {
            return action()
        }
        return DispatchQueue.main.sync(execute: action)
    }

    deinit {
        scanTimeoutItem?.cancel()
        connectionTimeoutItem?.cancel()
        reconnectItem?.cancel()
        activeCommand?.timeoutItem?.cancel()
        let central = centralStorage
        let peripheral = connectedPeripheral ?? awaitingDisconnection
        DispatchQueue.main.async {
            central?.delegate = nil
            peripheral?.delegate = nil
            if let peripheral {
                central?.cancelPeripheralConnection(peripheral)
            }
        }
        let pending =
            (activeCommand.map {
                [$0]
            } ?? []) + queue
        let destination = callbackQueue
        for command in pending {
            command.timeoutItem?.cancel()
            destination.async {
                command.completion(.failure(JobsBluetoothError.cancelled))
            }
        }
    }
}

extension JobsBluetoothManager: CBCentralManagerDelegate {
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        guard !mockTransport.enabled else {
            return
        }
        if central.state == .poweredOn {
            if storedState == .unavailable || storedState == .unknown {
                transition(.idle, message: "系统蓝牙已开启")
            }
        } else {
            stopScanInternal()
            clearConnection(error: JobsBluetoothError.bluetoothUnavailable)
            awaitingDisconnection = nil
            pendingIdentifier = nil
            reconnectItem?.cancel()
            transition(.unavailable, message: "系统蓝牙不可用")
        }
    }

    public func centralManager(
        _ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
        advertisementData: [String: Any], rssi RSSI: NSNumber
    ) {
        guard !mockTransport.enabled, storedState == .scanning else {
            return
        }
        nativePeripherals[peripheral.identifier] = peripheral
        let strings = advertisementData.reduce(into: [String: String]()) {
            $0[$1.key] = String(describing: $1.value)
        }
        let snapshot = JobsBluetoothPeripheral(
            identifier: peripheral.identifier, name: peripheral.name ?? "未命名设备",
            RSSI: RSSI.intValue, advertisementData: strings)
        storedDiscovered.removeAll {
            $0.identifier == snapshot.identifier
        }
        storedDiscovered.append(snapshot)
        let handler = peripheralDiscovered
        callback {
            handler?(snapshot)
        }
    }

    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        guard connectedPeripheral === peripheral else {
            return
        }
        transition(.discovering, message: "发现服务")
        peripheral.discoverServices(profile.serviceUUIDs.isEmpty ? nil : profile.serviceUUIDs)
    }

    public func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        connectionEnded(peripheral, error: error)
    }

    public func centralManager(
        _ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?
    ) {
        connectionEnded(peripheral, error: error)
    }

    private func connectionEnded(_ peripheral: CBPeripheral, error: Error?) {
        if awaitingDisconnection === peripheral {
            awaitingDisconnection = nil
            if let pendingIdentifier {
                beginConnection(pendingIdentifier)
            } else {
                scheduleReconnect()
            }
            return
        }
        guard connectedPeripheral === peripheral else {
            return
        }
        clearConnection(error: error ?? JobsBluetoothError.cancelled)
        transition(.idle, message: error?.localizedDescription ?? "连接已断开")
        scheduleReconnect()
    }
}

extension JobsBluetoothManager: CBPeripheralDelegate {
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard connectedPeripheral === peripheral else {
            return
        }
        if let error {
            failConnection(error)
            return
        }
        let services = peripheral.services ?? []
        guard !services.isEmpty,
            Set(profile.serviceUUIDs).isSubset(
                of: Set(
                    services.map {
                        $0.uuid
                    }))
        else {
            failConnection(JobsBluetoothError.characteristicNotFound)
            return
        }
        pendingServices = Set(services.map(ObjectIdentifier.init))
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }

    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?)
    {
        guard connectedPeripheral === peripheral, pendingServices.contains(ObjectIdentifier(service)) else {
            return
        }
        if let error {
            failConnection(error)
            return
        }
        for characteristic in service.characteristics ?? [] {
            if characteristic.uuid == profile.writeCharacteristicUUID,
                !characteristic.properties.intersection([.write, .writeWithoutResponse]).isEmpty
            {
                writeCharacteristic = characteristic
            }
            if characteristic.uuid == profile.readCharacteristicUUID,
                characteristic.properties.contains(.read)
            {
                readCharacteristic = characteristic
            }
            if characteristic.uuid == profile.notifyCharacteristicUUID,
                !characteristic.properties.intersection([.notify, .indicate]).isEmpty
            {
                notifyCharacteristic = characteristic
            }
        }
        pendingServices.remove(ObjectIdentifier(service))
        readyIfComplete()
    }

    public func peripheral(
        _ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?
    ) {
        guard connectedPeripheral === peripheral, notifyCharacteristic === characteristic else {
            return
        }
        if let error {
            failConnection(error)
            return
        }
        if notificationDesired, notificationsRequested, !characteristic.isNotifying {
            failConnection(JobsBluetoothError.characteristicNotFound)
            return
        }
        readyIfComplete()
    }

    public func peripheral(
        _ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?
    ) {
        guard connectedPeripheral === peripheral,
            characteristic === readCharacteristic || characteristic === notifyCharacteristic
        else {
            return
        }
        if let error {
            report(error)
            return
        }
        if let data = characteristic.value {
            receive(data)
        }
    }

    public func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?)
    {
        guard connectedPeripheral === peripheral, writeCharacteristic === characteristic,
            let command = activeCommand, command.awaitingWrite
        else {
            return
        }
        command.awaitingWrite = false
        if let error {
            retryOrFinish(error)
            return
        }
        pumpWrites()
    }

    public func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
        guard connectedPeripheral === peripheral, writeType == .withoutResponse else {
            return
        }
        pumpWrites()
    }
}
