import UIKit

//Fizzbuzz
//Write a function that takes in an integer as its only input. If the input is divisible by 3, output "fizz". If it is divisible by 5, output "buzz". If it is divisible by both 3 and 5, output "fizzbuzz". If neither, output "boring number"

func fizzBuzz(input: Int) -> String {
    //  if input % 5 == 0 && input % 3 == 0 {
    //    return "fizzbuzz"
    //  }
    //
    //  if input % 3 == 0 {
    //    return "fizz"
    //  }
    //
    //  if input % 5 == 0 {
    //    return "buzz"
    //  } else {
    //    return "boring number"
    //  }
    var returnString = ""
    if input % 3 == 0 {
        returnString += "fizz"
    }
    
    if input % 5 == 0 {
        returnString += "buzz"
    }
    
    guard !returnString.isEmpty else { return "boring number" }
    return returnString
}
print(fizzBuzz(input: 2))
print(fizzBuzz(input: 3))
print(fizzBuzz(input: 10))
print(fizzBuzz(input: 15))

struct MyStruct {
    var myProperty: Int
    let myConstant: String
}

class MyClass {
    var myProperty: Int
    let myConstant: String
    
    init(firstProperty: Int, secondProperty: String = "") {
        myProperty = firstProperty
        myConstant = secondProperty
    }
    
    func printHelloWorld() {
        print("hello world")
        print(MyStruct.init(myProperty: 1, myConstant: "hi"))
    }
}

MyClass(firstProperty: 0, secondProperty: "").printHelloWorld()
var optionalValue: Int?
print(optionalValue)
//nil coalescing
print(optionalValue ?? "no value")
var myNumber = 5
print(myNumber ?? "no number")
//optional chaining
print(optionalValue?.customMirror)
//force unwrapping
//print(optionalValue!)
//DONT DO FORCE UNWRAP

//conditional binding
if let unwrappedOptional = optionalValue {
    print(unwrappedOptional)
} else {
    print("no value boss!")
}
//guard let unwrappedOptional = optionalValue else { return }

protocol MyProtocol {
    func printHelloWorld()
    var myStoredProperty: Int { get set }
    var computedProperty: String { get }
}

protocol TheProtocol {
    var theNumber: Int { get set }
}

//class MyNewClass: NSObject {
//  var myStoredProperty: Int = 0
//}
//
//extension MyNewClass: TheProtocol {
//  var theNumber: Int {
//    get { return myStoredProperty }
//    set { myStoredProperty = newValue }
//  }
//}
//
//extension MyNewClass: MyProtocol {
//  func printHelloWorld() {
//    print("hello world")
//  }
//
//  var computedProperty: String {
//    let returnString = "my cool property at number: \(myStoredProperty)"
//    myStoredProperty += 1
//    return returnString
//  }
//}

func doTheThing(theThing: (() -> Void)?) {
    theThing?()
}

let myClass = MyClass(firstProperty: 0)
doTheThing(theThing: myClass.printHelloWorld)
doTheThing {
    print("inside the closure")
}

func filter(array: [Int], closure: (Int) -> Bool) -> [Int] {
    var secondArray = [Int]()
    for number in array where closure(number) {
        secondArray.append(number)
    }
    return secondArray
}

let myArray = [1, 5, 7, 3, 9, 2, 65432, 98765, 6543, 98765]
print(filter(array: myArray) { (currentNumber) -> Bool in
    return currentNumber % 2 != 0
})

