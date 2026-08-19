# `JobsSwiftBlock`

`JobsSwiftBlock` 集中提供 Swift Block / closure 类型别名，并承接不能放在高层 UI Pod 的最低层创建 closure。

- `NSObject.jobsMake { object in ... }` 统一无参系统对象创建，原生 `init()` 只存在于该入口内部。
- `JSONDecoder.make { decoder in ... }` / `JSONEncoder.make { encoder in ... }` 为不继承 `NSObject` 的 Foundation 类提供同语义入口。
- `JobsSwiftDSL` 通过桥接文件公开转出本 Pod；底层 Pod 可以直接依赖 `JobsSwiftBlock`，避免为了创建对象反向依赖 `JobsByUIKit`。

创建完成后的属性、无参实例方法和单参实例方法不由本 Pod 承担，统一进入真实类型的 `JobsSwiftDSL.byXxx(...)`。
