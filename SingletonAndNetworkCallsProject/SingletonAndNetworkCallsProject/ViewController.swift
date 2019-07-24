//
//  ViewController.swift
//  SingletonAndNetworkCallsProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let googleURLString = "https://pokeapi.co/api/v2/pokemon/34"
        guard let googleURL = URL(string: googleURLString) else { return }
        URLSession.shared.dataTask(with: googleURL) { (data, response, error) in
            print(data)
            print(response)
            print(error)
            }.resume()
    }
}

class MySingleton {
    static let sharedInstance = MySingleton()
    
    private init() { }
}
