import UIKit

func printNumber(input: Int) -> Int {
    print("\(input)")
    return input
}

func printViewController(input: UIViewController) -> UIViewController {
    print("\(input)")
    return input
}

func printString(input: String) -> String {
    print(input)
    return input
}

// T is generic
func printThing<T>(input: T) -> T {
    print("\(input)")
    return input
}

func printMultiple<T, U>(firstInput: T, secondInput: U) {
    print("\(firstInput)")
    print("\(secondInput)")
    printThing(input: firstInput)
    printThing(input: secondInput)
}

