import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct EquatableByMacro: ExtensionMacro, MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        guard declaration.isSupportedDeclaration else {
            throw MacroError.message("@EquatableBy 只能用于 struct 或 class")
        }
        let declaration: DeclSyntax = "extension \(type): Equatable, Hashable {}"
        guard let extensionDeclaration = declaration.as(ExtensionDeclSyntax.self) else {
            throw MacroError.message("生成 Equatable、Hashable 扩展失败")
        };return [extensionDeclaration]
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard declaration.isSupportedDeclaration else {
            throw MacroError.message("@EquatableBy 只能用于 struct 或 class")
        }
        let property = try parseProperty(from: node)
        return [
            """
            static func == (lhs: Self, rhs: Self) -> Bool {
                lhs.\(raw: property) == rhs.\(raw: property)
            }
            """,
            """
            func hash(into hasher: inout Hasher) {
                hasher.combine(self.\(raw: property))
            }
            """
        ]
    }
}

private enum MacroError: Error, CustomStringConvertible {
    case message(String)

    var description: String {
        switch self {
        case .message(let message): message
        }
    }
}

private func parseProperty(from node: AttributeSyntax) throws -> String {
    guard
        let arguments = node.arguments?.as(LabeledExprListSyntax.self),
        arguments.count == 1,
        let literal = arguments.first?.expression.as(StringLiteralExprSyntax.self),
        literal.segments.count == 1,
        let segment = literal.segments.first?.as(StringSegmentSyntax.self),
        !segment.content.text.isEmpty
    else {
        throw MacroError.message("@EquatableBy 需要一个属性名，例如 @EquatableBy(\"id\")")
    };return segment.content.text
}

extension DeclGroupSyntax {
    var isSupportedDeclaration: Bool {
        self.is(StructDeclSyntax.self)
            || self.is(ClassDeclSyntax.self)
    }
}
