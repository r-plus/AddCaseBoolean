import AddCaseBooleanMacros

/// A macro that generate `var isCaseNmae: Bool` computed properties per enum cases that have asociated value.
///
/// for example below source code
///
///    ```swift
///     @AddCaseBoolean
///     enum E {
///         case simple
///         case foo(Int)
///     }
///    ```
///
/// will generate `isFoo` computed property.
///
///    ```swift
///    var isFoo: Bool {...}
///    ```
///
@attached(member, names: arbitrary)
public macro AddCaseBoolean() = #externalMacro(module: "AddCaseBooleanMacros", type: "AddCaseBooleanMacro")
