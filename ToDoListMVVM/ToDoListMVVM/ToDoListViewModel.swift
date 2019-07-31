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
        
        Lists = [List(name: "To do List",
                              subordinates: getSubLists())]
        shouldGetLists = false
    }
    
    private func getSubLists() -> [List] {
        let subList1 = List(name: "Do Laundry", subordinates: getSubListsFunction())
        let subList2 = List(name: "Take my dog for a walk",
                      subordinates: getSubListsFunction())
        let subList3 = List(name: "Go to gym",
                      subordinates: getSubListsFunction())
        let subList4 = List(name: "Make some food",
                      subordinates: getSubListsFunction())
        let subList5 = List(name: "Go out for a walk",
                      subordinates: getSubListsFunction())
        let subList6 = List(name: "Water my plants",
                      subordinates: getSubListsFunction())
        let subList7 = List(name: "Buy a new game",
                      subordinates: getSubListsFunction())
        let subList8 = List(name: "Prepare shopping list",
                      subordinates: getSubListsFunction())
        let subList9 = List(name: "Check my bank account",
                      subordinates: getSubListsFunction())
        return [subList1, subList2, subList3, subList4, subList5, subList6, subList7, subList8, subList9]
    }
    
    private func getSubListsFunction() -> [List] {
        let subFunction1 = List(name: "update", subordinates: [])
        let subFunction2 = List(name: "delete", subordinates: [])
        return [subFunction1, subFunction2]
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
