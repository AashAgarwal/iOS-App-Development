//
//  ViewController.swift
//  MultipleImageCrawler
//
//  Created by Aashwatth Agarwal on 7/28/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

struct TheKeys: Decodable {
    var totalHits: Int?
    var hits: [hits]?
}

struct hits: Decodable {
    var largeImageURL: String?
    var user: String
    var views: Int
    var likes: Int
    var comments: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var tableView: UITableView!

    var mySectionswithHits: Array<[hits]> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //collectionView.delegate = self
        //collectionView.dataSource = self
       loadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
       // cell.frame.size.width = 500
        cell.frame.size.height = 500
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCell else {return}
        tableViewCell.frame.size.height = 200
        tableViewCell.setCollectionViewDataSourceDelegate(dataSource: tableView.dataSource as! UICollectionViewDataSource, dataDelegate: tableView.delegate as! UICollectionViewDelegate, forRow: indexPath.row)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(section,"sections items")
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //if !self.mySectionswithHits.isEmpty {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell  {
    
        cell.backgroundColor = .red
        //for section in 0...indexPath.section {
        //print(indexPath.section, " /section/ ")
        //print(mySectionswithHits[indexPath.section].count)
        if !mySectionswithHits.isEmpty && mySectionswithHits.count >= 5 {
            //currentHits = mySectionswithHits[indexPath.section]
            let currentHits = mySectionswithHits[1]
            cell.getImage(urlImage: currentHits[indexPath.row].largeImageURL ?? "")
            print(mySectionswithHits.count, "URL img COunting")
        }
            //}
            return cell
        //}
        //cell.label.text = "\(myData[indexPath.row].largeImageURL)"
       // return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    // MARK -- CollectionView
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //detailViewController.details = self.[myData[indexPath.row]]
        //print(detailViewController)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    
    func loadData(){
        let urlString = ["https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=earthquake&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=orange&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=joke&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=time&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=decision&image_type=photo&pretty=true"]
        
        for url in urlString {
        
            guard let url = URL(string: url) else {return}
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let myHits = try? JSONDecoder().decode(TheKeys.self, from: data!) {
                    
                    self.mySectionswithHits.append(myHits.hits ?? [])
                    //print(self.mySectionswithHits[0])
                    //print(self.mySectionswithHits.count, " / Data Loaded / ")
                    DispatchQueue.main.async {
                        //self.myData = myHits.hits ?? []
                        print(self.mySectionswithHits.count)
                        self.tableView.reloadData()
                    }
            } else {
                print("Error")
            }
              
             
            }.resume()
    }
    }
    

}
