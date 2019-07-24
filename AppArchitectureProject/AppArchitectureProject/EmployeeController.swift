//
//  EmployeeController.swift
//  AppArchitectureProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import Foundation

final class EmployeeController {
    func getEmployees() -> [Employee] {
        let ceo = Employee(name: "Bob", subordinates: getRegionalManagers())
        return [ceo]
    }
    
    private func getRegionalManagers() -> [Employee] {
        let regMan1 = Employee(name: "John", subordinates: getJohnSubordinates())
        let regMan2 = Employee(name: "Brian", subordinates: getBrianSubordinates())
        return [regMan1, regMan2]
    }
    
    private func getJohnSubordinates() -> [Employee] {
        let sub1 = Employee(name: "Chris", subordinates: [])
        let sub2 = Employee(name: "Aash", subordinates: [])
        return [sub1, sub2]
    }
    
    private func getBrianSubordinates() -> [Employee] {
        let sub1 = Employee(name: "Ryan", subordinates: [])
        let sub2 = Employee(name: "David", subordinates: [])
        return [sub1, sub2]
    }
}
