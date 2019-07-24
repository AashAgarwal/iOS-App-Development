import UIKit

let myArray: [Int] = [614, 26, 7537, 867, 1, 82, 8368, 75] // my unsorted array

// program to sort the array per project requirement
func sortedArray (myArray: [Int], myClosure: (Int, Int) -> Bool) -> [Int]{
    var finalArray = myArray
    let indexlength = myArray.count - 1
    
    for _ in 0...indexlength {
        for i in 0...indexlength - 1
        {
            if myClosure(finalArray[i], finalArray[i+1]){
                let temp = finalArray[i]
                finalArray[i] = finalArray[i+1]
                finalArray[i+1] = temp
            }
        }
    }
    return finalArray
}
// prints the sorted array
print(sortedArray(myArray: myArray) { (smaller, bigger) -> Bool in
    return smaller > bigger
})
