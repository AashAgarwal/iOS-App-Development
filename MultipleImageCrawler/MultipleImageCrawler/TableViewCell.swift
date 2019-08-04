//
//  TableViewCell.swift
//  MultipleImageCrawler
//
//  Created by Aashwatth Agarwal on 7/28/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

protocol MainDelegate: class {
    func didTappedOnImage(_ hits: hits)
}

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

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var mySectionswithHits: Array<[hits]> = []
    weak var delegate: MainDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func loadData(_ urlString: String) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let myHits = try? JSONDecoder().decode(TheKeys.self, from: data!) {
                self.mySectionswithHits.append(myHits.hits ?? [])
                DispatchQueue.main.async {
                    print(self.mySectionswithHits)
                    self.collectionView.reloadData()
                }
            } else {
                print("Error")
            }
            
            
            }.resume()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCollectionViewDataSourceDelegate(dataSource: UICollectionViewDataSource,  dataDelegate: UICollectionViewDelegate, forRow: Int) {
        
    }
}

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mySectionswithHits.count > 0 {
            let hits_arr = self.mySectionswithHits[0] as? [hits]
            return hits_arr?.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        if mySectionswithHits.count > 0 {
             let hits_arr = self.mySectionswithHits[0] as? [hits]
            let hits_obj = hits_arr?[indexPath.row] as? hits
             print(hits_obj?.largeImageURL)
            
            cell.getImage(urlImage: hits_obj?.largeImageURL ?? "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if mySectionswithHits.count > 0 {
            let hits_arr = self.mySectionswithHits[0] as? [hits]
            let hits_obj = hits_arr?[indexPath.row] as! hits
            print(hits_obj)
            self.delegate?.didTappedOnImage(hits_obj)
        }
    }
}
