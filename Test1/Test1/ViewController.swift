//
//  ViewController.swift
//  Test1
//
//  Created by Aashwatth Agarwal on 7/12/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var newTableView: UITableView!
    
    var control = ["switchingControl: false", "textEditor: hello there", "segmentControl: 0", "sliderControl: 0", "stepperFunction: 0"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTableView.dataSource = self
        newTableView.delegate = self
        newTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
    extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (control.count)
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = control[indexPath.row]
            
            return(cell)
        }
    }
    
    extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // create referenc to storyboard. Ie. let storyboard = ...
        // use storyboard object to instantiate detail view controller
        // use indexpath to tell it what information it needs.
        // set up DVC with right properties
        // use navigationcontroller to push DVC
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let editViewController = storyboard.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            editViewController.stringToEdit = control[indexPath.row]
            editViewController.delegate = self
            navigationController?.pushViewController(editViewController, animated: true)
        }
    }
    
    extension ViewController: EditViewControllerDelegate {
        func update(to newValue: String) {
            guard let updatedIndex = newTableView.indexPathForSelectedRow else { return }
            control[updatedIndex.row] = newValue
            newTableView.reloadRows(at: [updatedIndex], with: .fade)
        }
}
