//
//  Pokemon+CoreDataClass.swift
//  RandomPokemonApp
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case name
    }
    
    //We added convenience to this initializer because we are calling an initializer of this class inside this initializer on line 26
    required public convenience init(from decoder: Decoder) throws {
        guard let description = NSEntityDescription.entity(forEntityName: "Pokemon", in: CoreDataManager.shared.context) else {
            throw CoreDataError.noSuchEntity
        }
        
        self.init(entity: description,
                  insertInto: CoreDataManager.shared.context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
    }
}


class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "default name")
    }
}
