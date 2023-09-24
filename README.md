# AddCaseBoolean

A Swift macro that generate `isCaseName: Bool` computed properties per enum case that have associated value.

for example below source code

```swift
@AddCaseBoolean
enum E {
    case simple
    case foo(Int)
}
```

will generate `isFoo` computed property.

```swift
var isFoo: Bool {
    if case .foo = self {
        return true
    }
    return false
}
```
