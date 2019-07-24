//
//  PokemonController.swift
//  RandomPokemonApp
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import Foundation

class PokemonController {
    func getRandomPokemonAndAllSavedPokemon(completionHandler: @escaping ([Pokemon]) -> Void) {
        let randomPokemonURLString = "https://pokeapi.co/api/v2/pokemon/\(Int.random(in: 1...807))"
        guard let url = URL(string: randomPokemonURLString) else {
            completionHandler([])
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data,
                (try? JSONDecoder().decode(Pokemon.self, from: data)) != nil else {
                    completionHandler([])
                    return
            }
            CoreDataManager.shared.save()
            completionHandler(CoreDataManager.shared.getAllPokemon())
            }.resume()
    }
}
