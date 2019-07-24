import UIKit

//struct Ability {
//
//  let isHidden: Bool
//  let name: String
//
//  init?(dictionary: [String: Any]) {
//    guard let isHidden = dictionary["is_hidden"] as? Bool,
//      let abilityDictionary = dictionary["ability"] as? [String: Any],
//      let name = abilityDictionary["name"] as? String else { return nil }
//    self.isHidden = isHidden
//    self.name = name
//  }
//}
//
//struct Pokemon {
//
//  let name: String
//  let abilities: [Ability]
//
//
//  init?(dictionary: [String: Any]) {
//    guard let name = dictionary["name"] as? String,
//      let abilities = dictionary["abilities"] as? [[String: Any]] else { return nil }
//
//    self.name = name
//    self.abilities = abilities.compactMap { Ability(dictionary: $0) }
//  }
//}

struct Move: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case move
    }
    
    enum MoveCodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let moveContainer = try container.nestedContainer(keyedBy: MoveCodingKeys.self, forKey: .move)
        self.name = try moveContainer.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var moveContainer = container.nestedContainer(keyedBy: MoveCodingKeys.self, forKey: .move)
        try moveContainer.encode(self.name, forKey: .name)
    }
}

struct Pokemon: Codable {
    let name: String
    let moves: [Move]
    let isDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case moves
        case isDefault = "is_default"
    }
}


if let jsonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"),
    let jsonData = try? Data(contentsOf: jsonURL)/*,
     let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []),
     let jsonDictionary = jsonObject as? [String: Any]*/ {
        let pokemon = try? JSONDecoder().decode(Pokemon.self, from: jsonData)
        print(pokemon)
        //  let pokemon = Pokemon(dictionary: jsonDictionary)
        //  print(pokemon)
} else {
    print("Something went horribly wrong.")
}

