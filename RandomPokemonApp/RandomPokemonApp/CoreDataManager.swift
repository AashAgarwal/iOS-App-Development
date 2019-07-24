//
//  CoreDataManager.swift
//  RandomPokemonApp
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PokemonModel")
        container.loadPersistentStores { _,_ in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() { }
    
    func save() {
        guard context.hasChanges else { return }
        try? context.save()
    }
    
    func getAllPokemon() -> [Pokemon] {
        let request: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        let retrievedPokemon = try? context.fetch(request)
        return retrievedPokemon ?? []
    }
}
