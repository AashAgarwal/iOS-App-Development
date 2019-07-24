//
//  ViewController.swift
//  DataPersistenceProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var darkModeSwitch: UISwitch!
    var isDarkModeEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "darkModeEnabled")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "darkModeEnabled")
        }
    }
    
    let manager = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitch.isOn = isDarkModeEnabled
        let people = manager.getAllPersons()
        print(people)
        addClass()
        let newPeople = manager.getAllPersons()
        print(newPeople)
        let selectPeople = manager.getAllPeople(named: "Chris")
        print(selectPeople)
        //    manager.delete(person: people[0])
        //    manager.save()
        //    print(manager.getAllPersons())
        //    print(people[0].name)
        //    let updatedPerson = manager.update(person: people[0], with: "CH")
        //    print(updatedPerson)
        //    manager.save()
        //    print(people)
        //    print(people[0].name)
        //    print(people)
        //    print(manager.createNewPerson(with: "Chris"))
        //    manager.save()
        //    print(manager.getAllPersons())
    }
    
    func addClass() {
        manager.createNewPerson(with: "Ryan")
        manager.createNewPerson(with: "Chris")
        manager.createNewPerson(with: "iTony")
        manager.createNewPerson(with: "Aash")
        manager.createNewPerson(with: "Brian")
        manager.save()
    }
    
    @IBAction func switchTapped(_ sender: Any) {
    isDarkModeEnabled = !isDarkModeEnabled
    }
}


