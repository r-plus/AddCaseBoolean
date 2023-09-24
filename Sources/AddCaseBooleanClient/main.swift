import AddCaseBoolean

@AddCaseBoolean
enum E {
    case first
    case second(Int)
}

let e = E.second(1)
print(e.isSecond)
