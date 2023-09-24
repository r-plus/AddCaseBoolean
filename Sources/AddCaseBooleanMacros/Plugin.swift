import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct AddCaseBooleanPlugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    AddCaseBooleanMacro.self
  ]
}
