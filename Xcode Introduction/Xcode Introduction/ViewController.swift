//
//  ViewController.swift
//  Xcode Introduction
//
//  Created by Aashwatth Agarwal on 7/10/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var helloWorldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloWorldLabel.text = "Hello World"
        
    }
}

