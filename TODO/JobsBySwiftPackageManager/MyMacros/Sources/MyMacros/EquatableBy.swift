/// 让类型按指定字段生成 Equatable + Hashable（适合 DiffableDataSource 只认 id）。
///
/// 用法：
///   @EquatableBy("id")
///   struct UserInfo { let id: Int; var name: String }
@attached(extension, conformances: Equatable, Hashable)
@attached(member, names: named(==), named(hash(into:)))
public macro EquatableBy(_ keyPath: String) =
    #externalMacro(module: "MyMacrosMacros", type: "EquatableByMacro")
