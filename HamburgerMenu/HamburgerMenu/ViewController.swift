//
//  ViewController.swift
//  HamburgerMenu
//
//  Created by Aashwatth Agarwal on 7/23/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let hamgurgerMenuViewController = storyboard.instantiateViewController(withIdentifier: "HamburgerMenuViewController")
        hamgurgerMenuViewController.transitioningDelegate = self
        present(hamgurgerMenuViewController,animated: true, completion: nil)
    }
}

extension ViewController:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HamburgerMenuTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HamburgerMenuTransition()
    }
}
