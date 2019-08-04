//
//  DetailViewController.swift
//  Test2
//
//  Created by Aashwatth Agarwal on 7/22/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var episodeTitle: UILabel!
    
    @IBOutlet weak var premierDate: UILabel!
    
    @IBOutlet weak var airTime: UILabel!
    
    @IBOutlet weak var Season: UILabel!
    
    @IBOutlet weak var episodeNumber: UILabel!
    
    @IBOutlet weak var Sumarry: UILabel!
    
     var episodeDetail: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        episodeTitle.text = "Episode Title: \(episodeDetail!.episodeName)"
        premierDate.text = "Premier Date: \(episodeDetail!.premierDate)"
        airTime.text = "Air Time: \(episodeDetail!.airtime)"
        Season.text = "Season: \(episodeDetail!.season)"
        episodeNumber.text = "Episode Number: \(episodeDetail!.episodeNumber)"
        Sumarry.text = "Summary: \(episodeDetail!.summary.dropFirst(3).dropLast(4))"
        
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
