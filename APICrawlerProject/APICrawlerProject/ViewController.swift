//
//  ViewController.swift
//  APICrawlerProject
//
//  Created by Aashwatth Agarwal on 7/16/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var crawlerTableView: UITableView!
    
    var dictionary: [String: Any] = [:]
    var url = URL(string: "https://pokeapi.co/api/v2")
    
    enum APITypes {
        case dictionary
        case array
        case number
        case string
        case boolean
        case null
        
        init?(value: Any) {
            if value is [String: Any] {
                self = .dictionary
            } else if value is NSNumber {
                self = .number
            } else if value is String {
                self = .string
            } else if value is Bool {
                self = .boolean
            } else if value is [Any] {
                self = .array
            } else if value is NSNull {
                self = .null
            } else {
                return nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crawlerTableView.dataSource = self
        crawlerTableView.delegate = self
        crawlerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                let jsonDictionary = jsonObject as? [String: Any] else { return }
            self.dictionary = jsonDictionary
            DispatchQueue.main.async {
                self.crawlerTableView.reloadData()
            }
            }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        //Update the labels here
        let keys = Array(dictionary.keys)
        cell.textLabel?.text = keys[indexPath.row]
        guard let type = APITypes(value: dictionary[keys[indexPath.row]]) else { return cell }
        switch type {
        case .array:
            cell.detailTextLabel?.text = dictionary[keys[indexPath.row]] as? String
        case .boolean:
            cell.detailTextLabel?.text = dictionary[keys[indexPath.row]] as? String
        case .dictionary:
            cell.detailTextLabel?.text = dictionary[keys[indexPath.row]] as? String
        case .null:
            cell.detailTextLabel?.text = dictionary[keys[indexPath.row]] as? String
        case .number:
            cell.detailTextLabel?.text = dictionary[keys[indexPath.row]] as? String
        case .string:
            cell.detailTextLabel?.text = dictionary[keys[indexPath.row]] as? String
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let keys = Array(dictionary.keys)
        guard let value = dictionary[keys[indexPath.row]] as? String,
            let url = URL(string: value) else { return }
        nextViewController.url = url
        print(url)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
