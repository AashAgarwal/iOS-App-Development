//
//  ArrayViewModel.swift
//  DataBindingProject
//
//  Created by Aashwatth Agarwal on 8/2/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import Foundation

class ArrayViewModel {
    var array:[Element] = [Element(element: "oh my god"), Element(element: "my oh my"), Element(element: [97,579])
    ]
    var index = 0
    
    func getLength() -> Int {
        return array.count
    }
    
    func getElement(at index: Int) -> Any {
        return array[index].element
    }
    
    func updateElement<T>(at currentIndex: Int, with Element: T) {
        guard currentIndex >= 0 && currentIndex < array.count else {return}
        
        array[currentIndex] = Element(element: Element)
        printOut()
    }
    
    func delete(currentIndex: Int) {
        array.remove(at: currentIndex)
        printOut()
    }
    
    func addNew(Element: Element) {
        array.append(Element)
        printOut()
    }
    
    func printOut() {
        var printablearray: [Any] = []
        for i in 0...array.count-1 {
            printablearray.append(getElement(at: i))
        }
        print(printablearray)
    }
}
