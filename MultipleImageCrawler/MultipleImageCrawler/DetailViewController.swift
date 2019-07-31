//
//  DetailViewController.swift
//  MultipleImageCrawler
//
//  Created by Aashwatth Agarwal on 7/28/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var enlargedImageView: UIImageView!
    
    @IBOutlet weak var usersLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    var details: hits?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = details?.largeImageURL, let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.enlargedImageView.image = UIImage(data: data)
            }
            }.resume()
        
        usersLabel.text = " User: \(details!.user)"
        viewsLabel.text = " Views: \(details!.views)"
        likesLabel.text = " Likes: \(details!.likes)"
        commentsLabel.text = " Comments: \(details!.comments)"


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
