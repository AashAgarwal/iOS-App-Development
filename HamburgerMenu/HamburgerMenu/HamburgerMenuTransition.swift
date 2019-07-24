//
//  HamburgerMenuTransition.swift
//  HamburgerMenu
//
//  Created by Aashwatth Agarwal on 7/23/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

final class HamburgerMenuTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let hambugerMenuViewController: HamburgerMenuViewController
        let isPresentingHamburgerMenu: Bool
        if let toViewController = transitionContext.viewController(forKey: .to) as? HamburgerMenuViewController {
            hambugerMenuViewController = toViewController
            isPresentingHamburgerMenu = true
        } else if let fromViewController = transitionContext.viewController(forKey: .from) as? HamburgerMenuViewController{
            hambugerMenuViewController = fromViewController
            isPresentingHamburgerMenu = false
        } else {
            return
        }
            
        transitionContext.containerView.addSubview(hambugerMenuViewController.view)
        if isPresentingHamburgerMenu {
            hambugerMenuViewController.view.frame.origin.x -= hambugerMenuViewController.view.frame.width
            hambugerMenuViewController.seethroughView.alpha = 0
        }
        UIView.animate(withDuration: transitionDuration(using: transitionContext)/2, animations: {
            if isPresentingHamburgerMenu {
                hambugerMenuViewController.view.frame.origin.x = 0
            } else {
                hambugerMenuViewController.seethroughView.alpha = 0
            }}) {(completed) in
                UIView.animate(withDuration: self.transitionDuration(using: transitionContext) / 2, animations: { if isPresentingHamburgerMenu {
                    hambugerMenuViewController.seethroughView.alpha = 0.5
                } else {
                    hambugerMenuViewController.view.frame.origin.x -= hambugerMenuViewController.view.frame.width
                    }
                }, completion: {(seethroughCompleted) in transitionContext.completeTransition(completed && seethroughCompleted)
                    
                })
    }
}
}
