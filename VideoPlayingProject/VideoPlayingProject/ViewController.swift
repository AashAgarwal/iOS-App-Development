//
//  ViewController.swift
//  VideoPlayingProject
//
//  Created by Aashwatth Agarwal on 8/1/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    var player: AVPlayer!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        guard let sharkURL = Bundle.main.url(forResource: "shark", withExtension: "mp4") else {return}
       // print(sharkURL)
        player = AVPlayer(url: sharkURL)
        //let playerLayer = AVPlayerLayer(player: player)
       // playerLayer.frame = view.frame
       // print(playerLayer.frame)
      //  view.layer.addSublayer(playerLayer)
      //  player.play()
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true, completion: nil)
    }
}

