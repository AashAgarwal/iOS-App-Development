//
//  ViewController.swift
//  MemoryManagementProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hasShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Bill")
        let abode = Abode(address: "Cool place")
        person.abode = abode
        abode.occupant = person
        print("successfully moved in")
    }
    
    //  override func viewDidAppear(_ animated: Bool) {
    //    super.viewDidAppear(animated)
    //    guard !hasShown else { return }
    //    hasShown = true
    //    present(SecondViewController(),
    //            animated: true,
    //            completion: nil)
    //  }
}

class SecondViewController: UIViewController {
    
    deinit {
        print("SecondViewController deinitialized")
    }
    
    var numberOfThings = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dismiss(animated: true) { [weak self] in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                for number in 0...1000000 {
                    self?.numberOfThings += number
                    print(self?.numberOfThings)
                }
            }
        }
    }
}

class Person {
    let name: String
    var abode: Abode?
    
    deinit {
        print("Person murdered")
    }
    
    init(name: String, abode: Abode? = nil) {
        self.name = name
        self.abode = abode
    }
}

class Abode {
    let address: String
    weak var occupant: Person?
    
    deinit {
        print("Abode bulldozed")
    }
    
    init(address: String, occupant: Person? = nil) {
        self.address = address
        self.occupant = occupant
    }
}
