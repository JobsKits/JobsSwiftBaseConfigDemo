# `JobsCryptoKit`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

## 🔥 <span id="前言">前言</span>

基于 [**CommonCrypto**](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/CCCrypt.3cc.html) 与 [**CryptoKit**](https://developer.apple.com/documentation/cryptokit) 提供编码、摘要、认证加密、密钥派生与 RSA。同步接口会抛出错误；密钥管理由宿主负责。

## 一、认证加密与兼容格式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 入口/版本 | 格式与系统 | 完整性 |
| --- | --- | --- |
| `JobsAES.encrypt` / `0x01` | iOS 13+：版本 + 12-byte nonce + ciphertext + 16-byte GCM tag | GCM 认证 |
| `JobsAES.encryptAuthenticatedCBC` / `0x03` | iOS 12+：版本 + 16-byte IV + PKCS7 ciphertext + 32-byte HMAC-SHA256 | 先认证再解密 |
| `JobsChaCha20Poly1305Box.encrypt` / `0x11` | iOS 13+：版本 + 12-byte nonce + ciphertext + 16-byte Poly1305 tag | AEAD 认证 |
| 显式 legacy / `0x02` | 版本 + 16-byte IV + PKCS7 ciphertext | 无认证，仅旧协议迁移 |

AES 默认在 iOS 12 写入 `0x03`；ChaCha 入口在 iOS 12 也写入 `0x03`。AES key 为 16/24/32 字节，ChaCha key 必须为 32 字节。`0x03` 使用不同上下文的 HMAC 从输入 key 派生独立加密 key 与 MAC key，覆盖版本、IV、密文，恒定次数比较标签后才解密。跨 iOS 12/13 存储使用 `encryptAuthenticatedCBC`；iOS 12 无法解读 GCM/ChaCha 格式。

## 二、旧数据迁移 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

默认 `decrypt` 接受认证格式，遇到 `0x02` 抛出 `CryptoError.unsupported`。旧调用签名保留，但未认证数据须显式选择兼容入口：

```swift
let plain = try JobsAES.decryptLegacyCBC(base64: legacyValue, key: key)
let migrated = try JobsAES.encryptAuthenticatedCBC(plaintext: plain, key: key)
```

`encryptLegacyCBC` 仅供必须维持 `0x02` 后端协议的边界；低层 `AESCBC` 保留原始 CBC + PKCS7 互操作能力。旧密文无法证明未被篡改，迁移前需依赖来源可信性或独立认证。MD5/SHA1 保留用于兼容校验，密码使用 PBKDF2，消息认证使用 HMAC，摘要不能替代认证加密。

## 三、参数与错误合同 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`PBKDF2.deriveKey` 默认 SHA256、100000 轮、32 字节；盐不能为空，派生长度 1...1024，轮数 1...UInt32.max。口令按完整 UTF-8 字节传入，包括嵌入 NUL；生产轮数应结合设备耗时选择，不在 UI 线程执行高轮数任务。随机字节数允许 0...1048576，0 返回空 Data，越界抛出错误。非法 Base64、密钥长度、IV、密文结构、认证标签和非 UTF-8 明文均返回错误；不把解码失败转换成成功空字符串。

源码：[BaseCrypto](./BaseCrypto.swift)、[PBKDF2](./PBKDF2.swift)、[AES](./JobsCryptoKit@对称加解密/AESGCM.swift)、[ChaCha](./JobsCryptoKit@对称加解密/ChaChaPoly.swift)、[AESCBC](./AESCBC.swift)。

## 四、回归与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

仓库 `../../.github/tests/JobsPodsUpgrade/Network/CryptoRegression.swift` 使用真实源码校验认证格式往返、版本/IV/密文/tag 篡改、错误 key、legacy 显式迁移、负数/超范围参数、非 UTF-8、嵌入 NUL 的 PBKDF2 参考向量。原生 macOS Swift 编译运行已通过；iOS Pod 与宿主编译由工程构建流程验证。算法调用不保管 key，不承诺密钥轮换、重放防护或业务鉴权。


## 五、生产交付与全量门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

生产源码排除 Tests / Test、Demo / Example、build / DerivedData、测试入口及临时文件；回归脚本位于宿主 `.github/tests/JobsPodsUpgrade`，不被 Pod 生产 target 编入。

本次没有为未使用所需理由 API 的模块机械添加空隐私清单；业务用途变化后再按实际调用核对。

从宿主根目录执行当前 Pod 单元验证：

```shell
ruby .github/tests/JobsPodsUpgrade/validate_builds.rb --pods JobsCryptoKit --skip-host
```

全量命令为 `ruby .github/tests/JobsPodsUpgrade/validate_builds.rb`：逐个自建 Pod 编译成功后才构建宿主 workspace。当前集成验证使用最低部署目标 iOS 15.6 / arm64 Simulator / Swift 5 语言模式；独立 Pod 更低部署目标、动态集成和真机行为需相应消费配置验证。编译日志、JSON 结果及行为回归边界见宿主根目录《JobsByPods升级与编译验收报告.md》，不能用 Parse 或 fixture 的成功替代真实模块 / App 编译。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
