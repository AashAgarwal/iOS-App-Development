//
//  ViewController.swift
//  Test2
//
//  Created by Aashwatth Agarwal on 7/22/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

struct Episode: Codable {
    let episodeNumber: Int
    let episodeName: String
    let premierDate: String
    let airtime: String
    let season: Int
    let summary: String
    
    enum CodingKeys: String,CodingKey {
        case episodeNumber = "number"
        case episodeName = "name"
        case premierDate = "airdate"
        case airtime
        case season
        case summary
    }
}

struct Embed: Codable {
    let episodes: [Episode]
}

struct Shows: Codable {
    let _embedded: Embed
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UITableView!
    
    var shows: Shows? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.dataSource = self
        mainView.delegate = self
        mainView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        getdata()
        
    }
    func getdata() {
        let urlString = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let shows = try? JSONDecoder().decode(Shows.self, from: data!){
                DispatchQueue.main.async {
                    self.shows = shows
                    self.mainView.reloadData()
                }
            } else {
                print("Error in getting JSON data")
            }
        } .resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cellCount = self.shows?._embedded.episodes.count else {return 0}
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = self.shows?._embedded.episodes[indexPath.row].episodeName
        cell.detailTextLabel?.text = "Season: \(self.shows!._embedded.episodes[indexPath.row].season) Episode Number: \(self.shows!._embedded.episodes[indexPath.row].episodeNumber)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.episodeDetail = self.shows!._embedded.episodes[indexPath.row]
        print(detailViewController)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


