# `JobsCryptoKit`

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

将数据编码、摘要、消息认证、对称加解密、密钥派生和 RSA 等能力按用途拆开。BaseCrypto 提供错误与数据辅助，具体算法文件完成各自操作，统一 AES 入口还负责识别带版本的加密数据封装。

### 1.2、运行脉络

准备数据和密钥参数 → 选择算法或统一封装入口 → 编码或加解密 → 返回数据或抛出错误

### 1.3、关键设计与边界

- 摘要、HMAC、加密和密钥派生解决的问题不同，不能把 MD5/SHA 摘要当作可解密的密文。
- 统一 AES 封装区分 AES-GCM 与兼容 AES-CBC-PKCS7 的版本；解密必须按版本解释 nonce/IV、密文和认证标签，不能只截取同样长度。
- CBC 兼容路径自身不提供完整性认证，不能在文档或重建代码中宣称它与 GCM 具有相同安全属性。
- 密钥、随机数、编码和错误传播属于接口契约；不要在 README 或重建示例中固定生产密钥。

### 1.4、阅读与重建顺序

先读 BaseCrypto 与统一 AES 封装格式，再看具体算法文件；按现有协议核对往返结果和错误路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [BaseCrypto.swift](<./BaseCrypto.swift>)
- [AESCBC.swift](<./AESCBC.swift>)
- [PBKDF2.swift](<./PBKDF2.swift>)
- [JobsCryptoKit@对称加解密/AESGCM.swift](<./JobsCryptoKit@对称加解密/AESGCM.swift>)
- [JobsCryptoKit@对称加解密/ChaChaPoly.swift](<./JobsCryptoKit@对称加解密/ChaChaPoly.swift>)

依赖与编译入口：[JobsCryptoKit.podspec](<./JobsCryptoKit.podspec>)。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
