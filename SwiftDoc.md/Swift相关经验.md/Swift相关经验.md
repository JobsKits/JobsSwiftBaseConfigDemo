# [**Swift**](https://www.swift.org/) 相关经验

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id="前言">前言</font>

> 以生产开发为主：先掌握概念、选型和边界，再复制示例验证。面试问答集中在末尾 <a href="#FAQ" style="color:red;font-weight:bold;">FAQ</a>。

本文使用 Swift 6 语言模式；示例默认未标注声明的隔离为 <font color="red"><b><code>nonisolated</code></b></font>。<font color="red"><b><code>Task.sleep(for:)</code></b></font> 等示例按 iOS 16+ 使用，低版本需替换对应 API。Swift 6.2+ 的隔离选项单独说明，避免把项目配置当成语言恒定规则。

示例用于独立验证语言机制，不依赖 Jobs UI 封装。合入工程时按类型拆文件、补 Jobs 文件头、接入既有 API。每个代码块独立使用；标明“接上例”的代码需合并前文定义。

[**SwiftUI 相关经验**](/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftUIBaseConfigDemo/SwiftUI相关经验.md/SwiftUI相关经验.md) 单独维护视图、状态包装器、布局和 UIKit 互操作；本文只保留通用语言知识。

| 查阅目标 | 入口 |
| --- | --- |
| 读懂语法与类型 | <a href="#语法" style="color:red;font-weight:bold;">语法</a>、<a href="#类型" style="color:red;font-weight:bold;">类型</a>、<a href="#闭包" style="color:red;font-weight:bold;">闭包</a> |
| 处理集合与接口 | <a href="#集合" style="color:red;font-weight:bold;">集合</a>、<a href="#泛型" style="color:red;font-weight:bold;">泛型与协议</a> |
| 处理异步与共享状态 | <a href="#Task" style="color:red;font-weight:bold;"><font color="red"><b>Task</b></font></a>、<a href="#Actor" style="color:red;font-weight:bold;">Actor</a>、<a href="#Combine" style="color:red;font-weight:bold;"><font color="red"><b>Combine</b></font></a> |
| 排查生产问题 | <a href="#内存" style="color:red;font-weight:bold;">内存</a>、<a href="#网络请求" style="color:red;font-weight:bold;">网络与 JSON</a>、<a href="#计时" style="color:red;font-weight:bold;">计时</a> |

## 一、<font id="语法">语法：先读懂声明</font>

### 1、<font id="关键字">关键字与符号速查</font>

| 写法 | 含义 |
| --- | --- |
| <font color="red"><b><code>let</code></b></font> / <font color="red"><b><code>var</code></b></font> | 不可重新赋值 / 可以重新赋值 |
| <font color="red"><b><code>func</code></b></font> / <font color="red"><b><code>return</code></b></font> | 定义函数 / 返回结果 |
| <font color="red"><b><code>struct</code></b></font> / <font color="red"><b><code>class</code></b></font> / <font color="red"><b><code>enum</code></b></font> / <font color="red"><b><code>actor</code></b></font> | 结构体 / 类 / 枚举 / 隔离状态的引用类型 |
| <font color="red"><b><code>protocol</code></b></font> / <font color="red"><b><code>extension</code></b></font> | 约定能力 / 补充能力 |
| <font color="red"><b><code>self</code></b></font> / <font color="red"><b><code>Self</code></b></font> | 当前实例 / 当前类型关系中的自身类型 |
| `T.Type` / <font color="red"><b><code>T.self</code></b></font> | 类型值的类型 / 把类型本身作为值传递 |
| `_` | 忽略值，或省略外部参数标签 |
| `->` / <font color="red"><b><code>in</code></b></font> | 返回类型 / 分隔闭包参数与闭包体 |
| `$0` / `$1` | 闭包的第一个 / 第二个参数，不限于单参数闭包 |
| `\(表达式)` | 字符串插值：把结果放进字符串 |
| `\.name` | KeyPath：描述从根值访问 `name` 的路径 |
| <font color="red"><b><code>is</code></b></font> / <font color="red"><b><code>as?</code></b></font> / <font color="red"><b><code>as!</code></b></font> | 检查类型 / 尝试转换 / 强制转换，失败崩溃 |
| `==` / `===` | 比较相等 / 判断两个类引用是否指向同一实例 |

代码围栏保持原生语法高亮；正文中的关键字使用红色加粗，跨章节概念通过固定 ID 跳转。

### 2、<font id="可选值">可选值：有值或无值</font>

`Int?` 是 `Optional<Int>` 的简写；本质是枚举，包含 <font color="red"><b><code>.some(值)</code></b></font> 和 `.none`。<font color="red"><b><code>nil</code></b></font> 表示无值，不等于 `0`、空字符串或 `NSNull`。

```swift
let input: String? = "42"
let number = input.flatMap(Int.init) // 有字符串才尝试转 Int；失败仍为 nil。
let displayed = number ?? 0         // nil 才使用默认值 0。

func printNumber(_ number: Int?) {
    guard let number else { return } // 没值提前结束；后面得到非可选 Int。
    print(number)
}

if let number {                     // 只在这个分支内使用解包后的值。
    print(number + 1)               // 43
}
```

可选链 `object?.method()` 在对象为空时跳过调用；强制解包 `value!` 要有可证明的不为空前提。外部输入、网络字段和用户数据使用安全解包。

### 3、<font id="where"><font color="red"><b>where</b></font>：追加条件</font>

运行时用在循环或模式匹配；编译期用在泛型约束。两者不能混为一类检查。

```swift
for number in 1...6 where number.isMultiple(of: 2) {
    print(number) // 2、4、6；只执行满足条件的循环体。
}

let point = (2, -2)
switch point {
/// 两个坐标互为相反数
case let (x, y) where x == -y:
    print("位于 y = -x 上")
/// 其它坐标
default:
    break
}

func equal<T>(_ lhs: T, _ rhs: T) -> Bool where T: Equatable {
    lhs == rhs // 编译器已知 T 支持相等比较。
}
```

### 4、<font id="访问控制">访问控制：限制使用范围</font>

| 关键字 | 范围 |
| --- | --- |
| <font color="red"><b><code>private</code></b></font> | 当前声明及同文件内该类型的扩展 |
| <font color="red"><b><code>fileprivate</code></b></font> | 当前源文件 |
| <font color="red"><b><code>internal</code></b></font> | 当前模块，默认级别 |
| <font color="red"><b><code>package</code></b></font> | 同一个 Swift Package 内的模块，需包身份配置 |
| <font color="red"><b><code>public</code></b></font> | 模块外可使用；不开放模块外继承或重写 |
| <font color="red"><b><code>open</code></b></font> | 类与类成员可在模块外继承或重写 |

<font color="red"><b><code>private(set)</code></b></font> 限制 setter，不影响已声明的读取范围。访问控制不负责线程安全。<font color="red"><b><code>open</code></b></font> 与 <font color="red"><b><code>public</code></b></font> 的区别存在于模块边界，不取决于库以源码还是二进制交付。

<a href="#FAQ-访问控制" style="color:red;font-weight:bold;">FAQ：<font color="red"><b>public</b></font> 与 <font color="red"><b>open</b></font></a>

## 二、<font id="类型">类型：先选值还是引用</font>

### 1、<font id="值与引用">结构体、类与枚举</font>

**值类型表达内容；引用类型表达共同持有的实例。** 选择语义，再测性能。

| 能力 | <font color="red"><b><code>struct</code></b></font> | <font color="red"><b><code>class</code></b></font> |
| --- | --- | --- |
| 赋值 | 得到独立的外层值 | 复制引用，仍指向同一实例 |
| 身份 | 不用 `===` 判断 | 用 `===` 判断 |
| 继承 | 不支持 | 单继承 |
| 修改自身 | 方法通常需 <font color="red"><b><code>mutating</code></b></font> | 修改实例属性不需 <font color="red"><b><code>mutating</code></b></font> |
| <font color="red"><b><code>let</code></b></font> | 不能修改值的存储属性 | 引用不能换，实例中的可变属性仍可改 |
| 生命周期 | 普通可复制值没有 <font color="red"><b><code>deinit</code></b></font> | 类可在 <font color="red"><b><code>deinit</code></b></font> 清理资源 |
| 共通能力 | 属性、方法、下标、初始化、泛型、协议、扩展 | 同左 |

```swift
struct Profile {
    var name: String
}

var original = Profile(name: "Jobs")
var copied = original
copied.name = "New"
print(original.name) // Jobs：修改副本不影响原值。

final class ProfileBox {
    var name = "Jobs"
}

let first = ProfileBox()
let second = first
second.name = "New"
print(first.name)       // New：两个引用指向同一对象。
print(first === second) // true
```

<font color="red"><b><code>enum</code></b></font> 表达有限状态；关联值保存当前状态的数据，原始值用于固定编码。避免用多个布尔值表达互斥状态。

```swift
enum LoadState {
    case idle
    case loading
    case loaded([String]) // 关联值：这一次加载得到的数据。
    case failed(String)
}

enum HTTPMethod: String {
    case get = "GET"     // 原始值：case 的固定编码。
    case post = "POST"
}
```

模型、参数、快照优先使用结构体；需要身份、继承、共享生命周期时使用类；需要共享可变状态隔离时评估 <a href="#Actor" style="color:red;font-weight:bold;">Actor</a>。非可复制类型 `~Copyable` 有单独的所有权与析构规则，不套用普通结构体的复制结论。

### 2、<font id="元组">元组：临时组合多个值</font>

```swift
func measure(_ text: String) -> (count: Int, isEmpty: Bool) {
    (text.count, text.isEmpty)
}

let result = measure("Swift")
print(result.count)   // 5；命名字段比 result.0 更明确。
print(result.isEmpty) // false
```

一次性返回多个值使用元组；跨多处复用、需要方法或协议遵循时定义结构体。元组比较受元素能力与工具链支持约束；不能仅因两个元组形状相同就认定支持所有比较协议。

### 3、<font id="static-final"><font color="red"><b>static</b></font> 与 <font color="red"><b>final</b></font></font>

<font color="red"><b><code>static</code></b></font> 表示成员属于类型；<font color="red"><b><code>final</code></b></font> 禁止类继承或类成员重写；类中可重写的类型方法使用 <font color="red"><b><code>class func</code></b></font>。

```swift
class Formatter {
    static let separator = ","        // 类型属性，不需要创建实例。
    class func title() -> String { "默认" } // 允许子类 override。
    final func version() -> Int { 1 }   // 子类不能重写。
}

final class CSVFormatter: Formatter {  // 禁止继续继承这个类。
    override class func title() -> String { "CSV" }
}
```

| 语言 | <font color="red"><b><code>static</code></b></font> | <font color="red"><b><code>final</code></b></font> |
| --- | --- | --- |
| Swift | 类型成员 | 禁止继承 / 重写 |
| Java | 类成员 | 禁止继承 / 重写，或限制变量再次赋值 |
| C / C++ | 静态存储期或内部链接；C++ 也有类静态成员 | C 没有；C++ 可限制派生 / 虚函数重写 |

这些声明不等于指定栈、堆或常量池位置。

### 4、<font id="Any-AnyObject"><font color="red"><b>Any</b></font> 与 <font color="red"><b>AnyObject</b></font></font>

<font color="red"><b><code>Any</code></b></font> 可保存任意类型的值；<font color="red"><b><code>AnyObject</code></b></font> 限定类实例。两者都不承诺具体成员，需要已知能力时优先使用具体类型、泛型或协议。

```swift
import Foundation

let values: [Any] = [42, "Jobs", (x: 1, y: 2)]
for value in values {
    if let number = value as? Int { // 转换成功才使用 Int 的能力。
        print(number + 1)
    }
}

let boxed: AnyObject = 42 as NSNumber // 桥接成对象，不是 Int 变成类。
let optional: Int? = nil
let stored: Any = optional as Any    // 明确保存 Optional，而非先解包。
```

所有类满足 <font color="red"><b>AnyObject</b></font>；协议继承 <font color="red"><b>AnyObject</b></font> 后可用于弱引用。值类型桥接或装箱后成为对象表示，不代表原类型能遵循类专属协议。

### 5、<font id="OC互操作">Objective-C 互操作</font>

