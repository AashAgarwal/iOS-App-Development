//
//  ViewController.swift
//  To do list
//
//  Created by Aashwatth Agarwal on 7/15/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newTableView: UITableView!
    
    var itemList = ["Do Laundry", "Take my dog for a walk", "Go to gym", "Make some food", "Go out for a walk", "Water my Plants", "Buy a new game", "Prepare Shopping list", "Check my bank account"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTableView.delegate = self
        newTableView.dataSource = self
        newTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
    extension ViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemList.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = itemList[indexPath.row]
            return cell
        }
    }

    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let editViewController = storyboard.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            editViewController.stringToEdit = itemList[indexPath.row]
            editViewController.delegate = self
            navigationController?.pushViewController(editViewController, animated: true)
        }
    }
    extension ViewController: EditViewControllerDelegate {
        func update(to newValue: String) {
            guard let updatedIndex = newTableView.indexPathForSelectedRow else {return}
            itemList[updatedIndex.row] = newValue
            newTableView.reloadRows(at: [updatedIndex], with: .fade)
        }
        func delete() {
            guard let deletedIndex = newTableView.indexPathForSelectedRow else {return}
            itemList.remove(at: deletedIndex.row)
            newTableView.deleteRows(at: [deletedIndex], with: .fade)
        }
    }
