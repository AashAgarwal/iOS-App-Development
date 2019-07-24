//
//  ToDoListViewModel.swift
//  ToDoListMVVM
//
//  Created by Aashwatth Agarwal on 7/19/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import Foundation

final class ToDoListViewModel {
    
    private var Lists: [List] = []
    private var shouldGetLists = true
    
    init(Lists: [List] = [], shouldGetLists: Bool = true) {
        self.Lists = Lists
        self.shouldGetLists = shouldGetLists
    }
    
    func getLists() {
        guard shouldGetLists else { return }
        Lists = [List(name: "MainList",
                              subordinates: getSubLists())]
        shouldGetLists = false
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
    
    func getNumberOfLists() -> Int {
        return Lists.count
    }
    
    func getListName(at index: Int) -> String? {
        guard index >= 0 && index < Lists.count else { return nil }
        return Lists[index].name
    }
    
    func shouldContinue(at index: Int) -> Bool {
        guard index >= 0 && index < Lists.count else { return false }
        return !Lists[index].subordinates.isEmpty
    }
    
    func getViewModel(for index: Int) -> ToDoListViewModel? {
        guard shouldContinue(at: index) else { return nil }
        return ToDoListViewModel(Lists: Lists[index].subordinates, shouldGetLists: false)
    }
}
