/// 按指定属性生成 `Equatable` 与 `Hashable` 实现。
///
/// ```swift
/// @EquatableBy("id")
/// struct User {
///     let id: Int
///     var name: String
/// }
/// ```
@attached(extension, conformances: Equatable, Hashable)
@attached(member, names: named(==), named(hash(into:)))
public macro EquatableBy(_ property: String) =
    #externalMacro(module: "JobsSPMDemoMacrosPlugin", type: "EquatableByMacro")
