//
//  CollectionViewCell.swift
//  MultipleImageCrawler
//
//  Created by Aashwatth Agarwal on 7/28/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func getImage(urlImage: String) {
        guard let url = URL(string: urlImage) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
            }.resume()
    }
}
