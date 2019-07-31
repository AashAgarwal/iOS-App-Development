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

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var mySectionswithHits: Array<[hits]> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
//        loadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(section,"sections items")
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //if !self.mySectionswithHits.isEmpty {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .red
            //for section in 0...indexPath.section {
                print(indexPath.section, " /section/ ")
                //print(mySectionswithHits[indexPath.section].count)
                //let currentHits = mySectionswithHits[0]
                //cell.getImage(urlImage: currentHits[indexPath.row].largeImageURL ?? "")
            //}
            return cell
        //}
        //cell.label.text = "\(myData[indexPath.row].largeImageURL)"
       // return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*1.0)
    }
    
    func loadData(){
        let urlString = ["https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=earthquake&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=orange&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=joke&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=time&image_type=photo&pretty=true", "https://pixabay.com/api/?key=13136960-c0be6b330d714adcabffef94e&q=decision&image_type=photo&pretty=true"]
        
        for url in urlString {
        
            guard let url = URL(string: url) else {return}
        
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let myHits = try? JSONDecoder().decode(TheKeys.self, from: data!) {
                    
                    self.mySectionswithHits.append(myHits.hits ?? [])
                    print(self.mySectionswithHits[0])
                    print(self.mySectionswithHits.count, " // ")
                    DispatchQueue.main.async {
                        //self.myData = myHits.hits ?? []
                        //print(self.mySectionswithHits[].count)
                        self.collectionView.reloadData()
                    }
            } else {
                print("Error")
            }
                
            }.resume()
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //detailViewController.details = self.[myData[indexPath.row]]
        print(detailViewController)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
