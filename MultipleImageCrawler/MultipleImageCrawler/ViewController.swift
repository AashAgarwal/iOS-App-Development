//
//  ViewController.swift
//  MultipleImageCrawler
//
//  Created by Aashwatth Agarwal on 7/28/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

var arrUrlString = ["https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=Earthquake&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=Orange&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=Joke&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=Time&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=Decision&image_type=photo&pretty=true"]

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUrlString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.loadData(arrUrlString[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension ViewController: MainDelegate {
    
    func didTappedOnImage(_ hitsData: hits) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.details = hitsData
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
