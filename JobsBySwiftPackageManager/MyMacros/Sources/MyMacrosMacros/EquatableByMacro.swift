import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct EquatableByMacro: ExtensionMacro, MemberMacro {

    // MARK: - ExtensionMacro (加 Equatable / Hashable conformance)
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {

        guard declaration.isDecl(StructDeclSyntax.self)
                || declaration.isDecl(ClassDeclSyntax.self)
                || declaration.isDecl(ActorDeclSyntax.self)
        else {
            throw MacroError.message("@EquatableBy 只能用于 struct / class / actor")
        }

        let decl: DeclSyntax =
        """
        extension \(type): Equatable, Hashable {}
        """

        guard let ext = decl.as(ExtensionDeclSyntax.self) else {
            throw MacroError.message("生成 extension 失败")
        }

        return [ext]
    }

    // MARK: - MemberMacro (生成 == / hash(into:))
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        guard declaration.isDecl(StructDeclSyntax.self)
                || declaration.isDecl(ClassDeclSyntax.self)
                || declaration.isDecl(ActorDeclSyntax.self)
        else {
            throw MacroError.message("@EquatableBy 只能用于 struct / class / actor")
        }

        let key = try parseSingleStringArgument(from: node)

        let eq: DeclSyntax =
        """
        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.\(raw: key) == rhs.\(raw: key)
        }
        """

        let hash: DeclSyntax =
        """
        public func hash(into hasher: inout Hasher) {
            hasher.combine(self.\(raw: key))
        }
        """

        return [eq, hash]
    }
}

// MARK: - Helpers
private enum MacroError: Error, CustomStringConvertible {
    case message(String)
    var description: String {
        switch self {
        case .message(let m): return m
        }
    }
}

private func parseSingleStringArgument(from node: AttributeSyntax) throws -> String {
    guard
        let args = node.arguments?.as(LabeledExprListSyntax.self),
        let first = args.first?.expression.as(StringLiteralExprSyntax.self),
        first.segments.count == 1,
        let seg = first.segments.first?.as(StringSegmentSyntax.self)
    else {
        throw MacroError.message("@EquatableBy 需要一个字符串参数，比如 @EquatableBy(\"id\")")
    }
    return seg.content.text
}

private extension DeclGroupSyntax {
    func isDecl<T>(_ type: T.Type) -> Bool where T: SyntaxProtocol {
        self.as(T.self) != nil
    }
}
