# iOS 蓝牙开发：从原理、协议到 Demo、生产与面试

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 面向已经写过 iOS、但没有蓝牙项目经验的开发者。主线是“手机连接可穿戴设备或物联网设备”，从一次真实的数据往返理解无线通信、协议、代码与生产可靠性。先能解释，再能跑通，最后知道什么才算可以上线。

本文参照 Jobs 现有《Swift 相关经验》《Objective-C 相关经验》的中文编号、概念对比、原理拆解、代码与边界说明方式；面试部分采用“问题 → 可直接说出口的核心回答 → 干货拆解 → 追问与答案”。原有两份文档与业务工程保持不变。

- 技术主线：[**Bluetooth Low Energy（BLE）**](https://www.bluetooth.com/bluetooth-resources/the-bluetooth-low-energy-primer/)、[**Core Bluetooth**](https://developer.apple.com/documentation/corebluetooth)、GATT 与自定义业务协议。
- 语言分工：[**C**](https://www.open-std.org/jtc1/sc22/wg14/) 做字节与固件接口，[**C++**](https://isocpp.org/) 做可复用协议内核，[**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 与 [**Swift**](https://www.swift.org/) 做 iOS 连接、生命周期与业务集成。
- 资料核对日期：2026-08-30。平台结论按具体系统版本区分，不把 Bluetooth 版本号当作手机公开 API 的能力清单。
- 附带代码是独立教学材料，不是已经交付认证的设备 SDK。原生 Apple API 保留在教学 Transport 内核中，用于看清系统回调；接入 Jobs 业务工程仍通过真实已有的 Jobs 封装，不借此绕开 DSL。
- 未提供设备型号、固件或厂商协议。因此文中自定义 UUID、LED 命令、帧格式均为教学协议，不能直接发给未知设备；不包含真实设备的开锁、擦除、复位或升级操作。

### 阅读路线

| 当前目标 | 建议顺序 | 完成标志 |
| --- | --- | --- |
| 今天先听懂需求 | 第一至五章 | 能说清 BLE、GATT、业务协议分别是什么 |
| 尽快跑通 | 第六至十章 | 两台真机完成订阅、写入、业务 ACK |
| 能接生产任务 | 第十一至十七章 | 能拿出协议清单、状态机、错误处理与测试计划 |
| 准备面试 | 第十八、十九章 | 能解释方案与限制，而不是背方法名 |
| 学习计划与索引 | 第二十至二十二章 | 知道练习顺序、验证状态与权威资料 |

## 一、先理解你真正要开发什么 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

### 1.1、不要把“蓝牙开发”理解成“写一个扫描按钮”

以运动手环为例：传感器测得心率，固件把结果编码成字节，蓝牙把字节交给 iPhone，App 解析、存储并展示；需要时再同步云端。反方向，App 发送“修改采样周期”，固件校验权限、执行设置，再返回结果。

```text
传感器 → MCU 固件 → 蓝牙协议栈 → 无线链路 → iOS 蓝牙栈
                                                   ↓
云端 ← HTTPS / MQTT ← App 数据层 ← 业务解码 ← Core Bluetooth
```

你通常不用自己写无线驱动。你的核心工作是“把不稳定的设备连接，变成有清晰状态、有明确结果的业务接口”。

### 1.2、几种常见需求，其实是不同项目

| 场景 | 常见技术路线 | 开始前最该问什么 |
| --- | --- | --- |
| 手环、体温计、心率带 | BLE + 标准或私有 GATT | UUID、数据格式、是否需要认证 |
| 设备首次配置 Wi-Fi | BLE 传递配网信息，再切 Wi-Fi | 安全握手、凭据保护、配网完成判据 |
| 传感器历史记录同步 | BLE + 分页、游标、校验、补传 | 最大数据量、设备存储和时钟规则 |
| 耳机音频、通话 | 系统音频栈及音频 Profile | 是传音频，还是用 BLE 调耳机设置 |
| 智能灯组、多跳组网 | Bluetooth Mesh 或 Matter/Thread 等 | 到底选择哪个生态，手机扮演什么角色 |
| 工业设备“蓝牙串口” | 可能是 BLE 私有服务，也可能是 Classic SPP | “串口”说的是模块内 UART 还是空口 SPP |

### 1.3、项目分工：谁应该给你什么

| 角色 | 主要交付 |
| --- | --- |
| 硬件工程师 | 芯片、天线、功耗、传感器、射频与量产方案 |
| 固件工程师 | 广播、GATT 表、命令执行、设备状态、安全与 Bootloader |
| iOS 开发者 | 权限、设备选择、连接状态机、协议编解码、交互、存储与诊断 |
| 后端 | 用户和设备绑定、业务授权、数据同步、固件发布、审计 |
| 测试 | 真机/固件矩阵、异常场景、长稳、功耗、升级恢复 |

这些是常见分工，不是语言的硬边界。固件可以用 C++；纯 Swift 也能完成 App 的业务编解码。选择共享 C/C++，应该因为跨端复用或已有算法，而不是“蓝牙必须用 C”。

## 二、BLE、经典蓝牙与 iOS 能力边界

### 2.1、BLE 与 Classic：不是“新蓝牙和旧蓝牙”

| 维度 | BLE | BR/EDR（经典蓝牙） |
| --- | --- | --- |
| 常见任务 | 低功耗传感、控制、间歇数据交换 | 传统音频、通话和既有 Profile |
| 常见 App 数据模型 | GATT 服务与特征 | 取决于系统支持的 Profile 或配件协议 |
| 能否互相直接替代 | 不能，因为上层协议与栈不一定兼容 | 同样不能 |
| 双模芯片 | 可以同时具备两类能力，但要看产品实际启用什么 | 不能凭“支持蓝牙”推断开放了 SPP |

BLE 低功耗主要来自“需要时短暂通信，大量时间休眠”，不代表任何高频 BLE 业务都省电。持续扫描、持续唤醒 CPU、频繁小包，照样消耗电池。

### 2.2、Core Bluetooth 并非“所有蓝牙协议的万能入口”

普通 BLE GATT 数据交互用 Core Bluetooth。Apple 从 iOS 13 起还支持特定的 **GATT over BR/EDR** 场景；这不等于向 App 开放任意 RFCOMM/SPP，也不等于能用它直接控制任意耳机音频链路。[Apple WWDC19：What's New in Core Bluetooth](https://developer.apple.com/videos/play/wwdc2019/901/)

对使用 Apple 授权技术的经典蓝牙配件，应核实 [**External Accessory**](https://developer.apple.com/documentation/externalaccessory)、iAP2、支持的协议字符串与厂商授权。不能看到一个 SPP 模块就保证 iPhone App 能像桌面串口那样打开它。[Apple 配件开发入口](https://developer.apple.com/accessories/)

### 2.3、BLE 一定需要 MFi 吗？

**普通只使用 BLE 的配件，不因使用 BLE 本身就必须加入 MFi。** 如果还使用 HomeKit、Find My、MFi Hearing Aid、iAP2 等 Apple 授权技术，就要另行核对对应要求。不要把“BLE 不需要 MFi”扩写成“这款产品不需要任何认证”。[Apple MFi FAQ](https://mfi.apple.com/en/faqs)

Bluetooth 资格认证、商标使用、各地射频法规与行业合规是另外的工作；由硬件团队、产品和合规人员根据产品确认，不用 App 能连通代替合规结论。

### 2.4、常见能力误判

- `CBPeripheral.identifier` 是系统提供的标识，不是 MAC 地址，不适合直接当跨手机、跨安装的设备业务主键。
- Core Bluetooth 不提供通用“读取任意设备 MAC”“强制打开系统蓝牙”“强制选择任意 PHY/连接间隔”的 App 控制接口。
- 手机硬件支持某个 Bluetooth 版本，不表示该版本的所有可选特性都能由普通 App 调用。
- Simulator 适合纯协议、Mock 和 UI 测试；本文真实无线实验要求真机。不要用模拟器编译成功宣称射频链路已验证。
- App 的 BLE 扫描列表不等于系统设置中的配对设备列表。BLE 外设不必先在设置里配对才能被 App 发现或连接。

## 三、协议栈：每一层到底负责什么

### 3.1、先用“快递系统”理解分层

- PHY 是道路与车辆：怎样把比特通过无线电传出去。
- Link Layer 是相邻站点的运输规则：什么时候发、在哪个信道发、如何保持连接。
- L2CAP 是分拣：区分上层通道，承担协议规定的分段和重组。
- ATT 是访问规约：读哪个属性、写哪个属性、更新哪个属性。
- GATT 是目录和使用方式：这些属性如何组成服务、特征和描述符。
- 业务协议是箱子里的内容：`01` 究竟是开灯、关灯还是错误码，蓝牙标准不会替厂商决定。

类比帮助入门，但不是严格的一对一 OSI 映射。GAP、GATT 属于 Profile；HCI 是 Host/Controller 接口，不应都画成连续套娃的网络报文头。[Bluetooth Core Architecture](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core-62/out/en/architecture%2C-change-history%2C-and-conventions/architecture.html)

### 3.2、协议分工速查

| 名称 | 全称或含义 | 负责什么 | iOS App 的主要接触面 |
| --- | --- | --- | --- |
| PHY | Physical Layer | 调制、频段、物理传输 | 多由系统和硬件管理 |
| LL | Link Layer | 广播、连接、调度、链路可靠性 | 通过连接和错误间接观察 |
| HCI | Host Controller Interface | 主机协议栈与控制器通信 | 普通 App 不直接发 HCI 命令 |
| L2CAP | Logical Link Control and Adaptation Protocol | 上层复用、分段重组、通道 | 特定场景使用 CoC |
| ATT | Attribute Protocol | 按 Handle 访问属性值 | read/write/notify 背后的协议 |
| GATT | Generic Attribute Profile | 服务、特征、描述符的组织与操作 | Core Bluetooth 的日常对象模型 |
| GAP | Generic Access Profile | 发现、角色、连接等通用规则 | 扫描、广播、连接 |
| SMP | Security Manager Protocol | 配对与密钥相关安全过程 | 系统配对提示、访问安全要求 |
| 业务协议 | 厂商或产品定义 | 命令、字段、单位、错误、版本、授权 | 你必须实现或调用 SDK 的部分 |

L2CAP 的职责是协议复用与通道传输；**L2CAP 做了分段重组，不代表任意大的业务对象已经能自动变成多次 GATT 写入**。[Bluetooth L2CAP Specification](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core-62/out/en/host/logical-link-control-and-adaptation-protocol-specification.html)

### 3.3、无线原理：理解这些就够开始做 App

BLE 工作在 2.4 GHz ISM 频段，LE 信道规划为 40 个射频信道。传统主广播使用其中 3 个主广播信道，连接中的数据传输使用其余数据通道；扩展广播还会使用辅助广播机制，不能把“所有广播永远只用 3 个信道”当完整结论。

连接不是“两台设备一直不停地对着说话”，而是在连接事件中按调度交换数据；实际功耗和速度受连接间隔、包长、PHY、射频干扰和调度影响。链路有差错检测和重传机制，因此“Notify 没有 ATT 确认”不等于“无线层完全不可靠”。[Bluetooth LE Primer](https://www.bluetooth.com/bluetooth-resources/the-bluetooth-low-energy-primer/)

RSSI 是收到信号的强度指标，不是距离传感器。人体遮挡、天线方向、墙体、发射功率都可能改变它；用 RSSI 做粗略排序可以，拿它保证厘米级距离不行。

### 3.4、四种角色不要混淆

| 角色轴 | 常见手机 | 常见手环 | 描述的是什么 |
| --- | --- | --- | --- |
| GAP | Central | Peripheral | 谁扫描发起连接，谁广播接受连接 |
| GATT | Client | Server | 谁请求属性操作，谁提供属性数据库 |

两组角色是不同维度，不能规定“Central 永远是 GATT Client”。例如配件访问 iPhone 的 ANCS 时，iPhone 提供通知相关 GATT 服务，配件作为 GATT Client。单台设备也可以承担不止一种角色。[Bluetooth GAP](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core-62/out/en/host/generic-access-profile.html)、[Apple ANCS](https://developer.apple.com/library/archive/documentation/CoreBluetooth/Reference/AppleNotificationCenterServiceSpecification/Introduction/Introduction.html)

## 四、GATT：把设备看成一个带权限的数据目录

### 4.1、Service、Characteristic、Descriptor、UUID、Handle

```text
外设
├─ Heart Rate Service                    UUID 180D
│  └─ Heart Rate Measurement              UUID 2A37
│     └─ Client Characteristic Configuration  UUID 2902
├─ Battery Service                       UUID 180F
│  └─ Battery Level                      UUID 2A19
└─ 厂商自定义 Service                     128-bit UUID
   ├─ App 写命令的 Characteristic
   └─ 设备发应答的 Characteristic
```

上面是目录示意，**不表示每只手环都开放这些标准服务**。有的手表只开放厂商私有协议，有的只有在运动广播模式下才提供心率服务。

| 名词 | 通俗解释 | 易错点 |
| --- | --- | --- |
| Service | 一组相关能力，例如心率或电池 | 不等于一个 TCP 端口 |
| Characteristic | 数据及访问性质，例如电量值 | 不等于只能读写一个字节 |
| Descriptor | 对特征的补充信息或配置 | CCCD 不是业务数据帧的一部分 |
| UUID | 类型/用途标识 | 可以有同 UUID 的多个实例，不是设备唯一身份 |
| Handle | ATT 数据库内属性句柄 | 固件改变数据库后可能变化，不应硬编码 |

标准短 UUID 由 Bluetooth SIG 分配，常见完整形式为 `0000180D-0000-1000-8000-00805F9B34FB`。厂商自定义服务一般使用自己的 128-bit UUID，不随意占用未获分配的 16-bit 标识。[Bluetooth Assigned Numbers](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Assigned_Numbers/out/en/index-en.html)

### 4.2、Read、Write、Notify、Indicate 对比

| 操作 | 方向 | ATT 层确认 | 适合什么 | 不保证什么 |
| --- | --- | --- | --- | --- |
| Read | Client 请求，Server 响应 | 请求/响应 | 查询配置或当前快照 | 不是持续订阅 |
| Write With Response | Client → Server | Write Response 或错误 | 需要知道属性写入结果的控制命令 | 不保证业务动作已完成 |
| Write Without Response | Client → Server | 无对应 ATT Write Response | 有流控的批量传输 | 不提供逐条完成回调 |
| Notify | Server → Client | 无 ATT confirmation | 高频状态、传感器数据 | 不保证 App 已存储/执行 |
| Indicate | Server → Client | ATT confirmation | 需要协议确认的数据更新 | 不保证 App 业务事务成功 |

“有确认”要问清楚在哪一层：无线 Link Layer、ATT、你的命令 ACK、数据库提交，是四个不同层面的事实。

### 4.3、CCCD 的作用与正确订阅姿势

CCCD 的 UUID 为 `0x2902`，用于客户端配置通知/指示。Core Bluetooth 中调用 `setNotifyValue(true, for:)`，系统负责相关操作；不要照抄 Android 示例去手写 CCCD。

调用返回不代表订阅成功，要等 `didUpdateNotificationStateFor`，检查 `error` 和 `isNotifying`。之后的数据由 `didUpdateValueFor` 交付。若特征同时支持 Notify 和 Indicate，Apple 文档说明此 API 会启用 Notify；App 不能靠一个自造参数自由切换。[Apple setNotifyValue](https://developer.apple.com/documentation/corebluetooth/cbperipheral/setnotifyvalue(_:for:))

### 4.4、Properties 与安全权限是两回事

Properties 描述特征支持 Read、Write、Notify 等操作；固件还可要求加密、认证或更高安全级别。看到 `.write` 只能说明该特征具备这种操作性质，不保证当前会话已经获准写入。

生产顺序应是：发现目标服务 → 发现必要特征 → 检查 Properties → 满足安全/认证要求 → 订阅并确认 → 握手 → 进入业务 ready。

## 五、从广播到一条命令成功的完整过程

### 5.1、扫描究竟看到了什么

广告数据可能包括服务 UUID、Local Name、Manufacturer Data、Service Data 等；这些字段不保证每次都出现。`peripheral.name` 也可能为空或与广播名不同。过滤设备时优先使用厂商确认的服务与广播格式，名字只用于展示和辅助识别。

传统广播有效载荷受 31 字节限制，但 Flags、AD Type、长度等都会占空间；Scan Response 是另一份数据，不应简单声称“业务可以任意塞 62 字节”。扩展广播有不同能力与平台可见性，依硬件和系统核实。[Bluetooth LE Primer](https://www.bluetooth.com/bluetooth-resources/the-bluetooth-low-energy-primer/)

Manufacturer Data 的格式也不是任意把品牌名转字节：正式产品要遵循公司标识及相关数据格式。教学双机实验仅广播自定义 Service UUID，不冒用厂商 Company ID。

### 5.2、连接成功与业务 ready 之间还有很多事

```text
等待授权/蓝牙可用
  → 扫描（超时、取消、过滤）
  → 用户选择设备
  → 连接（超时、取消）
  → 发现 Service
  → 发现 Characteristic
  → 确认 Properties / 安全条件
  → 开启 Notify 并等待成功回调
  → 协议版本与身份握手
  → Ready
  → 写命令 → ATT 结果 → 匹配业务 ACK → 更新 UI
```

实验 Demo 为了减少 UI 依赖，会连接发现的第一个教学 UUID 外设；**生产必须增加用户选择与设备身份验证**，不能把同 UUID 当同一台设备。

### 5.3、写入成功的四级含义

1、`writeValue` 被调用：只代表 App 提交了请求。

2、`.withResponse` 收到无错误的 `didWriteValueFor`：对应 ATT 写入结果。

3、收到 `seq` 对得上的业务应答：设备表示它接受或完成了指定命令，语义由业务协议定义。

4、收到“持久化完成”或通过查询验证：设备状态在重启后仍有效，这是更进一步的业务保证。

例子：App 请求“升级固件”，ATT 写入成功当然不等于固件已校验、已写 Flash、已重启并切换成功。

### 5.4、为什么连接对象必须由会话层持有

`CBCentralManager`、当前 `CBPeripheral`、必要特征、未完成命令都需要明确生命周期。页面消失不一定应断开整个业务连接；但业务结束后必须能取消扫描、清理订阅和命令。不要依靠一个临时局部变量维持蓝牙，也不要把无限生命周期全塞进一个全局单例。

手机与外设重连时，要清理旧 Characteristic、接收缓冲、超时任务和未完成命令。避免上一轮迟到的回调把新设备误标成成功。

## 六、iOS 工程配置与系统回调地图

### 6.1、最小权限配置

本文原生 Core Bluetooth Demo 以 iOS 17+ 为最低验证目标。在宿主 App 的 `Info.plist` 配置真实用途说明：

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>用于连接你选择的可穿戴设备，并同步设备数据。</string>
```

`Always` 是这个隐私键的名称，不代表后台无限运行。若支持 iOS 13 以前的部署目标，还需根据 Apple 兼容规则处理 `NSBluetoothPeripheralUsageDescription`。[Apple 蓝牙隐私键](https://developer.apple.com/documentation/bundleresources/information-property-list/nsbluetoothperipheralusagedescription)

只做前台 Demo，不需要为了“可能有用”添加后台模式。确有后台接收设备数据的产品需求时，再启用：

```xml
<key>UIBackgroundModes</key>
<array>
    <string>bluetooth-central</string>
</array>
```

App 自己扮演外设并有对应后台业务时才考虑 `bluetooth-peripheral`。本实验第二台 iPhone 保持前台即可。蓝牙权限、HealthKit 权限、定位权限、局域网权限是不同权限，按实际功能分别申请，不要照搬 Android 扫描权限模型。[Apple 后台蓝牙指南](https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/CoreBluetoothBackgroundProcessingForIOSApps/PerformingTasksWhileYourAppIsInTheBackground.html)

### 6.2、对象地图

| 类型 | 职责 |
| --- | --- |
| `CBCentralManager` | 扫描、连接、取消连接与系统状态 |
| `CBCentralManagerDelegate` | 发现设备、连接成功/失败/断开 |
| `CBPeripheral` | 远端设备及其服务读写操作 |
| `CBPeripheralDelegate` | 服务、特征、数据、写入与订阅回调 |
| `CBService` / `CBCharacteristic` / `CBDescriptor` | 远端 GATT 数据对象 |
| `CBPeripheralManager` | 本 App 发布服务、广播、处理远端读写 |
| `CBMutableService` / `CBMutableCharacteristic` | 本地外设角色的服务定义 |
| `CBCentral` | 本 App 为外设时，连接过来的远端 Central |

不要继承 Core Bluetooth 的框架类；使用组合和代理。本文的 `JobsBLECentralLab` 继承 `NSObject`，不是继承 `CBCentralManager`。[Apple Core Bluetooth](https://developer.apple.com/documentation/corebluetooth)

### 6.3、Swift 与 OC 回调是同一套系统模型

| 阶段 | Swift | Objective-C |
| --- | --- | --- |
| 系统状态 | `centralManagerDidUpdateState(_:)` | `centralManagerDidUpdateState:` |
| 扫描结果 | `centralManager(_:didDiscover:advertisementData:rssi:)` | `centralManager:didDiscoverPeripheral:advertisementData:RSSI:` |
| 连接成功 | `centralManager(_:didConnect:)` | `centralManager:didConnectPeripheral:` |
| 服务发现 | `peripheral(_:didDiscoverServices:)` | `peripheral:didDiscoverServices:` |
| 特征发现 | `peripheral(_:didDiscoverCharacteristicsFor:error:)` | `peripheral:didDiscoverCharacteristicsForService:error:` |
| 订阅结果 | `peripheral(_:didUpdateNotificationStateFor:error:)` | `peripheral:didUpdateNotificationStateForCharacteristic:error:` |
| 数据到达 | `peripheral(_:didUpdateValueFor:error:)` | `peripheral:didUpdateValueForCharacteristic:error:` |
| 有响应写入结果 | `peripheral(_:didWriteValueFor:error:)` | `peripheral:didWriteValueForCharacteristic:error:` |

Read 和 Notify 都可能进入数据更新回调。解析时要根据当前外设、特征、操作与业务字段分发，不能认为“这个回调只会收到刚才那条命令的响应”。

### 6.4、并发：先选一种隔离策略

本文 Swift 实验对象使用 `@MainActor`，Central/Peripheral 的 delegate queue 明确指定 `.main`；少量报文在同一个串行执行域处理，方便教学。`@preconcurrency` 代理一致性标注是对系统旧式协议导入的适配，**不是任何线程都可以安全调用的许可**。

高频采样生产方案可以把 Core Bluetooth 状态放在专用串行队列，再向业务 Actor 发送 `Sendable` 值快照，最后切主线程更新 UI。不要跨 Actor 随意传可变 `CBPeripheral`；也不要给整个 manager 加 `@unchecked Sendable` 就宣称解决了线程安全。

Actor 保证隔离，不自动保证“跨多个 await 的事务顺序”。例如写命令后 `await` 等 ACK，这时别的任务仍可能修改状态；必须保留请求 ID、会话 ID 和状态机约束。

## 七、业务协议：从十六进制变回业务含义

### 7.1、字节、文本、编码，不是一回事

```text
十六进制显示：01 02 FF          实际是 3 个字节
字符串 "0102FF" 的 UTF-8：30 31 30 32 46 46   实际是 6 个字节
```

设备要求二进制 `0x01`，你发字符串 `"01"` 就是错报文。`Data` / `NSData` 是字节容器，不保证内容是 UTF-8，更不保证是 JSON。

### 7.2、大小端、符号与单位

`uint16` 数值 `300` 等于 `0x012C`。Little Endian（小端）在线路上是 `2C 01`，Big Endian 是 `01 2C`。不能因为 ARM 常用小端，就把 C 结构体直接发出去。

```c
uint16_t value = (uint16_t)bytes[0] | ((uint16_t)bytes[1] << 8);
```

这句的前提是已经确认至少有两个字节。另一常见错误是把 `int16` 温度、缩放系数、单位或无效值哨兵弄错：`2500` 可能代表 `25.00°C`，也可能不是温度。协议必须明确字段含义。

### 7.3、为什么不能把 struct 内存原样发给另一端

因为内存布局受 padding、对齐、字节序、字段宽度、编译器和 ABI 影响。`#pragma pack(1)` 最多改变部分布局，不能解决跨端全部问题，还可能引入非对齐访问风险。

C 中也不要把任意 `uint8_t *` 强转成 `uint16_t *` 直接读；Swift 不要对不保证对齐的网络数据随意 `load(as:)`。逐字节读取，或者在检查范围后用适当的复制/非对齐读取方式，再明确处理端序。

### 7.4、本文统一的教学协议

这个协议由本文定义，**不是 Bluetooth SIG 标准协议，也不对应任何商业设备**。

| 偏移 | 字段 | 长度 | 规则 |
| --- | --- | --- | --- |
| 0 | Magic | 2 | `A5 5A` |
| 2 | Version | 1 | 固定 `01` |
| 3 | Opcode | 1 | `10` 设置 LED；`90` 应答 |
| 4 | Sequence | 2 | 小端，请求与应答一致 |
| 6 | Payload Length | 2 | 小端，仅 payload 长度，范围 0…256 |
| 8 | Payload | N | 由 Opcode 决定 |
| 8+N | CRC16 | 2 | 小端；校验 Version 到 Payload，排除 Magic 和 CRC 字段 |

总帧长度 = `10 + N`。CRC 参数：多项式 `0x1021`、初值 `0xFFFF`、`RefIn=false`、`RefOut=false`、`XorOut=0`，通常称 CRC-16/IBM-3740 或 CCITT-FALSE；`"123456789"` 的校验值为 `0x29B1`。参数比算法别名更重要。

请求：`Opcode=0x10`，payload 为一字节 `0` 或 `1`。应答：`Opcode=0x90`，payload 为 `status, actualLED`，状态 `0` 表示成功。

```text
设置 LED=1，seq=1：
A5 5A 01 10 01 00 01 00 01 6B DE
       │  │  └─ seq └─ N  │  └─ CRC 0xDE6B，小端发送
       │  └─ opcode       └─ payload
       └─ version
```

CRC 只检测部分意外错误，**不是身份认证、不是加密，也不防恶意篡改**。本实验服务未要求配对/加密，只能用于可控实验环境。

### 7.5、帧格式之外，协议还必须定义哪些东西

- 命令幂等性：`setLED(1)` 与 `toggleLED()` 重试语义不同。
- 成功点：收到命令、执行完成、写入非易失存储，分别用什么 ACK。
- 序号：位宽、回绕、超时后是否复用、会话切换后如何隔离。
- 错误码：忙、未授权、不支持、参数非法、存储不足等如何表达。
- 版本：如何协商、如何识别不兼容的设备和字段。
- 分包：是否允许一帧跨多次写入；每片有无 offset、长度、会话 ID。
- 安全：身份、密钥生命周期、防重放与所有权转移。
- 时间：时间戳单位、时区、设备时钟漂移与重启后 epoch。

没有这份契约，“App 与固件各自写完”不代表能互相理解。

## 八、Demo A：C 编解码、C++ 重组与 Objective-C++ 桥接

### 8.1、为什么这个 Demo 不需要蓝牙硬件

协议编解码是“字节输入 → 确定性输出”，应先在普通进程里验证。把所有问题都放到真机无线环境里调，会分不清是帧格式错、线程错，还是设备没响应。

源码：`Demo/Common/JobsBLECodec.h/.c`、`Demo/CPP/JobsFrameStream.hpp`、`Demo/OC/JobsCodecBridge.h/.mm`。测试：`Demo/Tests/main.cpp`、`BridgeTests.mm`。

### 8.2、C：小而稳定的共享边界

```c
uint8_t payload[] = {1};
uint8_t output[11];
size_t written = 0;
JobsCodecStatus status = jobs_encode(0x10, 1, payload, sizeof payload,
                                    output, sizeof output, &written);
if (status == JOBS_CODEC_OK) {
    // output[0...written) 才是合法输出；提交给蓝牙发送层。
}
```

这个 API 不使用全局可变状态、不分配堆内存，输入长度和输出容量显式传入。`jobs_decode` 返回的 `JobsFrameView.payload` **借用输入缓冲区**：输入一旦失效，这个指针就不能继续使用。

`jobs_crc16` 要求 `length > 0` 时输入指针有效；`jobs_encode` 要求 payload 与 output 不重叠。把这些契约写在接口文档里，比只写“线程安全、高性能”更有用。

### 8.3、C++：管理重组状态与内存所有权

```cpp
jobs::FrameStream decoder;
decoder.feed(fragment.data(), fragment.size(), [](const jobs::Frame &frame) {
    // frame.payload 已经独立拷贝；需异步使用时，继续拷贝/移动 frame。
});
```

重组器每个会话一份，接收缓冲上限 266 字节：找帧头 → 校验版本和长度 → 等够一帧 → 验 CRC → 输出 → 继续解析。坏帧逐字节重新同步；断连、会话切换或半帧过期必须调用 `reset()`。

限制也要看到：它没有时钟，不自动判断半帧过期；合法长度但永远不补齐的头部，需要上层超时清理。示例使用固定小容量和移动数组来换可读性，高吞吐产品应评估环形缓冲。Sink 不可重入解析器或抛异常，调用方需串行使用。

### 8.4、重要纠偏：GATT 不是 TCP 字节流

标准特征的 Notify 是一次属性值更新，应用通常得到该次更新的值；不能机械宣称“BLE 每次回调天然随机粘包”。

只有当**业务协议主动把一个逻辑帧拆成多个特征值，或把多个逻辑帧合到一个值**，接收侧才要按其定义重组。L2CAP CoC 在 iOS 暴露为 Stream 时，也要处理读写边界与业务边界不一致。本文 C++ 重组器服务于这种“双方已约定字节流”的场景；后面的双机短命令 Demo 则约定一帧一次特征写入，不自动拆分。

### 8.5、Objective-C++：把 C++ 内核包装给 OC/Swift

`.m` 按 Objective-C 编译，`.mm` 按 Objective-C++ 编译。桥接头只公开 Foundation 类型，STL 隐藏在 `.mm` 中：

```objc
NSError *error = nil;
NSArray<NSDictionary<NSString *, id> *> *frames =
    [bridge consumeData:incomingData error:&error];
if (error) {
    // 解析内核发生异常；结束当前会话或进入明确的错误恢复策略。
}
```

`JobsCodecBridge` 将输出 payload 复制成 `NSData`，不把 C++ 容器内部指针交给异步业务。C++ 异常在 `.mm` 边界转成 `NSError`；Foundation 编程异常不伪装成普通通信失败。非法帧被重组器丢弃并尝试重同步，所以空数组可能意味着“还没收全”或“输入无有效帧”，并非每个坏帧都有 NSError。

### 8.6、Swift 调用 C/C++ 的三种办法

| 方式 | 适合什么 | 要注意什么 |
| --- | --- | --- |
| C 头 + Bridging Header/Clang module | 小型稳定编解码接口 | `extern "C"`、指针有效期、长度、错误码 |
| Objective-C++ 门面 | 已有复杂 C++ 类或 STL 内核 | 公开头不泄漏 STL，边界复制，异常不穿透 |
| Swift C++ interop | 工具链与库都适配好的项目 | 明确启用、核对支持特性与标准库兼容 |

Swift 从 5.9 起具备 C++ 互操作支持，因此“Swift 完全不能直接调用 C++，只能经 OC”已过时；但并非所有 C++ API 都能无条件导入。[Swift C++ 互操作指南](https://www.swift.org/documentation/cxx-interop/)、[支持范围与限制](https://www.swift.org/documentation/cxx-interop/status/)

```swift
// 导入 JobsBLECodec.h 后的同步借用示例。
let result: (JobsCodecStatus, Data?) = incomingData.withUnsafeBytes { raw in
    var frame = JobsFrameView()
    let status = jobs_decode(raw.bindMemory(to: UInt8.self).baseAddress,
                             raw.count, &frame)
    guard status == JOBS_CODEC_OK, let payload = frame.payload else {
        return (status, nil)
    };return (status, Data(bytes: payload, count: Int(frame.length)))
}
// result.1 独立拥有 payload；闭包结束后继续使用也不依赖借用指针。
```

## 九、Demo B：Swift 双机蓝牙完整往返

### 9.1、这个实验验证什么

第一台 iPhone 跑 `JobsBLECentralLab`；第二台跑 `JobsBLEPeripheralLab`。设备 B 发布服务，设备 A 连接并订阅后发送设置 LED 命令，设备 B 修改内存变量并返回业务 ACK。**第二台手机只模拟 LED，不会控制闪光灯，也不产生真实传感器数据。**

| 文件 | 作用 |
| --- | --- |
| `Demo/Swift/JobsLabFrame.swift` | 与 C 版格式一致的 Swift 编解码 |
| `Demo/Swift/JobsBLECentralLab.swift` | 扫描、连接、发现、订阅、写入、ACK 匹配、超时 |
| `Demo/Swift/JobsBLEPeripheralLab.swift` | 服务发布、广播、收命令、通知背压 |
| `Demo/Swift/JobsHeartRate.swift` | 标准心率数据解析，独立练习 |

### 9.2、运行前检查与操作步骤

1、在 [**Xcode**](https://developer.apple.com/xcode) 建两个临时 iOS App，或在一个临时 App 中做两个明确模式。最低部署版本设为 iOS 17；设置签名并使用两台真机。

2、Central App 加入 `JobsLabFrame.swift` 与 `JobsBLECentralLab.swift`；Peripheral App 加入 `JobsLabFrame.swift` 与 `JobsBLEPeripheralLab.swift`。加入对应 App target，不要把 `Tests/main.swift` 加进 App。

3、两端加入第六章的蓝牙用途说明。不要把整个教学目录递归拖入 target，避免多个测试 `main`、重复代码或 Markdown 被当资源打包。

4、由页面或业务对象的**强属性**持有实验对象。用户点击“开始”后调用 `start()`，避免启动页面就无理由触发隐私授权。

```swift
// 以下是宿主 @MainActor 类型中的属性和按钮动作，不是顶层一次性局部变量。
private let centralLab = JobsBLECentralLab()

func userTappedStart() {
    centralLab.start()
}

func userTappedLEDOn() {
    centralLab.setLED(true) // 日志出现 ready 后再点击。
}

func userTappedStop() {
    centralLab.stop()
}
```

第二台 App 同样强持有 `private let peripheralLab = JobsBLEPeripheralLab()`，在开始动作中调用 `peripheralLab.start()`。宿主 UI 可以复用现有 Jobs 页面；本文不新增第三方 UI 依赖。

5、先让 B 开始广播，再让 A 扫描。两端授权蓝牙，保持前台，只开启一个使用该教学 UUID 的外设。

6、A 出现 `ready` 后点击 LED 开启。应观察到以下事件；ATT 写入回调和业务通知到达的相对顺序不能硬编码：

```text
B: 广播已开始
B: Central 已订阅
A: ready：通知已开启，现在可以调用 setLED(true)
A: TX seq=1 setLED=true
B: 执行 setLED=1，准备业务 ACK seq=1
A: ATT write response 收到；不等于设备业务执行成功
A: 业务 ACK 成功：LED=1，seq=1
```

### 9.3、实现里最重要的几个设计点

- 必须等 `.poweredOn` 才扫描，不能初始化 manager 后马上假设可用。
- 强持有 `CBPeripheral`，只发现指定 Service 和两条必要特征。
- 检查 `.write` / `.notify`；收到订阅成功回调才进入 ready。
- 一次只允许一条业务命令和一个未结束的 ATT 写入，不用并发调用把顺序交给运气。
- 写入前使用 `maximumWriteValueLength(for:)` 检查长度；短命令不满足时拒绝，不隐式截断。
- 匹配当前 peripheral、characteristic、opcode、sequence、payload 后才认定业务成功。
- 扫描/连接/发现/订阅/命令超时均有取消；generation 使旧定时任务不能误伤新阶段。
- 断连和服务失效后清理旧会话；超时结果明确写为“未知”，不盲目重试。
- 外设的 `updateValue` 返回 false 时保留队首，等待 `peripheralManagerIsReady` 再继续，不忙等。

### 9.4、Demo 没有承诺什么

没有实现设备认证、加密业务协议、用户绑定、状态恢复、自动重连、多设备调度、OTA、跨会话防重放、持久化命令、完整 App UI 或商业固件。Peripheral 的 `stop()` 停止广播并拒绝后续写入，不等于驱逐所有已连接 Central；实验时由 Central 主动断开。

它是一条可读、可编译的教学路径，不是把所有生产难题藏进一个“全能蓝牙管理器”。

## 十、Demo C：Objective-C 链路与标准心率解析

### 10.1、用 OC Central 连接同一个 Swift 外设

临时 OC App 加入 `JobsOCCentralLab.h/.m`、`JobsBLECodec.h/.c`。Header Search Paths 指向 `Demo/Common`；无需引入 C++。第二台继续运行上一章 Swift Peripheral。

```objc
// 宿主长期持有 lab；页面退出时按业务需要调用 endWithReason:report:。
[lab beginWithLog:^(NSString *message) {
    NSLog(@"%@", message);
} timeout:30];
```

`lab` 是已初始化并由宿主持有的 `JobsOCCentralLab`。它扫描相同教学 Service，订阅成功后自动发送 `setLED(1), seq=1`，等到业务 ACK 才报告成功并断开。整体超时限制为 1…60 秒；与 Swift 版的逐阶段超时相比更精简，适合对照 OC 系统代理签名。

这个独立 Transport 内核展示原生 API；Jobs 业务层的 manager 创建与配置应复用已存在的真实 Jobs 入口，不能因为实验里出现原生写法而改回生产调用方。

### 10.2、标准心率为何不能永远取第二个字节

Heart Rate Measurement 首字节是 Flags，决定后面的字段布局：

| Flag | 含义 |
| --- | --- |
| bit 0 | 心率是 UInt8 还是 UInt16 |
| bit 1/2 | 接触状态与是否支持接触检测；不支持时不能按 bit 1 作结论 |
| bit 3 | 是否包含 Energy Expended |
| bit 4 | 是否包含 RR-Interval 字段 |
| bit 5…7 | 保留位；本文严格解析器拒绝非零 |

RR 单位为 `1/1024 s`，不是毫秒。可有多个 RR 值；应按实际可用长度循环读取，处理字段缺失与截断，不将固定长度当普遍保证。[Bluetooth Heart Rate Service](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/HRS_v1.0/out/en/index-en.html)

### 10.3、可直接运行的解析练习

```swift
let sample = try JobsHeartRate.decode(Data([0x00, 0x48]))
print(sample.bpm) // 72

let full = try JobsHeartRate.decode(
    Data([0x1F, 0x2C, 0x01, 0x0A, 0x00, 0x00, 0x04, 0x00, 0x02])
)
print(full.bpm)       // 300；只用于测试 UInt16，不是医学解释。
print(full.energyKJ!) // 10；Flags 指示该字段存在。
print(full.rrSeconds) // [1.0, 0.5]
```

真实心率设备练习：确认固件开放 `180D/2A37` → 用调试工具订阅确认有数据 → iOS 同样发现并订阅 → 将该特征的 `Data` 交给 `JobsHeartRate.decode`。不要把标准心率字节送入本文 `A5 5A` 私有协议解码器。

传感器值成功解析不等于健康结论可信；产品仍需处理信号质量、佩戴状态、设备声明、用户授权与数据用途。本文只讲数据通信，不作医学诊断。

## 十一、MTU、分包、流控与吞吐量

### 11.1、三个长度不要混为一谈

| 概念 | 指的是什么 | 不能怎样理解 |
| --- | --- | --- |
| ATT MTU | ATT 层允许的协议数据单元大小 | 不是应用能无条件发送的 payload 大小 |
| Link Layer Data Length | 链路层的数据包长度能力 | 不等于 ATT MTU，更不等于一次业务帧大小 |
| `maximumWriteValueLength(for:)` | 当前外设、指定写入方式的最大值长度 | 不是每台 iPhone 永远固定的常数 |

传统默认 ATT MTU 为 23 时，常见 ATT Write/Notification 的属性值上限为 `23 - 3 = 20` 字节。这是常见操作的协议头计算，不是“BLE 永远只能发 20 字节”。不同操作的头部不同，长写与链路分段又是另外的机制。

iOS 不采用 Android 的 `requestMtu()` 调用方式；App 查询当前 `maximumWriteValueLength(for:)`，并结合固件支持的写入方式与业务分包策略。不要拿一次 `.withoutResponse` 的上限去替代 `.withResponse` 的上限。[Apple 写入长度 API](https://developer.apple.com/documentation/corebluetooth/cbperipheral/maximumwritevaluelength(for:))

### 11.2、该由谁分包

1、系统协议栈处理其负责的下层分段与重组，不需要 App 拼造链路层包。

2、App 的业务帧超过单次写入能力时，必须按设备协议选择长写、应用分片或其它传输通道，不能盲目每 20 字节切一刀。

3、如果设备每次写入都当成完整命令，那么你把一个命令随便拆成三段，它会收到三条坏命令。先确认固件有相应重组规则。

4、文件/历史数据分片应包含传输 ID、offset/片号、有效长度和校验策略；重传时可从明确确认的位置恢复。

### 11.3、Without Response 不是无限发送许可

发送前检查 `canSendWriteWithoutResponse`。为 false 时停止出队，等 `peripheralIsReady(toSendWriteWithoutResponse:)` 再继续；不能 while 忙等，也不能固定 sleep 10 ms 作为通用流控。这个属性表示系统发送能力，不表示固件业务消费速度，设备自己的接收窗口/积分流控可能仍然需要。[Apple 发送能力](https://developer.apple.com/documentation/corebluetooth/cbperipheral/cansendwritewithoutresponse)、[Apple ready 回调](https://developer.apple.com/documentation/corebluetooth/cbperipheraldelegate/peripheralisready(tosendwritewithoutresponse:))

```text
入队前：检查队列总字节上限
发送泵：while 队列非空 且 系统可发送 且 设备窗口有额度
          发送队首 → 扣减设备额度 → 移除本地待发项
暂停点：等系统 ready 或设备 window-update 事件
失败点：超时/断连 → 记录最后业务确认位置，不把本地出队位置当完成位置
```

这是生产设计示意，不是声称现有 `JobsBluetooth` 已实现此发送泵。

### 11.4、外设通知同样有背压

App 作为 Peripheral 时，`updateValue` 返回 false 表示暂时不能再提交。保留数据，等 `peripheralManagerIsReady(toUpdateSubscribers:)`。发送前还应检查订阅 Central 的 `maximumUpdateValueLength`，不能让大通知被截断。[Apple updateValue](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/updatevalue(_:for:onsubscribedcentrals:))

本文 Peripheral 限制队列为 16 条，满时拒绝新写入。这比“永远把数据 append 到数组”更明确；生产中应按业务选择拒绝、覆盖旧遥测或降采样。

### 11.5、吞吐量该怎样测

```text
有效吞吐 = 设备确认接收的业务有效字节数 / 实际耗时
端到端延迟 = App 提交命令 → 业务 ACK 匹配成功
```

记录手机型号、系统、固件、写入方式、payload 大小、前后台、RSSI、并发设备数。不要把 1M/2M PHY 的物理速率当应用有效吞吐；也不要把调用 `writeValue` 的速度当设备收到的速度。

## 十二、把 Demo 变成生产系统：状态机与命令调度

### 12.1、建议的职责分层

```text
页面 / ViewModel
  └─ 设备业务服务：绑定、采样、同步、升级
      ├─ Session：身份、版本、ready 条件、生命周期
      ├─ CommandScheduler：排队、关联、超时、取消、重试
      ├─ Codec：字节编解码与协议校验
      └─ Transport：Core Bluetooth / Mock / 回放
```

页面不应关心某条 Characteristic 的 UUID；Codec 不应依赖 UIViewController；Transport 不应知道“今日步数上传到哪一个账号”。这也让 C/C++ 共享内核与 OC/Swift 平台层自然分开。

### 12.2、状态、事件和动作分开表达

| 当前状态 | 事件 | 动作与下一状态 |
| --- | --- | --- |
| Idle | 用户开始 | 等待系统可用，进入 Scanning |
| Scanning | 用户选中设备 | 停扫，开始 Connecting |
| Connecting | 连接成功 | Discovering，不直接 ready |
| Discovering | 所需特征齐全 | Subscribing / Authenticating |
| Subscribing | 订阅成功 | 握手通过后 Ready |
| Ready | 命令入队 | 开始事务，匹配 ACK |
| 任意工作态 | 用户取消 | 取消请求，终止当前会话 |
| 工作态 | 非预期断连 | 清理旧操作，再决定是否退避重连 |
| 任意态 | 权限拒绝 | 停止重试，给出可操作提示 |

每个事件都带 session ID 或与当前对象身份对应的验证。**旧超时、旧 ACK、旧断连回调不能修改新会话。**

### 12.3、命令最少需要记录哪些字段

```text
sessionID / requestID / sequence
opcode / expectedResponseOpcode
payload / transportWriteType
deadline / retryBudget / idempotencyKey
state / completion / cancellation
```

匹配条件至少考虑“当前会话 + 外设 + 特征 + 响应类型 + 请求序号”，不能只判断 `data.count > 0`。主动遥测、旧请求 ACK、设备事件都可能与命令响应交错。

### 12.4、超时不等于执行失败

假设 App 发“扣减一次额度”，设备已经执行，但 ACK 在断连时未送达。App 超时后自动重发，会造成重复执行。

正确设计是区分：

- 明确未提交：可以按策略重新提交。
- 明确失败：按错误码决定是否重试。
- 已提交但结果未知：用幂等键、状态查询或业务对账确认。
- 明确成功：完成任务，不因迟到定时器再次回调失败。

对于 `setLED(1)`，重复设置往往是幂等；对于 `toggleLED()`，重复执行会反向改变状态。幂等性来自设备执行协议，不来自 App 在内存里保存一个 UUID。

### 12.5、重连不是失败后立即循环 connect

区分用户主动断开与异常断开。主动断开通常不自动重连；权限拒绝、型号不兼容、认证失败也不应无限重试。

异常断开可采用有上限的指数退避并加抖动，例如 1、2、4、8 秒，设置总时长/次数预算；这只是可调策略示例。重连后重新确认特征与订阅、重新握手，再按设备实际状态恢复任务。

`retrievePeripherals(withIdentifiers:)` 返回已知对象，不表示对象当前已连接；`retrieveConnectedPeripherals(withServices:)` 也不是“我的全部绑定设备”。恢复对象身份后仍需按平台和业务要求连接及校验。

### 12.6、多设备与高频数据

- 每台设备拥有独立 Session、decoder、命令队列与超时，不能用一个全局 `writeCharacteristic` 接收所有连接。
- 不承诺所有 iPhone 都能同时连接固定数量设备。数量、吞吐和功耗一起做目标机型测试。
- 传感器每秒产生 100 条数据，不表示 UI 必须每秒刷新 100 次。解析/存储与展示节流分离。
- 队列、历史缓存、日志都设置容量与淘汰策略。实时遥测可以降采样，交易/控制响应通常不能静默丢弃。
- 封装 `async/await` 时，continuation 要在成功、失败、取消、断连、超时之间 **exactly once** 完成；登记请求与发送动作应处于同一串行执行域，避免先回调后登记。

## 十三、前后台、锁屏、状态恢复与 iOS 26

### 13.1、后台模式不是永久后台线程

声明蓝牙后台模式后，系统可为相关蓝牙事件唤醒 App；不等于 App 可以不受限制运行定时器、维持任意循环或高频刷新 UI。传统后台扫描限制包括服务过滤、重复发现合并、扫描节奏变化；不能要求后台和前台的每次广播回调完全相同。[Apple 后台处理指南](https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/CoreBluetoothBackgroundProcessingForIOSApps/PerformingTasksWhileYourAppIsInTheBackground.html)

### 13.2、状态恢复恢复的是系统蓝牙工作，不是你的全部内存

使用稳定的 `CBCentralManagerOptionRestoreIdentifierKey`，实现 `centralManager(_:willRestoreState:)`，在合适启动路径重建同标识的 manager；恢复外设引用、代理、必要服务状态，并与 App 自己持久化的任务对账。

不应把恢复逻辑挂在“用户进入蓝牙页面以后”才初始化；系统后台恢复时可能根本没有页面。恢复不等于重新发送所有未完成命令，也不保证你的旧闭包、decoder 缓冲和 UI 对象还在。

### 13.3、iOS 26 的两个新边界必须单独记

**Live Activity：** Apple 当前 Core Bluetooth 文档说明，iOS 26+ 在已经实例化 `CBManager` 并于进入后台前启动 Live Activity 等条件下，可继续部分前台式蓝牙能力，例如不指定服务的扫描和重复发现。但 Apple 工程师也明确说明，锁屏并熄屏后扫描行为仍会受限制，不能把 Live Activity 当作永不受限扫描的方案。[Apple Core Bluetooth](https://developer.apple.com/documentation/corebluetooth)、[Apple 工程师关于熄屏的说明](https://developer.apple.com/forums/thread/815189)

**重新拉起：** TN3115 将“系统移出内存”“用户强退”“控制中心蓝牙按钮”“设置里关闭蓝牙”“重启”等分别讨论；它在 iOS 26/iPadOS 26 的注 5 中为相关条目增加了“只有通过 AccessorySetupKit 设置蓝牙配件的 App 才会重新拉起”的条件。因此既不能一律承诺强退恢复，也不能继续把旧版的强退限制说成所有版本的永久定律。[Apple TN3115](https://developer.apple.com/documentation/technotes/tn3115-bluetooth-state-restoration-app-relaunch-rules)

准确工程做法：记录系统版本、是否 ASK 设置配件、待完成蓝牙事件、锁屏/熄屏状态，并按 TN3115 表格与脚注实测。状态恢复以等待特定事件且该事件发生为前提，不是通用定时唤醒服务。

### 13.4、AccessorySetupKit 是什么，不是什么

[**AccessorySetupKit**](https://developer.apple.com/documentation/accessorysetupkit) 在支持的系统上提供配件发现、选择和授权体验；它不替你实现设备业务协议，也不自动补齐 ACK、OTA 与云端绑定。采用 ASK 的授权模型与本文直接请求通用蓝牙权限的教学 Demo 不同，应按官方示例配置，而不是混抄两套 plist。[Apple ASK 双设备示例](https://developer.apple.com/documentation/accessorysetupkit/setting-up-and-authorizing-a-bluetooth-accessory)

### 13.5、后台验收矩阵

| 操作 | 要观察的事实 |
| --- | --- |
| 前台切后台 | 连接、订阅是否仍有效，收到事件时是否执行必要工作 |
| 锁屏但亮屏 / 熄屏 | 扫描行为分别如何变化，不能混成一个测试 |
| 系统移出内存 | 是否发生恢复回调，任务对账是否重复执行 |
| 用户强退 | 按版本与 ASK 条件验证；未满足条件时提示用户 |
| 控制中心按钮 / 设置开关 | 两种行为分别测，不能认为完全等价 |
| 重启后首次解锁前后 | 恢复、持久化数据与 Keychain 可访问性 |
| 设备离开再回来 | 退避、重连、重订阅、补传是否正确 |

## 十四、配对、绑定、安全与隐私

### 14.1、连接、配对、Bonding、业务绑定是四件事

| 名称 | 含义 |
| --- | --- |
| Connection | 建立通信链路 |
| Pairing | 协商或生成安全材料 |
| Bonding | 保存配对产生的密钥，以便后续使用 |
| 业务绑定 | 账号是否拥有设备、能执行哪些操作 |

能连接不等于已配对，已配对不等于属于当前账号。App 退出登录也不等于系统自动删除蓝牙配对；设备解绑流程要协调 App、后端、固件与系统能提供的能力。

### 14.2、加密不自动等于身份安全

LE Secure Connections 与 Legacy Pairing 的安全机制不同；Just Works、Passkey、Numeric Comparison、OOB 的适用条件及身份保证也不同。特别是 Just Works 不能提供与经过认证配对方式相同的 MITM 防护，不能只看到“链路已加密”就宣布设备身份可信。[Bluetooth Security Manager](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core_v6.3/out/en/host/security-manager-specification.html)

产品应在设备 I/O 能力、配对方式、唯一设备密钥、初始绑定流程和用户操作之间做完整设计。设备无屏幕时，可以评估带设备身份信息的二维码或合适的 OOB 流程，不让 App 自己随意发明密码协议。[Bluetooth 安全与隐私建议](https://www.bluetooth.com/download/bluetooth-security-and-privacy-best-practices-guide/)

### 14.3、业务协议的安全最低线

- 用经过评审的认证与加密方案；CRC、简单异或、固定共享密码都不能替代认证。
- 重要操作验证设备身份与调用者权限，不能只看广播名或 UUID。
- 防重放使用会话上下文、nonce/计数器和经过认证的消息；计数器回绕、重启、重复发送都有规则。
- 配网凭据、健康数据、设备密钥不写明文日志，不放进可被周围设备直接读取的广播。
- App 中的密钥按合适的 Keychain 可访问性保存；重启未解锁、后台与迁移场景必须测试。
- 一台设备转让给新用户时，旧用户授权撤销与设备侧密钥更新要闭环。

本文实验没有业务认证，因此 `seq` 只用于关联，不提供跨会话防重放安全性。不能把这个协议直接用于真实门锁、医疗指令或支付相关操作。

## 十五、可穿戴与物联网的协议生态

### 15.1、可穿戴常见协议与数据

| 名称 | 用途 | 注意边界 |
| --- | --- | --- |
| Heart Rate Service | 心率测量与可选字段 | Flags 决定格式，不保证每台手表开放 |
| Battery Service | 电量等信息 | 数据能力以对应版本和设备实现为准 |
| Device Information Service | 厂商、型号、固件等 | 是设备自报信息，不等于可信身份认证 |
| 私有运动/睡眠协议 | 历史记录、运动模式、传感器原始值 | 必须拿厂商文档或 SDK |
| ANCS | 配件获取 iPhone 通知相关信息 | 由系统服务提供，不是 App 任意读取其他 App 通知 |
| AMS | 配件控制媒体并读取媒体状态 | 传递控制/元信息，不是把音频 PCM 塞进 GATT |

ANCS 中要区分“系统通知内容”与“GATT notification”；AMS 则面向媒体控制与状态。[Apple ANCS](https://developer.apple.com/library/archive/documentation/CoreBluetooth/Reference/AppleNotificationCenterServiceSpecification/Introduction/Introduction.html)、[Apple AMS](https://developer.apple.com/library/archive/documentation/CoreBluetooth/Reference/AppleMediaService_Reference/Introduction/Introduction.html)

### 15.2、历史数据同步比实时心率更难在哪里

实时值可以允许少量过期后丢弃；历史数据通常需要完整性和去重。例如手环离线记录三天运动数据，App 再连接时需要确认：

1、记录以什么稳定 ID 标识，设备重启是否重置序号。

2、分页按 offset、record ID 还是时间范围；开始同步后新数据插入是否影响分页。

3、手机成功存储后才提交 ACK/游标；不能在收到字节但尚未落盘时就让设备删除历史记录。

4、断线续传从哪个“已确认持久化”的游标恢复；数据库唯一约束或去重键如何处理重复包。

5、设备时间与手机时间不一致时，保存原始时间、设备 epoch 与换算依据，不静默覆盖成“现在”。

这是一种数据同步事务，不是把 Notify 连上就完成了。

### 15.3、BLE、Wi-Fi、MQTT、HTTP 分别站在哪一层

```text
近距离控制：App ← BLE GATT → 设备
云端遥测：  设备 ← Wi-Fi/蜂窝 + IP + TLS + MQTT → Broker/业务服务
手机同步：  App ← HTTPS → 后端
首次配网：  App ← BLE 安全配置通道 → 设备，设备再加入 Wi-Fi
```

MQTT 是发布/订阅消息协议，常见部署承载于 TCP/TLS；不是 Bluetooth 的下层协议。不能因为产品“用了 MQTT”就认为 iOS 应该从 `CBCharacteristic` 直接拿 MQTT 消息。若厂商专门定义了 MQTT 类内容的 BLE 隧道，那又是一份额外协议。[OASIS MQTT 5.0](https://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html)

CoAP 常用于受限设备的应用层通信，常见基础规范基于 UDP；与 HTTP、MQTT 一样，应先确认它处于设备到网关、设备到云，还是产品自定义隧道中。[IETF CoAP RFC 7252](https://www.rfc-editor.org/rfc/rfc7252)

### 15.4、Matter、Thread、Bluetooth Mesh 不是同一东西

| 技术 | 大致定位 | 与 BLE 的关系 |
| --- | --- | --- |
| Matter | 智能家居的 IP 应用层互操作标准 | BLE 常用于 commissioning；常规控制走相应 IP 网络 |
| Thread | 基于 IEEE 802.15.4 的低功耗 IPv6 mesh 网络 | 不是“蓝牙换一个名字” |
| Bluetooth Mesh | 蓝牙多对多网络体系 | 有自己的模型、密钥、配置与传输机制 |

Matter 常用 Wi-Fi、Thread、Ethernet；不能把“配网用了 BLE”写成“所有 Matter 控制都在 BLE GATT 上”。[CSA Matter 概览](https://csa-iot.org/wp-content/uploads/2024/02/Matter-Overview_2024.pdf)

手机接入 Bluetooth Mesh 常通过支持 GATT Proxy 的节点，由代理衔接 Mesh 消息；Core Bluetooth 只提供相关通信基础，App 还需要正确的 Mesh 协议实现和配置流程，不是连接很多 Peripheral 就叫 Mesh。[Bluetooth Mesh Proxy 说明](https://www.bluetooth.com/mesh-private-beacons/)

### 15.5、音频与大数据：什么时候不能只盯着 GATT

Classic 音频常见 A2DP、HFP，AVRCP 负责媒体控制相关功能；LE Audio 则使用 LE 等时通道及相关音频协议体系，LC3 是其重要编解码器。**“BLE 不能有音频”不准确；“会写 GATT 就能自制完整 LE Audio 通道”也不准确。** 普通 iOS 音频业务应从系统音频框架和平台支持能力出发。[Bluetooth LE Audio Specifications](https://www.bluetooth.com/learn-about-bluetooth/feature-enhancements/le-audio/le-audio-specifications/)

需要持续较大数据时，可评估设备支持的 L2CAP Credit-Based Connection-Oriented Channel（CoC）。Core Bluetooth 有 `openL2CAPChannel(_:)`，外设端也有发布通道接口；PSM、加密要求和服务发现方式必须由双方约定。它不是任意打开 Classic SPP 的后门，也不会自动解决文件校验、断点和业务 ACK。[Apple L2CAP API](https://developer.apple.com/documentation/corebluetooth/cbperipheral/openl2capchannel(_:))

### 15.6、C/C++ 在固件侧具体做什么

固件中的常见数据路径：传感器经 I²C/SPI 接到 MCU → 驱动采样 → 任务/中断传递数据 → 业务编码 → BLE 栈 GATT 通知。UART 可能是 MCU 与蓝牙模块之间的内部串口，不说明空口一定是 SPP。

固件工程常处理内存上限、任务优先级、Flash 写入时机与硬件中断；iOS 工程处理权限、App 生命周期和系统调度。两端可以共享 `JobsBLECodec.c`，但不能共享“直接操作某芯片寄存器”的平台代码。

可用 [**Zephyr Heart-rate Peripheral**](https://docs.zephyrproject.org/latest/samples/bluetooth/peripheral_hr/README.html) 学习 C 固件发布标准服务的结构。它需要支持的开发板/环境；本文没有编译某块开发板固件，也没有把生成的假心率当真实传感器测量。

## 十六、OTA / DFU：最容易低估风险的功能

### 16.1、OTA 不是“循环把 bin 文件 writeValue”

OTA 是 Over-The-Air 更新，DFU 是 Device Firmware Update。厂商升级协议、Bootloader、镜像布局、签名方案可能完全不同，不存在能升级所有 BLE 设备的通用 iOS Opcode。

```text
查询硬件/固件/电量
  → 校验升级包元数据和授权
  → 进入升级模式，必要时重连 Bootloader
  → 协商分片与恢复点
  → 传输并获取设备确认进度
  → 设备校验完整镜像及签名
  → 安全切换/重启
  → 重连并核实实际版本与启动状态
```

### 16.2、必须向固件团队确认的契约

- 包是否适配硬件版本与分区布局；签名由谁验证，是否有 anti-rollback 策略。
- 断电时能否回到旧版本；是否有双分区或其它可靠恢复方案。
- Bootloader 是否更换广播名/UUID/标识；如何确认还是同一物理设备。
- 分片序号与确认 offset 的语义：已进 RAM，还是已持久化 Flash。
- 支持断点续传吗；镜像 hash、传输 ID 与 offset 如何联合校验。
- 电量、充电状态、温度、存储不足、取消与用户离开页面如何处理。
- 升级失败后的售后恢复方式是否可操作。

### 16.3、App 能保证什么，不能替硬件保证什么

App 可以验证下载包、控制节奏、记进度、处理错误、展示阶段、重连核实。App 无法用一个进度条替 Bootloader 提供掉电安全；同样不能只用 CRC 代替固件签名。

应先在可恢复开发板或厂商授权设备上测试。本文不执行升级，不提供未知设备的刷机命令；生产前采用芯片/厂商实际 SDK 和明确版本的升级协议。

## 十七、日常生产：接需求、联调、日志与排障

### 17.1、接到需求当天，先向厂商索取这份清单

| 材料 | 至少包含 |
| --- | --- |
| 设备能力 | 芯片/型号/固件、BLE 或 Classic、支持手机版本 |
| 广播定义 | UUID、广播字段、可连接条件、工作模式 |
| GATT 表 | Service/Characteristic UUID、Properties、安全要求 |
| 业务协议 | 帧头、长度、端序、Opcode、字段、单位、错误码、版本 |
| 完整报文 | 一条真实请求、一条真实响应、逐字节注释与 CRC 参数 |
| 状态与时序 | 初始化、认证、订阅、命令间隔、超时、主动上报 |
| 可靠性 | 幂等、重试、序号、补传、断线与恢复规则 |
| 安全与绑定 | 身份材料、解绑、密钥更新、出厂重置语义 |
| 测试环境 | 样机、可复现固件、调试工具、日志方式、故障注入 |
| 升级与发布 | OTA SDK、签名、回滚、兼容矩阵、量产差异 |

如果只拿到“某个 UUID 和一张截图”，应明确缺少协议材料与交付风险。不要先写几千行连接代码，再发现设备实际上只提供 iAP2 或私有认证 SDK。

### 17.2、先用通用工具缩小问题范围

用 [**nRF Connect for Mobile**](https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-mobile) 等厂商调试工具确认：设备是否广播、能否连接、有哪些服务、订阅后是否真有数据、指定安全写入是否得到预期结果。选择工具以其当前平台功能为准；不要假设 iOS 版具有 Android 版全部能力。

工具能连而 App 不能，优先检查权限、过滤、对象生命周期、UUID、属性和订阅；工具也不能连，则优先确认设备模式、固件、距离、占用和射频环境。但这只是定位方向，不是充分证明“固件一定没问题”。

### 17.3、日志应当能重建事件顺序

```text
t=123.456 session=S7 device=hash:8af2 state=subscribing event=notify_ready
t=123.501 session=S7 request=R42 seq=17 dir=tx opcode=10 bytes=11 write=withResponse
t=123.540 session=S7 request=R42 event=att_write_ok
t=123.601 session=S7 request=R42 dir=rx opcode=90 bytes=12 result=business_ok
```

记录单调时钟耗时、session、request、状态转换、错误 domain/code、字节数、写入方式、固件与 App 版本。可控测试环境记录脱敏 HEX；生产默认限制长度、采样率、保存时长，并避免健康明文、凭据、密钥和原始身份信息。

`NSLog("连接失败")` 不够；完整保存 `CBError` 与 `CBATTError` 相关 domain/code，以及发生于扫描、连接还是写入阶段，才方便判断重试策略。

### 17.4、排障决策表

| 现象 | 第一批检查 | 进一步证据 |
| --- | --- | --- |
| 扫不到 | 权限、poweredOn、服务过滤、设备是否广播 | 通用工具、广播 HEX、设备模式 |
| 偶尔扫到 | 去重、后台/熄屏、广告间隔、射频 | 前后台对照、扫描持续时间 |
| 连接后立刻断 | 设备占用、安全要求、固件主动断开 | CBError、固件串口日志 |
| 找不到特征 | UUID、服务层级、固件版本、数据库变化 | 工具 GATT 树、服务失效回调 |
| 订阅后没数据 | 订阅回调、设备采样开关、认证、佩戴状态 | CCCD/固件状态、启动采样命令 |
| 写入成功但没效果 | ATT 与业务成功混淆、Opcode/端序/参数 | 原始请求与应答、seq 关联 |
| 大包丢失/截断 | 当前写入上限、设备接收窗口、分片规则 | 每片 offset、总长、端到端校验 |
| 重连后串数据 | 旧特征、旧 timer、旧 decoder、旧 ACK | session ID 与对象身份日志 |
| 电量消耗快 | 无限扫描、重复发现、频繁 UI、太多小包 | 真机能耗测试、固件电流测量 |
| OTA 卡在 100% | 100% 只是传输完成，尚未校验/切换 | Bootloader 阶段、重启后版本 |

### 17.5、测试金字塔

| 层次 | 重点 | 本文状态 |
| --- | --- | --- |
| Codec 单测 | 黄金报文、长度、CRC、非法输入 | 已运行 |
| 重组器单测 | 所有拆分点、噪声、坏 CRC、重置 | 已运行 |
| OC++ 桥接 | C ABI、碎片重组、输出内存独立 | 已运行 |
| SDK 编译检查 | Swift 并发标注、系统签名、OC/OC++ 语法 | 已运行 |
| 事务模拟 | ACK 先后、取消竞态、超时重试、队列上限 | 作为生产待补项，不冒充已测 |
| 双机无线 | 真正发现/连接/订阅/写入/ACK | 需按第九、十章真机联调 |
| 厂商与量产 | 真固件、升级、安全、长稳、功耗 | 待真实设备和协议明确后执行 |

先有可重复的测试数据，再有真机联调，再有跨机型长稳。三者互相补充，不能互相替代。

## 十八、FAQ：开发时最常遇到的问题

### 18.1、设备写“支持蓝牙 5.x”，我就能连接吗？

不能据此保证。还要确认 BLE/Classic、Profile、广播模式、GATT 服务、安全要求和手机公开 API。版本号只是部分信息，不是接入文档。

### 18.2、是不是必须先去系统设置里配对？

普通 BLE 场景通常直接从 App 扫描连接；访问要求安全的特征时，系统可能启动配对过程。按厂商协议和系统提示操作，不把系统列表当所有 BLE 设备的入口。

### 18.3、蓝牙权限被拒绝，是不是多扫描几次就好了？

不会。权限拒绝与没扫描到设备是不同错误。停止重试，解释功能为什么需要权限，提供合法的设置引导；不要无限弹提示或循环创建 manager。

### 18.4、设备名为空，可以把它过滤掉吗？

不建议仅凭名字过滤。名字可能不在当前广播内，也可能由系统缓存；优先按服务和厂商协议识别。生产设备身份还需要进一步认证。

### 18.5、iOS 拿不到 MAC，怎么记住设备？

本机重连可保留 `CBPeripheral.identifier`，业务身份则使用厂商协议提供且经过验证的稳定设备 ID。两者分开存；不要期待本机 UUID 在另一台手机上相同。

### 18.6、为什么 `didConnect` 后立刻写会失败？

连接只是链路建立。特征对象可能还没发现、权限未满足、通知未订阅、设备握手未完成。使用完整 ready 条件，而不是靠延迟两秒碰运气。

### 18.7、为什么调用 setNotifyValue 后没有数据？

先看订阅结果，再看设备是否需要启动采样、认证、佩戴或运动模式。订阅成功只表示更新通道准备好，不保证设备一定在生成新值。

### 18.8、能不能手工给 2902 写 `01 00`？

在 iOS Core Bluetooth 场景使用 `setNotifyValue` 让系统管理；不要照搬其它平台的 CCCD 写法。结果以订阅代理回调为准。

### 18.9、Notify 不可靠，换成 Indicate 就保证零丢失吗？

不能。Indicate 增加 ATT 层确认，不等于 App 数据已落盘；Notify 也不是无线层没有重传。历史完整性仍需要记录 ID、游标、补传和存储确认。

### 18.10、`didWriteValueFor` 成功了，为什么设备没执行？

可能写入的只是属性值，业务还在异步执行；也可能报文语义不对。需要按协议等待业务响应或查询状态。不能把 ATT 成功直接显示为“升级完成”。

### 18.11、Without Response 没回调，怎么判断失败？

它没有逐次 ATT 写入完成回调。先用系统可发送状态和设备流控约束发送，再用应用 ACK、累计 offset、总长度/hash 或最终查询判断业务完成情况。

### 18.12、每包 20 字节是不是最保险？

不是通用答案。浪费吞吐只是一个问题，更重要的是设备可能不支持你自行切片。先查询 API 上限，再按固件协议约定分包。

### 18.13、为什么所有 HEX 看起来对，数值却离谱？

检查十六进制字符串与真实字节、端序、UInt16/Int16、缩放单位、字段存在位、offset 和 CRC 范围。用逐字节注释的黄金报文对照。

### 18.14、蓝牙回调是不是每次对应一整条业务消息？

不一定，要看业务协议。标准特征通常有明确属性值格式；私有协议可能把逻辑消息分片或合并。不要把 TCP 的“字节流”结论强套到所有 GATT 特征。

### 18.15、可以同时向两台设备发命令吗？

可以设计多设备会话，但每台设备的队列、状态、特征引用、decoder 和超时必须隔离。目标并发量要实测，不能只依赖单设备 Demo 的经验。

### 18.16、断开后重新连接，旧的 Characteristic 还能用吗？

不要把旧对象当永远有效。按当前会话重新确认服务与特征，处理 `didModifyServices`；固件升级后尤其要防数据库改变。

### 18.17、后台模式开了，为何锁屏后行为还不同？

后台模式不是无限执行授权。系统版本、亮屏/熄屏、Live Activity、ASK、等待的蓝牙事件都影响行为。使用第十三章矩阵验证，不能用一个开关解释全部现象。

### 18.18、能不能定时发一个心跳让 App 永远不被挂起？

不能把心跳当绕过系统生命周期的保证。心跳应解决设备协议的存活判断，并评估功耗；后台执行与恢复遵循系统机制。

### 18.19、用户强退后，蓝牙一定不能再拉起 App 吗？

旧系统的限制不能直接推广到所有新版本。TN3115 对 iOS 26 与 ASK 条件有专门脚注；按对应版本的官方条件验证，不向产品承诺无条件恢复。[Apple TN3115](https://developer.apple.com/documentation/technotes/tn3115-bluetooth-state-restoration-app-relaunch-rules)

### 18.20、CRC 能防止别人伪造控制命令吗？

不能，CRC 没有秘密密钥，任何人都可以为修改后的内容重新计算。需要正确的身份认证、消息认证/加密、防重放与授权策略。

### 18.21、蓝牙连接加密了，还需要账号绑定吗？

通常需要。链路加密保护通信，业务绑定确定谁能控制哪台设备。设备转让、共享授权、退出登录与撤销权限都不由一次配对自动解决。

### 18.22、Swift Actor 能替代整个蓝牙状态机吗？

不能。Actor 管状态访问隔离，状态机管“当前事件在这个阶段是否允许”。Actor 的 await 点还可能让别的任务进入，业务顺序仍要显式管理。

### 18.23、为什么不直接使用厂商 SDK？

可以，而且有私有认证、算法或 OTA 时经常更合适。先核对许可证、支持平台、线程模型、最低系统、固件兼容、错误信息与维护质量，再用自有门面隔离 SDK；不要盲目重写，也不要完全失去诊断能力。

### 18.24、扫描工具能连，是不是代表已经可以上线？

只能证明特定环境下的一部分连通性。生产还要验证绑定、异常恢复、完整性、安全、长稳、功耗、升级和跨版本兼容。

### 18.25、没有硬件还能做哪些事？

可以做 Codec 单测、Mock 事务、录制回放、错误状态、UI、数据库去重与取消竞态。不能由此证明射频连接、真实设备行为和后台恢复已经成立。

### 18.26、现有 Demo 菜单写了“自动重连/OTA”，能直接对外承诺吗？

不能。要追到实际实现、调用路径与测试证据；配置字段、菜单标题和 Mock 输出都不等于能力实现。下一章面试时也应按这个原则描述个人经验。

## 十九、面试题：可直接说出口的回答与追问

### 19.1、你怎么理解 iOS 蓝牙开发？

**核心回答：**

> 我把它分成平台通信和设备业务两层。Core Bluetooth 负责扫描、连接和 GATT 操作；设备协议负责报文、认证、命令和结果。生产重点不是连上，而是如何让不稳定链路上的操作有明确状态、可取消、可诊断和可恢复。

**干货拆解：** Transport、Codec、Session、CommandScheduler、业务服务与 UI 分离；先与固件对齐 GATT 表和黄金报文，再做真实设备验证。

**追问：你会先问产品什么？**

答：具体设备和固件、标准还是私有协议、是否有 SDK、安全/绑定方式、数据量、后台目标、OTA 与验收机型。没有这些，不能承诺排期与兼容范围。

### 19.2、BLE 与经典蓝牙的区别是什么？

**核心回答：**

> 它们是不同的蓝牙技术体系和使用模式，不是简单的新旧替代。BLE 常用于低功耗传感与控制，Classic 常见于传统音频和既有 Profile。iOS 选框架要看设备实际开放的协议，不能只看蓝牙版本。

**干货拆解：** Core Bluetooth 的 GATT over BR/EDR 支持不能扩写成任意 SPP；LE Audio 也不能等同于普通 GATT 大包。

**追问：普通 BLE 配件是否必须 MFi？**

答：不因仅使用 BLE 就必须 MFi；是否使用 HomeKit、iAP2、Find My 等授权技术要另外核对。Bluetooth 和射频合规是另一条线。

### 19.3、GAP、GATT、ATT 有什么区别？

**核心回答：**

> GAP 主要规定设备如何发现、连接和承担角色；GATT 规定服务、特征与描述符如何组织和使用；ATT 是底层按属性进行读写与更新的通信协议。UUID 标识类型，Handle 定位属性实例。

**干货拆解：** 一个 Characteristic 不只是某个字节数组，还有属性和访问条件；Profile 与协议不能一概当 OSI 网络层。

**追问：Central 必然是 GATT Client 吗？**

答：不是，它们属于不同角色轴。常见手机读手环时恰好如此，但配件读取 iPhone ANCS 服务时，iPhone 是相应 GATT Server。

### 19.4、描述一次完整 BLE 通信流程。

**核心回答：**

> 等待蓝牙可用后扫描并选择设备，连接后发现目标服务与特征，校验属性与安全要求，订阅并确认成功，再做协议握手进入 ready。命令通过写特征发送，收到匹配的业务 ACK 后才完成，而不是 didConnect 就能操作。

**干货拆解：** 每个阶段有超时、取消与错误分类；强持有外设；断连清理旧特征和请求；在当前会话内验证回调来源。

**追问：为什么不在连接后延迟两秒再写？**

答：时间过去不代表必要步骤完成。慢设备可能没准备好，快设备又被人为延迟；应以系统与协议事件推进状态机。

### 19.5、Notify、Indicate、业务 ACK 有什么不同？

**核心回答：**

> Notify 没有 ATT 层确认，Indicate 有，但两者都不等于应用业务已执行或持久化。业务 ACK 是我们与固件定义的完成语义，要用请求序号和状态码匹配。是否丢数据，需要按最终业务完成点判断。

**干货拆解：** LL 重传、ATT 确认、业务执行、数据库提交的保证不能混用；历史数据靠游标与补传保证完整性。

**追问：想保证设备真的保存配置，你会怎么办？**

答：协议规定持久化完成应答，或者写入后查询验证；关键场景再做重启恢复测试，而不是只依赖 ATT Write Response。

### 19.6、为什么很多示例每包 20 字节？怎么优化？

**核心回答：**

> 常见默认 ATT MTU 为 23，一些常用 ATT 操作扣除三字节头后是 20 字节值。但它不是固定的 BLE 上限。iOS 应查询当前写入方式的 maximumWriteValueLength，再与固件协商分片和流控。

**干货拆解：** ATT MTU、链路包长和业务帧分开；提高单包有效数据、减少不必要确认/往返、正确背压、测量设备确认吞吐。

**追问：Without Response 是不是最快且最合适？**

答：它减少 ATT 响应往返，但仍受系统与设备流控约束，还要补业务完整性。短控制命令与大量文件传输的取舍不同。

### 19.7、你怎么设计命令队列和超时重试？

**核心回答：**

> 每台设备一个串行会话和命令调度器，记录请求 ID、序号、预期响应、deadline 与重试预算。超时、取消、断连、成功只能完成一次。重试前先判断命令幂等性，对结果未知的操作优先查状态或用幂等键。

**干货拆解：** 队列有容量和优先级；设备忙与权限失败采取不同策略；旧 timeout 通过 generation/session 校验失效。

**追问：设备已执行但 ACK 丢了，如何防止重复执行？**

答：设备按幂等键记录并返回原结果，或提供可靠查询/对账。只在 App 里去重不能防止设备重复执行。

### 19.8、后台蓝牙如何保证？

**核心回答：**

> 我不会承诺无限后台运行。按业务声明蓝牙后台模式，用状态保存与恢复处理系统事件，再持久化自己的任务状态。不同 iOS 版本、ASK、Live Activity、锁屏熄屏和用户操作会改变行为，需要明确测试矩阵。

**干货拆解：** manager 恢复不能依赖页面；系统恢复对象不等于业务任务恢复；iOS 26 新规则按 TN3115 和当前文档解释。

**追问：强退以后一定不能恢复吗？**

答：不能跨版本下绝对结论。旧版限制与 iOS 26 的 ASK 条件需区分，按官方表格脚注和目标版本实测；不能承诺普通 Demo 无条件被拉起。

### 19.9、配对成功是否就安全了？

**核心回答：**

> 配对解决的是一部分链路安全，不等于账号拥有设备，也不等于所有业务操作被授权。还要看配对方式的身份保证、设备认证、绑定和撤销、防重放，以及密钥保存与升级过程。

**干货拆解：** 连接、配对、Bonding、账号绑定分层；CRC 不是认证；广播名和 Service UUID 都不能证明设备身份。

**追问：设备没有屏幕，怎么做初始信任？**

答：根据硬件条件采用经过评审的 OOB、设备二维码/身份材料或厂商认证流程，明确用户在物理设备上的确认动作与密钥生命周期，不自创简易加密算法。

### 19.10、C/C++、OC、Swift 如何分工？

**核心回答：**

> C 适合字节协议与稳定 ABI，C++ 适合共享解析状态机和算法，OC/Swift 负责平台通信与 App 生命周期。是否共享内核看跨端复用需求，而不是蓝牙强制要求。Swift 可以经 C 接口、OC++ 门面，或启用 C++ interop 来集成。

**干货拆解：** 指针与长度成对传，所有权写清，公开接口避免不必要的 STL/ABI 耦合；C++ 异常在桥接边界消化。

**追问：把 NSData.bytes 存到 C++ 异步线程中安全吗？**

答：只有明确维持原对象和缓冲有效期、且访问符合并发约定时才可能成立。默认应复制或转移到自己拥有的缓冲，不保存短期借用指针。

### 19.11、如何保证三天历史数据同步不重不漏？

**核心回答：**

> 需要稳定记录 ID、清晰的分页快照语义、持久化游标和去重策略。手机先落盘再确认，断线从最后持久化确认的位置续传；同时保留设备时间和时钟换算依据，不能仅靠收到多少次 Notify 来计数。

**干货拆解：** 设备重启 epoch、序号回绕、新旧记录并发插入、手机数据库事务、云端重试分别设计。

**追问：手机已经存好，给设备的 ACK 丢了怎么办？**

答：设备可重发；手机依靠稳定去重键重复确认已存记录。协议设计要允许重复传输，最终做到业务层不重复落账。

### 19.12、OTA 怎么设计才可靠？

**核心回答：**

> OTA 是包含预检查、Bootloader 模式、分片传输、确认进度、镜像校验、切换重启和版本复核的状态机。断点进度以设备确认的持久化位置为准；掉电恢复和签名校验必须由固件升级机制支持，不能只靠 App。

**干货拆解：** 硬件版本、镜像签名、anti-rollback、断电、Bootloader 身份与最后成功点。

**追问：进度 100% 能不能提示升级成功？**

答：如果 100% 只代表字节传完，就不能。至少要完成设备校验/切换，并重连核对实际运行版本或协议定义的最终结果。

### 19.13、Actor 与串行队列怎么选？

**核心回答：**

> 小数据 Demo 可以统一主执行域，生产高频数据可用专用串行队列管理 Core Bluetooth，再把值快照交给业务 Actor。核心是一个可变状态明确归一个执行域；Actor 解决数据隔离，但跨 await 的业务顺序仍要状态机保护。

**干货拆解：** 不让非 Sendable 系统对象随意跨域；不以 `@unchecked Sendable` 掩盖设计；UI 更新有节流与主线程边界。

**追问：串行队列是不是等于整个 App 不会发生竞态？**

答：只对所有相关读写都走该队列的状态成立。旁路访问、取消/超时回调和跨队列引用都可能打破保证。

### 19.14、现场发现设备偶发连不上，你怎么排查？

**核心回答：**

> 先确认失败阶段，再用同设备同环境的通用工具建立对照。检查权限与系统状态、广播和过滤、设备占用、安全条件、服务发现、订阅和业务握手；日志保留 session、事件时间与错误 domain/code。必要时联合固件串口或链路分析定位。

**干货拆解：** 一次只控制一组变量：机型、系统、固件、距离、前后台。不能用“重启手机好了”作为根因结论。

**追问：你会直接把重连次数加到无限吗？**

答：不会，那会掩盖永久错误、耗电并拖慢用户退出。先分类错误，再设置退避、上限和用户可见的恢复入口。

### 19.15、没有正式蓝牙项目经验，面试怎么诚实表达？

**核心回答：**

> 我目前做过的是系统性学习和实验验证，还没有独立上线过量产蓝牙产品。我能解释 BLE/GATT 与业务协议分层，已经完成编解码、边界测试和双端实验代码；实际真机、厂商认证和 OTA 量产验证做到哪一步，我会明确说明。

**干货拆解：** 将“读过”“写过”“编译过”“真机跑过”“上线过”分开。本文交付时没有进行真实无线联调，所以此时不能把“完成实验代码”说成“已经双机联调成功”。

**追问：给你一个新设备，你会怎么推进？**

答：先拿协议与样机，用通用工具确认能力；再完成最小数据往返和黄金报文测试；然后补绑定、异常恢复、数据完整性、后台与功耗矩阵，按证据逐步验收。

<details>
<summary>面试官通常在验证什么</summary>

能否区分平台 API 与协议业务，能否把“提交成功”和“执行成功”分开，能否面对未知设备提出验证路径，是否理解数据所有权、后台和安全边界。方法名可以查询，缺少完成语义和排障方法才是生产风险。

</details>

## 二十、与 Jobs 现有工程衔接，以及学习计划

### 20.1、参照过的现有文档

- Swift：`JobsBaseConfig@JobsSwiftBaseConfigDemo/SwiftDoc.md/Swift相关经验.md/Swift相关经验.md`。
- OC：`JobsBaseConfig@JobsOCBaseConfigDemo/OCDoc.md/OC相关经验.md/OC相关经验.md`。

以上路径以用户提供的 `JobsBaseConfig` 目录为基准。参照重点是概念对比、原理、代码、边界说明，不改动原文。尤其沿用已有“原生最小代码用于理解系统差异，生产仍走 Jobs 封装”的教学分界。

### 20.2、现有 JobsBluetooth 能直接帮你学习什么

Swift 工程已有 `JobsByPods/JobsBluetooth@Pods`，其中 `JobsBluetoothProfile`、`JobsBluetoothCommand`、`JobsBluetoothManager`、`JobsBluetoothMockTransport` 分别体现设备配置、命令描述、平台连接与模拟输入。OC 老工程在 `OCBaseConfig/JobsMixFunc/JobsBluetooth` 中有对应能力；两侧都有 `Demo@JobsBluetooth`。

现有 Swift 配置入口示例，签名已按源码核对：

```swift
let profile = JobsBluetoothProfile()
    .byIdentifier("jobs-learning")
    .byServiceUUIDStrings(["78F10000-7D85-4B27-9C36-89A650C9B912"])
    .byWriteUUIDString("78F10001-7D85-4B27-9C36-89A650C9B912")
    .byNotifyUUIDString("78F10002-7D85-4B27-9C36-89A650C9B912")
    .byScanTimeout(10)

let mock = JobsBluetoothMockTransport()
    .byEnabled(true)
    .byLatency(0.15)

let manager = JobsBluetoothManager(profile: profile, mockTransport: mock)
    .onLog { print($0) }
    .onDataReceived { data, decoded in
        print(data.count, String(describing: decoded))
    }
```

宿主必须强持有 manager；这个片段展示 **现有 API 配置方式**，不是完整交付代码，也不调用 `startScan()` 自动触发无线操作。

OC 侧已核对 `byServiceUUIDStrings`、`byWriteUUIDString`、`byNotifyUUIDString`、`startScan()`、`connectIdentifier(uuid)`、`setNotifyEnabled(YES)` 等入口。实际接入按工程聚合头、工厂与 Block 体系，不臆造 Swift 和 OC 完全相同的构造器。

### 20.3、不要把已有声明当作生产实现

2026-08-30 对 **Swift 版当前源码** 的核对结果：

| 看起来存在的入口 | 实际应怎样理解 |
| --- | --- |
| `MockTransport.enabled` | 默认 true；看到模拟结果不等于真实蓝牙成功 |
| `connectTimeout` / `maximumReconnectCount` | Profile 存在字段，不代表 Manager 已按字段执行连接超时/自动重连 |
| Command 的 timeout/retry/matcher | 命令描述存在，不代表发送路径已经排队和匹配 ACK |
| `send(...completion:)` | 真实路径调用写入后立即返回成功空 Data，不是业务应答完成点 |
| Manager 的 ready | 当前在特征发现回调中转换，不能等同“必要特征齐全 + 订阅成功 + 认证完成” |
| Demo 的功能目录 | 菜单名字不能证明 OTA、恢复、自动分包等均已实现 |

这些是用于学习与规划生产改造的边界说明，**本手册没有修改现有组件，也没有把 Swift 的实现细节未经检查套到 OC 实现上**。生产加固应作为单独任务，在实际协议明确后同步处理源码、公开入口、Demo、README 和受影响工程。

### 20.4、五阶段学习练习

| 阶段 | 动手任务 | 你应该能解释 |
| --- | --- | --- |
| 第一阶段 | 手算并运行 `A5 5A` 黄金报文、修改 payload 触发 CRC 错误 | 字节、端序、长度、CRC |
| 第二阶段 | 两台 iPhone 跑 Swift 双机实验，换 OC Central 重跑 | 完整回调顺序与两层应答 |
| 第三阶段 | 用真实标准心率设备订阅 `2A37`，解析 Flags | 标准服务与私有协议区别 |
| 第四阶段 | 增加事务 Mock：迟到 ACK、取消、断连、重复包 | 状态机、幂等性与恢复 |
| 第五阶段 | 对接实际厂商设备，做后台/功耗/安全验收 | 从 Demo 到上线的工程边界 |

不要强行承诺“五天精通”。每阶段以能解释、能运行、能复现故障为完成标准。

## 二十一、Demo 目录、运行命令与验证声明

### 21.1、交付目录

```text
README.md
Demo/
├─ Makefile
├─ Common/JobsBLECodec.h + JobsBLECodec.c
├─ CPP/JobsFrameStream.hpp
├─ OC/
│  ├─ JobsOCCentralLab.h + JobsOCCentralLab.m
│  └─ JobsCodecBridge.h + JobsCodecBridge.mm
├─ Swift/
│  ├─ JobsLabFrame.swift
│  ├─ JobsHeartRate.swift
│  ├─ JobsBLECentralLab.swift
│  └─ JobsBLEPeripheralLab.swift
└─ Tests/
   ├─ main.cpp
   ├─ main.swift
   ├─ JobsCInteropTests.swift
   └─ BridgeTests.h + BridgeTests.mm
```

没有额外下载依赖，没有修改 Podfile，没有新建宿主 `.xcodeproj`。真机实验需要按第九、十章把对应文件加入临时 App。源码文件彼此用途明确，不要把测试程序与 App 混入同一个 target。

### 21.2、在 macOS 上重跑自动验证

先在终端进入本 `README.md` 所在目录。需要已安装并选中完整 Xcode；只运行本地编译和测试，不触发设备蓝牙，不申请签名，不下载固件：

```shell
make -C ./Demo test typecheck BUILD_DIR="$(mktemp -d /tmp/jobs-bluetooth-learning.XXXXXX)"
```

测试产物写入新建的系统临时目录，Makefile 不提供删除用户文件的清理目标。需要保留结果时记下终端打印的目录路径。

### 21.3、已验证与未验证

验证环境：Apple Swift 6.3.3、iPhoneOS 26.5 SDK、arm64 macOS。iOS 源码以 `arm64-apple-ios17.0` 做类型/语法检查；这是最低目标设置，不等于已在 iOS 17 真机执行。

- C/C++：`-Wall -Wextra -Werror`，启用 AddressSanitizer 与 UndefinedBehaviorSanitizer，测试程序运行通过。
- C 编解码：CRC 标准检查值、0…256 字节 payload、所有截断长度、单字节损坏、容量与空指针边界。
- C++：各 payload 长度的全部二段拆分点、连续帧、噪声、坏 CRC、非法长度、reset。
- Swift：Swift 6 模式与 warnings-as-errors；私有帧和标准心率解析测试运行通过，与 C 生成相同黄金报文。
- Objective-C++：桥接测试运行通过，验证分片重组、C ABI、NSData 输出所有权与 reset。
- Swift/C：实际链接 C 对象文件，验证 Swift 编码 → C 解码 → 独立 Data 输出的跨语言闭环。
- iOS：Swift Central/Peripheral、OC Central、OC++ 桥接和 C 编解码通过对应 SDK 类型/语法检查。

**未执行：** 两台真机无线联调、实际穿戴设备测试、运行时线程检查、后台恢复、射频/功耗、OTA、厂商认证、完整 App 构建与上架。没有把这些项目写成“已通过”。

### 21.4、面向真实产品的完成定义

至少同时满足：协议经双方确认、测试数据可复现、真实设备最小往返成立、异常与取消可控、权限/后台行为明确、数据完整性和安全方案经过验证、机型/固件兼容清单齐全。否则只能称为阶段性 Demo 或技术验证。

## 二十二、官方资料与继续阅读

### 22.1、Apple 平台

- [Core Bluetooth 总览及当前平台说明](https://developer.apple.com/documentation/corebluetooth)：公开对象模型与新系统说明。
- [Central 常见任务](https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/PerformingCommonCentralRoleTasks/PerformingCommonCentralRoleTasks.html)：扫描、连接、发现、读写；旧指南配合当前 SDK 使用。
- [Peripheral 常见任务](https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/PerformingCommonPeripheralRoleTasks/PerformingCommonPeripheralRoleTasks.html)：服务发布与请求处理。
- [后台处理指南](https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/CoreBluetoothBackgroundProcessingForIOSApps/PerformingTasksWhileYourAppIsInTheBackground.html)：基础后台与恢复模型。
- [TN3115 重新拉起条件](https://developer.apple.com/documentation/technotes/tn3115-bluetooth-state-restoration-app-relaunch-rules)：要连同脚注阅读。
- [iOS 26 Live Activity 与熄屏扫描说明](https://developer.apple.com/forums/thread/815189)：Apple 工程师对边界的补充。
- [AccessorySetupKit 官方实验](https://developer.apple.com/documentation/accessorysetupkit/setting-up-and-authorizing-a-bluetooth-accessory)：配件选择和授权。
- [WWDC19 Core Bluetooth](https://developer.apple.com/videos/play/wwdc2019/901/)：GATT over BR/EDR。
- [Apple 配件开发](https://developer.apple.com/accessories/) 与 [MFi FAQ](https://mfi.apple.com/en/faqs)：技术与项目边界。
- [ANCS 规范](https://developer.apple.com/library/archive/documentation/CoreBluetooth/Reference/AppleNotificationCenterServiceSpecification/Introduction/Introduction.html) 与 [AMS 规范](https://developer.apple.com/library/archive/documentation/CoreBluetooth/Reference/AppleMediaService_Reference/Introduction/Introduction.html)：通知、媒体控制相关服务。

### 22.2、协议与跨语言

- [Bluetooth LE Primer](https://www.bluetooth.com/bluetooth-resources/the-bluetooth-low-energy-primer/)：第一遍理解协议栈。
- [Bluetooth Core Specification 6.2](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core-62/out/en/index-en.html)：本文基础层次引用入口，不代表声称它是最新版本。
- [Bluetooth Assigned Numbers](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Assigned_Numbers/out/en/index-en.html)：标准 UUID 和标识。
- [Heart Rate Service](https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/HRS_v1.0/out/en/index-en.html)：心率 Flags、Energy 与 RR。
- [Bluetooth 安全与隐私建议](https://www.bluetooth.com/download/bluetooth-security-and-privacy-best-practices-guide/)：安全设计原则。
- [Swift 与 C++ 混编](https://www.swift.org/documentation/cxx-interop/)：避免沿用过时的跨语言结论。
- [Swift C/C++ 安全互操作](https://www.swift.org/documentation/cxx-interop/safe-interop/)：指针、所有权与安全边界。

### 22.3、设备与物联网生态

- [nRF Connect for Mobile](https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-mobile)：设备观察与联调工具。
- [Zephyr 标准心率外设](https://docs.zephyrproject.org/latest/samples/bluetooth/peripheral_hr/README.html)：固件端服务示例。
- [OASIS MQTT 5.0](https://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html)：云端消息协议。
- [IETF CoAP](https://www.rfc-editor.org/rfc/rfc7252)：受限设备应用协议。
- [CSA Matter 概览](https://csa-iot.org/wp-content/uploads/2024/02/Matter-Overview_2024.pdf)：Matter 与网络承载关系。
- [Bluetooth Mesh Proxy](https://www.bluetooth.com/mesh-private-beacons/)：手机接入 Mesh 的相关模型。
- [LE Audio 协议体系](https://www.bluetooth.com/learn-about-bluetooth/feature-enhancements/le-audio/le-audio-specifications/)：与普通 GATT 传感器业务区分。

> 最后记住一句话：蓝牙只是把数据送到另一端的基础能力。真正的工程质量，取决于你是否知道数据代表什么、谁有权使用它、何时算成功，以及失败后如何恢复。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
