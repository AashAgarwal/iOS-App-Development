//
//  ListController.swift
//  ToDoListMVVM
//
//  Created by Aashwatth Agarwal on 7/19/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import Foundation

final class ListController {
    func getList() -> [List] {
        let mainList = List(name: "MainList", subordinates: getSubLists())
        return [mainList]
    }
    
    private func getSubLists() -> [List] {
        let subList1 = List(name: "Do Laundry", subordinates: getLaundrySubordinates())
        let subList2 = List(name: "Make some food", subordinates: getFoodSubordinates())
        return [subList1, subList2]
    }
    
    private func getLaundrySubordinates() -> [List] {
        let sub1 = List(name: "Take dirty clothes", subordinates: [])
        let sub2 = List(name: "Take laundry detergent", subordinates: [])
        return [sub1, sub2]
    }
    
    private func getFoodSubordinates() -> [List] {
        let sub1 = List(name: "Chop vegetables", subordinates: [])
        let sub2 = List(name: "Start Cooking", subordinates: [])
        return [sub1, sub2]
    }
}
