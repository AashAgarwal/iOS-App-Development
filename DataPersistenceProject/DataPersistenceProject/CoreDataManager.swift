//
//  CoreDataManager.swift
//  DataPersistenceProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExampleCoreDataModel")
        container.loadPersistentStores { description, error in
            print(description)
            print(error)
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getAllPersons() -> [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do {
            let people = try context.fetch(request)
            return people
        } catch {
            return []
        }
    }
    
    @discardableResult
    func createNewPerson(with name: String) -> Person? {
        guard let description = NSEntityDescription.entity(forEntityName: "Person", in: context) else { return nil }
        let person = Person(entity: description, insertInto: context)
        person.name = name
        return person
    }
    
    func update(person: Person, with newName: String) -> Person {
        person.name = newName
        return person
    }
    
    func delete(person: Person) {
        context.delete(person)
    }
    
    func getAllPeople(named name: String) -> [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        request.predicate = NSPredicate(format: "name=%@", name)
        do {
            let people = try context.fetch(request)
            return people
        } catch {
            return []
        }
    }
    
    func save() {
        guard context.hasChanges else { return }
        try? context.save()
    }
}
