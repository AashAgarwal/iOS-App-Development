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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.image = UIImage.init(named: "image")
    }
    
    func getImage(urlImage: String) {
        guard let url = URL(string: urlImage) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("Error at image")
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
           
            }.resume()
    }
}
