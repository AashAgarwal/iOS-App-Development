//
//  HW#1.swift
//  
//
//  Created by Aashwatth Agarwal on 7/10/19.
//

import UIKit

let myArray = [614, 26, 7537, 867, 1, 82, 8368, 75]

func sortedArray (myArray: [Int], myClosure: (Int, Int) -> Bool) -> [Int]{
    for _ in 0...myArray.count -1 {
        for i on 0...myArray.count -1{
            if myClosure(myArray[i],myArray[i+1]){
               let temp = myArray[i]
                myArray[i] = myArray[i+1]
                myArray[i+1] = temp
            }
        }
    }
    return myArray
}
