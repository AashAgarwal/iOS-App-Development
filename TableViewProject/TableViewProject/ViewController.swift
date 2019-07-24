//
//  ViewController.swift
//  TableViewProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var exampleTableView: UITableView!
    
    //  enum Section: Int {
    //    case firstSection
    //    case secondSection
    //    case thirdSection
    //  }
    var stringArray = ["hello world", "goodbye world", "its the end of the world", "Major Tom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleTableView.dataSource = self
        exampleTableView.delegate = self
        exampleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //    guard let sectionObject = Section(rawValue: section) else { return 0 }
        //    switch sectionObject {
        //    case .firstSection:
        //      return 3
        //    case .secondSection:
        //      return 4
        //    case .thirdSection:
        //      return 5
        //    }
        return stringArray.count
    }
    
    //  func numberOfSections(in tableView: UITableView) -> Int {
    //    return 3
    //  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = stringArray[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editViewController = storyboard.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        editViewController.stringToEdit = stringArray[indexPath.row]
        editViewController.delegate = self
        //    present(editViewController, animated: true, completion: nil)
        navigationController?.pushViewController(editViewController, animated: true)
    }
}

extension ViewController: EditViewControllerDelegate {
    func update(to newValue: String) {
        guard let updatedIndex = exampleTableView.indexPathForSelectedRow else { return }
        stringArray[updatedIndex.row] = newValue
        //    exampleTableView.reloadData()
        exampleTableView.reloadRows(at: [updatedIndex], with: .fade)
    }
}