[**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 中的结构体是 C 聚合值；不能像 Swift 结构体一样声明方法、泛型或协议遵循。`CGPoint` 等 C 结构体可被 Swift 导入；任意自定义 Swift 结构体不能直接变成 <font color="red"><b><code>@objc</code></b></font> 对象。

需要公开复杂行为时使用 `NSObject` 包装类；需要共享简单二进制数据时使用明确的 C 接口。`NSValue` 是对象包装，不会赋予 C 结构体 Swift 的类型能力。

<a href="#FAQ-值类型" style="color:red;font-weight:bold;">FAQ：值类型与引用类型</a>

## 三、<font id="内存">内存：区分语义、布局与生命周期</font>

### 1、<font id="内存区域">内存区域与执行上下文</font>

| 区域 | 用途 |
| --- | --- |
| 代码区 | 可执行机器指令 |
| 数据区 / BSS | 静态存储；传统映像中分别承载已初始化数据与零初始化数据 |
| 栈 | 调用记录、局部数据等；随调用推进分配与回收 |
| 堆 | 动态分配、生命周期可能跨越当前调用的数据 |

**值类型不等于栈，引用类型也不能作为物理分配位置的绝对判断。** 编译器可优化、消除复制或装箱；结构体字段也能持有堆对象。不同平台的段布局和增长方向不作为业务依据。

**上下文＝继续执行所需的信息。** 同步调用可能涉及参数、局部状态、返回地址和寄存器；闭包捕获的数据可比原函数活得更久；异步任务在挂起后仍需保存恢复位置与局部状态。

### 2、<font id="字节对齐">字节对齐：起始地址满足倍数要求</font>

对齐值为 `4`，起始地址需满足 `4` 的倍数。编译器为此可能在成员之间或末尾填充字节。

```swift
struct Packet {
    let count: UInt32
    let flag: UInt8
}

print(MemoryLayout<Packet>.size)      // 常见结果 5：有效布局长度，包含内部填充。
print(MemoryLayout<Packet>.alignment) // 常见结果 4：起始地址的对齐要求。
print(MemoryLayout<Packet>.stride)    // 常见结果 8：连续存放时相邻起点的间距。
```

`size` 不含末尾为了下一个元素补齐的字节；`stride` 包含尾部补齐。以上数值只代表对应构建的结果。`MemoryLayout` 不递归统计字符串缓冲区或引用指向对象的总内存，普通 Swift 布局也不自动成为 C ABI 合同。

### 3、<font id="COW">Copy-on-Write：共享到写入前</font>

标准库 `Array`、`Dictionary`、`String` 等值类型可共享底层存储；写入时若需要保持其他值不变，再分离存储。自定义结构体不会仅因使用了 <font color="red"><b><code>struct</code></b></font> 就自动实现所有引用字段的深拷贝。

```swift
var source = [1, 2]
var copy = source       // 语义上独立，物理缓冲区暂时可能共享。
copy.append(3)          // 修改 copy，source 必须保持原内容。
print(source)           // [1, 2]

final class Item { var count = 0 }
let list = [Item()]
let copiedList = list
copiedList[0].count = 9  // 修改的是共享 Item 对象，不是替换数组元素。
print(list[0].count)    // 9；数组复制不等于元素对象深拷贝。
```

COW 不保护多个任务对同一个数组变量的并发写入。跨域传递仍按 <a href="#Sendable" style="color:red;font-weight:bold;"><font color="red"><b>Sendable</b></font></a> 与隔离规则处理。

### 4、<font id="ARC">ARC：管理强引用，不自动打破环</font>

强引用保留对象；<font color="red"><b><code>weak</code></b></font> 不保留对象，对象释放后变成 <font color="red"><b><code>nil</code></b></font>；<font color="red"><b><code>unowned</code></b></font> 不保留对象，访问时要求对象仍存活，否则可能崩溃。

```swift
final class EventOwner {
    var onFinish: (() -> Void)?
    var count = 0

    func bind() {
        onFinish = { [weak self] in // owner 持有闭包，闭包弱持有 owner。
            self?.count += 1       // owner 已释放就跳过，避免强引用环。
        }
    }
}
```

根据持有关系选择捕获方式；没有环时不机械添加弱引用。<font color="red"><b><code>guard let self</code></b></font> 会在后续使用范围内建立强引用，跨长时间等待时要评估持有时长。内存中的强引用环与数据结构中的环不是同一个问题。

<a href="#FAQ-内存" style="color:red;font-weight:bold;">FAQ：布局与存储位置</a> · <a href="#FAQ-COW" style="color:red;font-weight:bold;">FAQ：COW 与深拷贝</a> · <a href="#FAQ-ARC" style="color:red;font-weight:bold;">FAQ：闭包循环引用</a>

## 四、<font id="闭包">函数与闭包：把行为作为值传递</font>

### 1、<font id="函数类型">函数类型与闭包简写</font>

**闭包＝可携带上下文的代码块。** 可以保存、传参或返回；和 Objective-C Block 用途相近，不是标准 C 的普通函数指针。

```swift
func add(_ lhs: Int, _ rhs: Int) -> Int { lhs + rhs }

var operation: (Int, Int) -> Int = add // 两个 Int 输入，一个 Int 输出。
print(operation(2, 3))                 // 5
operation = { $0 * $1 }                // 换成相同签名的闭包。
print(operation(2, 3))                 // 6

let full: (Int) -> String = { (value: Int) -> String in
    return "值：\(value)"              // 完整声明，in 后是执行体。
}
let named: (Int) -> String = { value in "值：\(value)" }
let short: (Int) -> String = { "值：\($0)" }
```

类型能推断时省类型，单表达式可省 <font color="red"><b><code>return</code></b></font>，匿名参数可用 `$0`、`$1`。多行闭包仍可使用匿名参数；复杂转换优先命名，避免多层 `$0` 难以辨认。

| Objective-C Block | Swift 函数类型 |
| --- | --- |
| `void (^)(void)` | `() -> Void` |
| `void (^)(NSString *)` | `(String) -> Void` |
| `int (^)(int, int)` | `(Int, Int) -> Int` |

### 2、<font id="尾随闭包">尾随闭包：把末尾闭包放到括号外</font>

```swift
func transformAndSort<T>(
    _ input: [T],
    using transform: (T) -> String,
    sorter: (String, String) -> Bool
) -> [String] {
    input.map(transform).sorted(by: sorter)
}

let result = transformAndSort([2, 1], using: { number in
    "编号\(number)"             // 每个 Int 转为 String。
}, sorter: { left, right in
    left < right              // 升序；比较规则必须一致，不能用 <=。
})
print(result)                 // ["编号1", "编号2"]

let doubled = [1, 2].map { $0 * 2 } // 最后一个闭包参数的尾随写法。
```

多个尾随闭包中，第一个可省标签，后续闭包保留标签。可读性优先于省字符数量。

### 3、<font id="逃逸与捕获">逃逸与捕获</font>

<font color="red"><b><code>@escaping</code></b></font> 表示闭包参数可能在函数返回后继续存在；不等于异步、后台执行或一定发生循环引用。普通非可选闭包参数默认非逃逸。

```swift
final class CallbackStore {
    private var callback: (() -> Void)?

    func save(_ callback: @escaping () -> Void) {
        self.callback = callback // 保存到属性，生命周期超出 save 调用。
    }

    func fire() {
        callback?()
        callback = nil           // 一次性回调执行后释放。
    }
}

func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1 // 捕获并保留 count；工厂返回后仍可修改。
        return count
    }
}

let counter = makeCounter()
print(counter()) // 1
print(counter()) // 2
```

`[value]` 显式按捕获时的值建立绑定；捕获的值若是类引用，仍指向同一对象。Swift 修改捕获变量不需要 Objective-C 的 `__block`；OC Block 修改外部局部标量时通常需要 `__block`。

### 4、<font id="自动闭包">autoclosure：把表达式延后求值</font>

```swift
func log(_ enabled: Bool, message: @autoclosure () -> String) {
    guard enabled else { return }
    print(message()) // 到这里才计算传入的表达式。
}

log(false, message: "结果：\(Array(1...3))") // 不生成 message 字符串。
```

用于短路、断言、轻量日志；不隐藏网络和磁盘副作用。<font color="red"><b><code>@autoclosure</code></b></font> 与 <font color="red"><b><code>@escaping</code></b></font> 是不同维度。

### 5、<font id="mutating-inout"><font color="red"><b>mutating</b></font> 改自身，<font color="red"><b>inout</b></font> 改传入变量</font>

```swift
struct Counter {
    var value = 0

    mutating func increment() {
        value += 1 // 修改值类型自身，需要 mutating。
    }
}

func increment(_ value: inout Int) {
    value += 1     // 修改调用方交来的变量。
}

var counter = Counter()
counter.increment()            // let counter 不能调用此 mutating 方法。
increment(&counter.value)      // & 表示传入可修改的存储位置。
print(counter.value)           // 2
```

<font color="red"><b><code>inout</code></b></font> 按“读入、修改、写回”理解；实现可优化为直接访问，不等于允许任意保存裸指针。访问期间要满足独占规则，不把同一变量重叠传给多个可修改参数，也不让逃逸闭包保留它。

<a href="#FAQ-闭包" style="color:red;font-weight:bold;">FAQ：逃逸、捕获与简写</a> · <a href="#FAQ-mutating" style="color:red;font-weight:bold;">FAQ：<font color="red"><b>mutating</b></font> 与 <font color="red"><b>inout</b></font></a>

## 五、<font id="集合">集合：变换、筛选与展开</font>

### 1、<font id="数组">数组、集合与字符串</font>

`Array` 有序且可重复；`Set` 去重但不保证遍历顺序；`Dictionary` 按键取值。`[Int?]` 可以保存 <font color="red"><b><code>nil</code></b></font>，Objective-C 数组需使用 `NSNull` 等对象占位。

```swift
let values: [Int?] = [1, nil, 3]
let numbers = Array(1...3)          // [1, 2, 3]；把序列收集成数组。
let unique = Set([3, 1, 3])        // 去重；不要依赖打印顺序。
let ordered = unique.sorted()     // [1, 3]；显式确定顺序。

let text = "A👨‍👩‍👧‍👦"
print(text.count)                  // 2 个 Character，不是 2 个字节。
print(text[text.startIndex])       // A；String 不用整数下标直接索引。
let characters = Array(text)      // [Character]，不是 UTF-8 字节数组。
```

数组下标越界会崩溃；优先用 `first`、`last` 或验证索引。`ArraySlice` 保留原索引并可能持有原缓冲区；长期保存小切片时评估转换为独立数组。大量先进先出操作不要反复 `removeFirst()` 搬移元素。

### 2、<font id="map">map：逐个转换，保留数量</font>

```swift
let numbers = [1, 2, 3]
let squares = numbers.map { number in // 每次收到一个 Int。
    number * number                  // 这个表达式成为对应的新元素。
}
print(squares)                       // [1, 4, 9]；原数组不变。

let inputs = ["1", "x", "3"]
let attempted = inputs.map(Int.init)       // [Int?]：[1, nil, 3]。
let successful = inputs.compactMap(Int.init) // [Int]：[1, 3]；去掉转换失败项。
let selected = numbers.filter { $0 > 1 }   // [2, 3]；筛选，元素类型不变。
```

`compactMap` 只去掉转换得到的 <font color="red"><b><code>nil</code></b></font>，不会自动删掉 `0` 或空字符串。

### 3、<font id="joined">joined：连接字符串，或展开一层序列</font>

```swift
let names = ["Jobs", "Swift"]
let title = names.joined(separator: " / ") // String："Jobs / Swift"。

let pages = [[1, 2], [3], [4, 5]]
let flattened = pages.joined()             // 展开一层；尚未创建新的 Array。
for number in flattened { print(number) }  // 可以直接遍历，无需先转数组。
let saved = Array(flattened)               // 需要 [Int] 时再收集。
print(saved)                              // [1, 2, 3, 4, 5]

let expanded = pages.flatMap { page in
    page.map { $0 * 10 }                   // 每页先转换成一组结果。
}                                         // 再把各组展开一层。
print(expanded)                           // [10, 20, 30, 40, 50]
```

嵌套序列的 `joined()` 返回扁平化序列视图；字符串序列的连接重载返回字符串。`flatMap` 是“转换后展开一层”，不是递归展开所有层级。

### 4、<font id="集合链">组合处理：保留每一步的类型</font>

```swift
let inputs: [String?] = ["hello world", nil, "swift is fun", "", "  "]

let words = inputs
    .compactMap { $0 }                    // [String]：只去 nil。
    .flatMap { text in                    // 每个字符串产生若干 Substring。
        text.split(separator: " ")       // 默认已忽略空片段，无需再 filter。
    }                                    // [Substring]：合并所有拆词结果。
    .map(String.init)                     // [String]：独立保存，不长期依赖原字符串。

let summary = words.joined(separator: ", ") // String：用逗号连接。
print(summary) // hello, world, swift, is, fun

let counts = words.reduce(into: [String: Int]()) { result, word in
    result[word, default: 0] += 1          // 原位累计到结果字典，统计词频。
}
print(counts["swift", default: 0])         // 1
```

只执行副作用时用循环或 `forEach`；需要结果才用 `map`。`forEach` 内的 <font color="red"><b><code>return</code></b></font> 只结束当前闭包调用；需要 <font color="red"><b><code>break</code></b></font>、<font color="red"><b><code>continue</code></b></font> 或跨步骤控制时用 <font color="red"><b><code>for</code></b></font>。惰性链用 <font color="red"><b><code>.lazy</code></b></font> 可推迟计算，但最终收益需测量。

### 5、<font id="同步序列">同步序列：每次计算下一个值</font>

Swift 普通函数没有 Dart 风格的 `sync**` / <font color="red"><b><code>async**</code></b></font> 生成器语法。用 `Sequence` / `IteratorProtocol` 或 `sequence(state:next:)` 逐项产生值。

```swift
let evens = sequence(state: 0) { current -> Int? in
    guard current <= 6 else { return nil } // nil 表示序列结束。
    defer { current += 2 }                 // 交出当前值后，推进下次状态。
    return current                        // 每次迭代只生成一个元素。
}
print(Array(evens))                        // [0, 2, 4, 6]
```

<font color="red"><b><code>Task.yield()</code></b></font> 是给调度器一次机会；`AsyncStream.Continuation.yield(_:)` 是发送事件；底层访问器中的 `yield` 又属于协程访问语法。不要仅凭同名就套用其他语言的生成器规则。

<a href="#FAQ-map" style="color:red;font-weight:bold;">FAQ：map / compactMap / flatMap</a> · <a href="#FAQ-joined" style="color:red;font-weight:bold;">FAQ：joined 返回类型</a>

## 六、<font id="泛型">泛型与协议：表达类型关系</font>

### 1、<font id="类型参数化">泛型：类型参数化</font>

把具体类型换成参数 `T`，同一份逻辑便能处理多种类型；重复出现的 `T` 表示同一个类型关系。

```swift
func echo<T>(_ value: T) -> T {
    value // 输入什么类型，就返回同一个 T 类型。
}

let number: Int = echo(42)
let name: String = echo("Jobs")

func same<T: Equatable>(_ lhs: T, _ rhs: T) -> Bool {
    lhs == rhs // 约束 T 支持 ==，函数体才可以比较。
}
print(same(1, 1)) // true；Int 与 String 不能在这里同时充当同一个 T。
```

| 约束 | 含义 |
| --- | --- |
| `T: P` | T 遵守协议 P |
| `T: BaseClass` | T 是指定类或其子类 |
| `T: A & B` | 同时具备两种能力 |
| <font color="red"><b><code>where T.Element: Hashable</code></b></font> | 元素支持哈希 |
| <font color="red"><b><code>where L.Value == R.Value</code></b></font> | 两个关联类型必须相同 |

泛型函数体只使用约束保证的能力；调用方知道 T 是具体类型，不表示函数体能无条件访问该类型独有的属性。

### 2、<font id="协议">协议：能力清单</font>

<font color="red"><b><code>protocol</code></b></font> 列出必须提供的入口；具体类型实现入口；调用方只依赖清单。编译器检查声明的遵循关系，不根据“碰巧有同名方法”自动认定遵循。

```swift
protocol MessageChannel {
    var name: String { get }            // 要求能读，不规定如何存储。
    func send(_ text: String) -> String // 要求具备这个调用入口。
}

struct SMSChannel: MessageChannel {
    let name = "短信"                  // let 存储属性也满足 get 要求。
    let limit = 70
    func send(_ text: String) -> String { "短信：\(text)" }
}

struct MailChannel: MessageChannel {
    var name: String { "邮件" }         // 计算属性同样满足 get 要求。
    func send(_ text: String) -> String { "邮件：\(text)" }
}

func notify(using channel: any MessageChannel) {
    print(channel.send("订单已完成"))  // 依赖协议，不依赖短信的内部实现。
}
notify(using: SMSChannel())             // 模拟发送，只打印，不联网。
```

协议可用于函数参数、服务属性、工厂返回值、容器元素、泛型约束和组合能力。类、结构体、枚举与 Actor 都可遵循适用协议。

| 协议要求 | 实现规则 |
| --- | --- |
| <font color="red"><b><code>var name: String { get }</code></b></font> | 至少可读，可用存储属性或计算属性；允许实现额外可写 |
| <font color="red"><b><code>var name: String { get set }</code></b></font> | 必须可读写，不能仅提供 <font color="red"><b><code>let</code></b></font> |
| <font color="red"><b><code>static func make() -&gt; Self</code></b></font> | 类型方法；类按是否可重写选择 <font color="red"><b><code>static</code></b></font> 或 <font color="red"><b><code>class</code></b></font> |
| <font color="red"><b><code>mutating func advance()</code></b></font> | 允许值类型修改自身；类实现不写 <font color="red"><b><code>mutating</code></b></font> |
| <font color="red"><b><code>init(text: String)</code></b></font> | 可按约定创建；非 <font color="red"><b>final</b></font> 类通常以 <font color="red"><b><code>required init</code></b></font> 满足 |
| <font color="red"><b><code>subscript(index: Int) -&gt; String { get }</code></b></font> | 提供下标入口；索引合法性仍由接口约定 |
| <font color="red"><b><code>func load() async throws -&gt; Value</code></b></font> | 调用方准备处理等待与错误 |

协议本体不分配存储，也不实现计算属性；它声明 getter / setter 要求。实现体写在具体类型或协议扩展中。

### 3、<font id="关联类型"><font color="red"><b>associatedtype</b></font>：协议中的类型占位</font>

泛型由使用处确定类型参数；关联类型由遵循者确定。**同一个遵循关系里的同名关联类型必须一致。**

```swift
protocol Store<Value> {                 // 把 Value 列为主关联类型。
    associatedtype Value: Equatable    // 真正声明类型占位与约束。
    func load() -> Value
}

struct NameStore: Store {
    func load() -> String { "Jobs" }    // 推断 Value == String。
}

struct DefaultNameStore: Store {
    typealias Value = String           // 也可显式声明，含义相同。
    func load() -> String { "Jobs" }
}

func valuesMatch<L: Store, R: Store>(_ lhs: L, _ rhs: R) -> Bool
where L.Value == R.Value {              // 容器可以不同，读出的值必须同型。
    lhs.load() == rhs.load()
}

print(valuesMatch(NameStore(), DefaultNameStore())) // true
let store: any Store<String> = NameStore()          // 隐藏存储器类型，固定输出 String。
print(store.load())                                // Jobs
```

`Store<Value>` 不是让协议变成普通泛型结构体；它允许使用处约束指定关联类型。关联类型也不是枚举的关联值：前者约定类型，后者保存某次枚举实例的数据。

<a href="#FAQ-关联类型" style="color:red;font-weight:bold;">相关 FAQ</a>

### 4、<font id="some-any"><font color="red"><b>some</b></font>、<font color="red"><b>any</b></font> 与泛型</font>

| 写法 | 类型由谁确定 | 适用场景 |
| --- | --- | --- |
| `<T: P>` | 调用方通过实参确定 | 需要命名并复用类型关系 |
| 参数 <font color="red"><b><code>some P</code></b></font> | 调用方确定，是隐式泛型参数 | 参数只有一处使用，不需要给类型命名 |
| 返回 <font color="red"><b><code>some P</code></b></font> | 实现方确定一个底层类型 | 隐藏实现名称，同时保留类型关系 |
| <font color="red"><b><code>any P</code></b></font> | 运行时保存某个遵循 P 的值 | 混合容器、可替换服务、不同类型的分支返回 |

接前面的渠道定义：

```swift
func echoChannel<C: MessageChannel>(_ channel: C) -> C {
    channel                           // 输入输出保持同型。
}
let sms = echoChannel(SMSChannel())
print(sms.limit)                      // 返回类型仍是 SMSChannel。

func label(_ channel: some MessageChannel) -> String {
    channel.name                      // 参数 some 是泛型简写。
}

func defaultChannel() -> some MessageChannel {
    SMSChannel()                      // 这个声明固定返回一种底层类型。
}

var current: any MessageChannel = SMSChannel()
current = MailChannel()               // 静态类型没变，内部换成另一种实现。
let channels: [any MessageChannel] = [SMSChannel(), MailChannel()]
print(channels.map(\.name))           // ["短信", "邮件"]

if let sms = current as? SMSChannel {
    print(sms.limit)                  // 转换成功后才有具体类型的独有能力。
}
```

返回 <font color="red"><b><code>some P</code></b></font> 的普通函数不能在不同分支随意返回两个不相关类型。两个独立参数 <font color="red"><b><code>some P</code></b></font> 也不代表同型；需要同型就重复使用同一个 T。

<font color="red"><b><code>any</code></b></font> 保留动态类型和协议能力，但不保留所有静态同型关系。因此两个独立的 <font color="red"><b><code>any Equatable</code></b></font> 不能直接用 `==` 比较。现代 Swift 能在部分泛型调用中临时打开存在类型；不代表 <font color="red"><b><code>any P</code></b></font> 在所有位置都等价于具体遵循者。

存在类型容器可能内联保存小值，也可能间接存储大值；不保证每次都分配堆对象。泛型也不保证永远静态派发或零分配，性能依据真实热点测量。

### 5、<font id="协议扩展">协议扩展、组合与条件遵循</font>

```swift
protocol Describable {
    func summary() -> String          // 写进要求，允许通过协议入口多态替换。
}

extension Describable {
    func summary() -> String { "默认" }
    func hint() -> String { "扩展工具" } // 只在扩展中，不是协议要求。
}

struct Report: Describable {
    func summary() -> String { "报告" }
    func hint() -> String { "具体工具" }
}

let report = Report()
let abstract: any Describable = report
print(abstract.summary()) // 报告：走协议要求对应的实现。
print(abstract.hint())    // 扩展工具：扩展独有方法不形成同样的多态入口。
print(report.hint())      // 具体工具：具体类型直接调用。

struct Box<Value> { let value: Value }
extension Box: Equatable where Value: Equatable {} // 条件遵循，可合成 ==。
print(Box(value: 1) == Box(value: 1))               // true
```

<font color="red"><b><code>protocol Downloadable: Named, Cancellable</code></b></font> 声明继承多份能力清单；`T: Named & Cancellable` 在当前使用处组合约束。协议继承不继承存储。

### 6、<font id="代理协议">代理与隔离边界</font>

```swift
protocol DownloadDelegate: AnyObject {  // 限制为引用类型，才能使用 weak。
    func didFinish()
}

final class Downloader {
    weak var delegate: (any DownloadDelegate)?
}

protocol CountReading: Sendable {
    func read() async -> Int            // 允许跨隔离域调用。
}

actor CountStore: CountReading {
    private var value = 0
    func read() -> Int { value }        // Actor 的同步隔离实现可满足异步要求。
}
```

Actor 的可变状态不能随意满足同步非隔离读取要求；应设计异步协议、全局 Actor 协议，或确实不读隔离状态的 <font color="red"><b><code>nonisolated</code></b></font> 实现。

需要被 Objective-C 调用时才使用 <font color="red"><b><code>@objc</code></b></font> 协议；可选要求使用 <font color="red"><b><code>@objc optional</code></b></font>，调用时检查方法是否存在。关联类型、泛型方法和多数纯 Swift 类型能力不能直接桥接。纯 Swift 代码优先使用协议要求与默认实现。

<a href="#FAQ-泛型" style="color:red;font-weight:bold;">FAQ：泛型</a> · <a href="#FAQ-协议" style="color:red;font-weight:bold;">FAQ：协议</a> · <a href="#FAQ-some-any" style="color:red;font-weight:bold;">FAQ：<font color="red"><b>some</b></font> 与 <font color="red"><b>any</b></font></a> · <a href="#FAQ-协议派发" style="color:red;font-weight:bold;">FAQ：默认实现派发</a>

## 七、<font id="属性与初始化">属性、初始化与扩展</font>

### 1、<font id="属性">属性：存储、计算与观察</font>

| 形式 | 职责 | 边界 |
| --- | --- | --- |
| 存储属性 | 保存值 | <font color="red"><b><code>let</code></b></font> 固定，<font color="red"><b><code>var</code></b></font> 可修改 |
| 计算属性 | 通过 getter / setter 访问 | 不因为声明了 getter 就自动缓存 |
| <font color="red"><b><code>willSet</code></b></font> / <font color="red"><b><code>didSet</code></b></font> | 在赋值前 / 后处理变化 | 不等于所有初始化赋值都会触发 |
| <font color="red"><b><code>lazy var</code></b></font> | 第一次访问时初始化 | 不保证并发首次访问只执行一次 |
| <font color="red"><b><code>static let</code></b></font> | 类型级按需初始化一次 | 只保证初始化，不保证实例后续可变状态安全 |

```swift
struct Rectangle {
    var width: Double
    var height: Double
    var area: Double { width * height } // 每次访问计算，没有独立 area 存储。
}
```

### 2、<font id="属性包装器">属性包装器：复用属性读写逻辑</font>

`wrappedValue` 是外部读写的值；`projectedValue` 是包装器额外提供的能力，通过 `$属性名` 访问；`_属性名` 是合成的底层包装器存储，通常只在类型内部使用。

```swift
@propertyWrapper
struct Clamped {
    private var value: Int
    private let range: ClosedRange<Int>

    var wrappedValue: Int {
        get { value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }
    var projectedValue: ClosedRange<Int> { range }

    init(wrappedValue: Int, _ range: ClosedRange<Int>) {
        self.range = range
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
}

struct Volume {
    @Clamped(0...100) var value = 50 // 编译器经包装器读写 value。
}

var volume = Volume()
volume.value = 200                  // 调用 wrappedValue 的 setter。
print(volume.value)                // 100：已经限制在范围内。
print(volume.$value)               // 0...100：读取 projectedValue。
```

属性包装器不等于 Objective-C 关联对象；它使用编译器合成的存储与访问入口。<font color="red"><b><code>@MainActor</code></b></font> 是隔离标记，<font color="red"><b><code>@Observable</code></b></font> 是宏，不能把所有 `@` 都叫包装器。

### 3、<font id="初始化">初始化：建立可用实例</font>

类可以有多个指定初始化器；每条路径都必须完成自身存储属性初始化，并在需要时调用父类指定初始化器，不要求所有路径最终汇入同一个指定初始化器。

```swift
class Person {
    let name: String

    required init(name: String) { // required 要求子类保持这条创建入口。
        self.name = name
    }

    convenience init() {         // 便捷入口向同类其他初始化器委托。
        self.init(name: "Jobs")   // 最终抵达本类的指定初始化器。
    }
}

final class Employee: Person {
    let identifier: Int

    init(name: String, identifier: Int) {
        self.identifier = identifier // 先完成当前类新增存储。
        super.init(name: name)       // 再向父类指定初始化器委托。
    }

    required init(name: String) {
        self.identifier = 0
        super.init(name: name)
    }
}

struct PositiveNumber {
    let value: Int
    init?(_ value: Int) {             // 可失败初始化，返回 Optional<Self>。
        guard value > 0 else { return nil }
        self.value = value
    }
}
print(PositiveNumber(-1) == nil)      // true
```

非可选存储必须先有值，实例才能进入正常使用阶段。<font color="red"><b><code>convenience</code></b></font> 仅用于类；结构体与枚举没有父类初始化链。结构体在主声明中新增自定义初始化器可能失去自动成员初始化器；放到扩展中可保留符合条件的自动入口。

### 4、<font id="extension"><font color="red"><b>extension</b></font>：补能力，不补实例存储</font>

```swift
struct Score { let value: Int }

extension Score {
    var passed: Bool { value >= 60 } // 计算属性，不增加实例字段。

    init(clamping value: Int) {
        self.init(value: min(max(value, 0), 100))
    }
}

print(Score(clamping: 120).value) // 100
print(Score(value: 60).passed)    // true；原自动成员初始化器仍在。
```

扩展可添加方法、计算属性、下标、嵌套类型和协议遵循；不能增加实例存储属性或随意重写已有实现。类扩展可添加便捷初始化器，不添加指定初始化器。不要重声明标准库已有签名，再从内部调用同名初始化器造成递归。

### 5、<font id="单例">单例：统一入口，另管状态安全</font>

```swift
@MainActor
final class AppSession {
    static let shared = AppSession() // 初始化一次，使用同一实例。
    private init() {}                // 外部不能直接创建。
    var displayName = ""             // 本例由 MainActor 保护后续读写。
}
```

<font color="red"><b><code>static let</code></b></font> 不会给实例自动加锁。跨任务业务状态使用 Actor 或完整同步方案；测试需要替换实现时，优先注入依赖，避免所有业务硬编码 `.shared`。

<a href="#FAQ-初始化" style="color:red;font-weight:bold;">FAQ：初始化委托</a> · <a href="#FAQ-包装器" style="color:red;font-weight:bold;">FAQ：包装器与宏</a> · <a href="#FAQ-扩展" style="color:red;font-weight:bold;">FAQ：扩展存储</a> · <a href="#FAQ-单例" style="color:red;font-weight:bold;">FAQ：单例线程安全</a>

## 八、<font id="Task">异步与 <font color="red"><b>Task</b></font>：管理工作及生命周期</font>

### 1、<font id="async-await"><font color="red"><b>async</b></font> 可挂起，<font color="red"><b>await</b></font> 标出等待位置</font>

同步调用执行完才返回；异步调用允许中途挂起。并发是交错推进，并行是同时执行；线程是执行资源，<font color="red"><b>Task</b></font> 是运行时调度的工作单元。

```swift
func loadName() async throws -> String {
    try await Task.sleep(for: .milliseconds(10)) // 挂起任务，不阻塞线程。
    return "Jobs"                               // 模拟结果，不发网络请求。
}

func printName() async {
    do {
        let name = try await loadName() // await：可能挂起；try：可能抛错。
        print(name)                     // 结果回来以后继续。
    } catch {
        print(error)                    // 处理失败，包含取消造成的错误。
    }
}
```

<font color="red"><b><code>await</code></b></font> 不保证每次都挂起，也不保证切线程；<font color="red"><b><code>async</code></b></font> 不会自动把耗时同步代码搬离主 Actor。[**Swift 并发语义**](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/) 中的挂起恢复由运行时调度，代码应依赖隔离保证。

### 2、<font id="Task生命周期"><font color="red"><b>Task</b></font>：从同步入口启动异步流程</font>

接上例的 `loadName()`：

```swift
@MainActor
final class NameModel {
    private(set) var name = ""
    private(set) var errorMessage: String?
    private var loadingTask: Task<Void, Never>? // 保存句柄，便于明确取消。
    private var revision = 0                   // 区分新旧加载。

    func reload() {
        loadingTask?.cancel()                  // 请求旧任务退出。
        revision += 1
        let requestRevision = revision
        errorMessage = nil

        loadingTask = Task { [weak self] in     // 继承此处的 MainActor 隔离。
            do {
                let result = try await loadName()
                try Task.checkCancellation()   // 即使服务返回，也拒绝已取消结果。
                guard let self, self.revision == requestRevision else { return }
                self.name = result             // 仍在 MainActor 更新状态。
            } catch {
                guard !Task.isCancelled,
                      let self, self.revision == requestRevision else { return }
                self.errorMessage = String(describing: error)
            }
        }
    }

    func stop() {
        revision += 1                          // 使旧请求立即失去提交资格。
        loadingTask?.cancel()
        loadingTask = nil
    }
}
```

页面离开或业务结束时调用 `stop()`。丢弃 <font color="red"><b>Task</b></font> 句柄不会自动取消任务；取消也不撤销已经完成的外部副作用。弱捕获放到等待之后再解包，避免为了等待而一直强持有模型。

<font color="red"><b><code>Task {}</code></b></font> 是非结构化任务，通常继承创建点的 Actor、优先级和 <font color="red"><b>Task</b></font> Local；它不是父任务自动管理的结构化子任务。<font color="red"><b><code>Task.detached</code></b></font> 不继承这些上下文，只有确需独立边界时使用，并自行管理取消与结果。

### 3、<font id="结构化并发">结构化并发：子任务不离开作用域</font>

固定数量使用 <font color="red"><b><code>async let</code></b></font>；动态数量使用任务组。退出作用域前等待子任务结束；取消是请求，仍需子任务响应。

```swift
func loadPart(_ name: String) async throws -> String {
    try await Task.sleep(for: .milliseconds(10))
    return name
}

func loadDashboard() async throws -> [String] {
    async let profile = loadPart("资料") // 先启动，不在这里等结果。
    async let messages = loadPart("消息")
    return try await [profile, messages] // 一起等待；结果按表达式位置组织。
}
```

任务组按完成顺序交付结果；需要输入顺序时携带索引。以下限制同时在途任务数量，避免一次创建数万个任务：

```swift
func loadTitles(_ ids: [Int], limit: Int = 4) async throws -> [String] {
    guard limit > 0, !ids.isEmpty else { return [] }
    return try await withThrowingTaskGroup(of: (Int, String).self) { group in
        var next = 0
        var result = Array(repeating: "", count: ids.count)

        for _ in 0..<min(limit, ids.count) {
            let index = next
            let id = ids[index]
            group.addTask {
                try Task.checkCancellation()
                return (index, "标题\(id)") // 模拟异步任务的结果。
            }
            next += 1
        }

        while let (index, title) = try await group.next() {
            result[index] = title           // 完成顺序不固定，按原索引放回。
            if next < ids.count {
                let index = next
                let id = ids[index]
                group.addTask {
                    try Task.checkCancellation()
                    return (index, "标题\(id)")
                }
                next += 1                   // 完成一个，再补一个。
            }
        };return result
    }
}
```

子任务抛错后，错误要经过 `next()`、异步遍历等被观察；不能概括为“任一子任务抛错就立刻停止所有任务”。错误传播出任务组作用域时会取消剩余子任务并等待退出。

### 4、<font id="取消">取消与超时：主动检查，明确退出</font>

- `cancel()` 设置取消请求；<font color="red"><b><code>Task.isCancelled</code></b></font> 读取状态，<font color="red"><b><code>Task.checkCancellation()</code></b></font> 抛出取消错误。
- 长 CPU 循环在合适粒度检查取消；使用 <font color="red"><b><code>Task.sleep</code></b></font> 等可取消等待，不用 `Thread.sleep` 阻塞并发线程。
- 以任务组竞速实现超时时，即使超时任务先完成，组退出仍需等待另一任务；不响应取消的工作无法保证立即停止。
- 网络超时、总业务截止时间与任务取消分开设计；处理重试时核对幂等性。

### 5、<font id="Continuation">Continuation：把一次回调接成异步返回</font>

```swift
func legacyLoad(_ completion: @escaping (Result<String, Error>) -> Void) {
    completion(.success("Jobs")) // 教学回调；真实旧 API 可能稍后调用。
}

func loadWithAsync() async throws -> String {
    try await withCheckedThrowingContinuation { continuation in
        legacyLoad { result in
            continuation.resume(with: result) // 成功返回值，失败抛出错误。
        }
    }
}
```

每条路径必须且只能恢复一次；遗漏会一直等待，重复恢复会触发错误。Continuation 不自动把 <font color="red"><b>Task</b></font> 取消传给旧 API；需要专门接线。多次回调用 <a href="#AsyncStream" style="color:red;font-weight:bold;">AsyncStream</a>，不反复恢复同一个 Continuation。

### 6、<font id="并发迁移">旧并发 API 的迁移方向</font>

| 旧能力 | 对应方向 |
| --- | --- |
| completion Block | <font color="red"><b><code>async throws</code></b></font> |
| 固定多请求与 Dispatch Group | <font color="red"><b><code>async let</code></b></font> |
| 动态批量任务 | <font color="red"><b>Task</b></font> Group，并限制并发数量 |
| 私有队列保护共享属性 | Actor，保留业务状态机 |
| 主队列 UI 更新 | <font color="red"><b><code>@MainActor</code></b></font> |
| 多次 delegate / notification | AsyncSequence、<font color="red"><b>Combine</b></font> 或保留原接口 |
| Operation 依赖图、KVO、暂停恢复 | 按能力保留，不能只做语法替换 |
| 信号量等待异步回调 | 沿调用链改异步，避免阻塞桥接 |

<a href="#FAQ-Task" style="color:red;font-weight:bold;">FAQ：<font color="red"><b>Task</b></font> 与线程</a> · <a href="#FAQ-结构化" style="color:red;font-weight:bold;">FAQ：结构化任务</a> · <a href="#FAQ-取消" style="color:red;font-weight:bold;">FAQ：取消与超时</a> · <a href="#FAQ-Continuation" style="color:red;font-weight:bold;">FAQ：回调桥接</a>

## 九、<font id="Actor">Actor：隔离共享可变状态</font>

### 1、<font id="Actor入门">声明、访问与返回快照</font>

**Actor＝自带隔离边界的引用类型。** 多个任务可以持有同一个 Actor；同一实例的隔离代码不会同时读写其状态。它有属性、方法、初始化器、协议和 ARC 生命周期，但不参与普通类继承。

```swift
struct DownloadSnapshot: Sendable {
    let completed: Int             // 两个字段都可安全跨隔离域传递。
    let totalBytes: Int
}

actor DownloadLedger {
    nonisolated let name: String   // 固定且安全的元数据，不访问可变账本。
    private var ids: Set<String> = []
    private var totalBytes = 0

    init(name: String) {
        self.name = name
    }

    func record(id: String, bytes: Int) {
        guard bytes >= 0, ids.insert(id).inserted else { return }
        totalBytes += bytes        // 去重与累计之间没有 await，整体提交。
    }

    func snapshot() -> DownloadSnapshot {
        DownloadSnapshot(completed: ids.count, totalBytes: totalBytes)
    }
}

func useLedger() async {
    let ledger = DownloadLedger(name: "资源包") // 一个共享账本实例。
    print(ledger.name)                          // nonisolated 固定信息可同步读取。
    await ledger.record(id: "A", bytes: 100)   // 外部跨隔离域调用，需要 await。
    let old = await ledger.snapshot()           // 一次取回相互一致的字段。
    await ledger.record(id: "B", bytes: 200)
    let new = await ledger.snapshot()
    print(old.completed, old.totalBytes)        // 1 100；旧快照不会跟着变化。
    print(new.completed, new.totalBytes)        // 2 300
}
```

`record()` 没有声明 <font color="red"><b><code>async</code></b></font>，外部仍需要 <font color="red"><b><code>await</code></b></font>，因为调用要进入另一个隔离域。同一 Actor 内部调用自己的同步方法不需要等待；同类型的另一个 Actor 实例仍是另一个隔离域。

外部不能直接赋值隔离属性；修改通过方法完成。相关字段一次返回快照，避免两次 <font color="red"><b><code>await</code></b></font> 取到不同时间点的数据。账本只做短状态操作，大文件处理放到合适的执行边界。

<a href="#FAQ-Actor-await" style="color:red;font-weight:bold;">相关 FAQ</a>

### 2、<font id="Actor重入">可重入：等待期间，共享状态仍可变化</font>

**Actor 保护一次连续的隔离执行片段，不自动把跨等待的完整流程变成事务。**

```swift
actor CouponStore {
    private var remaining = 1

    func claim(
        verify: @Sendable () async throws -> Bool // 注入异步资格检查。
    ) async throws -> Bool {
        guard remaining > 0 else { return false } // 提前拒绝，减少无效请求。
        let allowed = try await verify()          // 等待期间，其他调用可改库存。
        try Task.checkCancellation()
        guard allowed, remaining > 0 else { return false } // 恢复后重新确认。
        remaining -= 1                            // 最终检查与扣减之间不再等待。
        return true
    }
}
```

去掉等待后的库存检查，会允许以下顺序：

| 步骤 | 调用 A | 调用 B | 库存 |
| --- | --- | --- | ---: |
| 1 | 检查通过，等待资格 | 尚未进入 | 1 |
| 2 | 仍在等待 | 检查通过，等待资格 | 1 |
| 3 | 仍在等待 | 恢复并扣减 | 0 |
| 4 | 恢复后直接扣减 | 已完成 | -1 |

过期的是“已经确认有库存”的判断，不一定是读取了旧数字。任务恢复从等待后继续，不会自动重跑前面的 <font color="red"><b><code>guard</code></b></font>。这属于逻辑竞态，不需要两个隔离片段并行执行。

若业务要求先留名额，改为“检查并预留 → 等待 → 确认或补偿”；失败、取消、切账号时用请求 ID / 会话版本防止重复补偿。跨设备库存由服务端原子操作、事务和幂等控制；客户端 Actor 只管本进程内该实例。

### 3、<font id="Actor去重">合并请求：先登记 <font color="red"><b>Task</b></font>，再等待结果</font>

仅保存最终缓存不足以阻止重复请求：第一次请求等待时，第二次仍可能读到空缓存。保存正在执行的任务，让同一 key 的调用共同等待。

```swift
actor NameRepository {
    private var cache: [Int: String] = [:]
    private var inFlight: [Int: Task<String, Error>] = [:]
    private let loader: @Sendable (Int) async throws -> String

    init(loader: @escaping @Sendable (Int) async throws -> String) {
        self.loader = loader
    }

    func name(id: Int) async throws -> String {
        if let value = cache[id] { return value }
        if let task = inFlight[id] {
            return try await task.value       // 已有请求，复用其结果。
        }

        let loader = self.loader
        let task = Task { try await loader(id) }
        inFlight[id] = task                   // 先登记；这一行之前没有挂起。
        defer { inFlight[id] = nil }          // 只有创建者负责成功 / 失败清理。
        let value = try await task.value      // 等待时允许其他调用进来查表。
        cache[id] = value
        return value
    }
}

func useRepository() async throws {
    let repository = NameRepository { id in
        try await Task.sleep(for: .milliseconds(10))
        return "用户\(id)"                    // 模拟加载器。
    }
    async let first = repository.name(id: 1)
    async let second = repository.name(id: 1)
    print(try await [first, second])          // ["用户1", "用户1"]，共用一次加载。
}
```

本例由仓库持有共享请求。单个等待者取消不会自动取消共享 <font color="red"><b>Task</b></font>，也不保证立即结束等待。生产接入需明确取消策略、缓存容量和失效策略；增加清空、强刷、登出功能时，加入请求 ID / 会话版本校验，防止旧请求写回缓存或清掉新任务。

### 4、<font id="Sendable"><font color="red"><b>Sendable</b></font>：跨隔离域传值的安全契约</font>

**<font color="red"><b>Sendable</b></font> 承诺安全传递，不自动加锁、深拷贝或切线程。** 值类型需检查成员；普通类通常需不可变且满足更严格限制；Actor 依靠隔离保护状态。

```swift
public struct Progress: Sendable { // 明确向使用者提供安全传递契约。
    public let completed: Int
    public let total: Int
}

func accept<T: Sendable>(_ value: T) {}

func checkContract() {
    accept(Progress(completed: 1, total: 3))
}
```

在这个非 frozen 的公开结构体例子里，删掉 <font color="red"><b><code>: Sendable</code></b></font> 后不能满足 <font color="red"><b><code>T: Sendable</code></b></font>。某些内部结构体会自动推断遵循，删掉字面声明也可能仍通过。公开契约、隐式推断与某次跨域数据流检查要分开理解。

<font color="red"><b><code>@Sendable</code></b></font> 用于函数 / 闭包类型，捕获也需满足并发安全。<font color="red"><b><code>@unchecked Sendable</code></b></font> 是由实现者承担安全证明的承诺，不能用于掩盖可变类的并发读写。现代隔离分析还允许某些非 <font color="red"><b>Sendable</b></font> 值被单向转移，不代表它们可任意共享。

### 5、<font id="nonisolated"><font color="red"><b>nonisolated</b></font>：不进入所属 Actor 的隔离</font>

适合固定标识、纯计算和不依赖隔离状态的同步协议实现；不能直接访问隔离可变属性。同步非隔离函数不会自动转到后台。

```swift
actor Meter {
    nonisolated let name = "下载"
    private var completed = 0

    nonisolated func label() -> String {
        "任务：\(name)"             // 只读取安全的非隔离数据。
        // 不能在这里读取 completed；改成隔离方法并由外部 await。
    }

    func completedCount() -> Int { completed }
}
```

Swift 6.2+ 开启 `NonisolatedNonsendingByDefault` 后，非隔离异步函数默认保留调用方 Actor；旧配置的执行规则不同。明确要求离开调用方 Actor 执行耗时异步函数时，使用支持版本中的 <font color="red"><b><code>@concurrent</code></b></font>。这仍不承诺专属线程。[**异步函数隔离规则**](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md)

### 6、<font id="MainActor"><font color="red"><b>MainActor</b></font>：统一 UI 状态的隔离归属</font>

```swift
@MainActor
final class ProgressModel {
    private(set) var completed = 0

    func apply(_ snapshot: DownloadSnapshot) {
        completed = snapshot.completed // 页面状态只在 MainActor 修改。
    }
}

func refresh(_ model: ProgressModel, from ledger: DownloadLedger) async {
    let snapshot = await ledger.snapshot() // 先从业务 Actor 取快照。
    await model.apply(snapshot)            // 再进入 UI 隔离域更新。
}
```

接前面的 `DownloadSnapshot`、`DownloadLedger` 使用。<font color="red"><b><code>@MainActor</code></b></font> 在声明处规定归属；<font color="red"><b><code>MainActor.run</code></b></font> 在调用处进入该隔离域执行同步闭包，闭包内不能再写异步等待。已经在 <font color="red"><b>MainActor</b></font> 内时直接更新，不重复切换。

<font color="red"><b><code>MainActor.assertIsolated()</code></b></font> 检查当前隔离，不切换执行器；调试断言不能替代正确的 API 隔离声明。

### 7、<font id="Actor选型">Actor、类与锁的选型</font>

| 状态与接口 | 选择 |
| --- | --- |
| 不可变参数、独立快照 | 值类型 |
| UI 状态、页面模型 | <font color="red"><b><code>@MainActor class</code></b></font> |
| 多任务共用缓存、账本、刷新凭据、连接状态 | Actor，另外设计去重与状态机 |
| 需要继承、Objective-C 互操作或共享身份 | 类，按需增加隔离 |
| 极短同步临界区、调用链必须保持同步 | 完整加锁的类 |

Actor 不保证先进先出，不代表一实例一线程，也不自动提高速度。频繁跨域调用或把无关业务放进同一 Actor，可能形成串行瓶颈。只转发网络、没有共享可变状态的服务不必强行改 Actor。

<a href="#FAQ-Actor" style="color:red;font-weight:bold;">FAQ：Actor 与 <font color="red"><b>class</b></font></a> · <a href="#FAQ-重入" style="color:red;font-weight:bold;">FAQ：可重入</a> · <a href="#FAQ-去重" style="color:red;font-weight:bold;">FAQ：请求去重</a> · <a href="#FAQ-Sendable" style="color:red;font-weight:bold;">FAQ：<font color="red"><b>Sendable</b></font></a> · <a href="#FAQ-隔离" style="color:red;font-weight:bold;">FAQ：隔离标记</a>

<a href="#FAQ-Actor边界" style="color:red;font-weight:bold;">相关 FAQ</a>

## 十、<font id="事件流">事件流：持续接收多个值</font>

### 1、<font id="AsyncStream">AsyncStream：把多次事件变成异步序列</font>

```swift
func consumeEvents() async {
    let stream = AsyncStream<Int>(bufferingPolicy: .bufferingNewest(2)) { continuation in
        continuation.yield(1) // 发送一个值；这是方法调用，不是生成器关键字。
        continuation.yield(2)
        continuation.finish() // 明确结束；消费完缓冲后循环退出。
    }

    for await value in stream { // 等待下一次事件，无需阻塞线程。
        print(value)            // 1、2
    }
}
```

真实回调源要在 `onTermination` 取消订阅或释放资源；无限来源必须选择缓冲上限。`yield` 不会因消费者慢而自动等待，缓冲策略可能丢值，需按需检查返回结果。可能失败的流使用 `AsyncThrowingStream`。

### 2、<font id="Combine"><font color="red"><b>Combine</b></font>：订阅、变换、接收事件</font>

[**Combine**](https://developer.apple.com/documentation/combine) 把事件源与处理链连接起来：Publisher 发出值或终止事件，Operator 转换，Subscriber 接收。它是 Apple 框架，不是 Swift 语言关键字，也不专属于 UI。

```swift
import Combine
import Foundation

func combineDemo() {
    let input = PassthroughSubject<String, Never>() // 手动发事件；Never 表示不会失败。
    var subscriptions = Set<AnyCancellable>()      // 保留订阅，避免提前释放取消。

    input
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) } // 去首尾空白。
        .filter { !$0.isEmpty }                    // 空内容不继续传。
        .removeDuplicates()                       // 只去掉相邻重复值。
        .map { "搜索词：\($0)" }                  // 转成展示文字。
        .sink(receiveCompletion: { completion in
            print(completion)                     // 本例只可能 finished。
        }, receiveValue: { value in
            print(value)                          // 接收每个最终值。
        })
        .store(in: &subscriptions)                 // AnyCancellable 放进持有集合。

    input.send(" Swift ")                         // 输出：搜索词：Swift。
    input.send("Swift")                           // 相邻重复，过滤。
    input.send(" ")                               // 空字符串，过滤。
    input.send("Actor")                           // 输出：搜索词：Actor。
    input.send(completion: .finished)              // 终止后不再接收新值。
    withExtendedLifetime(subscriptions) {}         // 本例同步发送，持有到演示结束。
}
combineDemo()
```

页面里的订阅集合通常是属性，结束业务时 `removeAll()` 或调用 `cancel()`。对象持有订阅、闭包再强持有对象会形成环，按生命周期使用弱捕获。

### 3、<font id="Combine操作符">常用操作符与调度</font>

| 操作 | 含义 | 使用边界 |
| --- | --- | --- |
| `map` / `compactMap` / `filter` | 转换 / 去 <font color="red"><b>nil</b></font> / 筛选 | 每个事件单独处理 |
| `debounce` | 安静一段时间再发最后一个值 | 搜索输入、防抖 |
| `throttle` | 限制时间窗口内的发出频率 | 连续事件限频，不等于防抖 |
| `removeDuplicates` | 去掉连续相同值 | 不对整条历史全局去重 |
| `combineLatest` | 双方至少发过一次后，组合最新值 | 表单多字段联动 |
| `zip` | 按次序成对组合 | 第一个配第一个，可能等待另一侧 |
| `flatMap` | 每个输入展开成 Publisher，再合并输出 | 多个内层订阅可同时存在 |
| `switchToLatest` | 输入是 Publisher 时，仅订阅最新一个 | 新搜索替换旧搜索 |
| <font color="red"><b><code>catch</code></b></font> / `replaceError` | 用新流接续 / 用值代替错误并完成 | 放置位置决定局部失败还是全链结束 |
| `subscribe(on:)` | 安排上游订阅、请求和取消 | 不等于所有下游都在该调度器 |
| `receive(on:)` | 安排其后的值与完成事件 | 前面的重计算不会因此自动移走 |
| `eraseToAnyPublisher` | 隐藏组合后的具体 Publisher 类型 | 保留 Output 与 Failure |

以下定义可复用的搜索输入管线，订阅与取消由调用者管理：

```swift
import Combine
import Foundation

func searchTerms(from input: AnyPublisher<String, Never>) -> AnyPublisher<String, Never> {
    input
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main) // 停止输入后再发。
        .removeDuplicates()
        .receive(on: DispatchQueue.main) // 从这里起，在主队列交付下游事件。
        .eraseToAnyPublisher()           // 隐藏长链类型，便于作为接口返回。
}
```

空输入也要下传给搜索逻辑，以便清空结果或取消旧搜索。`receive(on: .main)` 是运行时调度，不等于给闭包建立 <font color="red"><b><code>@MainActor</code></b></font> 类型契约；严格并发下仍需显式设计 UI 隔离入口。将事件逐个包装进非结构化 <font color="red"><b>Task</b></font> 还可能改变处理顺序，状态提交应按请求版本校验。

<a href="#FAQ-搜索流" style="color:red;font-weight:bold;">相关 FAQ</a>

### 4、<font id="Published">Published：发布属性变化</font>

```swift
import Combine

final class QueryModel: ObservableObject { // 本例只在同一同步调用中使用。
    @Published var query = ""              // query 是值，$query 是 Publisher。
}

func observeQuery() {
    let model = QueryModel()
    let subscription = model.$query.sink { newValue in
        print(newValue)                     // 初次收到 ""，然后收到 "Swift"。
    }
    model.query = "Swift"
    withExtendedLifetime(subscription) {}
}
observeQuery()
```

<font color="red"><b><code>@Published</code></b></font> 在 <font color="red"><b><code>willSet</code></b></font> 阶段发布；订阅闭包读取参数 `newValue`，不要假设此刻再读对象属性已是新值。`ObservableObject` 和发布属性不会自动提供线程安全，UI 模型按需声明 <font color="red"><b>MainActor</b></font>。

### 5、<font id="事件流选型">异步接口选型</font>

一次请求返回一次结果，用 <font color="red"><b><code>async throws</code></b></font>；连续数据按顺序处理，用 `AsyncSequence`；既有项目需要多源组合、调度和操作符链，使用 <font color="red"><b>Combine</b></font>。不要只为语法统一，在三者之间反复包装。

<a href="#FAQ-流" style="color:red;font-weight:bold;">FAQ：流与一次回调</a> · <a href="#FAQ-Combine" style="color:red;font-weight:bold;">FAQ：订阅生命周期</a> · <a href="#FAQ-调度" style="color:red;font-weight:bold;">FAQ：<font color="red"><b>Combine</b></font> 调度</a> · <a href="#FAQ-Published" style="color:red;font-weight:bold;">FAQ：Published 的发送时机</a>

## 十一、<font id="属性标记">属性标记、版本与编译边界</font>

### 1、<font id="标记分类">@ 是语法入口，不是统一机制</font>

| 类别 | 例子 | 作用 |
| --- | --- | --- |
| 声明属性 | <font color="red"><b><code>@available</code></b></font>、<font color="red"><b><code>@main</code></b></font> | 给声明补充编译语义 |
| 函数类型属性 | <font color="red"><b><code>@escaping</code></b></font>、<font color="red"><b><code>@Sendable</code></b></font> | 约定生命周期或安全传递 |
| 属性包装器 | <font color="red"><b><code>@Published</code></b></font>、<font color="red"><b><code>@TaskLocal</code></b></font>、自定义包装器 | 管理属性读写或投影 |
| 全局 Actor | <font color="red"><b><code>@MainActor</code></b></font> | 规定隔离归属 |
| 宏 | <font color="red"><b><code>@Observable</code></b></font>、<font color="red"><b><code>@Model</code></b></font>、<font color="red"><b><code>@Test</code></b></font> | 编译时生成或转换语法 |
| 结果构建器声明 | <font color="red"><b><code>@resultBuilder</code></b></font> | 将多条表达式组合为结果 |
| 分支属性 | <font color="red"><b><code>@unknown default</code></b></font> | 为未来未知枚举值提供处理路径 |

识别标记时同时确认所属语言 / 框架、作用位置和最低工具链。以下保留常见与原有低频标记的用途，不把清单当作永久封闭的语法全集。

### 2、<font id="可用性">available：声明要求与运行时分支</font>

```swift
@available(iOS 17.0, *)              // 声明最低平台要求。
func useModernFeature() { print("现代路径") }

func startFeature() {
    if #available(iOS 17.0, *) {     // 运行设备满足条件才进入。
        useModernFeature()
    } else {
        print("兼容路径")
    }
    if #unavailable(iOS 17.0) {      // 表达旧系统路径。
        print("旧系统准备")
    }
}
```

<font color="red"><b><code>#if</code></b></font> 是条件编译；<font color="red"><b><code>#available</code></b></font> / <font color="red"><b><code>#unavailable</code></b></font> 是可用性条件。可用性检查不能让编译器识别一个根本不认识的新语法。<font color="red"><b><code>@available</code></b></font> 还能描述弃用、移除、重命名与 `noasync` 等限制。

### 3、<font id="main">main：可执行目标的唯一入口</font>

```swift
@main
struct ExampleApp {
    static func main() async {
        print("程序开始") // 框架 App 也可通过协议扩展提供 main。
    }
}
```

可执行 Target 保留一个入口；不要同时使用 `main.swift` 顶层入口和另一个 <font color="red"><b><code>@main</code></b></font>。旧 <font color="red"><b><code>@UIApplicationMain</code></b></font> / <font color="red"><b><code>@NSApplicationMain</code></b></font> 在 Swift 6 模式下不再使用，改为 <font color="red"><b><code>@main</code></b></font>。

### 4、<font id="内联">内联：用函数体替代调用</font>

减少调用成本，也可能增加代码体积；实际是否内联由编译器决定。C 宏是预处理文本替换，函数内联是经过类型检查后的优化；宏展开后的代码同样可能被优化。

| 标记 | 承诺与代价 |
| --- | --- |
| <font color="red"><b><code>@inlinable</code></b></font> | 向客户端编译器公开函数实现，允许跨模块优化，不强制内联 |
| <font color="red"><b><code>@usableFromInline</code></b></font> | 让 <font color="red"><b>internal</b></font> 声明可被 inlinable 代码引用；源码仍非公开，但加入 ABI |
| <font color="red"><b><code>@frozen</code></b></font> | 对库演进场景承诺公开布局 / 枚举 <font color="red"><b>case</b></font> 集合，限制后续变更 |

```swift
@usableFromInline
internal func normalize(_ value: Int) -> Int { max(0, value) }

@inlinable
public func normalized(_ value: Int) -> Int {
    normalize(value) // 引用的内部声明必须满足跨模块实现公开的约束。
}
```

正确拼写是 <font color="red"><b><code>@inlinable</code></b></font>。业务 App 内不要为了“可能更快”随意扩大 ABI 承诺；<font color="red"><b><code>@frozen</code></b></font> 不等于 C 布局兼容。

### 5、<font id="标记速查">其余标记速查</font>

| 标记 | 用途与边界 |
| --- | --- |
| <font color="red"><b><code>@discardableResult</code></b></font> | 允许忽略返回值，不改变调用行为 |
| <font color="red"><b><code>@objc</code></b></font> / <font color="red"><b><code>@nonobjc</code></b></font> | 开放 / 阻止兼容声明进入 Objective-C Runtime |
| <font color="red"><b><code>@objcMembers</code></b></font> | 批量推断兼容成员为 objc；优先只开放必要入口 |
| <font color="red"><b><code>@NSManaged</code></b></font> | 由 Core Data 等运行时提供实现，不自行合成普通存储 |
| <font color="red"><b><code>@NSCopying</code></b></font> | 为适用的类存储属性合成复制语义 |
| <font color="red"><b><code>@IBAction</code></b></font> / <font color="red"><b><code>@IBOutlet</code></b></font> | Interface Builder 事件 / 连接 |
| <font color="red"><b><code>@IBSegueAction</code></b></font> | 用代码参与 Storyboard 目标控制器创建 |
| <font color="red"><b><code>@IBDesignable</code></b></font> / <font color="red"><b><code>@IBInspectable</code></b></font> | 设计时渲染 / 属性检查器编辑 |
| <font color="red"><b><code>@GKInspectable</code></b></font> | GameplayKit 编辑器暴露属性 |
| <font color="red"><b><code>@dynamicMemberLookup</code></b></font> | 未直接找到的成员交给 dynamicMember 下标 |
| <font color="red"><b><code>@dynamicCallable</code></b></font> | 动态函数调用语法交给 dynamicallyCall；不同于普通 callAsFunction |
| <font color="red"><b><code>@globalActor</code></b></font> | 定义提供 shared Actor 实例的全局隔离域 |
| <font color="red"><b><code>@TaskLocal</code></b></font> | 任务动态作用域值；不是任意全局共享变量 |
| <font color="red"><b><code>@preconcurrency</code></b></font> | 旧接口并发迁移工具，不提供线程安全 |
| <font color="red"><b><code>@retroactive</code></b></font> | 明示外部类型遵守外部协议的冲突风险 |
| <font color="red"><b><code>@isolated(any)</code></b></font> | 函数值携带动态隔离信息 |
| <font color="red"><b><code>@concurrent</code></b></font> | 支持的工具链中显式离开调用方 Actor 执行异步函数 |
| <font color="red"><b><code>@convention(swift/block/c)</code></b></font> | 指定函数调用约定；C 函数指针不携带捕获上下文 |
| <font color="red"><b><code>@testable</code></b></font> | 测试访问内部声明，被导入模块需启用 testing |
| <font color="red"><b><code>@Test</code></b></font> / <font color="red"><b><code>@Suite</code></b></font> | Swift Testing 测试与套件宏 |
| <font color="red"><b><code>@attached</code></b></font> / <font color="red"><b><code>@freestanding</code></b></font> | 声明宏角色，主要用于宏作者 |
| <font color="red"><b><code>@backDeployed</code></b></font> | 为指定旧平台发射实现，不是任意 API 降级开关 |
| <font color="red"><b><code>@export(interface)</code></b></font> / <font color="red"><b><code>@export(implementation)</code></b></font> | 新工具链的接口 / 实现导出控制，按工具链支持使用 |
| <font color="red"><b><code>@requires_stored_property_inits</code></b></font> | 要求类存储属性在声明处提供默认值 |
| <font color="red"><b><code>@warn_unqualified_access</code></b></font> | 提醒使用限定名称，减少同名歧义 |
| <font color="red"><b><code>@unknown default</code></b></font> | 处理未来新增 <font color="red"><b>case</b></font>；保留对已知遗漏 <font color="red"><b>case</b></font> 的诊断 |

以下划线开头的编译器内部属性不是稳定公共接口，不作为日常业务模板。

<a href="#FAQ-可用性" style="color:red;font-weight:bold;">FAQ：版本判断</a> · <a href="#FAQ-内联" style="color:red;font-weight:bold;">FAQ：内联与 ABI</a>

## 十二、<font id="网络请求">网络与 JSON：请求、校验、解码分开</font>

### 1、<font id="URLSession">URLSession：先检查 HTTP，再解码业务</font>

```swift
import Foundation

struct Post: Decodable, Sendable {
    let id: Int
    let title: String
}

enum APIError: Error {
    case invalidResponse
    case httpStatus(Int)
}

func fetchPost(from url: URL) async throws -> Post {
    var request = URLRequest(url: url)       // URLSession 接收 URL / URLRequest，不接收 String。
    request.httpMethod = "GET"
    request.timeoutInterval = 15            // 请求超时策略，不等于整个业务的硬截止时间。

    let (data, response) = try await URLSession.shared.data(for: request)
    guard let http = response as? HTTPURLResponse else {
        throw APIError.invalidResponse
    }
    guard (200..<300).contains(http.statusCode) else {
        throw APIError.httpStatus(http.statusCode) // HTTP 失败不一定是传输错误。
    };return try JSONDecoder().decode(Post.self, from: data)
}
```

异步 API 返回结果，无需 `resume()`；completion 形式的 `dataTask` 需启动任务。分别处理传输失败、HTTP 状态失败、业务失败和解码失败；认证信息由安全凭据层注入，不在示例或日志中写真实密钥。

### 2、<font id="上传下载">POST、下载与上传</font>

```swift
import Foundation

struct CreatePost: Encodable {
    let title: String
}

func makeCreateRequest(url: URL, title: String) throws -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try JSONEncoder().encode(CreatePost(title: title))
    return request
}
```

下载 API 通常返回临时文件 URL，需按其生命周期要求移动到目标位置；completion 下载回调结束前应处理临时文件。上传使用 `uploadTask(with:from:)` / <font color="red"><b><code>upload(for:from:)</code></b></font> 等明确提供数据或文件的入口，不套用 dataTask 的签名。

长后台传输使用适合的后台 URLSession 配置与系统回调恢复流程；普通 <font color="red"><b>Task</b></font> 或后台队列不授予 App 常驻后台权限。

### 3、<font id="Codable">Codable：按模型编解码</font>

`Codable = Encodable & Decodable`。只读响应用 `Decodable`，只发请求用 `Encodable`；需要双向转换再用组合协议。

```swift
import Foundation

struct Article: Decodable {
    let identifier: Int
    let title: String
    let subtitle: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"       // 服务端键与本地属性名映射。
        case title
        case subtitle
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(Int.self, forKey: .identifier)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        // decodeIfPresent 接受缺失或 null；类型不匹配仍抛错。
    }
}

let data = Data(#"{"id":1,"title":"Swift"}"#.utf8)
let article = try JSONDecoder().decode(Article.self, from: data)
print(article.title)                 // Swift
print(article.subtitle as Any)       // nil
```

自动合成解码器不会把普通存储属性的默认值一概当作缺字段兜底。需要默认值时在自定义解码中写明；日期、snake_case 和数字字符串按服务端契约显式配置，不用 <font color="red"><b><code>try?</code></b></font> 把协议错误全部吞成空值。

### 4、<font id="网络库">第三方网络与映射库的职责</font>

| 方案 | 负责什么 | 接入重点 |
| --- | --- | --- |
| URLSession + Codable | 系统传输与类型化编解码 | 依赖少，业务封装自行组织 |
| [**Alamofire**](https://github.com/Alamofire/Alamofire) | 基于 URLSession 的请求、验证、编码与拦截 | 类型化响应使用 responseDecodable；按依赖版本核对接口 |
| [**Moya**](https://github.com/Moya/Moya) | 基于 Alamofire，用 TargetType 描述端点 | 组织 baseURL、path、method、task、headers；单独配置状态校验 |
| [**SwiftyJSON**](https://github.com/SwiftyJSON/SwiftyJSON) | 动态访问 JSON 节点 | 便利默认值可能掩盖缺失或类型错误 |
| [**ObjectMapper**](https://github.com/tristanhimmelman/ObjectMapper) | Mappable 与字段映射 | 维护旧工程时按现有模型规则接入 |

一个项目保持明确的网络层与错误模型，不为同类请求并排引入多套框架。Moya 的 <font color="red"><b>Task</b></font> 是请求任务描述，和 Swift Concurrency <font color="red"><b>Task</b></font> 不是同一类型，冲突时使用模块限定名。

<a href="#FAQ-网络" style="color:red;font-weight:bold;">FAQ：网络成功与 HTTP 成功</a> · <a href="#FAQ-解码" style="color:red;font-weight:bold;">FAQ：解码默认值</a>

## 十三、<font id="基础设施">基础设施：网络分层、数据结构与锁</font>

### 1、<font id="网络分层">网络分层：定位故障所在范围</font>

| OSI 层 | 职责 | 常见对象 |
| --- | --- | --- |
| 应用层 | 应用通信语义 | HTTP、DNS、SMTP |
| 表示层 | 编码、序列化、加解密等表示问题 | 教学分层职责，不强行映射某个独立进程 |
| 会话层 | 会话建立与管理 | 教学分层职责 |
| 传输层 | 端到端传输 | TCP、UDP |
| 网络层 | 寻址与路由 | IP |
| 数据链路层 | 链路内帧传递 | Ethernet、Wi-Fi 链路 |
| 物理层 | 信号传输 | 电、光、无线信号 |

TCP/IP 常合并为应用、传输、网际、链路四层；OSI 是参考模型，不要求真实协议严格一层一个。HTTPS 包含 HTTP 与 TLS；HTTP/3 基于 QUIC / UDP，不能概括成所有 HTTP 都走 TCP。

排查按“域名解析 → 建连 → TLS → HTTP 状态 → 业务响应 → 解码”逐步定位，避免把所有失败都记录成“网络错误”。

### 2、<font id="数据结构">数据结构：按访问方式选</font>

| 结构 | 核心特征 | 常见用途与边界 |
| --- | --- | --- |
| 数组 | 有序、按索引访问快 | 中部插删通常需移动元素 |
| 栈 | 后进先出 | 回退、解析；数组 append / popLast 可模拟 |
| 队列 | 先进先出 | 调度；高频出队使用合适的环形缓冲 / 双端队列 |
| 单向链表 | 每节点指向 next | 已知前驱时插删快；查找位置仍需遍历 |
| 双向链表 | 同时保存前后链接 | 已知节点便于拆接；强引用方向需避免 ARC 环 |
| 哈希表 | 按键映射 | Dictionary / Set；平均访问快，非无条件最坏 O(1) |
| 二叉搜索树 | 有序查找 | 未平衡时可退化 |
| AVL / 红黑树 | 维护平衡的搜索树 | 有序集合与映射 |
| 堆结构 | 维持最大 / 最小元素在顶端 | 优先队列；与堆内存不是同一概念 |
| B 树 / B+ 树 | 多路搜索 | 外部存储与索引 |
| Trie | 按前缀组织 | 前缀查询 |
| 后缀树 | 组织字符串后缀 | 子串匹配；不是 Trie 的中文名称 |
| 图 | 顶点与边 | 依赖、路由、关系网络 |

链表头节点可以直接保存数据；哨兵节点是可选设计。单向、双向链表都可有意构成环。快慢指针可检测链表环，比较节点身份，不比较节点内容。

### 3、<font id="锁">锁：保护完整临界区</font>

| 机制 | 行为 | 注意点 |
| --- | --- | --- |
| 互斥锁 | 同时只允许一个持有者进入 | 检查与修改一起保护，所有读写入口一致 |
| 自旋 | 忙等，不停重试 | 耗 CPU，业务层不自行写自旋等待 |
| 读写锁 | 多读互斥写 | 写入公平性、饥饿与实际负载需评估 |
| 条件变量 | 配合互斥锁等待条件 | 唤醒后用循环重查条件 |
| 信号量 | 按计数控制资源许可 | 不是对象隔离，禁止阻塞等待 <font color="red"><b>async</b></font> 结果 |
| GCD barrier | 自建并发队列上隔开前后工作 | 不对全局并发队列提供同样的独占保证 |

```swift
import Foundation

final class LockedCounter: @unchecked Sendable {
    private let mutex = NSLock()
    private var value = 0

    func increment() -> Int { // 同步接口，整个读改写都被同一把锁保护。
        mutex.lock()
        defer { mutex.unlock() }
        value += 1
        return value
    }

    func snapshot() -> Int {  // 读也加锁，不能只锁 setter。
        mutex.lock()
        defer { mutex.unlock() };return value
    }
}
```

这里的 unchecked 承诺依赖私有状态的全部入口都加锁。临界区保持短小，不调用未知外部回调，不在持锁期间跨 <font color="red"><b><code>await</code></b></font>。普通互斥锁不递归，同线程重入也可能死锁。

<a href="#FAQ-锁" style="color:red;font-weight:bold;">FAQ：Actor 与锁</a> · <a href="#FAQ-数据结构" style="color:red;font-weight:bold;">FAQ：结构选型</a> · <a href="#FAQ-网络分层" style="color:red;font-weight:bold;">FAQ：网络分层</a>

## 十四、<font id="计时">计时：唤醒刷新，不充当时间真值</font>

### 1、<font id="计时内核">四种内核</font>

| 内核 | 调度方式 | 适合场景 | Jobs 映射 |
| --- | --- | --- | --- |
| [**Timer / NSTimer**](https://developer.apple.com/documentation/foundation/timer) | RunLoop + Mode | 低频 UI 更新、轮播 | `.foundation` |
| [**DispatchSourceTimer**](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer) | 指定 Dispatch Queue | 工作队列心跳、维护 | `.gcd` |
| [**CADisplayLink**](https://developer.apple.com/documentation/quartzcore/cadisplaylink) | RunLoop，配合屏幕刷新 | 逐帧视觉更新 | `.displayLink` |
| [**CFRunLoopTimer**](https://developer.apple.com/documentation/corefoundation/cfrunlooptimer) | 底层 RunLoop 接口 | C / CF 互操作、特殊 Mode | `.runLoop` |

Timer 不是实时机制。RunLoop 忙或 Mode 不匹配会延迟；重复 Timer 错过多个周期通常只补一次通知。需要滚动期间继续处理时评估 `.common`，并设置合理 `tolerance` 节省唤醒。

GCD Timer 不依赖 RunLoop，但队列阻塞同样延迟；`deadline` 与 `wallDeadline` 分别面向单调时间和墙上时间语义，`leeway` 提供调度余量。正确配平激活、挂起、恢复和取消。

DisplayLink 首选帧率是请求，实际受设备和系统策略影响；根据 `timestamp` / `targetTimestamp` 或单调时钟计算进度，不按帧次数累加。CFRunLoopTimer 与 Timer 可桥接，不天然更精确。

### 2、<font id="计时示例">低频刷新与异步等待</font>

以下原生代码只说明机制；Jobs 应用层对接现有计时封装。

```swift
import Foundation

@MainActor
final class Countdown {
    private var timer: Timer?
    private let endAt: Date

    init(endAt: Date) { self.endAt = endAt }

    func start() {
        stop()
        let deadline = endAt
        let timer = Timer(timeInterval: 1, repeats: true) { timer in
            let remaining = max(0, deadline.timeIntervalSinceNow) // 每次从截止时间重算。
            print(remaining)
            if remaining == 0 { timer.invalidate() }
        }
        timer.tolerance = 0.1
        RunLoop.main.add(timer, forMode: .common)
        self.timer = timer
    }

    func stop() {
        timer?.invalidate() // 业务退出时主动停止，别只把引用设空。
        timer = nil
    }
}
```

绝对业务截止时间使用 `Date`，需考虑系统时间调整或服务端时钟校准；测量实际经过时间使用单调时钟。App 返回前台后重算，不靠补 tick 恢复倒计时。

一次等待使用 <font color="red"><b><code>Task.sleep</code></b></font> 或 `DispatchQueue.asyncAfter`；它们不是完整重复计时器管理方案。App 被挂起后，普通计时器不能保证继续每秒回调；后台任务与后台传输受系统资格和调度策略限制。

### 3、<font id="Jobs计时管理">JobsSwiftTimer 与 Manager</font>

- `JobsSwiftTimer` 统一四内核的启动、暂停、恢复、停止与回调边界，不改变底层精度。
- `JobsSwiftTimerMgr` 管 identifier、去重、受管句柄、Scope 与批量清理。
- 单对象私有计时使用独立 Timer；多个计时任务、复用列表和跨对象治理使用 Manager。
- Cell 使用稳定 Model identifier，并通过 `expectedTimer` 精准移除；页面持有 Scope，避免只记住最后一个 Timer。
- Timer 只唤醒刷新；Model 中的截止时间决定剩余时长。

<a href="#FAQ-计时" style="color:red;font-weight:bold;">FAQ：计时精度与后台执行</a>

## 十五、<font id="验证">示例使用与验证</font>

1、每个代码块独立使用；合并“接上例”依赖。多个同名教学类型或多个 <font color="red"><b><code>@main</code></b></font> 不要直接放进同一 Target。

2、无入口且只声明类型的片段用 `-typecheck`；顶层调用示例作为独立脚本文件；<font color="red"><b><code>@main</code></b></font> 示例用 <font color="red"><b><code>-parse-as-library</code></b></font> 构建。

3、并发示例保持 Swift 6 严格检查，不通过关闭诊断或无依据添加 unchecked 绕过错误。

```shell
xcrun swiftc -swift-version 6 -default-isolation nonisolated -strict-concurrency=complete -warnings-as-errors -typecheck Example.swift
```

调用异步演示时，在唯一的异步入口中执行 <font color="red"><b><code>await useLedger()</code></b></font> 或 <font color="red"><b><code>try await useRepository()</code></b></font>，并合入对应定义。

<font color="red"><b><code>-default-isolation</code></b></font> 需受支持的工具链。语言机制示例、网络声明与框架集成分别验证；编译通过不等于网络、UI 或设备行为已运行。

验证记录（2026-08-31）：Apple Swift 6.3.3，54 段 Swift 示例按各自依赖通过 Swift 6 严格类型检查；集合变换、协议派发、属性包装器、Actor 重入与请求去重、<font color="red"><b>Combine</b></font>、JSON 等 16 组运行检查通过。未执行真实网络请求、完整 App 构建、性能基准或设备测试。

## 十六、<font id="FAQ">FAQ：面试问答</font>

正文用于开发查阅；本节集中短答与追问。每题附返回知识点链接。

### 1、<font id="FAQ-泛型">泛型解决什么问题？</font>

**答：**类型参数化。同一份逻辑处理多种类型，编译器同时保留输入、输出和关联成员的类型关系；约束决定函数体能使用哪些能力。

**追问：为什么不用 <font color="red"><b>Any</b></font>？答：**<font color="red"><b>Any</b></font> 能装值，但会丢失可直接使用的静态类型关系，通常需要再转换。

<a href="#类型参数化" style="color:red;font-weight:bold;">返回：泛型</a>

### 2、<font id="FAQ-协议">协议有什么用？</font>

**答：**约定能力，让使用者依赖接口而不是具体实现。编译器检查实现是否满足约定，适合服务替换、测试注入、容器算法和代理。

**追问：<font color="red"><b>get</b></font> <font color="red"><b>set</b></font> 是存储属性吗？答：**它是读写要求，实现可以存储，也可以计算；协议本身不分配字段。

<a href="#协议" style="color:red;font-weight:bold;">返回：协议</a>

### 3、<font id="FAQ-some-any"><font color="red"><b>some</b></font>、<font color="red"><b>any</b></font> 与泛型怎样区分？</font>

**答：**命名泛型保留可重复引用的类型关系；参数 <font color="red"><b>some</b></font> 是泛型简写；返回 <font color="red"><b>some</b></font> 由实现方固定底层类型；<font color="red"><b>any</b></font> 用统一容器保存可能不同的遵循者。

**追问：<font color="red"><b>any</b></font> 一定堆分配吗？答：**不一定。保存形式与值大小、约束和优化有关，不能凭语法断定分配成本。

<a href="#some-any" style="color:red;font-weight:bold;">返回：<font color="red"><b>some</b></font> / <font color="red"><b>any</b></font></a>

### 4、<font id="FAQ-关联类型"><font color="red"><b>associatedtype</b></font> 和枚举关联值有什么区别？</font>

**答：**<font color="red"><b>associatedtype</b></font> 是协议中的类型占位，由遵循者确定；枚举关联值是某个 <font color="red"><b>case</b></font> 实例携带的实际数据。前者约定类型关系，后者保存值。

<a href="#关联类型" style="color:red;font-weight:bold;">返回：关联类型</a>

### 5、<font id="FAQ-协议派发">协议扩展的方法会被具体实现替换吗？</font>

**答：**写在协议要求中的成员，通过协议入口调用其对应实现；仅写在扩展中的同名工具方法，不形成相同的多态入口。需要可替换的能力必须写进要求。

<a href="#协议扩展" style="color:red;font-weight:bold;">返回：协议扩展</a>

### 6、<font id="FAQ-值类型">结构体与类的核心区别是什么？</font>

**答：**值语义与引用语义。结构体赋值得到独立外层值，类赋值复制同一实例的引用；需要内容用值类型，需要身份和共同生命周期用引用类型。

**追问：结构体包含 <font color="red"><b>class</b></font> 呢？答：**复制外层值仍会复制该对象引用，内部对象可能继续共享。

<a href="#值与引用" style="color:red;font-weight:bold;">返回：类型选择</a>

### 7、<font id="FAQ-内存">结构体一定在栈上吗？size 与 stride 有什么区别？</font>

**答：**不一定，存储位置由编译器、逃逸与上下文决定。size 是值的布局长度，stride 是连续存放的起点间距，包含必要的尾部补齐；alignment 约束起始地址。

<a href="#字节对齐" style="color:red;font-weight:bold;">返回：字节对齐</a>

### 8、<font id="FAQ-COW">COW 就是深拷贝和线程安全吗？</font>

**答：**都不是。COW 通过写前分离共享存储保持值语义；集合中的对象仍可能共享，同一个变量的并发写入仍需隔离或同步。

<a href="#COW" style="color:red;font-weight:bold;">返回：Copy-on-Write</a>

### 9、<font id="FAQ-ARC">闭包为什么会形成循环引用？</font>

**答：**对象强持有闭包，闭包又强捕获对象，双方无法释放。按持有关系使用弱捕获、一次性回调清理或取消订阅；不是所有闭包都必须 <font color="red"><b>weak</b></font>。

**追问：<font color="red"><b>weak</b></font> 与 <font color="red"><b>unowned</b></font> 怎样选？答：**<font color="red"><b>weak</b></font> 允许对象先释放并变 <font color="red"><b>nil</b></font>；<font color="red"><b>unowned</b></font> 要证明每次访问时对象仍存活。

<a href="#ARC" style="color:red;font-weight:bold;">返回：ARC</a>

### 10、<font id="FAQ-闭包">escaping 表示异步吗？</font>

**答：**只表示闭包可能在函数返回后继续存在。可以同步调用，也可以被保存后稍后调用；执行线程与并发安全由其他规则决定。

**追问：多行闭包还能用 $0 吗？答：**可以。匿名参数与是否多行无关，复杂代码优先命名以便阅读。

<a href="#逃逸与捕获" style="color:red;font-weight:bold;">返回：闭包</a>

### 11、<font id="FAQ-mutating"><font color="red"><b>mutating</b></font> 和 <font color="red"><b>inout</b></font> 的区别是什么？</font>

**答：**<font color="red"><b>mutating</b></font> 允许值类型方法修改自身，<font color="red"><b>inout</b></font> 允许函数修改调用方变量。<font color="red"><b>let</b></font> 结构体不能调用修改自身的方法；<font color="red"><b>inout</b></font> 还必须满足独占访问规则。

<a href="#mutating-inout" style="color:red;font-weight:bold;">返回：<font color="red"><b>mutating</b></font> / <font color="red"><b>inout</b></font></a>

### 12、<font id="FAQ-map">map、compactMap、flatMap 怎样选？</font>

**答：**map 逐个转换；compactMap 转换后去掉 <font color="red"><b>nil</b></font>；序列 flatMap 转换后展开一层。filter 只筛选，不改变元素类型。

**追问：空字符串会被 compactMap 删掉吗？答：**不会，除非转换明确返回 <font color="red"><b>nil</b></font>。

<a href="#map" style="color:red;font-weight:bold;">返回：集合转换</a>

### 13、<font id="FAQ-joined">joined 一定返回数组吗？</font>

**答：**不一定。嵌套序列的 joined 返回扁平化序列，可直接遍历；字符串连接重载返回 String。接口确实需要数组时再用 Array 收集。

<a href="#joined" style="color:red;font-weight:bold;">返回：joined</a>

### 14、<font id="FAQ-初始化">指定、便捷和 <font color="red"><b>required</b></font> 初始化器怎样配合？</font>

**答：**指定初始化器完成本类存储并向父类指定入口委托；便捷初始化器先向同类其他入口委托，最终进入本类指定入口；<font color="red"><b>required</b></font> 保持子类创建契约。

**追问：多个指定入口最终必须汇入同一个吗？答：**不必，每条路径正确完成初始化即可。

<a href="#初始化" style="color:red;font-weight:bold;">返回：初始化</a>

### 15、<font id="FAQ-扩展"><font color="red"><b>extension</b></font> 能增加存储属性吗？</font>

**答：**不能给已有类型增加实例存储属性；可添加计算属性、方法、下标和协议遵循。协议本体同样只声明能力，不分配字段。

<a href="#extension" style="color:red;font-weight:bold;">返回：扩展</a>

### 16、<font id="FAQ-包装器">所有 @ 标记都是属性包装器吗？</font>

**答：**不是。propertyWrapper 定义包装器；<font color="red"><b>MainActor</b></font> 声明隔离；Observable 是宏；available 描述可用性。共同的符号不表示相同机制。

**追问：$value 是什么？答：**包装器提供的 projectedValue，具体能力由包装器定义。

<a href="#属性包装器" style="color:red;font-weight:bold;">返回：属性包装器</a>

### 17、<font id="FAQ-单例"><font color="red"><b>static</b></font> <font color="red"><b>let</b></font> 单例线程安全吗？</font>

**答：**初始化具有一次性保证，但实例后续可变状态不会自动获得保护。UI 单例可隔离到 <font color="red"><b>MainActor</b></font>，共享业务状态使用 Actor 或完整同步方案。

<a href="#单例" style="color:red;font-weight:bold;">返回：单例</a>

### 18、<font id="FAQ-访问控制"><font color="red"><b>public</b></font> 与 <font color="red"><b>open</b></font> 有什么区别？</font>

**答：**<font color="red"><b>public</b></font> 开放模块外使用；<font color="red"><b>open</b></font> 进一步开放类的模块外继承与成员重写。区别取决于模块边界，和库是否以源码交付无关。

<a href="#访问控制" style="color:red;font-weight:bold;">返回：访问控制</a>

### 19、<font id="FAQ-Task"><font color="red"><b>async</b></font>、<font color="red"><b>await</b></font>、<font color="red"><b>Task</b></font> 都代表后台线程吗？</font>

**答：**不代表。<font color="red"><b>async</b></font> 允许挂起，<font color="red"><b>await</b></font> 标记潜在挂起点，<font color="red"><b>Task</b></font> 承载异步工作；执行位置受隔离和调度规则约束。<font color="red"><b>MainActor</b></font> 中创建的普通 <font color="red"><b>Task</b></font> 可以继续在 <font color="red"><b>MainActor</b></font> 执行。

<a href="#async-await" style="color:red;font-weight:bold;">返回：异步语义</a>

### 20、<font id="FAQ-结构化"><font color="red"><b>Task</b></font> 创建在另一个 <font color="red"><b>Task</b></font> 内，就是结构化子任务吗？</font>

**答：**不是。<font color="red"><b>Task</b></font> 初始化器仍创建非结构化任务。<font color="red"><b>async</b></font> <font color="red"><b>let</b></font> 与任务组建立结构化父子关系，子任务不能脱离作用域；普通 <font color="red"><b>Task</b></font> 的句柄、取消和结果由业务管理。

<a href="#结构化并发" style="color:red;font-weight:bold;">返回：结构化并发</a>

### 21、<font id="FAQ-取消">cancel 会立即停止任务吗？</font>

**答：**不会强杀。取消是请求，任务或调用的 API 需要检查并退出；已经发生的外部副作用不会自动回滚。任务组超时也可能被不响应取消的工作拖住。

<a href="#取消" style="color:red;font-weight:bold;">返回：取消与超时</a>

### 22、<font id="FAQ-Continuation">Continuation 最重要的约束是什么？</font>

**答：**每条路径恢复一次且仅一次。漏恢复会持续等待，重复恢复会触发错误；多次事件使用流。<font color="red"><b>Task</b></font> 取消与旧 API 取消需要另外连接。

<a href="#Continuation" style="color:red;font-weight:bold;">返回：回调桥接</a>

### 23、<font id="FAQ-Actor">Actor 比普通 <font color="red"><b>class</b></font> 多解决了什么？</font>

**答：**为共享可变状态建立语言级隔离边界，编译器检查访问与传值。普通 <font color="red"><b>class</b></font> 也能用锁或队列保护，但全部入口的一致性由实现负责。

**追问：Actor 是专属线程吗？答：**不是；Actor 管隔离，<font color="red"><b>Task</b></font> 管工作，线程是执行资源。

<a href="#Actor入门" style="color:red;font-weight:bold;">返回：Actor</a>

### 24、<font id="FAQ-重入">用了 Actor，为什么还可能超发名额？</font>

**答：**等待期间其他调用可以进入同一 Actor 改状态。等待前的检查可能失效；恢复后复查，把最终检查与扣减放进同一无挂起片段，或使用有补偿的预留策略。

**追问：这是数据竞争吗？答：**可以没有同时读写，仍发生业务上的逻辑竞态。

<a href="#Actor重入" style="color:red;font-weight:bold;">返回：可重入</a>

### 25、<font id="FAQ-去重">把 <font color="red"><b>class</b></font> 改成 <font color="red"><b>actor</b></font>，就不会重复请求了吗？</font>

**答：**不会。等待网络时最终缓存还没写入，后来调用仍可能再请求。需要先登记正在执行的 <font color="red"><b>Task</b></font>，再让同 key 调用复用，并设计失败清理和失效策略。

<a href="#Actor去重" style="color:red;font-weight:bold;">返回：请求去重</a>

### 26、<font id="FAQ-Sendable"><font color="red"><b>Sendable</b></font> 加了锁吗？不写会怎样？</font>

**答：**没有加锁。它声明可安全跨域传递，编译器检查相应条件；有些类型能隐式推断，有些必须显式声明。满足接口契约和偶然一次调用通过不是同一件事。

**追问：unchecked 可以解决报错吗？答：**只有安全由锁等机制完整证明时才使用；它不是修复数据竞争的代码。

<a href="#Sendable" style="color:red;font-weight:bold;">返回：<font color="red"><b>Sendable</b></font></a>

### 27、<font id="FAQ-隔离"><font color="red"><b>nonisolated</b></font>、<font color="red"><b>MainActor</b></font>、<font color="red"><b>Sendable</b></font> 各管什么？</font>

**答：**<font color="red"><b>nonisolated</b></font> 声明成员不归所属 Actor 隔离；<font color="red"><b>MainActor</b></font> 指定代码与状态的隔离域；<font color="red"><b>Sendable</b></font> 约定值的安全传递。三个维度不能互相替代。

<a href="#nonisolated" style="color:red;font-weight:bold;">返回：<font color="red"><b>nonisolated</b></font></a> · <a href="#MainActor" style="color:red;font-weight:bold;">返回：<font color="red"><b>MainActor</b></font></a>

### 28、<font id="FAQ-Actor-await">Actor 方法没写 <font color="red"><b>async</b></font>，为什么外部还要 <font color="red"><b>await</b></font>？</font>

**答：**方法体可以同步，但外部调用需要进入它的隔离域，调用点可能等待。当前 Actor 内调用自己的同步方法则不需要跨域。

<a href="#Actor入门" style="color:red;font-weight:bold;">返回：Actor 访问</a>

### 29、<font id="FAQ-Actor边界">Actor 能继承、保证 FIFO 或自动加速吗？</font>

**答：**不参与普通类继承，不保证请求按到达顺序执行，也不承诺更快。它可以遵循协议，通过组合复用；性能要测跨域次数与状态热点。

<a href="#Actor选型" style="color:red;font-weight:bold;">返回：Actor 选型</a>

### 30、<font id="FAQ-锁">Actor 与锁怎样选择？</font>

**答：**异步调用链里的共享业务状态优先评估 Actor；短同步临界区或必须维持同步接口时可用锁。持锁区不跨 <font color="red"><b>await</b></font>，Actor 跨等待流程也不自动成为事务。

<a href="#锁" style="color:red;font-weight:bold;">返回：锁</a>

### 31、<font id="FAQ-流">AsyncStream 与 Continuation 怎样区分？</font>

**答：**Continuation 接一次结果，AsyncStream 接多次事件。流要管理结束、缓冲和取消；yield 发值不等于自动等待慢消费者。

<a href="#AsyncStream" style="color:red;font-weight:bold;">返回：AsyncStream</a>

### 32、<font id="FAQ-Combine"><font color="red"><b>Combine</b></font> 的订阅为什么刚建立就没了？</font>

**答：**常见原因是没有保留 AnyCancellable，释放后订阅被取消。把订阅保存到明确拥有者中，退出业务时再取消，并检查闭包是否与拥有者形成强引用环。

<a href="#Combine" style="color:red;font-weight:bold;">返回：<font color="red"><b>Combine</b></font></a>

### 33、<font id="FAQ-调度">subscribe(on:) 与 receive(on:) 有什么区别？</font>

**答：**前者安排上游订阅、请求与取消；后者安排其后下游的值和完成事件。receive 放到重计算之后，不会把前面的计算自动搬走；主队列调度也不等于 <font color="red"><b>MainActor</b></font> 类型契约。

<a href="#Combine操作符" style="color:red;font-weight:bold;">返回：操作符与调度</a>

### 34、<font id="FAQ-Published">Published 发出新值时，属性已经改了吗？</font>

**答：**发布发生在 <font color="red"><b>willSet</b></font>，闭包参数已经是新值，但重新读取属性可能仍是旧值。处理本次变化优先使用收到的参数。

<a href="#Published" style="color:red;font-weight:bold;">返回：Published</a>

### 35、<font id="FAQ-搜索流"><font color="red"><b>Combine</b></font> 搜索怎样避免旧结果覆盖新结果？</font>

**答：**输入防抖后映射到请求 Publisher，用 switchToLatest 切到最新请求，并按业务需要加请求版本校验。取消旧订阅不代表服务端副作用已撤销。

<a href="#Combine操作符" style="color:red;font-weight:bold;">返回：搜索管线</a>

### 36、<font id="FAQ-可用性">available 与条件编译有什么区别？</font>

**答：**@available 声明 API 要求；#available / #unavailable 按运行系统选择路径；#<font color="red"><b>if</b></font> 决定是否参与编译。运行时检查不能让旧编译器认识新语法。

<a href="#可用性" style="color:red;font-weight:bold;">返回：版本边界</a>

### 37、<font id="FAQ-内联">inlinable 会强制内联吗？</font>

**答：**不会。它向客户端公开实现以允许跨模块优化；usableFromInline 让内部声明可被该实现引用；frozen 承诺公开布局。三者都有演进代价。

<a href="#内联" style="color:red;font-weight:bold;">返回：内联</a>

### 38、<font id="FAQ-网络">URLSession 没报错，就代表 HTTP 成功吗？</font>

**答：**不代表。传输成功仍可能得到 404 或 500；先检查响应类型和 HTTP 状态，再处理业务状态与解码。取消、传输、HTTP、业务、解码应区分。

<a href="#URLSession" style="color:red;font-weight:bold;">返回：网络校验</a>

### 39、<font id="FAQ-解码">模型有默认值，JSON 缺字段就一定能解码吗？</font>

**答：**不一定，自动合成不会统一把默认值作为缺字段兜底。需要明确策略时自定义解码；decodeIfPresent 接受缺失或 null，但类型错误仍会抛出。

<a href="#Codable" style="color:red;font-weight:bold;">返回：Codable</a>

### 40、<font id="FAQ-计时">哪个 Timer 最精确，能在后台一直跑吗？</font>

**答：**先按调度模型选，没有普通 Timer 保证硬实时或 App 挂起后持续秒级回调。视觉用 DisplayLink，工作队列用 GCD Timer，普通 UI 用 RunLoop Timer；倒计时从截止时间重算。

<a href="#计时" style="color:red;font-weight:bold;">返回：计时机制</a>

### 41、<font id="FAQ-数据结构">链表插删一定比数组快吗？</font>

**答：**需要已知节点或前驱等条件；寻找位置仍可能线性遍历。数组有局部性和索引优势，链表有指针与分配成本，按实际访问模式选择。

<a href="#数据结构" style="color:red;font-weight:bold;">返回：数据结构</a>

### 42、<font id="FAQ-网络分层">HTTP 一定基于 TCP 吗？</font>

**答：**不是。HTTP/3 使用 QUIC / UDP；HTTP 语义与底层传输应分开。OSI 是参考分层，真实协议不要求严格一层一个实现。

<a href="#网络分层" style="color:red;font-weight:bold;">返回：网络分层</a>

<a id="🔚" href="#前言" style="color:red;font-weight:bold;">返回前言</a>
