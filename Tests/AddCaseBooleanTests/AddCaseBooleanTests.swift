import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(AddCaseBooleanMacros)
import AddCaseBooleanMacros

let testMacros: [String: Macro.Type] = [
    "AddCaseBoolean": AddCaseBooleanMacro.self,
]
#endif

final class AddCaseBooleanTests: XCTestCase {
    func testMacro() throws {
        #if canImport(AddCaseBooleanMacros)
        assertMacroExpansion(
            """
            @AddCaseBoolean
            enum E {
                case first(Int)
                case second
                case thirdCamel(arg: String)
                case `default`
                case `type`(Int)
            }
            """,
            expandedSource: """
            enum E {
                case first(Int)
                case second
                case thirdCamel(arg: String)
                case `default`
                case `type`(Int)

                var isFirst: Bool {
                    if case .first = self {
                        return true
                    }
                    return false
                }

                var isThirdCamel: Bool {
                    if case .thirdCamel = self {
                        return true
                    }
                    return false
                }

                var isType: Bool {
                    if case .type = self {
                        return true
                    }
                    return false
                }
            }
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
