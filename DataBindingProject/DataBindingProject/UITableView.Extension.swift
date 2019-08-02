//
//  UITableView.Extension.swift
//  DataBindingProject
//
//  Created by Aashwatth Agarwal on 8/2/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: NibRegister & UITableViewCell>(cellType: T.Type) {
        register(UINib(nibName: cellType.nibName, bundle: cellType.bundle), forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}

protocol NibRegister {
    static var bundle: Bundle? {get}
    static var reuseIdentifier: String {get}
    static var nibName: String {get}
}

extension NibRegister {
    static var bundle: Bundle? {
        return nil
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}
