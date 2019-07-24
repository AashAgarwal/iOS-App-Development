//
//  ViewController.swift
//  RandomPokemonApp
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    var pokemonArray: [Pokemon] = []
    let controller = PokemonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.dataSource = self
        pokemonTableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokemonCell")
        controller.getRandomPokemonAndAllSavedPokemon { pokemon in
            self.pokemonArray = pokemon
            DispatchQueue.main.async {
                self.pokemonTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "pokemonCell")
        cell.textLabel?.text = pokemonArray[indexPath.row].name
        return cell
    }
}


