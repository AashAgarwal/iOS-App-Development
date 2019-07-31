//
//  ViewController.swift
//  ToDoListMVVM
//
//  Created by Aashwatth Agarwal on 7/19/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toDoListMVVP: UITableView!
    
    var viewModel = ToDoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListMVVP.dataSource = self
        toDoListMVVP.delegate = self
        toDoListMVVP.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "cell")
        viewModel.getLists()
        toDoListMVVP.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfLists()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel.getListName(at: indexPath.row)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let nextViewModel = viewModel.getViewModel(for: indexPath.row) else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        nextViewController.viewModel = nextViewModel
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}


