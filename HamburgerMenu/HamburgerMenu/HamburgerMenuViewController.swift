//
//  HamburgerMenuViewController.swift
//  HamburgerMenu
//
//  Created by Aashwatth Agarwal on 7/23/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

final class HamburgerMenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var seethroughView: UIView!
    
    let menuOptions = ["Home", "Acoounts", "Help"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.dataSource = self
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(didTapSeethroughView))
        seethroughView.addGestureRecognizer(tapGesture)
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        
    }
    
   @objc func didTapSeethroughView() {
        dismiss(animated: true, completion: nil)
    }
}

extension HamburgerMenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MenuTableViewCell")
        cell.textLabel?.text = menuOptions[indexPath.row]
        return cell
    }
}

